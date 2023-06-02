/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/pay_now_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

const callbackUrl = 'https://localhost:7271/swagger/index.html';

/// This Class is used for open webview payment gateway
class ADWebView extends StatefulWidget {
  const ADWebView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PayNowResponse data;

  @override
  _ADWebViewState createState() => _ADWebViewState();
}

class _ADWebViewState extends State<ADWebView> {
  WebViewController? _controllerGlobal;
  static const javaScriptNamePaymentId =
      'document.getElementsByName("payment_id")[0].value';
  static const javaScriptNamePaymentPluralOrderId =
      'document.getElementsByName("plural_order_id")[0].value';
  final PaymentResponse _paymentResponse = PaymentResponse('', '');
  String orderID = '';
  String paymentID = '';
  bool _isLoading = true;
  bool _isLoadingFirstTime = false;
  Uri? url;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  FutureOr<NavigationDecision> navigationDelegate(
    NavigationRequest request,
  ) async {
    adLog(request.url);
    if (request.url == callbackUrl || request.url.contains(callbackUrl)) {
      _updatePaymentResponse(request.url);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  void _onPageStart(url) {
    adLog(url);
    if (!_isLoadingFirstTime) {
      setState(() {
        _isLoading = true;
        _isLoadingFirstTime = true;
      });
    }
    _updatePaymentResponse(url);
  }

  void _updatePaymentResponse(dynamic urlStr) {
    if (urlStr.toString() == callbackUrl ||
        urlStr.toString().contains(callbackUrl)) {
      _paymentResponse
        ..paymentID = widget.data.paymentID ?? ''
        ..orderID = widget.data.orderID ?? '';

      ///in case need to read from the innerHTML Pinelab only
      //_setPaymentResponse();

      callBackToPaymentScreen(_paymentResponse);
    }
  }

  void _setPaymentResponse() {
    _controllerGlobal
        ?.runJavascriptReturningResult(javaScriptNamePaymentId)
        .then((value) async {
      if (value.isEmpty) {
        _paymentResponse.paymentID = widget.data.paymentID ?? '';
      }
      adLog('javaScriptNamePaymentId-->>> $value');
    });

    _controllerGlobal
        ?.runJavascriptReturningResult(javaScriptNamePaymentPluralOrderId)
        .then((value) async {
      if (value.isEmpty) {
        _paymentResponse.orderID = widget.data.orderID ?? '';
      }
      adLog('javaScriptNamePaymentPluralOrderId-->>> $value');
    });

    callBackToPaymentScreen(_paymentResponse);
  }

  void callBackToPaymentScreen(PaymentResponse value) {
    adLog('Final Response--->> ${value.orderID}');
    adLog('Final Response--->> ${value.paymentID}');
    return Navigator.pop(
      context,
      value,
    );
  }

  void _onPageFinish(url) {
    adLog(url);
    setState(() {
      _isLoading = false;
    });
    if (url.toString() == callbackUrl) {
      _controllerGlobal
          ?.runJavascriptReturningResult('document.documentElement.innerHTML')
          .then((value) async {
        adLog(value);
      });
    }
  }

  void _callCompletionHandler(WebViewController webViewController) {
    _controller.future.then((value) {
      _controllerGlobal = value;
    });
    _controller.complete(webViewController);
  }

  @override
  void initState() {
    super.initState();
    widget.data.pgType?.toLowerCase() == 'juspay'
        ? url = Uri.parse(widget.data.content ?? '')
        : url = Uri.dataFromString(
            widget.data.content ?? '',
            mimeType: 'text/html',
          );
  }

  @override
  Widget build(BuildContext context) {
    adLog('urls $url');
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'payments'.localize(context),
              style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            ),
          ),
          body: SafeArea(
            child: WebView(
              backgroundColor: Colors.white,
              /* userAgent:
                  'AdaniOne App iOS/Android - QWRhbmlPbmUgQXBwIGlPUy9BbmRyb2lk',*/
              initialUrl: url.toString(),
              onWebViewCreated: (WebViewController webViewController) =>
                  _callCompletionHandler(webViewController),
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (url) => _onPageStart(url),
              onPageFinished: (url) => _onPageFinish(url),
              navigationDelegate: navigationDelegate,
              gestureNavigationEnabled: true,
            ),
          ),
        ),
        if (_isLoading)
          const Positioned.fill(
            child: ADDotProgressView(),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}

class PaymentResponse {
  String orderID = '';
  String paymentID = '';

  PaymentResponse(this.orderID, this.paymentID);
}
