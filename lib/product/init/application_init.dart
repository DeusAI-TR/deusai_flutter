import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'shared_manager.dart';
import 'timezone_init.dart';
import 'application_init.config.dart';

@InjectableInit()
void configureDependencies() => GetIt.instance.init();

class ApplicationInit {
  Future<void> firstlyInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await _initEasyLocalization();

    TimezoneInit().init();
    SharedManager.instance.initSharedManager();
    configureDependencies();
  }

  /// EasyLocalization Initialization
  Future _initEasyLocalization() async {
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
  }

}

GetIt get locator => GetIt.I;
