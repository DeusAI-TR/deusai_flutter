enum NavigationEnums {
  init,
  login,
  preRegister,
  register,
  registerVerify,
  postRegister,
}

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue => switch (this) {
    NavigationEnums.init => '/init',
    NavigationEnums.login => '/login',
    NavigationEnums.register => '/register',
    NavigationEnums.preRegister => '/pre-register',
    NavigationEnums.registerVerify => '/register/verify',
    NavigationEnums.postRegister => '/post-register',
  };

  NavigationEnums normalValue(String? val) => switch (val) {
    '/' || '/init' => NavigationEnums.init,
    '/login' => NavigationEnums.login,
    '/register' => NavigationEnums.register,
    '/pre-register' => NavigationEnums.preRegister,
    '/register/verify' => NavigationEnums.registerVerify,
    '/post-register' => NavigationEnums.postRegister,
    _ => throw Exception('$val not found in $this'),
  };
}
