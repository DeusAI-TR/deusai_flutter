import 'package:alfai/core/services/navigation_service.dart';
import 'package:alfai/product/init/application_init.dart';
import 'package:alfai/product/navigate/navigation_enums.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterVerifyViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final String email;
  final TextEditingController pinputController = TextEditingController();
  final FocusNode pinputFocusNode = FocusNode();

  RegisterVerifyViewModel({this.email = 'meryemdemir.ui@gmail.com', NavigationService? navigationService})
    : _navigationService = navigationService ?? locator<NavigationService>();

  bool get isCodeValid => pinputController.text.length == 4;

  void navigateToRegister() {
    _navigationService.navigateToPage(path: NavigationEnums.register.rawValue);
  }

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
