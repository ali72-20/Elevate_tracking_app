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
import '../../src/data/data_sources/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart'
    as _i673;
import '../../src/data/data_sources/offline_data_source/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i813;
import '../../src/data/data_sources/online_data_source/auth_online_data_source/auth_online_data_source.dart'
    as _i269;
import '../../src/data/data_sources/online_data_source/auth_online_data_source/auth_online_data_source_impl.dart'
    as _i856;
import '../../src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source.dart'
    as _i673;
import '../../src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source_impl.dart'
    as _i387;
import '../../src/data/repositories/auth_repository_impl.dart' as _i486;
import '../../src/data/repositories/forget_password_repository_impl.dart'
    as _i847;
import '../../src/domain/repositories/auth_repository.dart' as _i333;
import '../../src/domain/repositories/forget_password/forget_password_repository.dart'
    as _i1032;
import '../../src/domain/use_cases/forget_password/forget_password_use_cases.dart'
    as _i235;
import '../../src/presentation/managers/forget_password/forget_password_screen_view_model.dart'
    as _i340;

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
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.singleton<_i318.ApiServices>(() => _i318.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i673.ForgetPasswordOnlineDataSource>(() =>
        _i387.ForgetPasswordOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i1032.ForgetPasswordRepository>(() =>
        _i847.ForgetPasswordRepositoryImpl(
            gh<_i673.ForgetPasswordOnlineDataSource>()));
    gh.factory<_i235.ForgetPasswordUseCases>(() =>
        _i235.ForgetPasswordUseCases(gh<_i1032.ForgetPasswordRepository>()));
    gh.factory<_i340.ForgetPasswordScreenViewModel>(() =>
        _i340.ForgetPasswordScreenViewModel(
            gh<_i235.ForgetPasswordUseCases>()));
    return this;
  }
}

class _$DioProvider extends _i801.DioProvider {}
