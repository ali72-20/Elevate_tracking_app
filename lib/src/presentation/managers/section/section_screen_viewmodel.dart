import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/pages/order/order_screen.dart';

import '../../pages/home/home_screen.dart';
import '../../pages/profile/profile_screen.dart';
import 'section_screen_state.dart';

@injectable
class SectionScreenViewmodel extends Cubit<SectionScreenState> {
  SectionScreenViewmodel() : super(HomeInitial());

  int _currentIndex = 0;

  // Expose current index
  int get currentIndex => _currentIndex;

  final List<String> _titles = [
    'Home',
    'Categories',
    'Cart',
    'Profile',
  ];

  final List<Widget> _screens = [
    const HomeScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  String get currentTitle => _titles[_currentIndex];
  Widget get currentScreen => _screens[_currentIndex];

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeStateUpdated());
  }
}
