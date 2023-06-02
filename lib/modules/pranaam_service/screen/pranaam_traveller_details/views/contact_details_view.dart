/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_codes/country_codes_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/country_code_state.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core_masters;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ContactDetailsView extends StatefulWidget {
  /// this is used to fill information about the billing details.
  const ContactDetailsView({
    Key? key,
    required this.gstNumberController,
    required this.companyNameController,
    required this.state,
    required this.mobileController,
    required this.emailController,
    required this.countryCodeController,
    required this.addressController,
    this.isPlacardView = false,
    required this.flag,
  }) : super(key: key);
  final ControllersAndFocus gstNumberController;
  final ControllersAndFocus companyNameController;
  final PranaamTravellerScreenState state;

  final ControllersAndFocus mobileController;
  final ControllersAndFocus emailController;
  final ControllersAndFocus countryCodeController;
  final ControllersAndFocus addressController;
  final bool isPlacardView;
  final ValueNotifier<String> flag;

  @override
  _ContactDetailsViewState createState() => _ContactDetailsViewState();
}

class _ContactDetailsViewState extends State<ContactDetailsView> {
  List<site_core.State>? stateData;
  List<city_list.Result>? citiesData;
  CountryCodeState codeState = CountryCodeState();
  List<CountryCodesList>? countryCodesList;
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  ValueNotifier<site_core_masters.Country?> selectedCountry =
      ValueNotifier(const site_core_masters.Country());
  final ValueNotifier<bool> _isIndiaCountrySelected = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    codeState.getCountryCodesfromJSON().then((value) {
      final CountryCodesResponseModel countryCodesResponseModel = value;
      countryCodesList = countryCodesResponseModel.data;
      stateData = _siteCoreStateManagement.state;
      citiesData = _siteCoreStateManagement.citiesListData;
      adLog('citiesData ${citiesData?.length}', className: this);
      /*countryMasterList =
          widget.pranaamAppDataStateManagement.getCountryMaster();*/
    });
  }

  @override
  void dispose() {
    _isIndiaCountrySelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    const internationalMobileNumberLength = 15;
    const indianMobileNumberLength = 10;
    const lineHight = 1.4;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking detail will be sent to this email address and phone number.',
            style: ADTextStyle400.size16.copyWith(
              color: const Color(0xff666666),
              height: lineHight,
            ),
          ).paddingBySide(bottom: context.k_30, top: context.k_13),
          ValidatedTextField(
            focus: widget.mobileController.focusNode,
            notifyParent: widget.state.refreshAndValidate,
            type: 'mobileNo'.localize(context),
            asyncValidation: Validations.validateMobileLib,
            textLength: widget.countryCodeController.controller.text == '+91'
                ? indianMobileNumberLength
                : internationalMobileNumberLength,

            controller: widget.mobileController.controller,
            keyboardType: TextInputType.number,
            //isDisabled: false,
            prefixWidget: DropDownGeneric(
              //  widthOfDropDown: dropDownWidth,
              type: 'countryCode'.localize(context),
              isForCountyCode: true,
              showDivider: true,
              onTap: () => showBottomSheetDialog(
                BottomSheetType.fromCountryCode,
              ),
              controller: widget.countryCodeController.controller,
              prefixIconUrl: widget.flag,
            ),
          ),
          Visibility(
            visible: !widget.isPlacardView,
            child: Column(
              children: [
                ADSizedBox(
                  height: context.k_20,
                ),
                ValidatedTextField(
                  focus: widget.emailController.focusNode,
                  validation: Validations.validateEmail,
                  notifyParent: widget.state.refreshAndValidate,
                  type: 'emailID'.localize(context),
                  controller: widget.emailController.controller,
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ).paddingBySide(bottom: context.k_20),
          ValueListenableBuilder(
            valueListenable: widget.state.useGSTNumber,
            builder: (_, value, __) {
              return InkWell(
                onTap: () => onClickCheckBox(
                  newValue: !widget.state.useGSTNumber.value,
                ),
                child: Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(-2, 0),
                      child: SizedBox(
                        height: context.k_26,
                        child: Checkbox(
                          visualDensity: const VisualDensity(horizontal: -4),
                          value: widget.state.useGSTNumber.value,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          splashRadius: context.k_30,
                          checkColor: context.adColors.whiteTextColor,
                          fillColor: MaterialStateProperty.all(
                            context.adColors.blackTextColor,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          side: BorderSide(
                            color: context.adColors.greyTextColor,
                          ),
                          onChanged: (bool? value) =>
                              onClickCheckBox(newValue: value),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.k_10,
                    ),
                    Text(
                      'use_gst_number'.localize(context),
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ],
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: widget.state.useGSTNumber,
            builder: (_, value, __) {
              const maxCompanyNameLength = 100;
              return widget.state.useGSTNumber.value
                  ? Column(
                      children: [
                        ADSizedBox(
                          height: context.k_20,
                        ),
                        ValidatedTextField(
                          validation: (value, context) =>
                              Validations.validateGstNumber(
                            value,
                            context,
                            widget.state.selectedState.tinCode,
                          ),
                          // textLength: maxAddressLength,
                          focus: widget.gstNumberController.focusNode,
                          nextFocus: widget.companyNameController.focusNode,
                          notifyParent: widget.state.refreshAndValidate,
                          type: 'gst_number'.localize(context),
                          controller: widget.gstNumberController.controller,
                        ),
                        ADSizedBox(
                          height: context.k_20,
                        ),
                        ValidatedTextField(
                          validation: Validations.validateCompanyName,
                          textLength: maxCompanyNameLength,
                          focus: widget.companyNameController.focusNode,
                          nextFocus: widget.addressController.focusNode,
                          notifyParent: widget.state.refreshAndValidate,
                          type: 'company_name'.localize(context),
                          controller: widget.companyNameController.controller,
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  /// this will be return widget of country list and country code list
  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    CountryCodeBottomSheet(
      context: context,
      type: type,
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData);
    });
  }

  void onTapCountryCodeBottomSheet(
    CountryCodeData value2,
  ) {
    widget.flag.value = value2.flag?.validateWithDefaultValue() ?? '';
    widget.countryCodeController.controller.text =
        value2.callingCode?.validateWithDefaultValue() ?? '+91';
  }

  void onClickCheckBox({
    bool? newValue,
  }) {
    widget.state.updateGSTCheckBox(
      value: newValue ?? false,
    );
  }
}
