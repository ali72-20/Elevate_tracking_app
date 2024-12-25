import 'package:flutter/material.dart';
import 'package:tracking_app/src/tracking_app.dart';

import 'core/di/di.dart';
import 'core/utilities/bloc_observer/my_bloc_observer.dart';
import 'package:bloc/bloc.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const TrackingApp());
}
