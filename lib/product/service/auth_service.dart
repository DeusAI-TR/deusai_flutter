import 'package:alfai/product/manager/network_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:alfai/product/models/auth/login_response.dart';
import 'package:alfai/product/models/auth/login_request.dart';
import 'package:alfai/product/constants/api_path.dart';

@lazySingleton
class AuthService {
  AuthService();

  Future<LoginResponse> login(String email, String password) async {
    final result = await NetworkManager().request<LoginResponse>(
      RequestType.post,
      ApiPath.login.toPath,
      data: LoginRequest(email: email, password: password).toJson(),
      isBaseResponse: false,
      fromJson: (json) => LoginResponse.fromJson(json),
    );
    return result as LoginResponse;
  }
}
