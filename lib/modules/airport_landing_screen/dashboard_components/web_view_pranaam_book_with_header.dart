/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This Class is used for open webview
class WebViewPranaamBookWithHeader extends StatefulWidget {
  const WebViewPranaamBookWithHeader({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  _ADWebViewState createState() => _ADWebViewState();
}

class _ADWebViewState extends State<WebViewPranaamBookWithHeader> {
  bool _isLoading = true;

  void _onPageFinish(url) {
    adLog(url);
    setState(() {
      _isLoading = false;
    });
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
              backgroundColor: Colors.white,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              userAgent:
                  'AdaniOne App iOS/Android - QWRhbmlPbmUgQXBwIGlPUy9BbmRyb2lk',
              onPageFinished: (url) => _onPageFinish(url),
              // debuggingEnabled: true,
              gestureNavigationEnabled: true,
            ),
            if (_isLoading)
              const Positioned.fill(
                child: ADDotProgressView(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: context.adColors.blueColor,
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              vertical: context.k_14,
            ),
          ),
          onPressed: () => navigateToScreenUsingNamedRouteWithArguments(
            context,
            serviceBookingScreen,
            argumentObject: [true, true],
          ),
          child: Text(
            'book_now'.localize(context),
            style: ADTextStyle700.size16.setTextColor(
              context.adColors.whiteTextColor,
            ),
          ),
        ).paddingBySide(
          left: context.k_22,
          right: context.k_22,
          top: context.k_8,
          bottom: context.k_8,
        ),
      ),
    );
  }
}

/*
String getUrlAccordingToEnvirornment(String url) {
  return Environment.instance.configuration is StagingConfig
      ? url.replaceAll(
          'https://cms-dev.adanidigitallabs.com/',
          Environment.instance.configuration.cmsBaseUrl,
        )
      : url;
}
*/

///TODO
