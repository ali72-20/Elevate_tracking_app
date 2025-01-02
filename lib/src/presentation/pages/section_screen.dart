import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/di.dart';
import '../../../core/utilities/style/app_colors.dart';
import '../managers/section/section_screen_viewmodel.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  State<SectionScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SectionScreen> {
  final SectionScreenViewmodel _viewModel = getIt.get<SectionScreenViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        body: _viewModel.currentScreen,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(4, 4),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BottomNavigationBar(
                currentIndex: _viewModel.currentIndex,
                onTap: (index) {
                  setState(() {
                    _viewModel.updateCurrentIndex(index);
                  });
                },
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.kBaseColor,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                type: BottomNavigationBarType.fixed,
                elevation: 15,
                items: [
                  _buildBottomNavItem(Icons.home, "Home"),
                  _buildBottomNavItem(Icons.receipt_outlined, "Orders"),
                  _buildBottomNavItem(Icons.person_outline, "Profile"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 24.w,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        icon,
        size: 24.w,
        color: AppColors.kBaseColor,
      ),
      label: label,
    );
  }
}
