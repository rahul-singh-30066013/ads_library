/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/models/customer_feedback/customer_feedback_request_model.dart';
import 'package:adani_airport_mobile/modules/more/models/customer_feedback/feedback_form_layout_models/feedback_form_layout_model_element.dart';
import 'package:adani_airport_mobile/modules/more/models/response/customer_feedback_response.dart';
import 'package:adani_airport_mobile/modules/more/repositories/feedback_repository.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/feedback_model/feedback_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/thank_you_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/utils/login_model_utils.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';

/// this class is use for api call for feedback and state management
class FeedbackStateManagement extends ADBaseViewModel {
  FeedbackFormBuilder? feedbackFormBuilder;

  final FeedbackRepository _feedbackRepository = FeedbackRepository();

  /// Initiate loading state for api hit
  ADResponseState feedbackState = ADResponseState.init();

  ///response
  ADResponseState feedbackResponseState = ADResponseState.init();
  Fields? elementsField;
  bool _isAbsorbing = false;

  bool get isAbsorbing => _isAbsorbing;
  String _incidentNo = '';

  String get incidentNo => _incidentNo;
  String dateValue = '';
  bool checkboxValue = ProfileSingleton.profileSingleton.isLoggedIn;
  ValueNotifier<String> flag = ValueNotifier(
    '${Environment.instance.configuration.cmsBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7',
  );

  List<BottomSheetRowModel> bottomSheetAirportList = [];
  List<BottomSheetRowModel> bottomSheetPostList = [];

  TextEditingController airportController = TextEditingController(
    text: selectedAirportsData?.airportName?.isEmpty ?? false
        ? ''
        : selectedAirportsData?.airportName.toString(),
  );
  TextEditingController commentController = TextEditingController(text: ' ');

  final ValueNotifier<bool> isSubmitButtonActive = ValueNotifier(true);
  final ValueNotifier<String> isAirportSelect = ValueNotifier('');
  final ValueNotifier<String> descriptionErrorMsg = ValueNotifier('');

  ///this method send feedback request to server
  Future<void> sendFeedback({required BuildContext context}) async {
    final code = bottomSheetAirportList
        .where(
          (element) =>
              element.text ==
              feedbackFormBuilder?.feedBackForm.selectAirport.controller.text,
        )
        .first
        .code;
    final CustomerFeedbackRequestModel feedbackRequestModel =
        CustomerFeedbackRequestModel(
      name:
          '${feedbackFormBuilder?.feedBackForm.title.controller.text} ${feedbackFormBuilder?.feedBackForm.firstName.controller.text} ${feedbackFormBuilder?.feedBackForm.lastName.controller.text}',
      airport: code,
      type:
          feedbackFormBuilder?.feedBackForm.selectOption.controller.text ?? '',
      description: commentController.text,
      mobileNumber:
          feedbackFormBuilder?.feedBackForm.contactNumber.controller.text ?? '',
      countryCode:
          feedbackFormBuilder?.feedBackForm.countryCode.controller.text ?? '',
      email:
          feedbackFormBuilder?.feedBackForm.emailAddress.controller.text ?? '',
      flightDetails: FlightDetails(
        flightNumber:
            feedbackFormBuilder?.feedBackForm.flightNumber.controller.text ??
                '',
        flightDate: dateValue,
      ),
    );
    _isAbsorbing = true;
    feedbackResponseState = ADResponseState.loading();
    notifyListeners();
    await _feedbackRepository
        .sendFeedback(
      feedbackRequestModel,
    )
        .then(
      (value) {
        if (value.viewStatus == Status.complete && value.data != null) {
          _sendFeedbackEvent(ClickEvents.feedback_submit_success);
          _incidentNo = CustomerFeedbackResponse.fromJson(value.data)
                  .incidentDetail
                  ?.incidentId ??
              '';
          showFeedbackSubmittedBottomSheet(
            context,
          );
        } else {
          _sendFeedbackEvent(
            ClickEvents.feedback_submit_fail,
            errorText: feedbackResponseState.message,
            errorCode: feedbackResponseState.errorCode,
          );
          showToastMessage(
            context,
            feedbackResponseState.message ?? 'ADLMS02'.localize(context),
          );
        }
        _isAbsorbing = false;
        feedbackResponseState = value;
        notifyListeners();
      },
    );
  }

  ///this method use to fetch  feedback layout data from sitecore
  Future<void> getFeedbackLayoutData() async {
    _updateState(ADResponseState.loading());
    await _feedbackRepository.fetchFeedbackFormLayoutData(
      queryParams: {
        'item': SiteCoreApiUrls.siteCoreFeedbackFormLayoutAPI,
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    ).then((value) {
      _updateState(value);
    });
  }

  void _updateState(ADResponseState response) {
    feedbackState = response;
    notifyListeners();
  }

  bool isLoggedInUser() {
    return ProfileSingleton.profileSingleton.isLoggedIn;
  }

  void _sendFeedbackEvent(
    ClickEvents event, {
    String? errorCode,
    String? errorText,
  }) {
    ///GA event feedback submit
    final map = GaEvent.getInstance().parameterMap;
    map['type'] =
        feedbackFormBuilder?.feedBackForm.selectOption.controller.text ?? '';
    map['flight_number'] =
        feedbackFormBuilder?.feedBackForm.flightNumber.controller.text ?? '';
    map['departure_date'] = dateValue.isNotEmpty
        ? FlightUtils.eventDateYYYYMMDDFormat(
            dateValue,
            Constant.dateFormat5,
            Constant.dateFormat21,
          )
        : '';
    map['description '] = commentController.text;
    map['business_unit '] =
        feedbackFormBuilder?.feedBackForm.selectAirport.controller.text ?? '';

    if (event == ClickEvents.feedback_submit_fail) {
      map['errorCode '] = errorCode = '';
      map['errorText '] = errorText = '';
    }
    event.logEvent(parameters: map);
  }

  /// this method will request for send feedback to server
  void _sendFeedback({required BuildContext context}) {
    _sendFeedbackEvent(ClickEvents.feedback_submit);
    sendFeedback(context: context);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// this method will call when submit button is clicked
  void navigateToFeedback({required BuildContext context}) {
    if (isLoggedInUser()) {
      _sendFeedback(context: context);
    } else {
      feedbackResponseState = ADResponseState.loading();
      notifyListeners();
      final SendOtpRequest request = SendOtpRequest(
        feedbackFormBuilder?.feedBackForm.contactNumber.controller.text ?? '',
        feedbackFormBuilder?.feedBackForm.countryCode.controller.text ?? '',
      );
      _feedbackRepository
          .sendOtp(
        sendOtpRequest: request,
      )
          .then((value) {
        if (value.viewStatus == Status.complete) {
          String sourceId = '';
          if (value.header != null) {
            final List<String> source = value.header?['source'] ?? [];
            if (source.isNotEmpty) {
              sourceId = source.first;
            }
          }
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            sendOtp,
            argumentObject: LoginModelUtils(
              countryCode: feedbackFormBuilder
                      ?.feedBackForm.countryCode.controller.text ??
                  '',
              mobileNumber: feedbackFormBuilder
                      ?.feedBackForm.contactNumber.controller.text ??
                  '',
              isOtpViaWhatsAppEnabled: true,
              signInStatusModel: SignInStatusModel(
                isLoginStatusTap: (value) => _sendFeedback(context: context),
                currentRouteName: customerFeedback,
                isNotFromSplash: true,
              ),
              sourceId: sourceId,
            ),
          );
          feedbackResponseState = value;
          notifyListeners();
        } else {
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.bottomSheet,
            message: value.message,
          );
        }
      });
    }
  }

  void showToastMessage(BuildContext context, String msg) {
    SnackBarUtil.showSnackBar(
      context,
      msg,
    );
  }

  /// this method will call date button when clicked
  Future<void> pickUpDate(BuildContext context) async {
    final selectedDate = await _selectDate(
      context,
      initialDate: DateTime.tryParse(
        MyProfileUtils.convertToParsableDateFormat(
          feedbackFormBuilder?.feedBackForm.flightDate.controller.text ?? '',
        ),
      ),
    );
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      if (feedbackFormBuilder?.feedBackForm.flightDate.controller != null) {
        final date = '$day/$month/${selectedDate.year}';
        feedbackFormBuilder?.feedBackForm.flightDate.controller.text = date;
        dateValue = DateFormat('dd-MM-yyyy').format(selectedDate);
      }
      // final String date = DateFormat('EE, dd MMM').format(selectedDate);
      // feedbackFormBuilder?.feedBackForm.flightDate.controller.text = date;
      // dateValue = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  ///this method will call select date picker
  /// this is use for select date of calender
  Future<DateTime?> _selectDate(
    BuildContext context, {
    DateTime? initialDate,
  }) =>
      showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: ADColors.black,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
            ),
            child: child ?? const Text(''),
          );
        },
        initialDate:
            initialDate ?? DateTime.now().add(const Duration(seconds: 1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

  /// this method will show thank you screen
  Future<void> showFeedbackSubmittedBottomSheet(
    BuildContext context,
  ) async {
    await adShowBottomSheetOutSideClickNotFinish(
      context: context,
      childWidget: ThankYouScreen(
        done: () => {},
        feedbackStateManagement: this,
        postTypeValue:
            feedbackFormBuilder?.feedBackForm.selectOption.controller.text ??
                '',
        incidentNo: incidentNo,
      ),
      headerTitle: '',
      isPaddingRequired: false,
    ).then((value) => navigatorPopScreen(context));
  }
}
