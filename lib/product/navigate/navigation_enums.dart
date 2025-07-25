enum NavigationEnums {
  init,
  login,
  preRegister,
  register,
  registerVerify,
  postRegister,
  mainScaffold,
}

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue => switch (this) {
    NavigationEnums.init => '/init',
    NavigationEnums.login => '/login',
    NavigationEnums.register => '/register',
    NavigationEnums.preRegister => '/pre-register',
    NavigationEnums.registerVerify => '/register/verify',
    NavigationEnums.postRegister => '/post-register',
    NavigationEnums.mainScaffold => '/main-scaffold',
  };

  NavigationEnums normalValue(String? val) => switch (val) {
    '/' || '/init' => NavigationEnums.init,
    '/login' => NavigationEnums.login,
    '/register' => NavigationEnums.register,
    '/pre-register' => NavigationEnums.preRegister,
    '/register/verify' => NavigationEnums.registerVerify,
    '/post-register' => NavigationEnums.postRegister,
    '/main-scaffold' => NavigationEnums.mainScaffold,
    _ => throw Exception(' [38;5;9m$val not found in $this [0m'),
  };
}
