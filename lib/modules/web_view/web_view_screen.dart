import 'package:flutter/material.dart';
import 'package:flutter_payment/modules/register/register.dart';
import 'package:flutter_payment/shared/component/component.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../notification_service/notofication.dart';
import '../../shared/network/api_const.dart';
import '../../shared/style/color_manager.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late NotifyHelper notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateToAndFinish(context, RegisterScreen());
                notifyHelper.initializeNotification();
                notifyHelper.displayNotification(
                    title: "Payment process finished",
                    body: 'You can register and start new billing process');
              },
              icon: const Icon(
                Icons.check_box_outlined,
                color: ColorManager.deepOrange,
              ))
        ],
      ),
      body: Center(
        child: WebView(
          initialUrl: ApiConst.webViewInitialUrl,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          backgroundColor: ColorManager.white,
        ),
      ),
    );
  }
}
