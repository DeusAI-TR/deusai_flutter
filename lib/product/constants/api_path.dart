enum ApiPath {
  login,
  create;

  String get toPath => switch (this) {
    ApiPath.login => '/api_giris',
    ApiPath.create => '/olustur',
  };
} 