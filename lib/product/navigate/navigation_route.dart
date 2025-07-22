import 'package:alfai/feature/login/login_view.dart';
import 'package:alfai/feature/register/post_register/post_register_view.dart';
import 'package:alfai/feature/register/pre_register/pre_register_view.dart';
import 'package:alfai/feature/register/register/register_view.dart';
import 'package:alfai/feature/register/register_verify/register_verify_view.dart';
import 'package:alfai/feature/splash_view.dart';
import 'package:flutter/material.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (NavigationEnums.init.normalValue(args.name)) {
      case NavigationEnums.init:
        return _normalNavigate(const SplashView());
      case NavigationEnums.login:
        return _normalNavigate(const LoginView());

      case NavigationEnums.preRegister:
        return _normalNavigate(const PreRegisterView());
      case NavigationEnums.register:
        return _normalNavigate(const RegisterView());
      case NavigationEnums.registerVerify:
        return _normalNavigate(const RegisterVerifyView());
      case NavigationEnums.postRegister:
        return _normalNavigate(const PostRegisterView(state: PostRegisterState.success));
      // default:
      //   throw Exception(' [38;5;9m$this not found [0m');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }
}
