import 'package:alfai/core/services/navigation_service.dart';
import 'package:alfai/product/init/application_init.dart';
import 'package:alfai/product/navigate/navigation_enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:alfai/product/service/auth_service.dart';
import 'package:alfai/product/manager/network_manager.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService;
  final NavigationService _navigationService;
  final TextEditingController emailController = TextEditingController(text: kDebugMode ? 'bilalozcan015@gmail.com' : '');
  final TextEditingController passwordController = TextEditingController(text: kDebugMode ? 'Bilal!123' : '');

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool get isFormValid => _isEmailValid && _isPasswordValid;

  LoginViewModel({AuthService? authService, NavigationService? navigationService})
    : _authService = authService ?? locator<AuthService>(),
      _navigationService = navigationService ?? locator<NavigationService>() {
    emailController.addListener(_validateEmail);
    passwordController.addListener(_validatePassword);
  }

  void _validateEmail() {
    final email = emailController.text;
    _isEmailValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}").hasMatch(email);
    notifyListeners();
  }

  void _validatePassword() {
    final password = passwordController.text;
    _isPasswordValid = password.length >= 6;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final result = await _authService.login(emailController.text, passwordController.text);
    if (result.token != null) {
      locator<NetworkManager>().setToken(result.token!);
      _navigationService.navigateToPageClear(path: NavigationEnums.mainScaffold.rawValue);
    } else {
      // Hata mesajı gösterilebilir
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navigateToRegister(BuildContext context) {
    _navigationService.navigateToPage(path: NavigationEnums.preRegister.rawValue);
  }
}
