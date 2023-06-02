/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DeleteAccount extends StatefulWidget {
  final ADTapCallback deleteAccountTap;
  final ValueNotifier<bool> deleteAccountNotifier;

  const DeleteAccount({
    Key? key,
    required this.deleteAccountTap,
    required this.deleteAccountNotifier,
  }) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, bool value, child) => AbsorbPointer(
        absorbing: value,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'are_you_sure_to_delete_account'.localize(context),
                style: ADTextStyle400.size16.setTextColor(
                  context.adColors.neutralInfoMsg,
                ),
              ),
              ADSizedBox(
                height: context.k_30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ADSizedBox(
                      height: context.k_48,
                      child: ElevatedButton(
                        onPressed: () => clickOnCancel(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_24),
                            ),
                            side: BorderSide(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                          primary: context.adColors.whiteTextColor,
                          onPrimary: context.adColors.lightGreyTextColor,
                        ),
                        child: Text(
                          'cancel'.localize(context),
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ),
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_10,
                  ),
                  Expanded(
                    child: ADSizedBox(
                      height: context.k_48,
                      child: ElevatedButton(
                        onPressed: () => logoutClick(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_24),
                            ),
                          ),
                          primary: context.adColors.blackTextColor,
                          onPrimary: context.adColors.lightGreyTextColor,
                        ),
                        child: value
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                              )
                            : Text(
                                'yes'.localize(context),
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ),
      ),
      valueListenable: widget.deleteAccountNotifier,
    );
  }

  Future<void> logoutClick() async {
    widget.deleteAccountTap();
  }

  void clickOnCancel() {
    Navigator.pop(context);
  }
}
