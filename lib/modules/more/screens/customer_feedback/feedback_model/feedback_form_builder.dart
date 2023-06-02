import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/feedback_validation.dart';
import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

class FeedbackFormBuilder {
  FeedBackForm feedBackForm;

  FeedbackFormBuilder({
    required this.feedBackForm,
  });
  factory FeedbackFormBuilder.dataFromState({
    required FeedbackStateManagement feedbackStateManagement,
    required AppSessionState? appSessionState,
    required ProfileModel profileModel,
  }) {
    final feedBackData = FeedBackForm.fromModel(
      feedbackStateManagement,
      appSessionState,
      profileModel,
    );
    return FeedbackFormBuilder(
      feedBackForm: feedBackData,
    );
  }
}

class FeedBackForm {
  final ADEditableTextModel title;
  final ADEditableTextModel firstName;
  final ADEditableTextModel lastName;
  final ADEditableTextModel countryCode;
  final ADEditableTextModel contactNumber;
  final ADEditableTextModel emailAddress;
  final ADEditableTextModel selectAirport;
  final ADEditableTextModel flightNumber;
  final ADEditableTextModel flightDate;
  final ADEditableTextModel selectOption;

  FeedBackForm({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.contactNumber,
    required this.emailAddress,
    required this.selectAirport,
    required this.flightNumber,
    required this.flightDate,
    required this.selectOption,
  });

  /// this is use for set max length of name
  static int maxLengthOfName = 27;
  static int maxLengthOfPassport = 15;

  factory FeedBackForm.fromModel(
    FeedbackStateManagement feedBackState,
    AppSessionState? appSessionState,
    ProfileModel profileModel,
  ) {
    return FeedBackForm(
      title: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text =
              appSessionState?.profileModel.personInfo?.title?.trim() ?? 'Mr.',
        placeHolder: 'title',
        onChange: () {
          //TODO
        },
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        type: ADEditableTextType.defaultTextField,
      ),
      firstName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text =
              appSessionState?.profileModel.personInfo?.firstName?.trim() ?? '',
        placeHolder: feedBackState.elementsField?.firstNameLabel ?? '',
        onChange: () {
          //TODO
        },
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
        validation: (String? value) => FeedBackValidation.validateName(
          value ?? '',
          feedBackState,
        ),
        length: maxLengthOfName,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z]'),
          ),
        ],
      ),
      lastName: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text =
              appSessionState?.profileModel.personInfo?.lastName?.trim() ?? '',
        placeHolder: feedBackState.elementsField?.lastNameLabel ?? '',
        onChange: () {
          //TODO
        },
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
        validation: (String? value) => FeedBackValidation.validateLastName(
          value ?? '',
          feedBackState,
        ),
        length: maxLengthOfName,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z ]'),
          ),
        ],
      ),
      countryCode: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
              ? profileModel.personInfo?.phones?.first.countryCode ?? ''
              : '+91',
        placeHolder: 'code',
        selectedCountryCode: '',
        onChange: () {
          //TODO
        },
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
          ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
              ? profileModel.personInfo?.phones
                      ?.firstWhere((phoneNumber) => phoneNumber.type == 'P')
                      .number ??
                  ''
              : '',
        placeHolder: 'mobile_no',
        onChange: () {
          //TODO
        },
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        asyncValidation: FlightValidations.validateMobileLib,
        validation: (String? value) =>
            FeedBackValidation.validateForMobileIsEmptyOrNot(value),
        length: maxLengthOfPassport,
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
          ..text =
              (appSessionState?.profileModel.personInfo?.emails?.isNotEmpty ??
                      false)
                  ? (appSessionState?.profileModel.personInfo?.emails?.first
                              .emailAddress ??
                          '')
                      .trim()
                  : '',
        placeHolder: feedBackState.elementsField?.emailIdLabel ?? '',
        onChange: () {
          //TODO
        },
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
            FeedBackValidation.validateEmail(value ?? '', feedBackState),
      ),
      selectAirport: valueForSelectAirport(feedBackState),
      flightNumber: valueForFlightNumber(feedBackState),
      flightDate: valueForFlightDate(feedBackState),
      selectOption: valueForSelectFeedbackOption(feedBackState),
    );
  }
  static ADEditableTextModel valueForSelectAirport(
    FeedbackStateManagement feedBackState,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = (selectedAirportsData?.airportName).toString(),
      placeHolder: feedBackState.elementsField?.selectAirportLabel ?? '',
      onChange: () {
        //TODO
      },
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
          FeedBackValidation.validatedForAirportRequired(
        value ?? '',
        feedBackState,
      ),
    );
  }

  static ADEditableTextModel valueForFlightDate(
    FeedbackStateManagement feedBackState,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = '',
      placeHolder: feedBackState.elementsField?.flightDateLabel ?? '',
      onChange: () {
        //TODO
      },
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
    );
  }

  static ADEditableTextModel valueForFlightNumber(
    FeedbackStateManagement feedBackState,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      globalKey: GlobalKey(),
      controller: TextEditingController()..text = '',
      placeHolder: feedBackState.elementsField?.flightNumberLabel ?? '',
      onChange: () {
        //TODO
      },
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
      length: maxLengthOfPassport,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]')),
      ],
    );
  }

  static ADEditableTextModel valueForSelectFeedbackOption(
    FeedbackStateManagement feedBackState,
  ) {
    return ADEditableTextModel(
      globalKey: GlobalKey(),
      focusNode: FocusNode(),
      controller: TextEditingController()..text = '',
      placeHolder: feedBackState.elementsField?.issueTypeLabel ?? '',
      onChange: () {
        //TODO
      },
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
      validation: (String? value) => FeedBackValidation.validatedForIssueType(
        value ?? '',
        feedBackState,
      ),
    );
  }
}
