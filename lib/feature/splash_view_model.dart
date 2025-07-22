import 'dart:async';
import 'package:stacked/stacked.dart';
import '../core/services/navigation_service.dart';
import '../product/navigate/navigation_enums.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> startSplashTimer() async {
    await Future.delayed(const Duration(seconds: 1));
    NavigationService.instance.navigateToPageClear(path: NavigationEnums.login.rawValue);
  }
} 