import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_payment/modules/register/register.dart';
import 'package:flutter_payment/shared/style/app_size.dart';
import 'package:flutter_payment/shared/style/app_values.dart';
import 'package:flutter_payment/shared/style/color_manager.dart';

import '../../shared/component/component.dart';
import '../../shared/style/text_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppValues.splashScreenTimer), () {
      navigateToAndFinish(context, RegisterScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image(
          image: AssetImage(TextManager.splashImagePath),
          width: AppSize.size450,
        ),
      ),
    );
  }
}
