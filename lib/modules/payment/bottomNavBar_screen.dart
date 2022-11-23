import 'package:flutter/material.dart';
import 'package:flutter_payment/modules/payment/reference_code.dart';
import 'package:flutter_payment/modules/payment/visa_card.dart';
import 'package:flutter_payment/notification_service/notofication.dart';
import 'package:flutter_payment/shared/style/app_values.dart';
import 'package:flutter_payment/shared/style/color_manager.dart';

import '../../shared/style/text_manager.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = AppValues.currentIndex;

  List<Widget> screens = [const VisaCardScreen(), const ReferenceCodeScreen()];

  List<String> title = [TextManager.visaCard, TextManager.referenceCode];

  late NotifyHelper notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.displayNotification(
        title: "choose your billing way!",
        body: 'you can pay with visa or reference code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(title[currentIndex]),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
              ),
              label: TextManager.visaCard),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_sharp),
              label: TextManager.referenceCode),
        ],
      ),
    );
  }
}
