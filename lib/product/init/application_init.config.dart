// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alfai/core/services/navigation_service.dart' as _i207;
import 'package:alfai/product/manager/network_manager.dart' as _i1016;
import 'package:alfai/product/service/ai_service.dart' as _i202;
import 'package:alfai/product/service/auth_service.dart' as _i295;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i207.NavigationService>(() => _i207.NavigationService());
    gh.singleton<_i1016.NetworkManager>(() => _i1016.NetworkManager());
    gh.lazySingleton<_i295.AuthService>(() => _i295.AuthService());
    gh.lazySingleton<_i202.AiService>(() => _i202.AiService());
    return this;
  }
}
