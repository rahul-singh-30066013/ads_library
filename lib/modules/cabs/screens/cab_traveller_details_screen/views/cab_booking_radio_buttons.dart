/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/ad_custom_radio_button.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_traveller_form_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabBookingRadioButtons extends StatefulWidget {
  const CabBookingRadioButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<CabBookingRadioButtons> createState() => _CabBookingRadioButtonsState();
}

class _CabBookingRadioButtonsState extends State<CabBookingRadioButtons> {
  CabTravellerDetailState? cabTravellerDetailState;

  @override
  void initState() {
    cabTravellerDetailState = context.read<CabTravellerDetailState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CabTravellerDetailState, TitleSalutation>(
      selector: (context, state) =>
          CabTravellerFormUtils.convertToTitleSalutation(
        state.updateCabBookingFormBuilder?.updateTravellerForm.title.controller
                .text ??
            TitleSalutation.mister.titleAbbr,
      ),
      builder: (context, titleSalutation, child) => Row(
        children: [
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.mister,
            onChanged: (value) => _onTitleRadioButtonSelect(
              cabTravellerDetailState?.updateCabBookingFormBuilder
                  ?.updateTravellerForm.title.onChange,
              cabTravellerDetailState?.updateCabBookingFormBuilder
                      ?.updateTravellerForm.title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
          SizedBox(
            width: context.k_24,
          ),
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.miss,
            onChanged: (value) => _onTitleRadioButtonSelect(
              cabTravellerDetailState?.updateCabBookingFormBuilder
                  ?.updateTravellerForm.title.onChange,
              cabTravellerDetailState?.updateCabBookingFormBuilder
                      ?.updateTravellerForm.title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
          SizedBox(
            width: context.k_24,
          ),
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.missus,
            onChanged: (value) => _onTitleRadioButtonSelect(
              cabTravellerDetailState?.updateCabBookingFormBuilder
                  ?.updateTravellerForm.title.onChange,
              cabTravellerDetailState?.updateCabBookingFormBuilder
                      ?.updateTravellerForm.title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
        ],
      ),
    ).paddingBySide(
      left: context.k_10,
      right: context.k_16,
      bottom: context.k_20,
      top: context.k_18,
    );
  }

  /// this method gets triggered when one of the radio button is selected
  void _onTitleRadioButtonSelect(
    void Function()? onChange,
    TextEditingController controller,
    String value,
  ) {
    setState(() {
      controller.text = value;
      onChange?.call();
    });
  }
}

class _RadioButton extends StatelessWidget {
  const _RadioButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final TitleSalutation? groupValue;
  final TitleSalutation value;
  final void Function(TitleSalutation?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AdCustomRadioButton<TitleSalutation>(
          value: value,
          splashRadius: context.k_10,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: context.adColors.blackTextColor,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () => onChanged(value),
          child: Text(
            value.titleAbbr,
            style: _getRadioButtonStyle(context, value),
          ),
        ),
      ],
    );
  }

  TextStyle _getRadioButtonStyle(
    BuildContext context,
    TitleSalutation titleSalutation,
  ) {
    return groupValue == titleSalutation
        ? ADTextStyle500.size16.setTextColor(
            context.adColors.blackTextColor,
          )
        : ADTextStyle400.size16.setTextColor(
            context.adColors.greyTextColor,
          );
  }
}
