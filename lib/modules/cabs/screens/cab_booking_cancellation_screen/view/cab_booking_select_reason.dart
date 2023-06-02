/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cancel_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Select cancel reason Radio button section
class CabBookingSelectReason extends StatefulWidget {
  final CabBookingCancellationState cabBookingCancellationState;
  final CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  const CabBookingSelectReason({
    Key? key,
    required this.cabBookingCancellationState,
    required this.cabOrderDetailResponseModel,
  }) : super(key: key);

  @override
  State<CabBookingSelectReason> createState() => _CabBookingSelectReasonState();
}

class _CabBookingSelectReasonState extends State<CabBookingSelectReason> {
  /// Enum for Radio value
  Reason? itemSelected; // = CancelReasonsItemDutyFreeEnum.one;
  int _textLength = 0;
  TextEditingController typeReasonController = TextEditingController();
  final double textFieldHeight = 80.sp;
  static const maxLinesOfTextField = 4;
  static const minLinesOfTextField = 2;

  /// refresh and validation
  void refreshAndValidate(isValidate) {
    if (widget.cabBookingCancellationState.isContinueCancelOrderButtonActive
            .value !=
        isValidate) {
      widget.cabBookingCancellationState.isContinueCancelOrderButtonActive
          .value = isValidate;
    }
    widget.cabBookingCancellationState.isContinueCancelOrderButtonActive.value =
        typeReasonController.text.trim().length > 1;
    widget.cabBookingCancellationState.cabBookingCancellationRequest = widget
        .cabBookingCancellationState.cabBookingCancellationRequest
        .copyWith(cancelReason: typeReasonController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.cabBookingCancellationState.cancelReasonResponseModel
              ?.reasons?.length ??
          0,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final Reason reason = widget.cabBookingCancellationState
                .cancelReasonResponseModel?.reasons?[index] ??
            Reason();
        final int textLength = ((reason.descriptionLength?.length ?? 0) > 0)
            ? int.parse(reason.descriptionLength.toString())
            : 0;
        return Column(
          children: [
            InkWell(
              onTap: () => changeSelected(
                reason,
              ),
              borderRadius: BorderRadius.circular(context.k_4),
              child: Row(
                children: [
                  ADSizedBox(
                    width: context.k_18,
                    child: Radio(
                      fillColor: MaterialStateColor.resolveWith((states) {
                        return context.adColors.neutralInfoMsg;
                      }),
                      value: reason,
                      groupValue: itemSelected,
                      onChanged: (value) => changeSelected(value as Reason),
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_12,
                  ),
                  Text(
                    reason.reason ?? '',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                ],
              ),
            ),
            if (_textLength > 0 && textLength > 0)
              ValidatedTextField(
                notifyParent: refreshAndValidate,
                type: reason.descriptionHint,
                controller: typeReasonController,
                textLength: textLength,
                maxLine: maxLinesOfTextField,
                minLines: minLinesOfTextField,
                showScrollBar: true,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                validation: validateCancellationReasonCabBooking,
              ).paddingBySide(top: context.k_12),
            if (_textLength <= 0 && textLength <= 0) const SizedBox(),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return ADSizedBox(
          height: context.k_2,
        );
      },
    );
  }

  void changeSelected(Reason? value) {
    setState(() {
      itemSelected = value;
      _textLength = ((value?.descriptionLength?.length ?? 0) > 0)
          ? int.parse(value?.descriptionLength ?? '0')
          : 0;
      if (_textLength > 0) {
        widget.cabBookingCancellationState.isContinueCancelOrderButtonActive
            .value = false;
      } else {
        _setReasonToResponse(value?.reason ?? '');
        typeReasonController.text = '';
      }
    });
  }

  void _setReasonToResponse(String value) {
    widget.cabBookingCancellationState.isContinueCancelOrderButtonActive.value =
        true;
    widget.cabBookingCancellationState.cabBookingCancellationRequest = widget
        .cabBookingCancellationState.cabBookingCancellationRequest
        .copyWith(cancelReason: value);
  }

  String? validateCancellationReasonCabBooking(
    String? value,
    BuildContext context,
  ) {
    if (value.isNullOrEmpty) {
      return '';
    }
    adLog('type_the_reason_for_order_cancellation'.localize(context));

    return null;
  }
}
