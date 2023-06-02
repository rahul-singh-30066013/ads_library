/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_traveller_form_utils.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

class CabBookingFormBuilder {
  UpdateTravellerForm updateTravellerForm;

  CabBookingFormBuilder({
    required this.updateTravellerForm,
  });

  factory CabBookingFormBuilder.fromCabTravellerDetailResponse({
    required Function() onChange,
    required ProfileModel profileModel,
  }) {
    final _updateProfileForm = UpdateTravellerForm.fromModel(
      onChange: onChange,
      profileModel: profileModel,
    );

    return CabBookingFormBuilder(
      updateTravellerForm: _updateProfileForm,
    );
  }
}

class UpdateTravellerForm {
  final ADEditableTextModel title;
  final ADEditableTextModel firstName;
  final ADEditableTextModel lastName;
  final ADEditableTextModel contactNumber;
  final ADEditableTextModel emailAddress;
  final ADEditableTextModel countryCode;
  final ADEditableTextModel gstNumber;
  final ADEditableTextModel gstAddress;
  final ADEditableTextModel gstCompanyName;
  ADEditableTextModel pinCode;
  final ADEditableTextModel country;
  final ADEditableTextModel state;
  final ADEditableTextModel city;

  UpdateTravellerForm({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.emailAddress,
    required this.countryCode,
    required this.gstNumber,
    required this.gstAddress,
    required this.gstCompanyName,
    required this.pinCode,
    required this.country,
    required this.state,
    required this.city,
  });

  static int maxLengthOfPinCode = 6;
  static int maxLengthOfOtherPinCode = 30;
  static int maxLengthOfName = 27;
  static int phoneNumberLength = 10;
  static int addressMaxLength = 100;

  factory UpdateTravellerForm.defaultValue() {
    return UpdateTravellerForm(
      title: ADEditableTextModel.defaultValue(),
      firstName: ADEditableTextModel.defaultValue(),
      lastName: ADEditableTextModel.defaultValue(),
      contactNumber: ADEditableTextModel.defaultValue(),
      emailAddress: ADEditableTextModel.defaultValue(),
      countryCode: ADEditableTextModel.defaultValue(),
      gstNumber: ADEditableTextModel.defaultValue(),
      gstAddress: ADEditableTextModel.defaultValue(),
      gstCompanyName: ADEditableTextModel.defaultValue(),
      pinCode: ADEditableTextModel.defaultValue(),
      country: ADEditableTextModel.defaultValue(),
      state: ADEditableTextModel.defaultValue(),
      city: ADEditableTextModel.defaultValue(),
    );
  }

  factory UpdateTravellerForm.fromModel({
    required Function() onChange,
    required ProfileModel profileModel,
  }) {
    final billingAddress = profileModel.personInfo?.addresses?.firstWhereOrNull(
      (address) => address.type?.toLowerCase() == AddressType.billing.name,
    );
    return UpdateTravellerForm(
      title: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.title?.trim() ?? '',
        placeHolder: 'title',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
      ),
      firstName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.firstName?.trim() ?? '',
        placeHolder: 'firstName',
        onChange: onChange,
        onClearTextAction: () => {
          // TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfName,
        validation: (String? value) =>
            CabFormFieldsValidation.validateFirstName(value ?? ''),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z ]'),
          ),
        ],
      ),
      lastName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.lastName?.trim() ?? '',
        placeHolder: 'last_name',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfName,
        validation: (String? value) =>
            CabFormFieldsValidation.validateLastName(value ?? ''),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z]'),
          ),
        ],
      ),
      countryCode: ADEditableTextModel(
        controller: TextEditingController()
          ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
              ? profileModel.personInfo?.phones?.first.countryCode?.trim() ?? ''
              : '',
        placeHolder: 'code',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        enable: false,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.done,
      ),
      contactNumber: valueForMobileNumber(onChange, profileModel),
      emailAddress: valueForEmailId(onChange, profileModel),
      gstNumber: valueGst(onChange),
      gstCompanyName: valueForCompanyNAme(onChange),
      gstAddress: valueForAddress(
        onChange,
        billingAddress?.line1,
      ),
      city: valueForCity(
        onChange,
        billingAddress?.city,
      ),
      pinCode: valueForPinCode(
        onChange,
        billingAddress?.pinCode ?? '',
        billingAddress?.country ?? 'India',
      ),
      country: valueForCountry(
        onChange,
        billingAddress?.country ?? 'India',
      ),
      state: valueForState(
        onChange,
        billingAddress?.state,
      ),
    );
  }

  static ADEditableTextModel valueForMobileNumber(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
            ? profileModel.personInfo?.phones
                    ?.firstWhere((phoneNumber) => phoneNumber.type == 'P')
                    .number
                    ?.trim() ??
                ''
            : '',
      placeHolder: 'mobile_no',
      errorMessage: 'please_enter_mobile_number',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      length: int.parse('15'),
      readonly: false,
      style: ADTextStyle500.size16,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.phone,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      asyncValidation: CabFormFieldsValidation.validateMobileLib,
      validation: (String? value) =>
          CabFormFieldsValidation.validateMobile(value ?? ''),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[0-9]'),
        ),
      ],
    );
  }

  static ADEditableTextModel valueForCity(
    Function() onChange,
    String? cityName,
  ) {
    {
      return ADEditableTextModel(
        focusNode: FocusNode(),
        controller: TextEditingController()..text = cityName?.trim() ?? '',
        placeHolder: 'city',
        enable: false,
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        validation: (String? text) =>
            CabFormFieldsValidation.validateCityName(text ?? ''),
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.done,
      );
    }
  }

  static ADEditableTextModel valueForCountry(
    Function() onChange,
    String? countryName,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = countryName?.trim() ?? 'India',
      placeHolder: 'nationality',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      icon: Icons.keyboard_arrow_down_outlined,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.trailingArrow,
    );
  }

  static ADEditableTextModel valueForPinCode(
    Function() onChange,
    String? postalCode,
    String country, {
    bool isRefresh = false,
  }) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()
        ..text = isRefresh ? '' : postalCode?.trim() ?? '',
      placeHolder: 'pincode',
      errorMessage: 'please_enter_valid_pincode',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      style: ADTextStyle500.size16,
      validation: (String? text) => CabFormFieldsValidation.validatePinCode(
        text ?? '',
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          country.toUpperCase() != 'INDIA'
              ? RegExp('[a-zA-Z0-9-]')
              : RegExp('[0-9]'),
        ),
        UpperCaseTextFormatter(),
      ],
      type: ADEditableTextType.defaultTextField,
      keyBoardType: country.toUpperCase() != 'INDIA'
          ? TextInputType.text
          : TextInputType.number,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      length: country.toUpperCase() != 'INDIA'
          ? maxLengthOfOtherPinCode
          : maxLengthOfPinCode,
    );
  }

  static ADEditableTextModel valueForState(
    Function() onChange,
    String? stateName,
  ) {
    {
      return ADEditableTextModel(
        focusNode: FocusNode(),
        controller: TextEditingController()..text = stateName?.trim() ?? '',
        placeHolder: 'state',
        onChange: onChange,
        enable: false,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        validation: (String? text) =>
            CabFormFieldsValidation.validateStateName(text ?? ''),
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.done,
      );
    }
  }

  static ADEditableTextModel valueGst(
    Function() onChange,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()..text = '',
      placeHolder: 'gst_number',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      style: ADTextStyle500.size16,
      validation: (String? value) =>
          CabFormFieldsValidation.validateGstNumber(value ?? ''),
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-9]'),
        ),
        UpperCaseTextFormatter(),
      ],
    );
  }

  static ADEditableTextModel valueForCompanyNAme(
    Function() onChange,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()..text = '',
      placeHolder: 'company_name',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      style: ADTextStyle500.size16,
      validation: (String? value) =>
          CabFormFieldsValidation.validateCompanyName(value ?? ''),
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
    );
  }

  static ADEditableTextModel valueForAddress(
    Function() onChange,
    String? addressLine,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()..text = addressLine ?? '',
      placeHolder: 'address',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      style: ADTextStyle500.size16,
      validation: (String? value) =>
          CabFormFieldsValidation.validateAddressName(value ?? ''),
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.streetAddress,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      length: addressMaxLength,
    );
  }

  static ADEditableTextModel valueForEmailId(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.emails?.isNotEmpty ?? false
            ? profileModel.personInfo?.emails?.first.emailAddress?.trim() ?? ''
            : '',
      placeHolder: 'emailID',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      style: ADTextStyle500.size16,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.emailAddress,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      validation: (String? value) =>
          CabFormFieldsValidation.validateEmailId(value ?? ''),
    );
  }

  void pinCodeUpdateOnSelectCountry(String? countryName) {
    pinCode.controller.text = '';
    city.controller.text = '';
    state.controller.text = '';
    pinCode
      ..length = countryName?.toUpperCase() != 'INDIA'
          ? maxLengthOfOtherPinCode
          : maxLengthOfPinCode
      ..keyBoardType = countryName?.toUpperCase() != 'INDIA'
          ? TextInputType.text
          : TextInputType.number;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
