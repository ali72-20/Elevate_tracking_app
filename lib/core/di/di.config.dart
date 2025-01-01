// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../src/data/api/api_services.dart' as _i318;
import '../../src/data/api/network_factory.dart' as _i801;
import '../../src/data/data_sources/offline_data_source/auth_offline_data_source.dart'
    as _i886;
import '../../src/data/data_sources/offline_data_source/auth_offline_data_source_impl.dart'
    as _i895;
import '../../src/data/data_sources/online_data_source/Auth/forget_password/forget_password_online_data_source.dart'
    as _i159;
import '../../src/data/data_sources/online_data_source/Auth/forget_password/forget_password_online_data_source_impl.dart'
    as _i1013;
import '../../src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source.dart'
    as _i633;
import '../../src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source_impl.dart'
    as _i523;
import '../../src/data/repositories/forget_password_repository_impl.dart'
    as _i847;
import '../../src/domain/repositories/forget_password/forget_password_repository.dart'
    as _i1032;
import '../../src/domain/use_cases/forget_password/forget_password_use_cases.dart'
    as _i235;
import '../../src/presentation/managers/Auth/apply/apply_screen_view_model.dart'
    as _i675;
import '../../src/presentation/managers/Auth/forget_password/forget_password_screen_view_model.dart'
    as _i762;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i675.ApplyScreenViewModel>(() => _i675.ApplyScreenViewModel());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.singleton<_i318.ApiServices>(() => _i318.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i886.AuthOfflineDataSource>(
        () => _i895.AuthOfflineDataSourceImpl());
    gh.factory<_i159.ForgetPasswordOnlineDataSource>(() =>
        _i1013.ForgetPasswordOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i633.VehiclesOnlineDataSource>(
        () => _i523.VehiclesOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i1032.ForgetPasswordRepository>(
        () => _i847.ForgetPasswordRepositoryImpl(
              gh<_i159.ForgetPasswordOnlineDataSource>(),
              gh<_i886.AuthOfflineDataSource>(),
            ));
    gh.factory<_i235.ForgetPasswordUseCases>(() =>
        _i235.ForgetPasswordUseCases(gh<_i1032.ForgetPasswordRepository>()));
    gh.factory<_i762.ForgetPasswordScreenViewModel>(() =>
        _i762.ForgetPasswordScreenViewModel(
            gh<_i235.ForgetPasswordUseCases>()));
    return this;
  }
}

class _$DioProvider extends _i801.DioProvider {}
