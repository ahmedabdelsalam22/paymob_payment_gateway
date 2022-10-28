import 'package:flutter/material.dart';
import 'package:flutter_payment/shared/style/color_manager.dart';

import '../../shared/component/component.dart';
import '../../shared/style/app_size.dart';
import '../../shared/style/text_manager.dart';
import '../web_view/web_view_screen.dart';

class VisaCardScreen extends StatelessWidget {
  const VisaCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.size10,
          ),
          Container(
            height: AppSize.size55,
            width: AppSize.size250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.size8),
              color: Colors.deepOrange,
            ),
            child: TextButton(
                onPressed: () {
                  navigateTo(context, const WebViewScreen());
                },
                child: const Text(
                  TextManager.pay,
                  style: TextStyle(
                      color: ColorManager.white, fontSize: AppSize.size20),
                )),
          ),
          const SizedBox(height: AppSize.size50),
          const Image(image: AssetImage(TextManager.visaCardAssetPath)),
        ],
      ),
    );
  }
}
