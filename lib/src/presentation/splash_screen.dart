import 'package:flutter/cupertino.dart';
import 'package:tracking_app/core/common/common_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("new app"),),
    );
  }
}
