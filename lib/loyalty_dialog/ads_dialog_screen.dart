
import 'dart:io';

import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/main.dart';
import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:ads_library/viewModel/ads_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// this class is used to load loyalty dialog
class AdsDialogScreen {
   bool _isLoading = false;
   BuildContext? contextT;
  AdsViewModel viewModel = AdsViewModel();

  AdsDialogScreen({ AdsType type = AdsType.dialog}) {
    init(type);
  }

   Future<void> init(AdsType type) async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
    await Firebase.initializeApp().then((value) => {
       viewModel.fetchDataFromFirebase(type)
    });
  }

   void closeLoadingDialog(BuildContext? buildContext) {
    if (_isLoading) {
      contextT = buildContext;
      if (buildContext != null) {
        Navigator.of(buildContext).pop();
      }
      _isLoading = false;
    }
  }

   void showDialogBanner(BuildContext context) {
    final DialogBanner dialogBanner = viewModel.adResponseState.data as DialogBanner;
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 400,
            width: 300,
            child: Image.network(
              dialogBanner.fields?.first.imageLink ?? '',
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0)),
          ),
        );
      },
    );
  }

   void showBigBanner(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 400,
            width: 200,
            child: const SizedBox.expand(child: FlutterLogo()),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
          ),
        );
      },
    );
  }
}
