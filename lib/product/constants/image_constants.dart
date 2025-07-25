// ignore_for_file: unused_element

class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final lottieAssets = _Lottie();
  final svgAssets = _SVG();
  final iconAssets = _Icon();
  //final String example = 'png/example'.toPNG;
}

class _SVG {
  //final String example = 'svg/example'.toSVG;
  final String logo = 'svg/logo'.toSVG;
  final String upgrade = 'icons/Icon-18'.toSVG;
  final String upload = 'icons/Icon-19'.toSVG;
  final String home = 'icons/Icon-10'.toSVG;
  final String discory = 'icons/Icon-11'.toSVG;
  final String profile = 'icons/Icon-12'.toSVG;
  final String surpriseMe = 'icons/Icon-5'.toSVG;
  final String delete = 'icons/Icon-14'.toSVG;
}

class _Icon {
  //final String example = 'svg/example'.toSVG;
  final String google = 'icons/google'.toSVG;
}

class _Lottie {
  // final String example = 'lottie/example'.toJSON;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
  String get toJPEG => 'assets/$this.jpeg';
  String get toJSON => 'assets/$this.json';
  String get toSVG => 'assets/$this.svg';
  String get toJPG => 'assets/$this.jpg';
}
