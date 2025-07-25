import 'package:alfai/product/init/application_init.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:alfai/product/service/ai_service.dart';
import 'package:alfai/product/service/ai_response.dart';

enum HomeTab { description, image }

enum VideoSize {
  ratio169,
  ratio11,
  ratio916;

  String get name => switch (this) {
    ratio169 => '16:9',
    ratio11 => '1:1',
    ratio916 => '9:16',
  };
}

class HomeViewModel extends BaseViewModel {
  // Tab kontrolü
  HomeTab _activeTab = HomeTab.description;
  HomeTab get activeTab => _activeTab;
  void setTab(HomeTab tab) {
    _activeTab = tab;
    notifyListeners();
  }

  // Açıklama alanı
  final TextEditingController descriptionController = TextEditingController();
  int get descriptionLength => descriptionController.text.length;
  static const int maxDescriptionLength = 200;

  // Görsel (dosya yolu ve önizleme)
  String? imagePath;
  File? imageFile;
  int? imageSizeMB;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imagePath = picked.path;
      imageFile = File(picked.path);
      imageSizeMB = await imageFile!.length() ~/ (1024 * 1024);
      notifyListeners();
    }
  }

  void removeImage() {
    imagePath = null;
    imageFile = null;
    imageSizeMB = null;
    notifyListeners();
  }

  // Boyut seçimi
  VideoSize _selectedSize = VideoSize.ratio169;
  VideoSize get selectedSize => _selectedSize;
  void setSize(VideoSize size) {
    _selectedSize = size;
    notifyListeners();
  }

  // Stil seçimi (index ile, örnek stiller)
  int _selectedStyle = 0;
  int get selectedStyle => _selectedStyle;
  void setStyle(int index) {
    _selectedStyle = index;
    notifyListeners();
  }

  // Kimler görebilir (true: sadece ben, false: herkes)
  bool onlyMe = true;
  void setOnlyMe(bool value) {
    onlyMe = value;
    notifyListeners();
  }

  // Oluştur butonu aktifliği
  bool get isCreateEnabled {
    if (_activeTab == HomeTab.description) {
      return descriptionController.text.isNotEmpty;
    } else {
      return imagePath != null;
    }
  }

  // AI servis sonucu ve loader
  AiResponse? aiResponse;
  bool isLoading = false;
  String? errorMessage;

  Future<void> createContent() async {
    if (imagePath == null || descriptionController.text.isEmpty) return;
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final aiService = locator<AiService>();
      aiResponse = await aiService.uploadFiles(
        textFilePath: await _createTempTextFile(descriptionController.text),
        imageFilePath: imagePath!,
      );
    } catch (e) {
      errorMessage = 'Bir hata oluştu: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Açıklamayı geçici bir txt dosyasına kaydet (API text_file için dosya bekliyor)
  Future<String> _createTempTextFile(String text) async {
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/alfai_prompt.txt');
    await file.writeAsString(text);
    return file.path;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
