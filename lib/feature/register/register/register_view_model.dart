import 'package:alfai/core/services/navigation_service.dart';
import 'package:alfai/product/init/application_init.dart';
import 'package:alfai/product/navigate/navigation_enums.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();

  RegisterViewModel({NavigationService? navigationService}) : _navigationService = navigationService ?? locator<NavigationService>();

  bool get isFormValid =>
      usernameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      passwordRepeatController.text.isNotEmpty;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  void navigateToPostRegister() {
    _navigationService.navigateToPage(path: NavigationEnums.postRegister.rawValue);
  }
} 