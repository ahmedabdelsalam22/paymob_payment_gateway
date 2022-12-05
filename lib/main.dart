import 'package:flutter/material.dart';
import 'package:flutter_payment/notification_service/notofication.dart';
import 'package:flutter_payment/shared/network/remote/dio_helper.dart';
import 'package:flutter_payment/shared/style/theme.dart';

import 'modules/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotifyHelper notifyHelper = NotifyHelper();
  notifyHelper.initializeNotification();
  notifyHelper.displayNotification(
    title: "Welcome in payment app",
    body: 'I hope you like our app',
  );

  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
