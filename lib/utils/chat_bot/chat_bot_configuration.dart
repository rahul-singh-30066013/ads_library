import 'dart:async';
import 'dart:convert';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:ymchat_flutter/ymchat_flutter.dart';

class ChatBotConfiguration {
  static StreamSubscription<dynamic>? _eventsChannel;
  static StreamSubscription<dynamic>? _closeEventChannel;
  static bool isChatBotRunning = false;

  /// Use this function to start ChatBot.
  static Future<void> startChatBot() async {
    isChatBotRunning = true;
    final value = await YmChat.startChatbot();
    adLog(value.toString());
  }

  static Future<void> _closeChatBot() async {
    final value = await YmChat.closeBot();
    adLog(value.toString());
  }

  static void chatBotConfigurationSetup({required BuildContext context}) {
    // Initializing chatbot id to work with in the SDK

    const Uuid uuid = Uuid();

    /// get chatBotId for flavor
    final boatId =
        YmChat.setBotId(Environment.instance.configuration.chatBotId);
    adLog(boatId.toString());

    // Adding payload to communicate with chatbot
    final payLod = YmChat.setPayload({'integration': 'Flutter'});
    adLog(payLod.toString());

    // Enabling UI close button
    final closeButton = YmChat.showCloseButton(true);
    adLog(closeButton.toString());

    // Enabling voice input
    final enableSpeech = YmChat.setEnableSpeech(false);
    adLog(enableSpeech.toString());

    // using v2 widget
    final version = YmChat.setVersion(2);
    adLog(version.toString());

    final authToken = uuid.v4();
    final authUuid = YmChat.setAuthenticationToken(authToken);
    adLog(authUuid.toString());

    final value = YmChat.setStatusBarColor('#0d60b0');
    adLog(value.toString());

    // Listening to bot events
    const EventChannel _ymEventChannel = EventChannel('YMChatEvent');
    _eventsChannel = _ymEventChannel.receiveBroadcastStream().listen(
      (event) {
        final Map ymEvent = event;
        adLog('Event Recieved -->> ${ymEvent.toString()}');
        if (ymEvent['data'] != null) {
          final String redirectUrl = ymEvent['data'];
          final Map urlMap = jsonDecode(redirectUrl);
          if (urlMap['url'] != null) {
            final String url = urlMap['url'];
            adLog(url);
            _closeChatBot();
            // Close ChatBot Before Routing
            if (url.contains('adanione://deeplink')) {
              // InApp Routing
              DeepLinkManager().startChatBotRouting(
                route: url,
              );
            } else {
              // Open WebView
              String title = 'Services';
              if (urlMap.containsKey('pageTitle')) {
                title = urlMap['pageTitle'];
              }
              final WebViewModel model = WebViewModel(
                title: title,
                url: url,
              );
              navigateToScreenUsingNamedRouteWithArguments(
                context,
                webViewContainer,
                argumentObject: model,
              );
            }
          }
        }
      },
    );

    // Listening to close bot events
    const EventChannel _ymCloseEventChannel = EventChannel('YMBotCloseEvent');
    _closeEventChannel = _ymCloseEventChannel.receiveBroadcastStream().listen(
      (event) {
        isChatBotRunning = false;
        adLog('In ChatBot Close Event');
      },
    );
  }

  static void disposeChatBotListeners() {
    _eventsChannel?.cancel();
    _closeEventChannel?.cancel();
  }
}
