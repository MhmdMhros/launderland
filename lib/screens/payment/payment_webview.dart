import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentWebview extends StatefulWidget {
  const PaymentWebview({super.key, required this.url});
  final String url;

  @override
  State<PaymentWebview> createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('payment'.tr()),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        ),
      ),
    );
  }
}
