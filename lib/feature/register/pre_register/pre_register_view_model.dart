import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreRegisterViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  
  PreRegisterViewModel() {
    emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    notifyListeners();
  }

  bool get isEmailNotEmpty => emailController.text.isNotEmpty;

  @override
  void dispose() {
    emailController.removeListener(_onEmailChanged);
    emailController.dispose();
    super.dispose();
  }
} 