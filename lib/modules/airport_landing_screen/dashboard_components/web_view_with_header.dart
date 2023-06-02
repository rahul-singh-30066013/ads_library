/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This Class is used for open webview
class WebViewWithHeader extends StatefulWidget {
  const WebViewWithHeader({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  _ADWebViewState createState() => _ADWebViewState();
}

class _ADWebViewState extends State<WebViewWithHeader> {
  bool _isLoading = true;
  bool _isLoadingFirstTime = false;

  WebViewController? _controller;

  void _onPageStart(url) {
    adLog(url);
    if (!_isLoadingFirstTime) {
      setState(() {
        _isLoading = true;
        _isLoadingFirstTime = true;
      });
    }
  }

  void _onPageFinish(url) {
    adLog(url);
    if (_isLoading) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    _controller?.reload();
  }

  @override
  void dispose() {
    super.dispose();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        elevation: 0,
        title: Text(
          widget.title,
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              onWebViewCreated: (controller) => _controller = controller,
              backgroundColor: Colors.white,
              initialUrl: widget.url,
              // initialUrl:
              // 'https://web-dev.adanidigitallabs.com/services/wifi?isapp=true',
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: _getUserAgent(),
              onPageFinished: (url) => _onPageFinish(url),
              onPageStarted: (url) => _onPageStart(url),
              // debuggingEnabled: true,
              gestureNavigationEnabled: true,
              allowsInlineMediaPlayback: true,
              navigationDelegate: navigationDelegate,
              javascriptChannels: <JavascriptChannel>{
                Utils.getAirportChangeWebViewBridge(context),
              },
            ),
            if (_isLoading)
              const Positioned.fill(
                child: ADDotProgressView(),
              ),
          ],
        ),
      ),
    );
  }

  String _getUserAgent() {
    if (kReleaseMode &&
        Environment.instance.configuration.appFlavor == AppFlavor.prod) {
      return '';
    }
    return userAgent;
  }

  FutureOr<NavigationDecision> navigationDelegate(
    NavigationRequest request,
  ) async {
    if (request.url.contains('pluralonline.com/?orderToken')) {
      await Utils.launchAppUrl(
        Uri.parse(request.url),
      );
      return NavigationDecision.prevent;
    } else if (request.url.contains('adanione://deeplink')) {
      DeepLinkManager().nativeDeepLink(route: request.url);
      return NavigationDecision.prevent;
    } else {
      if (!(await FlightUtils.openPdf(
        request.url,
      ))) {
        return NavigationDecision.navigate;
      }
      return NavigationDecision.prevent;
    }
  }
}
