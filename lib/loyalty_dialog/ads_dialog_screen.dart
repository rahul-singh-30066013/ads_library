import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/extension/size_config_extention.dart';
import 'package:flutter/material.dart';

/// this class is used to load loyalty dialog
class AdsDialogScreen {
  static bool _isLoading = false;
  static BuildContext? contextT;


  static void closeLoadingDialog(BuildContext? buildContext) {
    if (_isLoading) {
      buildContext = contextT;
      if (buildContext != null) {
        Navigator.of(buildContext).pop();
      }
      _isLoading = false;
    }
  }

  static void showDialogBanner(BuildContext context, DialogBanner dialogBanner) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: context.heightOfScreen - 200,
            width: context.widthOfScreen - context.k_36,
            child: Image.network(dialogBanner.fields?.first.imageLink ?? '',),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(context.k_24)),
          ),
        );
      },
    );
  }

  static void showBigBanner(BuildContext context) {
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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
          ),
        );
      },
    );
  }
}
