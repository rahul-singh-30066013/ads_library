/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/product_detail_duty_free_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/timer_count_down.dart';
import 'package:adani_airport_mobile/modules/more/models/response/verify_email_otp_response.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/profile_otp_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/profile_otp_state.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class VerifyProfileTemplate extends StatefulWidget {
  const VerifyProfileTemplate({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.otpTo,
    required this.arguments,
    this.fromChangeScreen,
    required this.verifyEmailCallBack,
    this.sourceId,
    this.fromBottomSheet,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final OtpTo otpTo;
  final bool? fromChangeScreen;
  final List<String> arguments;
  final ADTapCallbackWithValue verifyEmailCallBack;
  final String? sourceId;
  final bool? fromBottomSheet;

  @override
  State<VerifyProfileTemplate> createState() => _VerifyProfileTemplateState();
}

class _VerifyProfileTemplateState extends State<VerifyProfileTemplate>
    with TickerProviderStateMixin {
  ///*[otpState] used to manage the state.
  ProfileOtpState otpState = ProfileOtpState();

  ///*[controller] used to animate the clock.
  AnimationController? controller;

  List<TextEditingController> listTextEdit = [];

  final List<FocusNode> listFocusNode = [];

  ///*[_levelClock] used to identify the time.
  static const _levelClock = 30;

  ///*[otpTextFieldCount] used to show the number of otp box.
  int otpTextFieldCount = 6;

  final double _heightOfSubmitButton = 54.sp;

  @override
  void initState() {
    super.initState();
    // if (widget.otpTo == OtpTo.email) {
    //   _emailOtpApiCall(widget.arguments.first);
    // } else {
    //   //TODO:Implemnt logic for sending otp to mobile
    // }
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: _levelClock,
      ),
    );
    controller?.forward().whenComplete(updateResendOTPButton);
    otpState.sourceId = widget.sourceId ?? '';
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => navigatorPopScreen(context),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
            size: context.k_20,
          ),
        ).paddingBySide(
          left: context.k_10,
          right: context.k_10,
        ),
        elevation: 0,
      ),
      body: ADSelectorStateLessWidget(
        viewModel: otpState,
        child: Consumer<ProfileOtpState>(
          builder: (BuildContext context, value, Widget? child) =>
              AbsorbPointer(
            absorbing: value.apiState.viewStatus == Status.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: ADTextStyle700.size32.setTextColor(
                    context.adColors.black,
                  ),
                ),
                SizedBox(
                  height: context.k_10,
                ),
                Row(
                  children: [
                    Text(
                      'otp_sent_to_space'.localize(context),
                      style: ADTextStyle400.size16.setTextColor(
                        context.adColors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.arguments.first,
                        overflow: TextOverflow.ellipsis,
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                    ),
                    ADSizedBox(
                      width: context.k_6,
                    ),
                    GestureDetector(
                      onTap: () => moveToNavigatePop(),
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
                SizedBox(
                  height: context.k_40,
                ),
                ProfileOtpView(
                  otpTextFieldCount: otpTextFieldCount,
                  otpState: otpState,
                  listTextEdit: listTextEdit,
                  listFocusNode: listFocusNode,
                ),
                SizedBox(
                  height: context.k_40,
                ),
                Selector<ProfileOtpState, bool>(
                  selector: (context, otpModelState) =>
                      otpModelState.isOtpCompleted,
                  builder: (
                    BuildContext context,
                    tripType,
                    Widget? child,
                  ) =>
                      ElevatedButton(
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
                    onPressed: () =>
                        otpState.isOtpCompleted ? onSubmitTap() : null,
                    child: Center(
                      child: value.apiState.viewStatus == Status.loading &&
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
                  ),
                ),
                SizedBox(
                  height: context.k_40,
                ),
                Selector<ProfileOtpState, bool>(
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                        Selector<ProfileOtpState, bool>(
                          selector: (context, state) => state.isResendingOTP,
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
                                          'have_not_receive_an_otp'
                                              .localize(context),
                                          style: ADTextStyle400.size16.copyWith(
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
                                  : Align(
                                      child: Visibility(
                                        visible: otpState.isResendOTPEnabled,
                                        child: Text.rich(
                                          TextSpan(
                                            style: ADTextStyle400.size16,
                                            children: [
                                              WidgetSpan(
                                                child: InkWell(
                                                  child: Text(
                                                    'have_not_receive_an_otp'
                                                        .localize(context),
                                                    style: ADTextStyle400.size16
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
                                                text:
                                                    'resend'.localize(context),
                                                style: ADTextStyle400.size16
                                                    .copyWith(
                                                  color: context.adColors.black,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        otpState
                                                          ..isOtpCompleted =
                                                              false
                                                          ..notifyListeners();
                                                        if (otpState
                                                            .isResendOTPEnabled) {
                                                          if (widget.otpTo ==
                                                              OtpTo.email) {
                                                            _emailOtpApiCall(
                                                              widget.arguments
                                                                  .first,
                                                            );
                                                          } else {
                                                            //TODO: Implement send otp to mobile
                                                          }
                                                        }
                                                        Future.delayed(
                                                          const Duration(
                                                            microseconds: 150,
                                                          ),
                                                          updateOtpView,
                                                        );
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        ),
      ),
    );
  }

  void moveToNavigatePop() {
    ClickEvents.edit_email.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: 'otp_page',
      },
    );
    navigatorPopScreen(context);
  }

  void updateOtpView() {
    for (final textController in listTextEdit) {
      textController.text = '';
    }
    listTextEdit.first.clear();
    listFocusNode.first.requestFocus();
  }

  void updateResendOTPButton() {
    otpState.updateResendOTPButton(isResend: true);
  }

  void onSubmitTap() {
    ClickEvents.otp_verification_submit.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: (widget.fromChangeScreen ?? false)
            ? 'email_change'
            : 'email_verify',
      },
    );
    if (widget.otpTo == OtpTo.email) {
      otpState
          .validateEmailOTP(
        otp: otpState.otpStr,
        source: otpState.sourceId,
        referCode: '',
      )
          .then((value) {
        if (value.viewStatus == Status.complete) {
          final VerifyEmailOtpResponse verifyEmailOtpResponse = value.data;
          widget.verifyEmailCallBack.call(widget.arguments.first);
          if(!(widget.fromBottomSheet ?? false)){
            navigatorPopScreenUntil(context, ModalRoute.withName(updateProfile));
          }else{
            navigatorPopScreenUntil(context, ModalRoute.withName(tabRoute));
          }
          // getView(
          //   context: context,
          //   dialogEnm: DialogTypeEnm.bottomSheet,
          //   message: verifyEmailOtpResponse.successMessage,
          //   backgroundColor: context.adColors.black,
          // );
          showToast(
            context,
            context.adColors.black,
            '',
            Text(
              verifyEmailOtpResponse.successMessage ?? '',
              style: ADTextStyle600.size14.copyWith(color: ADColors.white),
            ),
          );
          ClickEvents.otp_verification_success.logEvent(
            parameters: {
              Parameters.category.name: 'profile',
              Parameters.sub_category.name: 'email_verify',
              Parameters.type.name: (widget.fromChangeScreen ?? false)
                  ? 'email_change'
                  : 'email_verify',
            },
          );
          ClickEvents.verify_email_success.logEvent(
            parameters: {
              Parameters.category.name: 'profile',
              Parameters.sub_category.name: 'email_verify',
              Parameters.type.name: (widget.fromChangeScreen ?? false)
                  ? 'email_change'
                  : 'email_verify',
            },
          );
          ClickEvents.email_change_success.logEvent(
            parameters: {
              Parameters.category.name: 'profile',
              Parameters.sub_category.name: 'email_verify',
              Parameters.type.name: (widget.fromChangeScreen ?? false)
                  ? 'email_change'
                  : 'email_verify',
            },
          );
          //TODO
        } else {
          showToast(
            context,
            context.adColors.black,
            '',
            Text(
              value.message ?? '',
              style: ADTextStyle600.size14.copyWith(color: ADColors.white),
            ),
          );
          ClickEvents.otp_verification_fail.logEvent(
            parameters: {
              Parameters.category.name: 'profile',
              Parameters.sub_category.name: 'email_verify',
              Parameters.type.name: (widget.fromChangeScreen ?? false)
                  ? 'email_change'
                  : 'email_verify',
              Parameters.error_text.name: value.message,
            },
          );
        }
      });
    } else {
      ///TODO: Implementation of mobile number otp validation
    }
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

  //to send otp on email
  void _emailOtpApiCall(String email) {
    ClickEvents.otp_resend.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: (widget.fromChangeScreen ?? false)
            ? 'email_change'
            : 'email_verify',
      },
    );
    final SendEmailOtpRequest request = SendEmailOtpRequest(
      email.trim(),
    );
    otpState.notifyListeners();
    otpState
        .sendEmailOtp(
      sendEmailOtpRequest: request,
    )
        .then((value) {
      otpState.isResendingOTP = false;
      if (value.viewStatus == Status.complete) {
        otpState.apiState.viewStatus = Status.complete;
        if (value.header != null) {
          final List<String> source = value.header?['source'] ?? [];
          if (source.isNotEmpty) {
            otpState.sourceId = source.first;
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
        ClickEvents.submit_email_success.logEvent(
          parameters: {
            Parameters.category.name: 'profile',
            Parameters.sub_category.name: 'email_verify',
            Parameters.type.name: (widget.fromChangeScreen ?? false)
                ? 'email_change'
                : 'email_verify',
          },
        );
      } else {
        adLog('errors ${value.message}');
        showToast(
          context,
          context.adColors.black,
          '',
          Text(
            value.message ?? '',
            style: ADTextStyle600.size14.copyWith(color: ADColors.white),
          ),
        );
        otpState.moreOptionResendState.viewStatus = Status.none;
        otpState.apiState.viewStatus = Status.none;
        otpState.notifyListeners();
        ClickEvents.submit_email_fail.logEvent(
          parameters: {
            Parameters.category.name: 'profile',
            Parameters.sub_category.name: 'email_verify',
            Parameters.type.name: (widget.fromChangeScreen ?? false)
                ? 'email_change'
                : 'email_verify',
            Parameters.error_text.name: value.message,
          },
        );
      }
    });
  }
}

enum OtpTo { email, mobile }
