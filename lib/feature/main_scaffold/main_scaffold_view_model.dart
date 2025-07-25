import 'package:alfai/product/constants/image_constants.dart';
import 'package:stacked/stacked.dart';

enum NavbarItem {
  home,
  discory,
  profile;

  String get label => switch (this) {
    home => 'Anasayfa',
    discory => 'Keşfet',
    profile => 'Profil',
  };

  String get icon => switch (this) {
    home => ImageConstants.instance.svgAssets.home,
    discory => ImageConstants.instance.svgAssets.discory,
    profile => ImageConstants.instance.svgAssets.profile,
  };
}

class MainScaffoldViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
