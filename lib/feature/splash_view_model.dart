import 'dart:async';
import 'package:alfai/product/init/application_init.dart';
import 'package:stacked/stacked.dart';
import '../core/services/navigation_service.dart';
import '../product/navigate/navigation_enums.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  SplashViewModel({NavigationService? navigationService}) : _navigationService = navigationService ?? locator<NavigationService>();

  Future<void> startSplashTimer() async {
    await Future.delayed(const Duration(seconds: 1));
    _navigationService.navigateToPageClear(path: NavigationEnums.login.rawValue);
  }
} 