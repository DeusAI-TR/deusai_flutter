import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class INavigationService {
  Future<T?> navigateToPage<T>({required String path, Object? data});
  Future<T?> navigateToPageClear<T>({required String path, Object? data});
  void pop<T extends Object?>([T? object]);
}

@singleton
class NavigationService implements INavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<T?> navigateToPage<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<T?> navigateToPageClear<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: data);
  }

  @override
  void pop<T extends Object?>([T? object]) {
    navigatorKey.currentState?.pop(object);
  }
}
