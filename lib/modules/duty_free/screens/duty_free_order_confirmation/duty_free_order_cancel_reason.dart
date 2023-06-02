/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_cancel_reason_refund.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_select_reason.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// Order Cancel reason page
class DutyFreeOrderCancelReason extends StatelessWidget {
  // DutyFreeOrderState? dutyFreeOrderState;
  const DutyFreeOrderCancelReason({Key? key, this.scrollController})
      : super(key: key);

  /// padding of height 50
  static double padding50 = 50.sp;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    context.read<DutyFreeOrderState>()
      ..isContinueCancelOrderlButtonActive.value = false
      ..dutyFreeEventState.orderCancellationStartEvent();

    return Consumer<DutyFreeOrderState>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'cancellation_reason_title'.localize(context),
            style: ADTextStyle700.size22.setTextColor(
              context.adColors.blackTextColor,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ADSizedBox(
                  //   height: context.k_4,
                  // ),
                  // Text(
                  //   'please_choose_the_correct_reason_for_cancellation'
                  //       .localize(context),
                  //   style: ADTextStyle400.size14.setTextColor(
                  //     context.adColors.neutralInfoMsg,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: context.k_30,
                  // ),
                  Text(
                    'select_reason'.localize(context),
                    style: ADTextStyle500.size18.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  const DutyFreeSelectReason(),
                  SizedBox(
                    height: context.k_30,
                  ),
                  const DutyFreeCancelReasonRefund(),
                  SizedBox(
                    height: padding50,
                  ),

                  /// Submit button
                  ValueListenableBuilder(
                    valueListenable: context
                        .read<DutyFreeOrderState>()
                        .isContinueCancelOrderlButtonActive,
                    child: Container(),
                    builder: (context, bool value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: context.adColors.blueColor,
                        // elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.k_28),
                        ),
                        minimumSize: Size(
                          double.infinity,
                          context.k_56,
                        ), //////// HERE
                      ),
                      onPressed:
                          value ? () => cancelConfirmation(context) : null,
                      child: Text(
                        'continue'.localize(context),
                        style: ADTextStyle700.size18.setTextColor(
                          context.adColors.whiteTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.k_48,
                  ),
                ],
              ).paddingBySide(
                top: context.k_20,
                left: context.k_16,
                right: context.k_16,
                bottom: context.k_16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _apiCall(
    BuildContext context,
    BuildContext dialogContext,
  ) {
    final DutyFreeOrderState orderState = context.read<DutyFreeOrderState>();
    adLog(
      '${orderState.dutyFreeCancellationRequest}',
    );
    orderState
      ..dutyFreeCancellationRequest =
          orderState.dutyFreeCancellationRequest.copyWith(
        orderReferenceId: orderState.transactionId,
      )
      ..orderCancellation(
        orderState.dutyFreeCancellationRequest,
        context,
        dialogContext,
      );
  }

  void cancelConfirmation(
    BuildContext context,
  ) {
    context
        .read<DutyFreeOrderState>()
        .dutyFreeEventState
        .cancellationReasonEvent();

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
        return DutyFreeOrderCancelPopUp(
          detailString: 'duty_free_cancel_order_message'.localize(context),
          titleString: 'confirm_cancellation'.localize(context),
         yesCallBack: () => dismissDialogAndPush(context, dialogContext),
          buttonTitle: 'confirm'.localize(context),
        );
      },
    );
    adLog('$bottomSheet');
  }

  void dismissDialogAndPush(
    BuildContext context,
    BuildContext dialogContext,
  ) {
    adLog(context.toString());
    adLog('dialog');
    // navigatorPopScreen(dialogContext);
    context
        .read<DutyFreeOrderState>()
        .dutyFreeEventState
        .confirmCancellationPopupEvent();
    _apiCall(context, dialogContext);
  }
}
