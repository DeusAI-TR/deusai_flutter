enum ApiPath {
  login;

  String get toPath => switch (this) {
    ApiPath.login => '/api_giris',
  };
} 