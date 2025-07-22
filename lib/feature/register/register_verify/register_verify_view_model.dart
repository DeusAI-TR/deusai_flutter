import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterVerifyViewModel extends BaseViewModel {
  final String email;
  final TextEditingController pinputController = TextEditingController();
  final FocusNode pinputFocusNode = FocusNode();

  RegisterVerifyViewModel({this.email = 'meryemdemir.ui@gmail.com'});

  bool get isCodeValid => pinputController.text.length == 4;

  void onPinputChanged(String value) {
    notifyListeners();
  }

  void onPinputCompleted(String value) {
    // Kod tamamlandığında yapılacak işlemler
    notifyListeners();
  }

  @override
  void dispose() {
    pinputController.dispose();
    pinputFocusNode.dispose();
    super.dispose();
  }
} 