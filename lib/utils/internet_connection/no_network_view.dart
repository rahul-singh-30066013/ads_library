/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_data_found_widget.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoNetworkView extends StatefulWidget {
  const NoNetworkView({Key? key}) : super(key: key);

  @override
  State<NoNetworkView> createState() => _NoNetworkViewState();
}

class _NoNetworkViewState extends State<NoNetworkView> {
  StreamSubscription? connectivityStream;
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _listenNetworkChanges();
  }

  @override
  void dispose() {
    super.dispose();
    connectivityStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // final String routeName = ModalRoute.of(context)?.settings.name ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_connectivityResult != ConnectivityResult.none) {
        navigatorPopScreen(context);
      }
    });
    return Scaffold(
      appBar: Utils.getGenericAppBar(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => navigatorPopScreen(context),
              icon: const Icon(Icons.close),
            ),
            Expanded(
              child: Center(
                child: NoDataFoundWidget(
                  pageMainDesc: 'cant_find_you',
                  pageSubDesc: 'please_check_your_internet',
                  showButton: true,
                  buttonText: 'try_again',
                  onTapHandler: () => {
                    if (_connectivityResult != ConnectivityResult.none)
                      {
                        navigatorPopScreen(context),
                      },
                  },
                  imageStyle: Image.asset(
                    'lib/assets/images/common/no_internet_found.gif',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listenNetworkChanges() {
    connectivityStream = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) => {
            _connectivityResult = result,
            setState(() {
              adLog('');
            }),
          },
        );
  }
}
