/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/views/cab_booking_billing_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_traveller_form_utils.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// ignore: must_be_immutable
class CabFormDetailsWidget extends StatefulWidget {
  CabFormDetailsWidget({
    Key? key,
    required this.cabTravellerDetailState,
    required this.flag,
    required this.keyOfCabTravellerDetail,
    required this.siteCoreStateManagement,
    required this.onTap,
    required this.selectedCountryCode,
    required this.onChange,
  }) : super(key: key);
  final CabTravellerDetailState cabTravellerDetailState;
  final ValueNotifier<String> flag;
  final GlobalKey<FormState> keyOfCabTravellerDetail;
  final SiteCoreStateManagement siteCoreStateManagement;
  final ADTapCallback onTap;
  final Function() onChange;
  String? selectedCountryCode;

  @override
  State<CabFormDetailsWidget> createState() => _CabFormDetailsWidgetState();
}

class _CabFormDetailsWidgetState extends State<CabFormDetailsWidget> {
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

    return Form(
      key: widget.keyOfCabTravellerDetail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// this is use for create first name of passenger form
              Flexible(
                child: ADDefaultEditableText(
                  componentData: widget
                          .cabTravellerDetailState
                          .updateCabBookingFormBuilder
                          ?.updateTravellerForm
                          .firstName ??
                      ADEditableTextModel.defaultValue(),
                  nextFocus: (_) => FocusScope.of(context).requestFocus(
                    widget.cabTravellerDetailState.updateCabBookingFormBuilder
                        ?.updateTravellerForm.lastName.focusNode,
                  ),
                ),
              ),
              ADSizedBox(width: context.k_16),

              /// this is use for create last name of passenger form
              Flexible(
                child: ADDefaultEditableText(
                  componentData: widget
                          .cabTravellerDetailState
                          .updateCabBookingFormBuilder
                          ?.updateTravellerForm
                          .lastName ??
                      ADEditableTextModel.defaultValue(),
                  nextFocus: (abc) => {
                    FocusScope.of(context).requestFocus(
                      widget.cabTravellerDetailState.updateCabBookingFormBuilder
                          ?.updateTravellerForm.contactNumber.focusNode,
                    ),
                  },
                ),
              ),
            ],
          ).paddingBySide(left: context.k_16, right: context.k_16),

          /// this is use for create country name and phone number of passenger form
          ADDefaultEditableText(
            iconWidth: context.k_8,
            iconHeight: context.k_8,
            iconColour: context.adColors.greenTextColor,
            componentData: widget
                    .cabTravellerDetailState
                    .updateCabBookingFormBuilder
                    ?.updateTravellerForm
                    .contactNumber ??
                ADEditableTextModel.defaultValue(),
            selectedCountryCode: widget.selectedCountryCode,
            prefixWidget: DropDownGeneric(
              type: (widget.cabTravellerDetailState.updateCabBookingFormBuilder
                          ?.updateTravellerForm.countryCode.placeHolder ??
                      '')
                  .localize(context),
              showDivider: true,
              isForCountyCode: true,
              onTap: () => getCountryCode(context),
              controller: widget
                      .cabTravellerDetailState
                      .updateCabBookingFormBuilder
                      ?.updateTravellerForm
                      .countryCode
                      .controller ??
                  TextEditingController(),
              prefixIconUrl: widget.flag,
            ),
            nextFocus: (abc) => {
              FocusScope.of(context).nextFocus(),
            },
          ).paddingBySide(
            top: context.k_20,
            left: context.k_16,
            right: context.k_16,
          ),

          ADDefaultEditableText(
            componentData: widget
                    .cabTravellerDetailState
                    .updateCabBookingFormBuilder
                    ?.updateTravellerForm
                    .emailAddress ??
                ADEditableTextModel.defaultValue(),
            nextFocus: (abc) => {
              FocusScope.of(context).nextFocus(),
              if (widget.cabTravellerDetailState.checkForGst)
                {
                  Scrollable.ensureVisible(
                    widget
                            .cabTravellerDetailState
                            .updateCabBookingFormBuilder
                            ?.updateTravellerForm
                            .gstNumber
                            .globalKey
                            ?.currentContext ??
                        context,
                  ),
                  FocusScope.of(context).requestFocus(
                    widget.cabTravellerDetailState.updateCabBookingFormBuilder
                        ?.updateTravellerForm.gstNumber.focusNode,
                  ),
                },
            },
          ).paddingBySide(
            top: context.k_20,
            left: context.k_16,
            right: context.k_16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: widget
                        .cabTravellerDetailState
                        .cabCartDetailResponseModel
                        ?.cartDetail
                        ?.securityKey
                        ?.isGSTEnable ??
                    false,
                child: Selector<CabTravellerDetailState, bool>(
                  selector: (context, model) => model.checkForGst,
                  builder: (context, value, child) => InkWell(
                    onTap: () =>
                        widget.cabTravellerDetailState.checkForGstValue(
                      value: !value,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: context.k_20,
                          height: context.k_20,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: value,
                            splashRadius: context.k_30,
                            checkColor: context.adColors.whiteTextColor,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_4),
                              ),
                            ),
                            side: BorderSide(
                              color: context.adColors.blackTextColor,
                            ),
                            onChanged: (bool? value) =>
                                widget.cabTravellerDetailState.checkForGstValue(
                              value: value ?? false,
                            ),
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_10,
                        ),
                        Text(
                          'use_gst_number'.localize(context),
                          style: value
                              ? ADTextStyle500.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                )
                              : ADTextStyle400.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                      top: context.k_40,
                    ),
                  ),
                ),
              ),
              Selector<CabTravellerDetailState, bool>(
                selector: (context, model) => model.checkForGst,
                builder: (context, value, child) => Column(
                  children: [
                    Visibility(
                      visible: value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ADSizedBox(
                            height: context.k_20,
                          ),
                          ADDefaultEditableText(
                            componentData: widget
                                    .cabTravellerDetailState
                                    .updateCabBookingFormBuilder
                                    ?.updateTravellerForm
                                    .gstNumber ??
                                ADEditableTextModel.defaultValue(),
                            nextFocus: (abc) => {
                              Scrollable.ensureVisible(
                                widget
                                        .cabTravellerDetailState
                                        .updateCabBookingFormBuilder
                                        ?.updateTravellerForm
                                        .gstCompanyName
                                        .globalKey
                                        ?.currentContext ??
                                    context,
                              ),
                              FocusScope.of(context).requestFocus(
                                widget
                                    .cabTravellerDetailState
                                    .updateCabBookingFormBuilder
                                    ?.updateTravellerForm
                                    .gstCompanyName
                                    .focusNode,
                              ),
                            },
                          ),
                          ADSizedBox(
                            height: context.k_20,
                          ),
                          ADDefaultEditableText(
                            componentData: widget
                                    .cabTravellerDetailState
                                    .updateCabBookingFormBuilder
                                    ?.updateTravellerForm
                                    .gstCompanyName ??
                                ADEditableTextModel.defaultValue(),
                            nextFocus: (abc) => {
                              Scrollable.ensureVisible(
                                widget
                                        .cabTravellerDetailState
                                        .updateCabBookingFormBuilder
                                        ?.updateTravellerForm
                                        .gstAddress
                                        .globalKey
                                        ?.currentContext ??
                                    context,
                              ),
                              FocusScope.of(context).requestFocus(
                                widget
                                    .cabTravellerDetailState
                                    .updateCabBookingFormBuilder
                                    ?.updateTravellerForm
                                    .gstAddress
                                    .focusNode,
                              ),
                            },
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                      ),
                    ),
                    Visibility(
                      visible: (!widget.cabTravellerDetailState
                                  .isBillingDetailsExpend) &&
                              widget.cabTravellerDetailState
                                  .checkBillingFormValidate() ||
                          (!value),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: context.k_8,
                            decoration: BoxDecoration(
                              color: context.adColors.containerGreyBg,
                            ),
                          ).paddingBySide(
                            top: context.k_40,
                            bottom: context.k_20 +
                                (!widget.cabTravellerDetailState
                                        .checkBillingFormValidate()
                                    ? context.k_20
                                    : 0),
                          ),
                          Text(
                            'billing_details'.localize(context),
                            style: ADTextStyle700.size22,
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (widget.cabTravellerDetailState
                              .isBillingDetailsExpend) ||
                          !widget.cabTravellerDetailState
                              .checkBillingFormValidate(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ADDefaultEditableText(
                            componentData: widget
                                    .cabTravellerDetailState
                                    .updateCabBookingFormBuilder
                                    ?.updateTravellerForm
                                    .gstAddress ??
                                ADEditableTextModel.defaultValue(),
                            nextFocus: (abc) =>
                                FocusScope.of(context).unfocus(),
                          ).paddingBySide(top: context.k_20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: ADDefaultEditableText(
                                  iconHeight: context.k_20,
                                  iconWidth: context.k_20,
                                  componentData: widget
                                          .cabTravellerDetailState
                                          .updateCabBookingFormBuilder
                                          ?.updateTravellerForm
                                          .country ??
                                      ADEditableTextModel.defaultValue(),
                                  onTap: () => adShowBottomSheet(
                                    context: context,
                                    childWidget: ADCountryCodeBottomSheet(
                                      selectedCountry: widget
                                              .cabTravellerDetailState
                                              .updateCabBookingFormBuilder
                                              ?.updateTravellerForm
                                              .country
                                              .controller
                                              .text ??
                                          '',
                                      onTap: (value) => onCountryTap(
                                        widget
                                                .cabTravellerDetailState
                                                .updateCabBookingFormBuilder
                                                ?.updateTravellerForm
                                                .country
                                                .controller ??
                                            TextEditingController(),
                                        value,
                                      ),
                                      countryListCodes: widget
                                          .siteCoreStateManagement.country,
                                    ),
                                    headerTitle: 'Country',
                                  ),
                                ),
                              ),
                              ADSizedBox(
                                width: context.k_16,
                              ),
                              Selector<CabTravellerDetailState, bool>(
                                selector: (context, model) =>
                                    model.isUpdatePinCode,
                                builder: (context, value, child) => Flexible(
                                  child:
                                      Selector<CabTravellerDetailState, bool>(
                                    selector: (context, model) =>
                                        model.fetchingCityState,
                                    builder: (
                                      context,
                                      value,
                                      child,
                                    ) =>
                                        ADDefaultEditableText(
                                      componentData: widget
                                              .cabTravellerDetailState
                                              .updateCabBookingFormBuilder
                                              ?.updateTravellerForm
                                              .pinCode ??
                                          ADEditableTextModel.defaultValue(),
                                      isLoadedEnable: value,
                                      onTap: () => widget
                                          .cabTravellerDetailState
                                          .isUpdateAfterEditing = true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingBySide(top: context.k_20),
                          // this is use for create contact number of profile form
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: ADDefaultEditableText(
                                  componentData: widget
                                          .cabTravellerDetailState
                                          .updateCabBookingFormBuilder
                                          ?.updateTravellerForm
                                          .state ??
                                      ADEditableTextModel.defaultValue(),
                                  onTap: () => setFocusOnClick(
                                    context,
                                    widget
                                        .cabTravellerDetailState
                                        .updateCabBookingFormBuilder
                                        ?.updateTravellerForm
                                        .state,
                                  ),
                                ),
                              ),
                              ADSizedBox(
                                width: context.k_16,
                              ),
                              Flexible(
                                child: ADDefaultEditableText(
                                  componentData: widget
                                          .cabTravellerDetailState
                                          .updateCabBookingFormBuilder
                                          ?.updateTravellerForm
                                          .city ??
                                      ADEditableTextModel.defaultValue(),
                                  onTap: () => setFocusOnClick(
                                    context,
                                    widget
                                        .cabTravellerDetailState
                                        .updateCabBookingFormBuilder
                                        ?.updateTravellerForm
                                        .city,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            top: context.k_20,
                            bottom: context.k_20,
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                      ),
                    ),
                    Selector<CabTravellerDetailState, bool?>(
                      selector: (
                        context,
                        stateClassObject,
                      ) =>
                          widget.cabTravellerDetailState.isBillingAddressUpdate,
                      builder: (
                        BuildContext context,
                        billingAddress,
                        Widget? child,
                      ) =>
                          Visibility(
                        visible: (!widget.cabTravellerDetailState
                                .isBillingDetailsExpend) &&
                            (widget.cabTravellerDetailState
                                .checkBillingFormValidate()),
                        child: CabBookingBillingView(
                          cabTravellerDetailState:
                              widget.cabTravellerDetailState,
                          onTap: widget.onTap,
                        ).paddingBySide(
                          left: context.k_16,
                          right: context.k_16,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !value,
                      child: Container(
                        height: context.k_8,
                        decoration: BoxDecoration(
                          color: context.adColors.containerGreyBg,
                        ),
                      ).paddingBySide(top: context.k_20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showBottomSheetDialog(
    BottomSheetType type,
    BuildContext context,
  ) {
    CountryCodeBottomSheet(
      context: context,
      type: type,
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData, type);
    });
  }

  void onTapCountryCodeBottomSheet(
    CountryCodeData value2,
    BottomSheetType type,
  ) {
    if (type == BottomSheetType.fromCountryName) {
      widget
          .cabTravellerDetailState
          .updateCabBookingFormBuilder
          ?.updateTravellerForm
          .countryCode
          .controller
          .text = value2.name.validateWithDefaultValue();
    } else {
      widget
          .cabTravellerDetailState
          .updateCabBookingFormBuilder
          ?.updateTravellerForm
          .countryCode
          .controller
          .text = value2.callingCode?.validateWithDefaultValue() ?? '';
      widget.cabTravellerDetailState.updateCabBookingFormBuilder
              ?.updateTravellerForm.countryCode.text =
          value2.countryCode.validateWithDefaultValue(defaultValue: 'IND');
      widget.flag.value = value2.flag.validateWithDefaultValue();
      widget
          .cabTravellerDetailState
          .updateCabBookingFormBuilder
          ?.updateTravellerForm
          .contactNumber
          .length = FlightUtils.lengthOfNumber(
        widget.cabTravellerDetailState.updateCabBookingFormBuilder
                ?.updateTravellerForm.countryCode.controller.text ??
            '',
      );
      widget.cabTravellerDetailState.updateCabBookingFormBuilder
          ?.updateTravellerForm.countryCode.onChange
          .call();

      setState(() {
        widget.selectedCountryCode = value2.countryCode ?? 'IN';
        widget
            .cabTravellerDetailState
            .updateCabBookingFormBuilder
            ?.updateTravellerForm
            .country
            .selectedCountryCode = widget.selectedCountryCode;
        context.read<FlightCommonState>().countryCodeData = value2;
      });
    }
  }

  void getCountryCode(BuildContext context) {
    FocusScope.of(context).unfocus();
    showBottomSheetDialog(
      BottomSheetType.fromCountryCode,
      context,
    );
  }

  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    if (controller.text != value.countryName) {
      controller.text = value.countryName.validateWithDefaultValue();
      CabFormFieldsValidation.countryName = controller.text;
      widget.cabTravellerDetailState.resetPinCode(countryName: controller.text);
    }
  }

  void showSnackBar(BuildContext context) {
    const duration = 3000;
    SnackBarUtil.showSnackBar(
      context,
      'selected_state_and_city_is_based_on_your_pin_code'.localize(context),
      duration,
      EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_64 + context.k_30,
      ),
    );
  }

  void setFocusOnClick(BuildContext context, ADEditableTextModel? text) {
    Scrollable.ensureVisible(
      text?.globalKey?.currentContext ?? context,
    );
    FocusScope.of(context).requestFocus(
      text?.focusNode,
    );
  }
}
