/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/cancel_reasons_item_duty_free_enum.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Select cancel reason Radio button section
class DutyFreeSelectReason extends StatefulWidget {
  const DutyFreeSelectReason({Key? key}) : super(key: key);

  @override
  State<DutyFreeSelectReason> createState() => _DutyFreeSelectReasonState();
}

class _DutyFreeSelectReasonState extends State<DutyFreeSelectReason> {
  /// Enum for Radio value
  CancelReasonsItemDutyFreeEnum?
      itemSelected; // = CancelReasonsItemDutyFreeEnum.one;
  DutyFreeOrderState? _orderState;

  TextEditingController typeReasonController = TextEditingController();
  static const int textLength = 150;
  final double textFieldHeight = 80.sp;
  static const maxLinesOfTextField = 4;
  static const minLinesOfTextField = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// refresh and validation
  void refreshAndValidate(isValidate) {
    if (_orderState?.isContinueCancelOrderlButtonActive.value != isValidate) {
      _orderState?.isContinueCancelOrderlButtonActive.value = isValidate;
    }
    context.read<DutyFreeOrderState>().dutyFreeCancellationRequest = context
        .read<DutyFreeOrderState>()
        .dutyFreeCancellationRequest
        .copyWith(reason: typeReasonController.text);
  }

  @override
  Widget build(BuildContext context) {
    _orderState = context.read<DutyFreeOrderState>();
    return Column(
      children: [
        InkWell(
          onTap: () => changeSelected(
            CancelReasonsItemDutyFreeEnum.one,
            context,
          ),
          borderRadius: BorderRadius.circular(
            context.k_4,
          ),
          child: Row(
            children: [
              ADSizedBox(
                width: context.k_18,
                child: Radio(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    return context.adColors.black;
                  }),
                  value: CancelReasonsItemDutyFreeEnum.one,
                  groupValue: itemSelected,
                  onChanged: (CancelReasonsItemDutyFreeEnum? value) =>
                      changeSelected(
                    value,
                    context,
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_12,
              ),
              Text(
                'i_am_not_travelling_anymore'.localize(context),
                style: ADTextStyle400.size16,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => changeSelected(
            CancelReasonsItemDutyFreeEnum.two,
            context,
          ),
          borderRadius: BorderRadius.circular(context.k_4),
          child: Row(
            children: [
              ADSizedBox(
                width: context.k_18,
                child: Radio(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    return context.adColors.black;
                  }),
                  value: CancelReasonsItemDutyFreeEnum.two,
                  groupValue: itemSelected,
                  onChanged: (CancelReasonsItemDutyFreeEnum? value) =>
                      changeSelected(
                    value,
                    context,
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_12,
              ),
              Text(
                'my_flight_got_cancelled'.localize(context),
                style: ADTextStyle400.size16,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => changeSelected(
            CancelReasonsItemDutyFreeEnum.three,
            context,
          ),
          borderRadius: BorderRadius.circular(context.k_4),
          child: Row(
            children: [
              ADSizedBox(
                width: context.k_18,
                child: Radio(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    return context.adColors.black;
                  }),
                  value: CancelReasonsItemDutyFreeEnum.three,
                  groupValue: itemSelected,
                  onChanged: (CancelReasonsItemDutyFreeEnum? value) =>
                      changeSelected(
                    value,
                    context,
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_12,
              ),
              Text(
                'i_have_changed_my_mind'.localize(context),
                style: ADTextStyle400.size16,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => changeSelected(
            CancelReasonsItemDutyFreeEnum.four,
            context,
          ),
          borderRadius: BorderRadius.circular(context.k_4),
          child: Row(
            children: [
              ADSizedBox(
                width: context.k_18,
                child: Radio(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    return context.adColors.black;
                  }),
                  value: CancelReasonsItemDutyFreeEnum.four,
                  groupValue: itemSelected,
                  onChanged: (CancelReasonsItemDutyFreeEnum? value) =>
                      changeSelected(
                    value,
                    context,
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_12,
              ),
              Text(
                'my_reason_is_not_listed'.localize(context),
                style: ADTextStyle400.size16,
              ),
            ],
          ),
        ),
        if (itemSelected == CancelReasonsItemDutyFreeEnum.four)
          ValidatedTextField(
            notifyParent: refreshAndValidate,
            type: 'type_reason'.localize(context),
            controller: typeReasonController,
            textLength: textLength,
            maxLine: maxLinesOfTextField,
            minLines: minLinesOfTextField,
            showScrollBar: true,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            validation: Validations.validatecancellationReasonDutyfree,
          ).paddingBySide(top: context.k_12),
      ],
    );
  }

  void changeSelected(
    CancelReasonsItemDutyFreeEnum? value,
    BuildContext context,
  ) {
    setState(() {
      itemSelected = value;

      switch (value) {
        case CancelReasonsItemDutyFreeEnum.one:
          _setReasonToResponse(context, 'i_am_not_travelling_anymore');
          typeReasonController.text = '';
          break;
        case CancelReasonsItemDutyFreeEnum.two:
          _setReasonToResponse(context, 'my_flight_got_cancelled');
          typeReasonController.text = '';
          break;
        case CancelReasonsItemDutyFreeEnum.three:
          _setReasonToResponse(context, 'i_have_changed_my_mind');
          typeReasonController.text = '';
          break;
        case CancelReasonsItemDutyFreeEnum.four:
          _orderState?.isContinueCancelOrderlButtonActive.value = false;
          break;
        default:
          adLog('Nothing To show');
      }
    });
  }

  void _setReasonToResponse(BuildContext context, String value) {
    _orderState?.isContinueCancelOrderlButtonActive.value = true;
    context.read<DutyFreeOrderState>().dutyFreeCancellationRequest = context
        .read<DutyFreeOrderState>()
        .dutyFreeCancellationRequest
        .copyWith(reason: value.localize(context));
  }
}
