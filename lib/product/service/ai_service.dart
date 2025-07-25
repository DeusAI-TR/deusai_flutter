import 'package:alfai/product/init/application_init.dart';
import 'package:alfai/product/constants/api_path.dart';
import 'package:alfai/product/service/ai_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../manager/network_manager.dart';

@lazySingleton
class AiService {
  AiService();

  Future<AiResponse> uploadFiles({required String textFilePath, required String imageFilePath}) async {
    final formData = FormData.fromMap({
      'text_file': await MultipartFile.fromFile(textFilePath),
      'image_file': await MultipartFile.fromFile(imageFilePath),
    });
    final result = await locator<NetworkManager>().request<AiResponse>(
      RequestType.post,
      ApiPath.create.toPath,
      data: formData,
      isFile: true,
      isBaseResponse: false,
      fromJson: (json) => AiResponse.fromJson(json),
    );
    return result as AiResponse;
  }
} 