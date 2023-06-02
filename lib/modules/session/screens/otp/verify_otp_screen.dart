/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/product_detail_duty_free_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/timer_count_down.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/loyalty_diaglog_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/screens/otp/otp_view.dart';
import 'package:adani_airport_mobile/modules/session/screens/otp/view/more_option.dart';
import 'package:adani_airport_mobile/modules/session/state_management/otp_state.dart';
import 'package:adani_airport_mobile/modules/session/utils/login_model_utils.dart';
import 'package:adani_airport_mobile/modules/train/ga_analytics/train_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart'
    as routes;
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// used to avoid the magic number error
const six = 6;

/// this class is use for verify otp
class VerifyOTPScreen extends StatefulWidget {
  final LoginModelUtils? loginModelUtils;
  final bool isSendRequired;

  const VerifyOTPScreen({
    Key? key,
    this.loginModelUtils,
    this.isSendRequired = false,
  }) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen>
    with TickerProviderStateMixin {
  ///*[otpState] used to manage the state.
  OtpState otpState = OtpState();

  ///*[controller] used to animate the clock.
  AnimationController? controller;

  List<TextEditingController> listTextEdit = [];

  final List<FocusNode> listFocusNode = [];

  ///*[_levelClock] used to identify the time.
  static const _levelClock = 30;

  ///*[otpTextFieldCount] used to show the number of otp box.
  int otpTextFieldCount = 6;
  final double _heightOfSubmitButton = 54.sp;

  AppSessionState? appSessionState;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: _levelClock,
      ),
    );
    appSessionState = context.read<AppSessionState>();
    if (widget.loginModelUtils?.signInStatusModel?.lob == trainBooking) {
      TrainBookingGaAnalytics().otpSuccessAnalyticsData(
        type: appSessionState?.sendOtpTo.abbr ?? '',
        label: OtpLabel.direct.name,
        signInFromPopup:
            widget.loginModelUtils?.signInStatusModel?.loginFromPopup,
      );
    } else if (widget.loginModelUtils?.signInStatusModel?.lob ==
        CabConstants.cabBooking) {
      CabGoogleAnalytics().otpSuccessAnalyticsData(
        type: appSessionState?.sendOtpTo.abbr ?? '',
        label: OtpLabel.direct.name,
        signInFromPopup:
            widget.loginModelUtils?.signInStatusModel?.loginFromPopup,
      );
    } else {
      FlightBookingGaAnalytics().otpSuccessAnalyticsData(
        type: appSessionState?.sendOtpTo.abbr ?? '',
        label: OtpLabel.direct.name,
        signInFromPopup:
            widget.loginModelUtils?.signInStatusModel?.loginFromPopup,
        categoryName: widget
                        .loginModelUtils?.signInStatusModel?.currentRouteName ==
                    routes.genericCartScreen &&
                context.read<AppSessionState>().cartType == CartType.dutyFree
            ? 'duty_free'
            : null,
      );
    }

    if (widget.isSendRequired) {
      _apiCall(
        widget.loginModelUtils?.mobileNumber ?? '',
        widget.loginModelUtils?.countryCode ?? '',
      );
    }
    otpState.loginModelUtils = widget.loginModelUtils;
    controller?.forward().whenComplete(updateResendOTPButton);
    ScreenEvents.otp_verification.log();
  }

  void updateResendOTPButton() {
    otpState.updateResendOTPButton(isResend: true);
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      backgroundColor: parentContext.adColors.whiteTextColor,
      body: SafeArea(
        child: ADSelectorStateLessWidget(
          viewModel: otpState,
          child: Consumer<OtpState>(
            builder: (BuildContext context, value, Widget? child) {
              return AbsorbPointer(
                absorbing: value.apiState.viewStatus == Status.loading,
                child: SliverAppBarBaseComponent(
                  appBarLeftPadding: 0,
                  isBackCross: false,
                  body: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          children: [
                            Text(
                              'enter_otp_description'.localize(context),
                              style: ADTextStyle400.size16
                                  .setTextColor(context.adColors.black),
                            ),
                            Text(
                              ' ${widget.loginModelUtils?.countryCode} ${widget.loginModelUtils?.mobileNumber}',
                              style: ADTextStyle500.size16
                                  .setTextColor(context.adColors.black),
                            ),
                            ADSizedBox(
                              width: context.k_6,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                'edit_new'.localize(context),
                                style: ADTextStyle500.size16.copyWith(
                                  color: context.adColors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ADSizedBox(
                        height: context.k_40,
                      ),
                      OtpView(
                        otpTextFieldCount: otpTextFieldCount,
                        otpState: otpState,
                        autoDetectOtp: () => onSubmitTap(parentContext),
                        listTextEdit: listTextEdit,
                        listFocusNode: listFocusNode,
                      ),
                      ADSizedBox(
                        height: context.k_40,
                      ),
                      Selector<OtpState, bool>(
                        selector: (context, otpModelState) =>
                            otpModelState.isOtpCompleted,
                        builder: (
                          BuildContext context,
                          tripType,
                          Widget? child,
                        ) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: otpState.isOtpCompleted
                                  ? context.adColors.blueColor
                                  : context.adColors.greyReviewShade,
                              shape: const StadiumBorder(),
                              minimumSize: Size(
                                double.infinity,
                                _heightOfSubmitButton,
                              ),
                            ),
                            onPressed: () => otpState.isOtpCompleted
                                ? onSubmitTap(parentContext)
                                : null,
                            child: Center(
                              child: value.apiState.viewStatus ==
                                          Status.loading &&
                                      !otpState.isResendingOTP
                                  ? ADDotProgressView(
                                      color: context.adColors.whiteTextColor,
                                    )
                                  : Text(
                                      'continue'.localize(context),
                                      style: ADTextStyle700.size18.setTextColor(
                                        context.adColors.whiteTextColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                            ),
                          );
                        },
                      ),
                      ADSizedBox(
                        height: context.k_26,
                      ),
                      Selector<OtpState, bool>(
                        selector: (context, otpModelState) =>
                            otpModelState.isResendOTPEnabled,
                        builder: (
                          BuildContext context,
                          tripType,
                          Widget? child,
                        ) {
                          return Column(
                            children: [
                              Visibility(
                                visible: !otpState.isResendOTPEnabled,
                                child: Wrap(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'you_will_receive_message_within'
                                              .localize(context),
                                          style: ADTextStyle400.size16,
                                        ).paddingAllSide(context.k_4),
                                        TimerCountDown(
                                          animation: StepTween(
                                            begin: _levelClock,
                                            // THIS IS A USER ENTERED NUMBER
                                            end: 0,
                                          ).animate(
                                            controller ??
                                                AnimationController(
                                                  vsync: this,
                                                  duration: const Duration(
                                                    seconds: _levelClock,
                                                  ), // gameData.levelClock is a user entered number elsewhere in the application
                                                ),
                                          ),
                                        ),
                                        Text(
                                          'seconds'.localize(context),
                                          style: ADTextStyle400.size16,
                                        ).paddingAllSide(context.k_4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Selector<OtpState, bool>(
                                selector: (context, state) =>
                                    state.isResendingOTP,
                                builder: (
                                  BuildContext context,
                                  value,
                                  Widget? child,
                                ) =>
                                    value
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'have_not_receive_otp'
                                                    .localize(context),
                                                style: ADTextStyle400.size16
                                                    .copyWith(
                                                  color: context.adColors.black,
                                                ),
                                              ),
                                              Container(
                                                width: k_52.sp,
                                                child: ADDotProgressView(
                                                  size: context.k_4,
                                                  color: context.adColors.black,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Visibility(
                                            visible:
                                                otpState.isResendOTPEnabled,
                                            child: Text.rich(
                                              TextSpan(
                                                style: ADTextStyle400.size16,
                                                children: [
                                                  WidgetSpan(
                                                    child: InkWell(
                                                      child: Text(
                                                        'have_not_receive_otp'
                                                            .localize(context),
                                                        style: ADTextStyle400
                                                            .size16
                                                            .copyWith(
                                                          color: context
                                                              .adColors.black,
                                                        ),
                                                      ),
                                                      onTap: () => {
                                                        if (otpState
                                                            .isResendOTPEnabled)
                                                          {
                                                            otpState
                                                                .updateResendOTPButton(
                                                              isResend: false,
                                                            ),
                                                            controller?.reset(),
                                                            controller
                                                                ?.forward()
                                                                .whenComplete(
                                                                  updateResendOTPButton,
                                                                ),
                                                          },
                                                      },
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'resend'
                                                        .localize(context),
                                                    style: ADTextStyle400.size16
                                                        .copyWith(
                                                      color: context
                                                          .adColors.black,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            otpState
                                                              ..isOtpCompleted =
                                                                  false
                                                              ..notifyListeners();
                                                            FlightBookingGaAnalytics()
                                                                .resendOtpAnalyticsData(
                                                              signInFromPopup: widget
                                                                  .loginModelUtils
                                                                  ?.signInStatusModel
                                                                  ?.loginFromPopup,
                                                              categoryName: widget
                                                                              .loginModelUtils
                                                                              ?.signInStatusModel
                                                                              ?.currentRouteName ==
                                                                          routes
                                                                              .genericCartScreen &&
                                                                      context.read<AppSessionState>().cartType ==
                                                                          CartType
                                                                              .dutyFree
                                                                  ? 'duty_free'
                                                                  : null,
                                                            );
                                                            if (otpState
                                                                .isResendOTPEnabled) {
                                                              _apiCall(
                                                                widget.loginModelUtils
                                                                        ?.mobileNumber ??
                                                                    '',
                                                                widget.loginModelUtils
                                                                        ?.countryCode ??
                                                                    '',
                                                                isResent: true,
                                                              );
                                                            }
                                                            Future.delayed(
                                                              const Duration(
                                                                microseconds:
                                                                    150,
                                                              ),
                                                              updateOtpView,
                                                            );
                                                          },
                                                  ),
                                                  if (widget.loginModelUtils
                                                          ?.isOtpViaWhatsAppEnabled ??
                                                      false)
                                                    TextSpan(
                                                      text: 'or'
                                                          .localize(context),
                                                      style: ADTextStyle400
                                                          .size16
                                                          .copyWith(
                                                        color: context
                                                            .adColors.black,
                                                      ),
                                                    ),
                                                  if (widget.loginModelUtils
                                                          ?.isOtpViaWhatsAppEnabled ??
                                                      false)
                                                    WidgetSpan(
                                                      child: InkWell(
                                                        child: Text(
                                                          'more_options'
                                                              .localize(
                                                            context,
                                                          ),
                                                          style: ADTextStyle400
                                                              .size16
                                                              .copyWith(
                                                            color: context
                                                                .adColors.black,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        ),
                                                        onTap: () => moreDialog(
                                                          context:
                                                              parentContext,
                                                          countryCode: widget
                                                                  .loginModelUtils
                                                                  ?.countryCode ??
                                                              '',
                                                          mobileNumber: widget
                                                                  .loginModelUtils
                                                                  ?.mobileNumber ??
                                                              '',
                                                          otpState: otpState,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ).paddingAllSide(parentContext.k_14),
                  title: 'enter_otp'.localize(parentContext),
                  titleTextStyle: ADTextStyle700.size32.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  leadingTitleTextStyle: ADTextStyle700.size22
                      .setTextColor(context.adColors.blackTextColor),
                  flexibleTitleTopPadding: parentContext.k_8,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void updateOtpView() {
    for (final textController in listTextEdit) {
      textController.text = '';
    }
    listTextEdit.first.clear();
    listFocusNode.first.requestFocus();
  }

  void onSubmitTap(BuildContext parentContext) {
    otpState
        .validateOTP(
      context: parentContext,
      source: widget.loginModelUtils?.sourceId ?? '',
      mobileNumber: widget.loginModelUtils?.mobileNumber ?? '',
      referCode: widget.loginModelUtils?.referCode,
      countryCodeData: widget.loginModelUtils?.countryCodeData ??
          CountryCodeData.defaultValue(),
    )
        .then((isLoggedIn) {
      adLog('isLoggedIn $isLoggedIn');
      if (isLoggedIn) {
        appSessionState?.updateIsLoggedIn(
          loginStatus: true,
        );
        if ((OfferBannerRemote().offerBannerRemoteModel?.isPopUpEnabled ??
                false) &&
            (widget.loginModelUtils?.signInStatusModel?.loginFromPopup ??
                false)) {
          final data = NetworkAssetBundle(
            Uri.parse(
              OfferBannerRemote()
                      .offerBannerRemoteModel
                      ?.widgetItem
                      ?.imageSrc ??
                  '',
            ),
          ).load('').then(
                (imageUrlInByte) => {
                  LoyaltyDiaglogScreen.saveCurrentDateTime(),
                  LoyaltyDiaglogScreen.showOfferBannerDialog1(
                    context,
                    imageUrlInByte,
                  ),
                  navigate(),
                },
              );
          adLog('message $data');
        } else {
          navigate();
        }
      }
    });
  }

  void navigate() {
    if (widget.loginModelUtils?.signInStatusModel?.isNotFromSplash ?? false) {
      navigatorPopScreenUntil(
        context,
        ModalRoute.withName(
          widget.loginModelUtils?.signInStatusModel?.currentRouteName ??
              tabRoute,
        ),
      );
      widget.loginModelUtils?.signInStatusModel?.isLoginStatusTap(true);
    } else {
      navigateUsingPushNamedAndRemoveUntil(
        context,
        selectedAirportsData != null ? tabRoute : airportsLandingScreen,
        (Route<dynamic> route) => false,
      );
    }
  }

  void moreDialog({
    required BuildContext context,
    required String countryCode,
    required String mobileNumber,
    required OtpState otpState,
  }) {
    FlightBookingGaAnalytics().moreOptionsAnalyticsData(
      otpState.wasOtpResent ? OtpLabel.resend.name : OtpLabel.direct.name,
      signInFromPopup:
          widget.loginModelUtils?.signInStatusModel?.loginFromPopup,
    );
    adShowBottomSheetWithWrap(
      context: context,
      childWidget: MoreOption(
        resendOtpCallBack: (mobileNumber, countryCode, otpType) =>
            _bottomSheetCallback(
          mobileNumber,
          countryCode,
          otpType,
        ),
        countryCode: countryCode,
        mobileNumber: mobileNumber,
        otpState: otpState,
        otpType: appSessionState?.sendOtpTo ?? OtpType.sms,
      ),
      headerTitle: 'more_options'.localize(context),
    );
  }

  void _bottomSheetCallback(
    String mobileNumber,
    String countryCode,
    OtpType otpType,
  ) {
    appSessionState?.setValueForOtp(otpType);
    _apiCall(mobileNumber, countryCode, isResent: true);
  }

  void _apiCall(
    String mobileNumber,
    String countryCode, {
    bool isResent = false,
  }) {
    otpState.wasOtpResent = isResent;
    final SendOtpRequest request = SendOtpRequest(
      mobileNumber.trim(),
      countryCode,
      isWhatsapp:
          ((appSessionState?.sendOtpTo) ?? OtpType.sms) == OtpType.whatsApp,
    );
    otpState.notifyListeners();
    otpState
        .sendOtp(
      sendOtpRequest: request,
    )
        .then((value) {
      otpState.isResendingOTP = false;
      adLog('testing');
      if (value.viewStatus == Status.complete) {
        FlightBookingGaAnalytics().otpSuccessAnalyticsData(
          type: appSessionState?.sendOtpTo.abbr ?? '',
          label: isResent ? OtpLabel.resend.name : OtpLabel.direct.name,
          signInFromPopup:
              widget.loginModelUtils?.signInStatusModel?.loginFromPopup,
          categoryName: widget.loginModelUtils?.signInStatusModel
                          ?.currentRouteName ==
                      routes.genericCartScreen &&
                  context.read<AppSessionState>().cartType == CartType.dutyFree
              ? 'duty_free'
              : null,
        );
        otpState.apiState.viewStatus = Status.complete;
        otpState.moreOptionResendState.viewStatus = Status.complete;
        if (value.header != null) {
          final List<String> source = value.header?['source'] ?? [];
          if (source.isNotEmpty) {
            widget.loginModelUtils?.sourceId = source.first;
            adLog(source.first);
          }
        }
        otpState.updateResendOTPButton(
          isResend: false,
        );
        controller?.reset();
        controller?.forward().whenComplete(
              updateResendOTPButton,
            );
        if (!widget.isSendRequired) {
          SnackBarUtil.showSnackBar(
            context,
            'we_have_resend_otp'.localize(context),
          );
        }
      } else {
        adLog('errors ${value.message}');
        SnackBarUtil.showSnackBar(
          context,
          value.message ?? 'ADLEX01'.localize(context),
        );
        otpState.moreOptionResendState.viewStatus = Status.none;
        otpState.apiState.viewStatus = Status.none;
        otpState.notifyListeners();
      }
    });
  }
}
