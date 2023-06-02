/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/card_text_field.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/cell_type.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

// Tile (for ListView), Brick (for GridView), Card (for credit/debit cards) view representing a payment option.
class PaymentOptionsCell extends StatefulWidget {
  // name of the payment mode
  final String title;

  // cell type - grid-brick or list-tile
  final CellType typeOfCell;

  // path for image/icon
  final String iconPath;

  // to check whether current cell is selected as payment mode
  final bool isSelected;

  final PaymentOptionType type;

  final PaymentMethodState paymentMethodViewModel;
  final GlobalKey<FormState> globalKey;
  final bool radioButtonVisibility;
  final GlobalKey? globalKeyForUpiFocus;

  const PaymentOptionsCell({
    Key? key,
    required this.typeOfCell,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.type,
    required this.paymentMethodViewModel,
    required this.globalKey,
    required this.radioButtonVisibility,
    this.globalKeyForUpiFocus,
  }) : super(key: key);

  @override
  State<PaymentOptionsCell> createState() => _PaymentOptionsCellState();
}

class _PaymentOptionsCellState extends State<PaymentOptionsCell> {
  final double brickAspectRatio = 96 / 75;

  String? errorValue;

  @override
  Widget build(BuildContext context) {
    final double width = (context.widthOfScreen - 62.sp) / 4;
    final double height = width * brickAspectRatio;
    switch (widget.typeOfCell) {
      case CellType.brick:
        return Container(
          width: width,
          height: height,
          decoration: widget.isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(context.k_4)),
                  border: Border.all(color: context.adColors.neutralInfoMsg),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(context.k_4)),
                  border: Border.all(color: context.adColors.tileBorderColor),
                ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: context.k_8,
                    backgroundColor: context.adColors.transparentColor,
                    child: SvgPicture.asset(
                      widget.isSelected
                          ? 'lib/assets/images/common/radio_checked.svg'
                          : 'lib/assets/images/common/radio_unchecked.svg',
                    ),
                  ),
                ],
              ).paddingAllSide(context.k_6),
              const Spacer(),
              Container(
                height: context.k_24,
                width: context.k_24,
                color: context.adColors.transparentColor,
                child: SvgPicture.network(widget.iconPath),
              ),
              const Spacer(),
              SizedBox(
                height: context.k_12,
              ),
              if (widget.isSelected)
                Text(
                  widget.title,
                  style: ADTextStyle700.size12
                      .setTextColor(context.adColors.neutralInfoMsg),
                )
              else
                Text(
                  widget.title,
                  style: ADTextStyle400.size12
                      .setTextColor(context.adColors.neutralInfoMsg),
                ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        );
      case CellType.tile:
        return widget.type == PaymentOptionType.addNew
            ? Form(
                key: widget.globalKey,
                child: Column(
                  key: widget.globalKeyForUpiFocus,
                  children: [
                    SizedBox(
                      height: context.k_10,
                    ),
                    // AcceptedPayments(
                    //   upiOptionsList:
                    //       widget.paymentMethodViewModel.upiOptionsList,
                    // ),
                    // SizedBox(
                    //   height: context.k_26,
                    // ),
                    CardTextField(
                      mask: false,
                      enableInteractiveSelection: true,
                      hintText: 'enter_upi'.localize(context),
                      controller: widget.paymentMethodViewModel.upiController,
                      textInputType: TextInputType.text,
                      onChangeImpl: (value) => _onChange(value),
                      regex: upiValidate,
                      suffixIcon: IconButton(
                        constraints: BoxConstraints(maxWidth: context.k_40),
                        padding: EdgeInsets.zero,
                        onPressed: () => clearFocusController(context),
                        icon: widget.paymentMethodViewModel.upiController.text
                                .isNotEmpty
                            ? Icon(
                                Icons.clear,
                                color: context.adColors.greyTextColor,
                              )
                            : const SizedBox.shrink(),
                      ),
                      errorText: widget.paymentMethodViewModel.upiError
                          ? widget.paymentMethodViewModel.upiServerMessage
                          : errorValue,
                      inputFormatter: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'\s'),
                        ),
                      ],
                      validation: (String? value) =>
                          widget.paymentMethodViewModel.upiError
                              ? widget.paymentMethodViewModel.upiServerMessage
                              : validatedForUpi(value),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      if (widget.radioButtonVisibility)
                        CircleAvatar(
                          radius: context.k_8,
                          backgroundColor: context.adColors.transparentColor,
                          child: SvgPicture.asset(
                            widget.isSelected
                                ? 'lib/assets/images/common/radio_checked.svg'
                                : 'lib/assets/images/common/radio_unchecked.svg',
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      if (widget.radioButtonVisibility)
                        SizedBox(
                          width: context.k_18,
                        ),
                      if (widget.radioButtonVisibility)
                        Container(
                          height: context.k_24,
                          width: context.k_24,
                          // color: context.adColors.transparentColor,
                          child: SvgPicture.network(widget.iconPath),
                        ),
                      if (widget.radioButtonVisibility)
                        SizedBox(
                          width: context.k_18,
                        ),
                      Expanded(
                        child: Container(
                          // height: context.k_18,
                          alignment: Alignment.centerLeft,
                          child: widget.isSelected
                              ? Text(
                                  widget.title,
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.neutralInfoMsg,
                                  ),
                                )
                              : Text(
                                  widget.title,
                                  style: ADTextStyle400.size16.setTextColor(
                                    context.adColors.neutralInfoMsg,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(
                top: context.k_14,
                bottom: context.k_14,
              );
      default:
        return const SizedBox.shrink();
    }
  }

  String? validatedForUpi(String? value) {
    return _returnOnChange(value ?? '');

    //   if (!RegExp(upiValidate)
    //     .hasMatch(value?.replaceAll(RegExp(r'\s+\b|\b\s'), '') ?? '')) {
    //   return 'enter_valid_upi_id'.localize(context);
    // } else {
    //   return null;
    // }
  }

  void clearFocusController(BuildContext context) {
    widget.paymentMethodViewModel.upiController.clear();
    FocusScope.of(context).unfocus();
    final Option option = Option(mode: PaymentMode.upi);
    widget.paymentMethodViewModel.cardOptionUpdate(option);
    callSetState(null);
  }

  void _onChange(String value) {
    final Option option = Option(mode: PaymentMode.upi);
    widget.paymentMethodViewModel.cardOptionUpdate(option);
    if (value.isNotEmpty) {
      widget.paymentMethodViewModel.removeCardInfo();
      if (RegExp(upiValidate)
          .hasMatch(value.replaceAll(RegExp(r'\s+\b|\b\s'), ''))) {
        callSetState(null);
        widget.paymentMethodViewModel.isSelectedPayment = true;
      } else {
        callSetState('invalid_upi'.localize(context));
        widget.paymentMethodViewModel.isSelectedPayment = false;
      }
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;

      callSetState(null);
    }
  }

  String? _returnOnChange(String value) {
    String? returnValue;
    final Option option = Option(mode: PaymentMode.upi);
    if(widget.paymentMethodViewModel.selectedOption?.packageName==null|| value.isNotEmpty){
    widget.paymentMethodViewModel.cardOptionUpdate(option);
    }
    if (value.isNotEmpty) {
      widget.paymentMethodViewModel.removeCardInfo();
      if (RegExp(upiValidate)
          .hasMatch(value.replaceAll(RegExp(r'\s+\b|\b\s'), ''))) {
        // callSetState(null);
        returnValue = null;
        widget.paymentMethodViewModel.isSelectedPayment = true;
      } else {
        // callSetState('invalid_upi'.localize(context));
        returnValue = 'enter_valid_upi_id'.localize(context);
        widget.paymentMethodViewModel.isSelectedPayment = false;
      }
    } else {
      if(widget.paymentMethodViewModel.selectedOption?.packageName==null || widget.paymentMethodViewModel.selectedOption?.packageName==''){
      widget.paymentMethodViewModel.isSelectedPayment = false;
      // callSetState(null);
      returnValue = 'enter_valid_upi_id'.localize(context);

      }
    }
    return returnValue;
  }

  void callSetState(String? value) {
    if (errorValue != value) {
      setState(() {
        errorValue = value;
      });
    }
  }
}

// List of accpeted payment services, to be shown when adding a credit/debit card.
class AcceptedPayments extends StatelessWidget {
  // List of urls for images of all supported payment services.
  // final List<String> urls = [
  //   '${Environment.instance.configuration.cmsBaseUrl}-/media/Project/Adani/Payment_icons/Assets/App/UPI-phonePe.svg',
  //   '${Environment.instance.configuration.cmsBaseUrl}-/media/Project/Adani/Payment_icons/Assets/App/UPI-googlePe.svg',
  //   '${Environment.instance.configuration.cmsBaseUrl}-/media/Project/Adani/payments_banklogos/freecharge_logo.svg',
  //   '${Environment.instance.configuration.cmsBaseUrl}-/media/Project/Adani/Payment_icons/Assets/App/UPI-paytm.svg',
  //   '${Environment.instance.configuration.cmsBaseUrl}-/media/Project/Adani/Payment_icons/Assets/App/UPI-upi.svg',
  // ];
  const AcceptedPayments({Key? key, required this.upiOptionsList})
      : super(key: key);
  final List<String> upiOptionsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: upiOptionsList
          .map(
            (url) => SvgPicture.network(
              url,
              height: context.k_16,
            ).paddingBySide(
              right: context.k_12,
            ),
          )
          .toList(),
    );
  }
}
