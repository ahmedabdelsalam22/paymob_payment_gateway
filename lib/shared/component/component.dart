import 'package:flutter/material.dart';
import 'package:flutter_payment/shared/style/app_size.dart';

import '../style/color_manager.dart';

void navigateTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndFinish(context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget defaultButton({
  double width = double.infinity,
  double height = AppSize.size55,
  Color background = Colors.deepOrange,
  required Function onPressed,
  required String text,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSize.size8),
      color: background,
    ),
    padding: const EdgeInsets.all(AppSize.size8),
    child: MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: ColorManager.white),
      ),
    ),
  );
}

Widget buildTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefixIcon,
  Widget? suffix,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    validator: validate,
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        border: const OutlineInputBorder(),
        suffixIcon: suffix),
  );
}
