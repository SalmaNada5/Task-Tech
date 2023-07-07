import 'package:flutter/material.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/unexpected_error_screen.dart';
import 'package:task_tech/presentation/screens/payment/success_payment_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith("https://task-teck.onrender.com/")) {
            debugPrint('blocking navigation to ${request.url}');
            Constants.navigateTo(
              const CongratesScreen(),
              pushAndRemoveUntil: true,
            );
          } else {
            Constants.navigateTo(
              const UnexpectedErrorScreen(
                failedMessage: 'Payment Faild!',
              ),
              pushReplacment: true,
            );
          }
          return NavigationDecision.prevent;
        },
        onUrlChange: (UrlChange change) {
          // if (change.url == "https://task-teck.onrender.com/") {
          // Constants.navigateTo(
          //   const CongratesScreen(),
          // );
          // } else {
          //   Constants.navigateTo(const UnexpectedErrorScreen(
          //     failedMessage: 'Payment Faild!',
          //   ));
          // }
          debugPrint('url change to ${change.url}');
        },
      ));
    return Center(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
