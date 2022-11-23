import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/modules/payment/bottomNavBar_screen.dart';
import 'package:flutter_payment/modules/payment/cubit/cubit.dart';
import 'package:flutter_payment/modules/payment/cubit/states.dart';
import 'package:flutter_payment/shared/style/app_size.dart';
import 'package:flutter_payment/shared/style/color_manager.dart';
import 'package:flutter_payment/shared/style/text_manager.dart';

import '../../shared/component/component.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentSates>(
        listener: (context, state) {
          if (state is PaymentRefCodeKioskSuccessState) {
            navigateToAndFinish(context, const BottomNavBarScreen());
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: AppSize.size0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.white,
                  statusBarIconBrightness: Brightness.dark),
              title: const Text(
                TextManager.paymentIntegration,
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.size20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          TextManager.welcome,
                          style: TextStyle(
                              fontSize: AppSize.size25,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.deepOrange),
                        ),
                        const Text(
                          TextManager.signInToPay,
                          style: TextStyle(
                              fontSize: AppSize.size20,
                              color: ColorManager.deepOrange),
                        ),
                        const SizedBox(height: AppSize.size60),
                        buildTextFormField(
                          controller: firstNameController,
                          inputType: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return TextManager.pleaseEnterFirstName;
                            }
                            return null;
                          },
                          label: TextManager.firstName,
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: AppSize.size12),
                        buildTextFormField(
                          controller: lastNameController,
                          inputType: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return TextManager.pleaseEnterLastName;
                            }
                            return null;
                          },
                          label: TextManager.lastName,
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: AppSize.size12),
                        buildTextFormField(
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return TextManager.pleaseEnterEmail;
                            }
                            return null;
                          },
                          label: TextManager.emailAddress,
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: AppSize.size12),
                        buildTextFormField(
                          controller: phoneController,
                          inputType: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return TextManager.pleaseEnterPhone;
                            }
                            return null;
                          },
                          label: TextManager.phoneNumber,
                          prefixIcon: Icons.call,
                        ),
                        const SizedBox(height: AppSize.size12),
                        buildTextFormField(
                          controller: priceController,
                          inputType: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return TextManager.pleaseEnterPrice;
                            }
                            return null;
                          },
                          label: TextManager.price,
                          prefixIcon: Icons.monetization_on,
                        ),
                        const SizedBox(height: AppSize.size35),
                        if (state is PaymentLoadingState)
                          const LinearProgressIndicator(
                            color: Colors.deepOrange,
                          ),
                        const SizedBox(
                          height: AppSize.size10,
                        ),
                        defaultButton(
                            text: TextManager.goToPay,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getFirstToken(
                                    price: priceController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
