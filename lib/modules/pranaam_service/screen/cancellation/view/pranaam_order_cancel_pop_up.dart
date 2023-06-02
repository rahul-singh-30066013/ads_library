/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/cancellation_policies/cancellation_policies_model.dart'
    as policies;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/pranaam_cancellation_policies.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// Order cancellation bottom sheet popup
class PranaamOrderCancelPopUp extends StatefulWidget {
  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  final String? buttonTitle;
  static double k_72 = 72.sp;
  final bool isLoading;

  const PranaamOrderCancelPopUp({
    Key? key,
    required this.yesCallBack,
    required this.titleString,
    required this.detailString,
    required this.isLoading,
    this.buttonTitle,
  }) : super(key: key);

  @override
  _PranaamOrderCancelPopUpState createState() =>
      _PranaamOrderCancelPopUpState();
}

class _PranaamOrderCancelPopUpState extends State<PranaamOrderCancelPopUp> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_10),
          const PranaamRemoveOrderCancelHeader(),
          SizedBox(
            height: context.scaled(context.k_6),
          ),
          Text(
            widget.titleString,
            textAlign: TextAlign.left,
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveHeaderTitle,
            ),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.k_20,
          ),
          Text(
            widget.detailString,
            textAlign: TextAlign.left,
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_10,
          ),
          InkWell(
            onTap: () => {
              if (!DeBounce.isRedundantClick())
                {
                  initCancellationPoliciesApi(context),
                },
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: ADTextStyle400.size14,
                    text: 'By proceeding, you agree with our ',
                  ),
                  TextSpan(
                    style: ADTextStyle500.size14
                        .copyWith(decoration: TextDecoration.underline),
                    text: '${'cancellation_charges'.localize(context)}.',
                  ),
                ],
              ),
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_10,
            bottom: context.k_20,
          ),
          SizedBox(
            height: context.k_10,
          ),
          PranaamRemoveOrderCancelFooter(
            isLoading: widget.isLoading,
            yesCallBack: widget.yesCallBack,
            buttonTitle: widget.buttonTitle,
          ),
        ],
      ),
    );
  }

  void onChanged({required bool newValue}) {
    setState(() {
      checkBoxValue = newValue;
    });
  }

  Future<bool> onBackPressed() {
    Navigator.of(context).pop();

    return Future.value(false);
  }

  Future<void> initCancellationPoliciesApi(BuildContext context) async {
    final ADResponseState response =
        await SiteCoreStateManagement().fetchCancellationPoliciesFromSiteCore();
    switch (response.viewStatus) {
      case Status.complete:
        adLog('initCancellationPoliciesApi ${response.data}');
        if (response.data != null) {
          final policies.Element cancellationPolicies = response.data;
          final header = cancellationPolicies.fields.header;
          final rows = cancellationPolicies.fields.rows;
          if (header.isNotEmpty &&
              rows.isNotEmpty &&
              header.length > 1 &&
              rows.length > 1) {
            cancellationPoliciesBottomSheet(context, response.data);
          } else {
            showSnackBar(context);
          }
        } else {
          showSnackBar(context);
        }
        break;
      case Status.error:
        showSnackBar(context);
        break;
      case Status.loading:
        ProcessDialog.showLoadingDialog(context);
        break;
      default:
        break;
    }
  }

  void showSnackBar(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'some_thing_went_wrong'.localize(context),
    );
  }

  void cancellationPoliciesBottomSheet(
    BuildContext context,
    policies.Element pranaamCancellationPolicies,
  ) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return PranaamCancellationPolicies(
          pranaamCancellationPolicies: pranaamCancellationPolicies,
        );
      },
    );

    adLog('$bottomSheet');
  }
}

///_height is used for header & Tab bar container height
final _height = 50.0.sp;

///_height is used for bottom container height
double _bottomContainerHeight = 84.sp;

/// This class is used to for create Duty Free Remove Item Header & Footer View
///[PranaamRemoveOrderCancelHeader] is use for create Header View
class PranaamRemoveOrderCancelHeader extends StatelessWidget {
  const PranaamRemoveOrderCancelHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: Row(
        children: <Widget>[
          InkWell(
            splashColor: context.adColors.transparentColor,
            onTap: () => {
              Navigator.pop(context),
            },

            ///Image that will be used to Left Top close button
            child: Container(
              width: context.k_34,
              height: context.k_34,
              child: SvgPicture.asset(
                SvgAssets.closeIcon,
                height: context.k_14,
                width: context.k_14,
                color: closeIconColor,
              ).paddingAllSide(context.k_10),
            ),
          ),
          SizedBox(
            width: context.k_4,
          ),
        ],
      ),
    ).paddingBySide(left: context.k_6, right: context.k_6);
  }
}

/// This class is used for create Footer View
/// [PranaamRemoveOrderCancelFooter] is used for create footer button
class PranaamRemoveOrderCancelFooter extends StatelessWidget {
  const PranaamRemoveOrderCancelFooter({
    Key? key,
    required this.yesCallBack,
    this.buttonTitle,
    required this.isLoading,
  }) : super(key: key);

  final String? buttonTitle;

  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    adLog('BookingAndCancellationState');
    return ADSelectorStateLessWidget<BookingAndCancellationState>(
      key: const Key('DashBoard'),
      viewModel: BookingAndCancellationState(),
      child: Container(
        height: _bottomContainerHeight,
        width: context.widthOfScreen,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            foregroundColor: MaterialStateProperty.all<Color>(
              context.adColors.whiteTextColor,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              context.adColors.blackTextColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(context.k_28)),
                side: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          onPressed: yesCallBack,
          child: isLoading
              ? ADDotProgressView(
                  color: context.adColors.whiteTextColor,
                )
              : Text(
                  buttonTitle ?? 'yes'.localize(context),
                  style: ADTextStyle700.size16
                      .setTextColor(context.adColors.whiteTextColor),
                ),
        )
            .paddingBySide(
              left: PranaamOrderCancelPopUp.k_72,
              right: PranaamOrderCancelPopUp.k_72,
            )
            .paddingBySide(bottom: context.k_36),
      ),
    );
  }
}
