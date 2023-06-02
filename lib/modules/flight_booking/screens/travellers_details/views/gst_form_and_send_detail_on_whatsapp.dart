/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for gst form when you click on checkbox
class GstFormAndSendDetailOnWhatsapp extends StatefulWidget {
  /// this is an callback for update value of checkbox for gst
  final Function(bool value) checkForGstValue;

  /// this is an callback for update value of whatsapp for gst
  final Function(bool value) checkForWhatsappValue;

  /// this is use for update value of gst detail
  final GstDetail? gstDetail;

  final bool? isFromGst;

  const GstFormAndSendDetailOnWhatsapp({
    Key? key,
    required this.checkForGstValue,
    required this.checkForWhatsappValue,
    this.gstDetail,
    this.isFromGst,
  }) : super(key: key);

  @override
  _GstFormAndSendDetailOnWhatsappState createState() =>
      _GstFormAndSendDetailOnWhatsappState();
}

class _GstFormAndSendDetailOnWhatsappState
    extends State<GstFormAndSendDetailOnWhatsapp> {
  @override
  Widget build(BuildContext context) {
    /// this is use for set colour of checkbox
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.black;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: false,
          child: Row(
            children: [
              SizedBox(
                height: context.k_20,
                width: context.k_20,
                child: Selector<TravellerDetailState, bool>(
                  selector: (context, model) => model.checkForWhatsapp,
                  builder: (context, value, child) => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: value,
                    checkColor: context.adColors.whiteTextColor,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    side: BorderSide(
                      color: context.adColors.greyTextColor,
                    ),
                    onChanged: (bool? value) =>
                        widget.checkForWhatsappValue(value ?? false),
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Text(
                'also_send_my_booking'.localize(context),
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.darkGreyTextColor),
              ),
              //  const Icon(Icons.wallet_giftcard),
            ],
          ),
        ),
        Selector<TravellerDetailState, bool>(
          selector: (context, model) => model.checkForGst,
          builder: (context, value, child) => GestureDetector(
            onTap: () => widget.checkForGstValue(!value),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: value,
                  splashRadius: context.k_30,
                  checkColor: context.adColors.whiteTextColor,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  side: BorderSide(
                    color: context.adColors.greyTextColor,
                  ),
                  onChanged: (bool? value) =>
                      widget.checkForGstValue(value ?? false),
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
                Text(
                  'use_gst_number'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.darkGreyTextColor),
                ).paddingBySide(left: context.k_36),
              ],
            ).paddingBySide(
              left: context.k_6,
              right: context.k_16,
              top: context.k_8,
              bottom: context.k_8,
            ),
          ),
        ),

        /// this selector is use for set value of gst check
        // Selector<TravellerDetailState, bool>(
        //   selector: (context, model) => model.checkForGst,
        //   builder: (context, value, child) => ListTileTheme(
        //     horizontalTitleGap: 0,
        //     child: Theme(
        //       data: ThemeData(
        //         checkboxTheme: CheckboxThemeData(
        //           shape: RoundedRectangleBorder(
        //             borderRadius:
        //                 BorderRadius.all(Radius.circular(context.k_4)),
        //           ),
        //         ),
        //       ),
        //       child: CheckboxListTile(
        //         dense: true,
        //         activeColor: context.adColors.blackTextColor,
        //         tristate: true,
        //         contentPadding: EdgeInsets.zero,
        //         value: value,
        //         title: Text(
        //           'use_gst_number'.localize(context),
        //           style: ADTextStyle500.size16
        //               .setTextColor(context.adColors.black),
        //         ),
        //         checkColor: context.adColors.whiteTextColor,
        //         side: BorderSide(
        //           color: context.adColors.greyTextColor,
        //         ),
        //         controlAffinity: ListTileControlAffinity.leading,
        //         onChanged: (bool? value) =>
        //             widget.checkForGstValue(value ?? false),
        //       ),
        //     ),
        //   ),
        // ).paddingBySide(
        //   left: context.k_6,
        //   right: context.k_16,
        // ),
        ADSizedBox(
          height: context.k_16,
        ),
        Selector<TravellerDetailState, bool>(
          selector: (context, model) => model.checkForGst,
          builder: (context, value, child) => GstForm(
            gstChecked: value,
            gstDetail: widget.gstDetail,
            isFromGst: widget.isFromGst,
          ),
        ),
      ],
    );
  }
}

/// this is use for form of gst when you will fill form and implement condition
class GstForm extends StatefulWidget {
  final GstDetail? gstDetail;

  /// value is use for form is visible or not
  final bool gstChecked;

  final bool? isFromGst;

  const GstForm({
    Key? key,
    required this.gstChecked,
    this.gstDetail,
    this.isFromGst,
  }) : super(key: key);

  @override
  _GstFormState createState() => _GstFormState();
}

/// this class is use for GST form and implement condition
class _GstFormState extends State<GstForm> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  Timer? _timer;
  final timerInitiationLength = 5;
  final timerInitiationLengthForOther = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    widget.gstDetail?.pinCode.controller.addListener(pinCodeListener);
    context
        .read<TravellerDetailState>()
        .formBuilderObject
        ?.gstDetails
        ?.setMaxLengthOfPin(widget.gstDetail?.country.controller.text ?? '');
    FlightValidations.setCountryName(
      widget.gstDetail?.country.controller.text ?? '',
    );
    if ((widget.gstDetail?.city.controller.text.trim() ?? '').isNotEmpty ||
        (widget.gstDetail?.state.controller.text.trim() ?? '').isNotEmpty) {
      widget.gstDetail?.city.enable = true;
      widget.gstDetail?.state.enable = true;
      widget.gstDetail?.city.readonly = false;
      widget.gstDetail?.state.readonly = false;
      widget.gstDetail?.state.validation =
          (String? value) => FlightValidations.validateState(value ?? '');
      widget.gstDetail?.city.validation =
          (String? value) => FlightValidations.validateCity(value ?? '');
    } else {
      widget.gstDetail?.city.enable = false;
      widget.gstDetail?.state.enable = false;
      widget.gstDetail?.city.readonly = true;
      widget.gstDetail?.state.readonly = true;
    }
  }

  @override
  void dispose() {
    widget.gstDetail?.pinCode.controller.removeListener(pinCodeListener);
    super.dispose();
  }

  void pinCodeListener() {
    if (_timer != null) {
      _timer?.cancel();
      context.read<TravellerDetailState>().resetStateCity();
    }
    if (widget.gstDetail?.country.controller.text == 'India') {
      if ((widget.gstDetail?.pinCode.controller.text.length ?? 0) >
              timerInitiationLength &&
          context.read<TravellerDetailState>().oldPinValue !=
              widget.gstDetail?.pinCode.controller.text) {
        _timer = Timer(const Duration(milliseconds: 400), fetchStateCity);
      }
    } else {
      if ((widget.gstDetail?.pinCode.controller.text.length ?? 0) >
              timerInitiationLengthForOther &&
          context.read<TravellerDetailState>().oldPinValue !=
              widget.gstDetail?.pinCode.controller.text) {
        _timer = Timer(const Duration(milliseconds: 400), fetchStateCity);
      }
    }
  }

  void fetchStateCity() {
    context
        .read<TravellerDetailState>()
        .searchStateCityByPinCode(
          widget.gstDetail?.pinCode.controller.text ?? '',
          widget.gstChecked,
        )
        .then((value) {
      if (value.viewStatus != Status.complete && value.data == null) {
        // getView(
        //   context: context,
        //   dialogEnm: DialogTypeEnm.snackBar,
        //   message: value.message,
        //   backgroundColor: context.adColors.black,
        // );
        showToast(
          context,
          context.adColors.black,
          '',
          Text(
            'please_enter_valid_number'.localize(context),
            style: ADTextStyle600.size14.copyWith(color: ADColors.white),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.gstChecked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADDefaultEditableText(
            componentData: widget.gstDetail?.gstNumber ??
                ADEditableTextModel.defaultValue(),
            nextFocus: (abc) => FocusScope.of(context).requestFocus(
              widget.gstDetail?.gstCompanyName.focusNode,
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          ADDefaultEditableText(
            componentData: widget.gstDetail?.gstCompanyName ??
                ADEditableTextModel.defaultValue(),
            nextFocus: (abc) => FocusScope.of(context)
                .requestFocus(widget.gstDetail?.gstAddress.focusNode),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Column(
            children: [
              Visibility(
                child: ADDefaultEditableText(
                  componentData: widget.gstDetail?.gstAddress ??
                      ADEditableTextModel.defaultValue(),
                  nextFocus: (abc) => FocusScope.of(context).unfocus(),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
              ),
              Selector<TravellerDetailState, bool>(
                selector: (context, model) => model.fetchingCityState,
                builder: (context, value, child) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ADDefaultEditableText(
                            iconHeight: context.k_20,
                            iconWidth: context.k_20,
                            componentData: widget.gstDetail?.country ??
                                ADEditableTextModel.defaultValue(),
                            onTap: () => adShowBottomSheet(
                              context: context,
                              childWidget: ADCountryCodeBottomSheet(
                                selectedCountry:
                                    widget.gstDetail?.country.controller.text ??
                                        '',
                                onTap: (value) => onCountryTap(
                                  widget.gstDetail?.country.controller ??
                                      TextEditingController(),
                                  value,
                                ),
                                countryListCodes:
                                    _siteCoreStateManagement.country,
                              ),
                              headerTitle: 'Country',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.k_16,
                        ),
                        Selector<TravellerDetailState, bool>(
                          selector: (context, model) => model.fetchingCityState,
                          builder: (context, value, child) => Expanded(
                            child: ADDefaultEditableText(
                              componentData: widget.gstDetail?.pinCode ??
                                  ADEditableTextModel.defaultValue(),
                              isLoadedEnable: value,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                      top: context.k_20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ADDefaultEditableText(
                            componentData: widget.gstDetail?.state ??
                                ADEditableTextModel.defaultValue(),
                            // onTap: () => showToast(
                            //   context,
                            //   context.adColors.black,
                            //   '',
                            //   Text(
                            //     (widget.gstDetail?.state.controller.text
                            //                 .isNotEmpty ??
                            //             false)
                            //         ? 'selected_state_city'.localize(context)
                            //         : 'please_enter_your_pincode'
                            //             .localize(context),
                            //     style: ADTextStyle600.size14
                            //         .copyWith(color: ADColors.white),
                            //   ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: context.k_16,
                        ),
                        Expanded(
                          child: ADDefaultEditableText(
                            componentData: widget.gstDetail?.city ??
                                ADEditableTextModel.defaultValue(),
                            // onTap: () => showToast(
                            //   context,
                            //   context.adColors.black,
                            //   '',
                            //   Text(
                            //     (widget.gstDetail?.city.controller.text
                            //                 .isNotEmpty ??
                            //             false)
                            //         ? 'selected_state_city'.localize(context)
                            //         : 'please_enter_your_pincode'
                            //             .localize(context),
                            //     style: ADTextStyle600.size14
                            //         .copyWith(color: ADColors.white),
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_20,
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ADSizedBox(
            height: context.k_16,
          ),
        ],
      ),
    );
  }

  void showToast(
    BuildContext context,
    Color? color,
    String? iconPath,
    Widget textWidget, {
    int? toastDuration,
  }) {
    Widget text;
    text = textWidget is Text
        ? Text(
            textWidget.data ?? '',
            style: ADTextStyle400.size14.copyWith(color: ADColors.white),
          )
        : textWidget;

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.k_8),
      ),
      margin: EdgeInsets.only(
        bottom: context.k_60,
        left: context.k_16,
        right: context.k_16,
      ),
      backgroundColor: color,
      duration: Duration(seconds: toastDuration ?? 3),
      content: Row(
        children: [
          IconFromAsset(
            iconPath: iconPath ?? SvgAssets.icCircleSuccess,
            height: context.scaled(20),
            width: context.scaled(20),
          ),
          ADSizedBox(
            width: context.k_10,
          ),
          // getSizedBoxWithWidth(context.scaled(12)),
          Expanded(child: text),
        ],
      ),
    );
    final valueOfSnack = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    adLog(valueOfSnack.toString());
  }

  // this method is use for set country name
  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    setState(() {
      controller.text = value.countryName.validateWithDefaultValue();
    });
    FlightValidations.setCountryName(
      widget.gstDetail?.country.controller.text ?? '',
    );
    context.read<TravellerDetailState>().countryChangeEmptyController();
    context
        .read<TravellerDetailState>()
        .formBuilderObject
        ?.gstDetails
        ?.setMaxLengthOfPin(widget.gstDetail?.country.controller.text ?? '');

    context.read<TravellerDetailState>().oldPinValue = null;
    widget.gstDetail?.pinCode.controller.clear();
    widget.gstDetail?.city.controller.clear();
    widget.gstDetail?.state.controller.clear();
  }
}
