/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/gst_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

/// this is use for create form for run time according to response of view itinerary  id
class TextFormBuilder {
  /// this is use for create passenger form
  List<OneTravellerDetails> formData = [];

  /// this is use for contact detail form
  ContactDetails contactDetails;

  /// this is use for gst form
  GstDetail? gstDetails;

  /// this is use for date of birth mandatory or not for adult
  bool isDobMandatory = false;

  static bool isGstEnable = false;

  BillingDetails? billingDetail;

  TextFormBuilder({
    required this.formData,
    required this.contactDetails,
    this.gstDetails,
    this.billingDetail,
  });

  void updateGstEnable({required bool value}) {
    isGstEnable = value;
  }

  /// this factory method is use for create passenger form ,contact detail and gst detail
  factory TextFormBuilder.fromItineraryResponseModel({
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
    required Function() onChange,
    required ProfileModel profileModel,
    CountryCodeData? countryCodeData,
    required List<site_core.Country> country,
  }) {
    final List<OneTravellerDetails> _formData = [];

    final paxListInfo = flightViewItineraryResponseModel?.paxInfoList ?? [];
    final contactInfo = flightViewItineraryResponseModel?.contactDetail;
    final gstInfo = flightViewItineraryResponseModel?.gstDetails;
    final addressInfo =
        flightViewItineraryResponseModel?.contactDetail?.address;

    final bool isDobMandatory = flightViewItineraryResponseModel
            ?.itineraryMetaData?.isDateOfBirthRequired ??
        false;

    /// this is use for validate passport is required or not
    final bool isPassportMandatory = flightViewItineraryResponseModel
            ?.itineraryMetaData?.isPassportRequired ??
        false;

    final bool isPassportExpiryRequired = flightViewItineraryResponseModel
            ?.itineraryMetaData?.isPassportExpiryRequired ??
        false;

    final bool isPassportIssueRequired = flightViewItineraryResponseModel
            ?.itineraryMetaData?.isPassportIssueRequired ??
        false;

    final bool isPassportIssueCountryRequired = flightViewItineraryResponseModel
            ?.itineraryMetaData?.isPassportIssueCountryRequired ??
        false;

    final bool isInternational =
        flightViewItineraryResponseModel?.isInternational ?? false;

    /// this is use for validate nationality is required or not
    final bool isNationalityMandatory = isInternational &&
        (flightViewItineraryResponseModel
                ?.itineraryMetaData?.isNationalityRequired ??
            false);

    int adult = 1;
    int child = 1;
    int infant = 1;

    String type;
    int countOfPassenger = 0;

    for (int index = 0; index < paxListInfo.length; index++) {
      if (FlightUtils.getPaxType(
            paxListInfo[index].passengerTypeCode ?? '',
          ) ==
          PaxType.adult) {
        countOfPassenger = adult++;
        type = kAdult;
      } else if (FlightUtils.getPaxType(
            paxListInfo[index].passengerTypeCode ?? '',
          ) ==
          PaxType.child) {
        countOfPassenger = child++;
        type = kChild;
      } else {
        countOfPassenger = infant++;
        type = kInfant;
      }
      final data = OneTravellerDetails.fromPaxInfo(
        paxListInfo[index],
        isDateOfBirth: isDobMandatory,
        passengerTypeCode: paxListInfo[index].passengerTypeCode ?? '',
        type: type,
        countOfPassenger: countOfPassenger,
        onChange: onChange,
        journeyStartingDate: FlightUtils.getFirstDateOfJourney(
          flightViewItineraryResponseModel?.journeyStartDate ?? '',
        ),
        isPassport: isPassportMandatory,
        isPassportExpiryRequired: isPassportExpiryRequired,
        isPassportIssueRequired: isPassportIssueRequired,
        isPassportIssueCountryRequired: isPassportIssueCountryRequired,
        isNationality: isNationalityMandatory,
        country: country,
      );
      _formData.add(data);
    }

    final contactData = ContactDetails.fromModel(
      itineraryContactDetail: contactInfo ?? ItineraryContactDetail(),
      onChange: onChange,
      profileModel: profileModel,
      countryCodeData: countryCodeData,
    );
    final GstDetail gstDetail = GstDetail.fromModel(
      gstDetails: gstInfo ?? GstDetails(),
      onChange: onChange,
      isGstEnable: isGstEnable,
    );

    final billingDetails = BillingDetails.fromModel(
      onChange: onChange,
      profileModel: profileModel,
      address: addressInfo ?? [],
    );

    return TextFormBuilder(
      formData: _formData,
      contactDetails: contactData,
      gstDetails: gstDetail,
      billingDetail: billingDetails,
    );
  }

  /// this method is use for validate all field of passenger form
  Future<bool> isValidated() async {
    // final isGSTValid = gstDetails?.isValidated.call() ?? true;
    // final isContactValid = await contactDetails.isValidated();
    bool isPaxInfoValid = true;
    for (final paxInfo in formData) {
      if (!paxInfo.isValidated()) {
        isPaxInfoValid = false;
        break;
      }
    }
    return isPaxInfoValid;
  }

  ///This function is used to check for any duplicate entry in the passengers data.
  bool isDuplicateDataInForm() {
    final Set nameSet = <String>{};
    for (final paxInfo in formData) {
      final fullName =
          '${paxInfo.title.controller.text}${paxInfo.firstName.controller.text}${paxInfo.lastName.controller.text}';
      if (!nameSet.add(fullName)) {
        return true;
      }
    }
    return false;
  }
}

///This is use to build the form component for the one pax.
class OneTravellerDetails {
  final ADEditableTextModel title;
  final ADEditableTextModel firstName;
  final ADEditableTextModel lastName;
  final ADEditableTextModel? dateOfBirth;
  final ADEditableTextModel? passport;
  final ADEditableTextModel? nationality;
  final ADEditableTextModel? issuedCountryName;
  final ADEditableTextModel? issueDate;
  final ADEditableTextModel? expiryDate;
  final String? type;
  final int count;
  bool? isDateOfBirth;
  bool? isPassport;
  bool? isNationality;
  final DateTime journeyStartingDate;

  OneTravellerDetails({
    required this.title,
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.passport,
    this.nationality,
    this.issueDate,
    this.expiryDate,
    this.issuedCountryName,
    this.type,
    required this.count,
    this.isDateOfBirth,
    this.isPassport,
    this.isNationality,
    required this.journeyStartingDate,
  });

  /// this is use for set max length of name
  static int maxLengthOfName = 27;
  static int maxLengthOfPassport = 15;

  static String getCountryName(
    String countryCode,
    List<site_core.Country> country,
  ) {
    if (countryCode.isNotEmpty) {
      final requiredCountry =
          country.firstWhere((country) => country.isO2 == countryCode);
      return requiredCountry.countryName;
    } else {
      return '';
    }
  }

  factory OneTravellerDetails.fromPaxInfo(
    PaxInfoList paxInfoList, {
    required bool isDateOfBirth,
    required bool isPassport,
    required bool isPassportExpiryRequired,
    required bool isPassportIssueRequired,
    required bool isPassportIssueCountryRequired,
    required bool isNationality,
    required String passengerTypeCode,
    required String type,
    required int countOfPassenger,
    required Function() onChange,
    required DateTime journeyStartingDate,
    required List<site_core.Country> country,
  }) {
    /// this is use for get passenger type
    final paxType = FlightUtils.getPaxType(passengerTypeCode);

    return OneTravellerDetails(
      type: type,
      count: countOfPassenger,
      isDateOfBirth: isDateOfBirth,
      isPassport: isPassport,
      isNationality: isNationality,
      title: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = (paxInfoList.personName?.namePrefix ?? '').isNotEmpty
              ? getNamePrefixAsPerTitleSelected(
                  paxInfoList.personName?.namePrefix ?? '',
                )
              : '',
        placeHolder: paxType == PaxType.adult ? 'title' : 'title',
        errorMessage: paxType == PaxType.adult
            ? 'please_select_salutation'
            : 'please_select_gender',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        type: ADEditableTextType.defaultTextField,
        validation: (String? value) => paxType == PaxType.adult
            ? FlightValidations.validateSalutation(value ?? '')
            : FlightValidations.validateGender(value ?? ''),
      ),
      firstName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = paxInfoList.personName?.firstName ?? '',
        placeHolder: 'firstname_middlename',
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
        validation: (String? value) =>
            FlightValidations.validateFirstName(value ?? ''),
        length: maxLengthOfName,
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
          ..text = paxInfoList.personName?.lastName ?? '',
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
        textInputAction: TextInputAction.done,
        validation: (String? value) =>
            FlightValidations.validateLastName(value ?? ''),
        length: maxLengthOfName,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z]'),
          ),
        ],
      ),
      journeyStartingDate: journeyStartingDate,
      dateOfBirth: FlightUtils.getPaxType(passengerTypeCode) == PaxType.adult
          ? isDateOfBirth
              ? valueForDateOfBirth(
                  onChange,
                  paxInfoList.dateOfBirth,
                  passengerTypeCode,
                  isDateOfBirth: isDateOfBirth,
                )
              : null
          : valueForDateOfBirth(
              onChange,
              paxInfoList.dateOfBirth,
              passengerTypeCode,
              isDateOfBirth: isDateOfBirth,
            ),
      passport: isPassport
          ? valueForPassport(onChange, paxInfoList.document?.first.docID)
          : null,
      nationality: isNationality
          ? valueForNationality(
              onChange,
              getCountryName(paxInfoList.nationality ?? '', country),
            )
          : null,
      issuedCountryName: isPassportIssueCountryRequired
          ? valueForIssuedCountryName(
              onChange,
              getCountryName(
                paxInfoList.document?.first.docIssueCountry ?? '',
                country,
              ),
            )
          : null,
      issueDate: isPassportIssueRequired
          ? valueForIssueDate(
              onChange,
              paxInfoList.document?.first.docIssueDate,
            )
          : null,
      expiryDate: isPassportExpiryRequired
          ? valueForExpiryDate(onChange, paxInfoList.document?.first.expireDate)
          : null,
    );
  }

  static ADEditableTextModel valueForPassport(
    Function() onChange,
    String? passportNumber,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()..text = passportNumber ?? '',
      placeHolder: 'passport_number',
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
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatePassport(value ?? ''),
      length: maxLengthOfPassport,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-9]'),
        ),
      ],
    );
  }

  static ADEditableTextModel valueForNationality(
    Function() onChange,
    String nationality,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = nationality,
      placeHolder: 'nationality',
      errorMessage: 'please_select_nationality',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      svgAssets: SvgAssets.trailingArrow,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatedForNationality(value ?? ''),
    );
  }

  static ADEditableTextModel valueForIssuedCountryName(
    Function() onChange,
    String countryName,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = countryName,
      placeHolder: 'issued_country_name',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      svgAssets: SvgAssets.trailingArrow,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatedForIssuedCountryName(value ?? ''),
    );
  }

  static ADEditableTextModel valueForIssueDate(
    Function() onChange,
    String? issueDate,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = issueDate ?? '',
      placeHolder: 'issue_date',
      errorMessage: 'please_select_issue_date',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      svgAssets: SvgAssets.calenderIcon,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatedForIssueDate(value ?? ''),
    );
  }

  static ADEditableTextModel valueForExpiryDate(
    Function() onChange,
    String? expiryDate,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = expiryDate ?? '',
      placeHolder: 'expiry_date',
      errorMessage: 'please_select_expiry_date',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      svgAssets: SvgAssets.calenderIcon,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatedForExpiryDate(value ?? ''),
    );
  }

  static ADEditableTextModel valueForDateOfBirth(
    Function() onChange,
    String? dateOfBirth,
    String passengerTypeCode, {
    required bool isDateOfBirth,
  }) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = MyProfileUtils.convertToDisplayDateFormat(dateOfBirth ?? ''),
      placeHolder: FlightUtils.getPaxType(passengerTypeCode) == PaxType.adult
          ? isDateOfBirth
              ? 'date_of_birth'
              : 'date_of_birth_optional'
          : 'date_of_birth',
      errorMessage: 'please_select_dob',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      style: ADTextStyle500.size16,
      svgAssets: SvgAssets.calenderIcon,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.done,
      validation: (String? value) =>
          FlightValidations.validatedForDob(value ?? ''),
    );
  }

  static String getNamePrefixAsPerTitleSelected(String gender) {
    if (gender == kMr) {
      return kMrDot;
    } else if (gender == kMs) {
      return kMsDot;
    } else if (gender == kMrs) {
      return kMrsDot;
    } else if (gender == kMstr) {
      return kMstrDot;
    } else if (gender == kMiss) {
      return kMiss;
    } else {
      return kMr;
    }
  }

  bool isValidated() {
    final isTitleValid = title.validation?.call(title.controller.text);
    final isFirstNameValid =
        firstName.validation?.call(firstName.controller.text);
    final isLastNameValid = lastName.validation?.call(lastName.controller.text);
    final isDateOfBirthValid =
        dateOfBirth?.validation?.call(dateOfBirth?.controller.text);
    final isExpiryDateValid =
        expiryDate?.validation?.call(expiryDate?.controller.text);
    return isTitleValid == null &&
        isFirstNameValid == null &&
        isLastNameValid == null &&
        isExpiryDateValid == null &&
        isDateOfBirthValid == null;
  }
}

///This is use to build the form component for GST.
class GstDetail {
  ADEditableTextModel gstNumber;
  ADEditableTextModel gstAddress;
  ADEditableTextModel gstCompanyName;
  ADEditableTextModel pinCode;
  ADEditableTextModel country;
  ADEditableTextModel state;
  ADEditableTextModel city;

  GstDetail({
    required this.gstNumber,
    required this.gstAddress,
    required this.gstCompanyName,
    required this.pinCode,
    required this.country,
    required this.state,
    required this.city,
  });

  static int maxLengthOfCompanyName = 150;
  static int maxLengthOfCompanyAddress = 100;
  static int maxLengthOfCityAndState = 30;
  static bool isInvalidPin = true;

  factory GstDetail.defaultValue() {
    return GstDetail(
      gstNumber: ADEditableTextModel.defaultValue(),
      gstAddress: ADEditableTextModel.defaultValue(),
      gstCompanyName: ADEditableTextModel.defaultValue(),
      pinCode: ADEditableTextModel.defaultValue(),
      country: ADEditableTextModel.defaultValue(),
      state: ADEditableTextModel.defaultValue(),
      city: ADEditableTextModel.defaultValue(),
    );
  }

  void updateValidationIfVisible({required bool isGstVisible}) {
    if (isGstVisible) {
      gstNumber.validation =
          (String? value) => FlightValidations.validateGstNumber(value ?? '');
      gstAddress.validation = (String? value) =>
          FlightValidations.isValidateForCompanyAddress(value ?? '');
      gstCompanyName.validation =
          (String? value) => FlightValidations.validateCompanyName(value ?? '');
    } else {
      //TODO
      // gstNumber.controller.clear();
      // gstAddress.controller.clear();
      // gstCompanyName.controller.clear();
      // gstNumber.validation = null;
      // gstAddress.validation = null;
      // gstCompanyName.validation = null;
    }
  }

  void isEnableForEditAndValidationForGst() {
    state.readonly = false;
    city.readonly = false;
    state.validation =
        (String? value) => FlightValidations.validateState(value ?? '');
    city.validation =
        (String? value) => FlightValidations.validateCity(value ?? '');
  }

  void setMaxLengthOfPin(String countryName) {
    const int lengthForIndia = 6;
    const int lengthForAnotherCountry = 30;
    if (countryName == 'India') {
      pinCode
        ..length = lengthForIndia
        ..keyBoardType = TextInputType.phone
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ];
    } else {
      pinCode
        ..length = lengthForAnotherCountry
        ..keyBoardType = TextInputType.text
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z0-9-]'),
          ),
        ];
    }
  }

  static int lengthOfText = 2;

  factory GstDetail.fromModel({
    required GstDetails gstDetails,
    required Function() onChange,
    required bool isGstEnable,
  }) {
    return GstDetail(
      gstNumber: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = gstDetails.gstNumber ?? '',
        placeHolder: 'gst_number',
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
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z0-9]'),
          ),
        ],
      ),
      gstAddress: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = gstDetails.gstHolderAddress ?? '',
        placeHolder: 'address',
        errorMessage: 'enter_valid_company_add',
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
        textInputAction: TextInputAction.done,
        length: maxLengthOfCompanyAddress,
        validation: (String? value) =>
            FlightValidations.isValidateForCompanyAddress(value ?? ''),
      ),
      gstCompanyName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = gstDetails.gstHolderName ?? '',
        placeHolder: 'company_name',
        errorMessage: 'enter_valid_com_name',
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
        length: maxLengthOfCompanyName,
      ),
      pinCode: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = gstDetails.gstHolderPinCode ?? '',
        placeHolder: 'pin_code',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        // keyBoardType: TextInputType.number,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) => FlightValidations.validatePincode(
          value ?? '',
        ),
      ),
      country: ADEditableTextModel(
        controller: TextEditingController()
          ..text = gstDetails.gstHolderCountryName ?? 'India',
        placeHolder: 'country',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        svgAssets: SvgAssets.trailingArrow,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) =>
            FlightValidations.validateCountryCode(value ?? ''),
      ),
      state: ADEditableTextModel(
        controller: TextEditingController()
          ..text = gstDetails.gstHolderStateName ?? '',
        placeHolder: 'state',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        // validation: (String? value) =>
        //     FlightValidations.validateState(value ?? ''),
        // validation: (String? value) =>
        //     FlightValidations.validateState(value ?? ''),
      ),
      city: ADEditableTextModel(
        controller: TextEditingController()
          ..text = gstDetails.gstHolderCityName ?? '',
        placeHolder: 'city',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        // validation: (String? value) =>
        //     FlightValidations.validateState(value ?? ''),
        // validation: (String? value) =>
        //     FlightValidations.validateCity(value ?? ''),
      ),
    );
  }

  bool isValidated() {
    final isGSTNumberValid =
        gstNumber.validation?.call(gstNumber.controller.text);
    final isGSTAddressValid =
        gstAddress.validation?.call(gstAddress.controller.text);
    final isGSTCompanyNameValid =
        gstCompanyName.validation?.call(gstCompanyName.controller.text);
    return isGSTNumberValid == null &&
        isGSTAddressValid == null &&
        isGSTCompanyNameValid == null;
  }
}

///This is use to build the form component for Contact.
class ContactDetails {
  final ADEditableTextModel countryCode;
  final ADEditableTextModel contactNumber;
  final ADEditableTextModel emailAddress;

  ContactDetails({
    required this.countryCode,
    required this.contactNumber,
    required this.emailAddress,
  });

  static int phoneNumberLength = 10;

  factory ContactDetails.defaultValue() {
    return ContactDetails(
      contactNumber: ADEditableTextModel.defaultValue(),
      countryCode: ADEditableTextModel.defaultValue(),
      emailAddress: ADEditableTextModel.defaultValue(),
    );
  }

  factory ContactDetails.fromModel({
    required ItineraryContactDetail itineraryContactDetail,
    required Function() onChange,
    required ProfileModel profileModel,
    CountryCodeData? countryCodeData,
  }) {
    final int length = profileModel.personInfo?.emails?.length ?? 0;
    return ContactDetails(
      countryCode: ADEditableTextModel(
        controller: TextEditingController()
          ..text = itineraryContactDetail
                      .contactNumber?.first.countryAccessCode?.isEmpty ??
                  false ||
                      itineraryContactDetail
                              .contactNumber?.first.countryAccessCode ==
                          null
              ? ProfileSingleton.profileSingleton.countryCodeData.callingCode
                          ?.isNotEmpty ??
                      false
                  ? ProfileSingleton
                          .profileSingleton.countryCodeData.callingCode ??
                      ''
                  : ''
              : itineraryContactDetail.contactNumber?.first.countryAccessCode ??
                  '',
        placeHolder: 'code',
        selectedCountryCode: countryCodeData != null
            ? countryCodeData.countryCode
            : ProfileSingleton.profileSingleton.countryCodeData.countryCode,
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) =>
            FlightValidations.validateCountryCode(value ?? ''),
      ),
      contactNumber: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = itineraryContactDetail
                      .contactNumber?.first.phoneNumber?.isEmpty ??
                  false ||
                      itineraryContactDetail.contactNumber?.first.phoneNumber ==
                          null
              ? ProfileSingleton.profileSingleton.userID.isNotEmpty
                  ? ProfileSingleton.profileSingleton.userID
                  : ''
              : itineraryContactDetail.contactNumber?.first.phoneNumber ?? '',
        placeHolder: 'mobile_no',
        errorMessage: 'please_enter_mobile_number',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        length: int.parse(countryCodeData?.max ?? '15'),
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        asyncValidation: FlightValidations.validateMobileLib,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ],
      ),
      emailAddress: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = itineraryContactDetail.email?.first.emailId?.isEmpty ??
                  false || itineraryContactDetail.email?.first.emailId == null
              ? length > 0
                  ? profileModel.personInfo?.emails?.first.emailAddress
                          ?.trim() ??
                      ''
                  : ''
              : itineraryContactDetail.email?.first.emailId?.trim() ?? '',
        placeHolder: 'email_id_capital',
        errorMessage: 'enter_email',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.emailAddress,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.done,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp(' ')),
        ],
        validation: (String? value) =>
            FlightValidations.validateEmailId(value ?? ''),
      ),
    );
  }

  Future<bool> isValidated() async {
    final isCodeValid =
        countryCode.validation?.call(countryCode.controller.text);
    final isContactNumberValid = contactNumber.asyncValidation != null
        ? await contactNumber.asyncValidation?.call(
            contactNumber.controller.text,
            countryCode.selectedCountryCode,
          )
        : null;
    final isEmailValid =
        emailAddress.validation?.call(emailAddress.controller.text);
    return isCodeValid == null &&
        isContactNumberValid == null &&
        isEmailValid == null;
  }
}

class BillingDetails {
  final ADEditableTextModel address;
  final ADEditableTextModel pinCode;
  final ADEditableTextModel country;
  final ADEditableTextModel state;
  final ADEditableTextModel city;

  BillingDetails({
    required this.address,
    required this.pinCode,
    required this.country,
    required this.state,
    required this.city,
  });

  static int maxLengthOfCompanyAddress = 100;
  static int maxLengthOfCityAndState = 30;

  factory BillingDetails.defaultValue() {
    return BillingDetails(
      address: ADEditableTextModel.defaultValue(),
      pinCode: ADEditableTextModel.defaultValue(),
      country: ADEditableTextModel.defaultValue(),
      state: ADEditableTextModel.defaultValue(),
      city: ADEditableTextModel.defaultValue(),
    );
  }

  void isEnableForEditAndValidationForBilling() {
    state.readonly = false;
    city.readonly = false;
    state.validation =
        (String? value) => FlightValidations.validateState(value ?? '');
    city.validation =
        (String? value) => FlightValidations.validateCity(value ?? '');
  }

  void setMaxLengthOfPin(String countryName) {
    const int lengthForIndia = 6;
    const int lengthForAnotherCountry = 30;
    if (countryName == 'India') {
      pinCode
        ..length = lengthForIndia
        ..keyBoardType = TextInputType.phone
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ];
    } else {
      pinCode
        ..length = lengthForAnotherCountry
        ..keyBoardType = TextInputType.text
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z0-9]'),
          ),
        ];
    }
  }

  factory BillingDetails.fromModel({
    required ProfileModel profileModel,
    required Function() onChange,
    required List<Address> address,
  }) {
    final billingAddress = profileModel.personInfo?.addresses?.firstWhereOrNull(
      (address) => address.type?.toLowerCase() == AddressType.billing.name,
    );
    final addressData = address.firstWhereOrNull(
      (address) => address.type?.toLowerCase() == AddressType.billing.name,
    );
    return BillingDetails(
      address: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = addressData?.addressLine?.isEmpty ??
                  false || addressData?.addressLine == null
              ? billingAddress != null
                  ? billingAddress.line1?.trim() ?? ''
                  : ''
              : addressData?.addressLine ?? '',
        placeHolder: 'address',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCompanyAddress,
        validation: (String? value) =>
            FlightValidations.isValidateForCompanyAddress(value ?? ''),
      ),
      pinCode: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = addressData?.postalCode?.isEmpty ??
                  false || addressData?.postalCode == null
              ? billingAddress != null
                  ? billingAddress.pinCode?.trim() ?? ''
                  : ''
              : addressData?.postalCode ?? '',
        placeHolder: 'pin_code',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        // keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) => FlightValidations.validatePincode(
          value ?? '',
        ),
      ),
      country: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = addressData?.country?.countryName?.isEmpty ??
                  false || addressData?.country?.countryName == null
              ? billingAddress != null
                  ? billingAddress.country?.trim() ?? ''
                  : 'India'
              : addressData?.country?.countryName ?? 'India',
        placeHolder: 'country',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        svgAssets: SvgAssets.trailingArrow,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) =>
            FlightValidations.validateCountryCode(value ?? ''),
      ),
      state: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = addressData?.stateProv?.stateName?.isEmpty ??
                  false || addressData?.stateProv?.stateName == null
              ? billingAddress != null
                  ? billingAddress.state?.trim() ?? ''
                  : ''
              : addressData?.stateProv?.stateName ?? '',
        placeHolder: 'state',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        // validation: (String? value) =>
        //     FlightValidations.validateState(value ?? ''),
      ),
      city: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = addressData?.city?.cityName?.isEmpty ??
                  false || addressData?.city?.cityName == null
              ? billingAddress != null
                  ? billingAddress.city?.trim() ?? ''
                  : ''
              : addressData?.city?.cityName ?? '',
        placeHolder: 'city',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        // validation: (String? value) =>
        //     FlightValidations.validateCity(value ?? ''),
      ),
    );
  }
}
