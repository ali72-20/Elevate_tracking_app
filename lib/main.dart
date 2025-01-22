import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/src/tracking_app.dart';

import 'core/di/di.dart';
import 'core/helpers/shared_pref/shared_pref_keys.dart';
import 'core/utilities/bloc_observer/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  String? token =
  await getIt<FlutterSecureStorage>().read(key: SharedPrefKeys.tokeKey);
  print(token);
  if (token != null) {
    getIt<Dio>().options.headers['Authorization'] = 'Bearer $token';
  }
  Bloc.observer = MyBlocObserver();
  runApp(const TrackingApp());
}