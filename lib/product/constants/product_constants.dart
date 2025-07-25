

class ProductConstants {
  static ProductConstants? _instace;
  static ProductConstants get instance {
    _instace ??= ProductConstants._init();
    return _instace!;
  }

  ProductConstants._init();

  final String appName = 'ALFAI';
  final String apiUrl = 'https://alfaamg-229550263076.europe-west3.run.app';

}
