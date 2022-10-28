import 'package:flutter/material.dart';
import 'package:flutter_payment/shared/network/api_const.dart';
import 'package:flutter_payment/shared/style/color_manager.dart';
import 'package:flutter_payment/shared/style/text_manager.dart';

import '../../shared/style/app_size.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            TextManager.refCodeScreenHeader,
            style: TextStyle(
                color: ColorManager.deepOrange, fontSize: AppSize.size20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSize.size50,
          ),
          const Image(image: AssetImage(TextManager.reCodeAssetsPath)),
          const SizedBox(
            height: AppSize.size10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                TextManager.yourRefCodeIs,
                style: TextStyle(
                    color: Colors.deepOrange, fontSize: AppSize.size15),
              ),
              const SizedBox(width: AppSize.size10),
              Container(
                color: ColorManager.grey,
                child: Text(
                  ApiConst.refCode,
                  style: const TextStyle(
                      color: ColorManager.black, fontSize: AppSize.size20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
