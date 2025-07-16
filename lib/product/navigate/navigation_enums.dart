enum NavigationEnums {
  init,
}

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.init:
        return '/init';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/':
      case '/init':
        return NavigationEnums.init;
      default:
        throw Exception('$val not found in $this');
    }
  }
}
