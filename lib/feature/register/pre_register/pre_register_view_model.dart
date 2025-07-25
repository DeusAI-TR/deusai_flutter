import 'package:alfai/core/services/navigation_service.dart';
import 'package:alfai/product/init/application_init.dart';
import 'package:alfai/product/navigate/navigation_enums.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreRegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final TextEditingController emailController = TextEditingController();

  PreRegisterViewModel({NavigationService? navigationService})
    : _navigationService = navigationService ?? locator<NavigationService>() {
    emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    notifyListeners();
  }

  bool get isEmailNotEmpty => emailController.text.isNotEmpty;

  void navigateToLogin(){
    _navigationService.pop();
  }

  void navigateToRegisterVerify() {
    _navigationService.navigateToPage(path: NavigationEnums.registerVerify.rawValue);
  }

  @override
  void dispose() {
    emailController.removeListener(_onEmailChanged);
    emailController.dispose();
    super.dispose();
  }
}
