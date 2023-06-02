/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/duty_free_confirmation_order.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/login_automation_keys.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_codes/country_codes_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/country_code_state.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/response/send_otp_response.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/terms_and_policy_section.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/session/state_management/otp_state.dart';
import 'package:adani_airport_mobile/modules/session/state_management/sign_in_state.dart';
import 'package:adani_airport_mobile/modules/session/utils/enums/login_skip_type.dart';
import 'package:adani_airport_mobile/modules/session/utils/login_model_utils.dart';
import 'package:adani_airport_mobile/modules/train/ga_analytics/train_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart'
    as routes;
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Login/ SignIn Statefull widget
class SignInScreen extends StatefulWidget {
  final SignInStatusModel? signInStatusModel;

  const SignInScreen({
    Key? key,
    this.signInStatusModel,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

double _bottomButtonWidth = 230.sp;

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  String selectedCountryCode = 'IN';
  CountryCodeData? countryCodeData;

  final SignInState _signInState = SignInState();

  // Constants
  final double _heightOfSubmitButton = 54.sp;
  final double _paddingFortopOfTextFeild = 52.sp;
  static const double opacityOfPage = 1;

  bool otpViaWhatsAppEnabled = true;
  bool hasFocus = true;

  /// this is use for default value of flag
  ValueNotifier<String> flag = ValueNotifier(
    ProfileSingleton.profileSingleton.countryCodeData.flag ?? '',
  );

  final double adaniIconHeight = 62.5.sp;
  final double adaniIconWidth = 50.sp;

  int indianTextLength = 10;
  int otherTextLength = 13;
  int mobileTextLength = 15;
  String? error;

  // adding notifier to notify the change in header opacity
  final ValueNotifier<bool> _isSubmitButtonActive = ValueNotifier(true);
  CountryCodeState codeState = CountryCodeState();
  List<CountryCodesList>? countryCodesList;
  final ValueNotifier<bool> isPhoneNumberValid = ValueNotifier(true);

  /// this is use for set flag according to login
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCodeController.text = '+91';
    codeState.getCountryCodesfromJSON().then((value) {
      final CountryCodesResponseModel countryCodesResponseModel = value;
      countryCodesList = countryCodesResponseModel.data;
    });
    Validations.isPhoneNumberValid = false;
    ScreenEvents.login_screen.log();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isSubmitButtonActive.dispose();
    mobileNumberController.dispose();
    flag.dispose();
  }

  /// refresh and validating
  void refreshAndValidate(isValidate) {
    adLog('$isValidate');
    isPhoneNumberValid.value = true;
    setState(() {
      error = '';
    });
  }

  void submitButtonAction() {
    if (Validations.isPhoneNumberValid) {
      FocusScope.of(context).unfocus();
      _sendOtpApiCall(
        mobileNumber: mobileNumberController.text,
        countryCode: countryCodeController.text,
      );

      if (widget.signInStatusModel?.lob == trainBooking) {
        TrainBookingGaAnalytics().signInAnalyticsData();
      } else if (widget.signInStatusModel?.lob == CabConstants.cabBooking) {
        CabGoogleAnalytics().signInAnalyticsData();
      } else {
        FlightBookingGaAnalytics().signInAnalyticsData(
          categoryName: widget.signInStatusModel?.currentRouteName ==
                      routes.genericCartScreen &&
                  context.read<AppSessionState>().cartType == CartType.dutyFree
              ? 'duty_free'
              : null,
        );
      }

      hasFocus = false;
      error = '';
    } else {
      setState(() {
        isPhoneNumberValid.value = Validations.isPhoneNumberValid;
        error = 'please_enter_valid_phone'.localize(context);
      });
    }
  }

  void _sendOtpApiCall({
    required String mobileNumber,
    required String countryCode,
  }) {
    final SendOtpRequest request = SendOtpRequest(
      mobileNumber.trim(),
      countryCode,
      isWhatsapp:
          context.read<AppSessionState>().sendOtpTo == OtpType.whatsApp &&
              otpViaWhatsAppEnabled,
    );
    _signInState
        .sendOtp(
      sendOtpRequest: request,
    )
        .then((value) {
      _signInState.notify(absorbingValue: false);
      if (value.viewStatus == Status.complete) {
        String sourceId = '';
        final SendOtpResponse sendOtpResponse = value.data;
        adLog(sendOtpResponse.phoneNumber);

        if (value.header != null) {
          final List<String> source = value.header?['source'] ?? [];
          if (source.isNotEmpty) {
            sourceId = source.first;
          }
        }
        Navigator.pushNamed(
          context,
          otp,
          // Your arguments
          arguments: LoginModelUtils(
            countryCode: countryCodeController.text,
            mobileNumber: mobileNumber,
            isOtpViaWhatsAppEnabled: otpViaWhatsAppEnabled,
            signInStatusModel: widget.signInStatusModel,
            countryCodeData: countryCodeData ?? CountryCodeData.defaultValue(),
            sourceId: sourceId,
            referCode: DeepLinkManager.referCode,
          ),
        ).then((value) {
          setState(() {
            hasFocus = true;
          });
        });
      } else {
        if (value.errorCode == 'IDTOTP06') {
          getUserRestrictionSheet();
        } else {
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.bottomSheet,
            message: value.message,
          );
        }
      }
    });
  }

  /// displayed for error when user is not allowed to access login in production
  Future<void> getUserRestrictionSheet() {
    final double gifHeight = 140.sp;
    return showModalBottomSheet<void>(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            context.k_22,
          ),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.k_10,
                bottom: context.k_20,
              ),
              child: ADBottomSheetDragBar(
                height: context.k_4,
                width: context.k_40,
              ),
            ),
            Image.asset(
              'lib/assets/gif/unlock.gif',
              height: gifHeight,
            ),
            ADSizedBox(
              height: context.k_12,
            ),
            Text(
              'Unlocking for you soon!',
              style: ADTextStyle700.size20
                  .setTextColor(context.adColors.blackTextColor),
            ).paddingBySide(
              top: context.k_6,
              bottom: context.k_20,
            ),
            Text(
              'IDTOTP06'.localize(context),
              style: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
              textAlign: TextAlign.center,
            ).paddingBySide(left: context.k_16, right: context.k_16),
            ADSizedBox(
              height: context.k_38,
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(
                  context.adColors.blackTextColor,
                ),
                overlayColor: MaterialStateProperty.all(
                  context.adColors.blackShade400,
                ),
                enableFeedback: true,
                minimumSize: MaterialStateProperty.all(
                  Size(
                    _bottomButtonWidth,
                    buttonHeight,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(),
                    borderRadius: BorderRadius.circular(context.k_48),
                  ),
                ),
              ),
              onPressed: () => navigatorPopScreen(context),
              child: Text(
                'OK',
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
              ),
            ),
            ADSizedBox(
              height: context.k_28,
            ),
          ],
        );
      },
    );
  }

  void forgotButtonAction() {
    ///TODO: long functionality
    navigateToScreenUsingNamedRoute(context, signupScreen);
  }

  Future<bool> _willPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    adLog('building signup screen');
    final LoginSkipType loginSkipType =
        widget.signInStatusModel?.loginSkipType ?? LoginSkipType.cross;
    return WillPopScope(
      onWillPop: _willPopScope,
      child: ADSelectorStateLessWidget(
        viewModel: _signInState,
        child: Selector<SignInState, bool>(
          selector: (context, model) => model.absorbing,
          builder: (context, value, child) => value
              ? AbsorbPointer(
                  child: Opacity(
                    opacity: opacityOfPage,
                    child: child,
                  ),
                )
              : child ?? const ADSizedBox(),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: WillPopScope(
              onWillPop: () => willPop(context),
              child: Scaffold(
                backgroundColor: context.adColors.whiteTextColor,
                bottomNavigationBar: SafeArea(
                  child: const TermsAndPolicySection().paddingBySide(
                    bottom: context.k_30,
                    right: context.k_20,
                    left: context.k_20,
                  ),
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ADSizedBox(
                                height: context.k_56,
                              ),
                              SvgPicture.asset(
                                'lib/assets/images/svg/icons/login_adani_logo.svg',
                                height: adaniIconHeight,
                                width: adaniIconWidth,
                              ),
                              ADSizedBox(
                                height: context.k_16,
                              ),
                              Text(
                                'login_or_sign_up'.localize(context),
                                style: ADTextStyle600.size22.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),

                              ADSizedBox(
                                height: _paddingFortopOfTextFeild,
                              ),
                              // editFormOfPhoneNumber(),
                              ValidatedTextField(
                                autoFocusOnly: hasFocus,
                                isFromLogin: true,
                                notifyParent: refreshAndValidate,
                                type: 'mobileNo'.localize(context),
                                hintText: 'mobileNo'.localize(context),
                                formatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'),
                                  ),
                                ],
                                controller: mobileNumberController,
                                textLength: mobileTextLength,
                                keyboardType: TextInputType.number,
                                asyncValidation: Validations.validateMobileLib,
                                isoCode: selectedCountryCode,
                                error: error,
                                key: const Key(
                                  LoginAutomationKeys.mobiledKey,
                                ),
                                prefixWidget: DropDownGeneric(
                                  isForCountyCode: true,
                                  type: 'countryCode'.localize(context),
                                  showDivider: true,
                                  //svgIcon: '',
                                  onTap: () => showBottomSheetDialog(
                                    BottomSheetType.fromCountryCode,
                                  ),
                                  controller: countryCodeController,
                                  prefixIconUrl: flag,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_10,
                              ),
                              if (otpViaWhatsAppEnabled)
                                ValueListenableBuilder(
                                  valueListenable: isPhoneNumberValid,
                                  child: Container(),
                                  builder: (context, bool value, child) =>
                                      Visibility(
                                    child: value
                                        ? Align(
                                            alignment: Alignment.centerLeft,
                                            child: Selector<AppSessionState,
                                                OtpType>(
                                              selector: (_, state) =>
                                                  state.sendOtpTo,
                                              builder:
                                                  (context, sendOtpTo, child) =>
                                                      Text(
                                                sendOtpTo == OtpType.sms ||
                                                        !otpViaWhatsAppEnabled
                                                    ? 'otp_via_sms'
                                                        .localize(context)
                                                    : 'otp_via_whatsapp'
                                                        .localize(context),
                                                style: ADTextStyle400.size14
                                                    .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'please_enter_valid_phone'
                                                  .localize(context),
                                              style: ADTextStyle400.size14
                                                  .setTextColor(
                                                const Color(0xffef645a),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),

                              ADSizedBox(
                                height: context.k_40,
                              ),

                              /// Submit button
                              ValueListenableBuilder(
                                valueListenable: _isSubmitButtonActive,
                                child: Container(),
                                builder: (context, bool value, child) =>
                                    ElevatedButton(
                                  key: const Key(
                                    LoginAutomationKeys.submitKey,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: context.adColors.blueColor,
                                    // elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(context.k_28),
                                    ),
                                    minimumSize: Size(
                                      double.infinity,
                                      _heightOfSubmitButton,
                                    ), //////// HERE
                                  ),
                                  onPressed:
                                      value ? () => submitButtonAction() : null,
                                  child: Selector<SignInState, bool>(
                                    selector: (context, model) =>
                                        model.absorbing,
                                    builder: (context, value, child) => value
                                        ? ADDotProgressView(
                                            color:
                                                context.adColors.whiteTextColor,
                                          )
                                        : Text(
                                            'continue'.localize(context),
                                            style: ADTextStyle700.size18
                                                .setTextColor(
                                              context.adColors.whiteTextColor,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAllSide(context.k_16),
                        ),
                      ),
                      if (loginSkipType != LoginSkipType.none)
                        IconButton(
                          iconSize: context.k_48,
                          visualDensity: VisualDensity.compact,
                          splashRadius: context.k_20,
                          padding: EdgeInsets.zero,
                          onPressed: () => skipLoginProcess(context),
                          icon: SvgPicture.asset(
                            SvgAssets.closeIcon,
                            height: context.k_14,
                            width: context.k_14,
                            color: context.adColors.black,
                          ),
                        ).paddingBySide(left: context.k_4),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> willPop(BuildContext context) async {
    skipLoginProcess(context);
    return false;
  }

  /// this will be return widget of country list and country code list
  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    // productTap(context);
    // return;
    CountryCodeBottomSheet(
      context: context,
      type: type,
      selectedItem: countryCodeController.text.toString(),
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData);
    });
  }

  void productTap(BuildContext context) {
    final Future obj = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DutyFreeConfirmationOrder(
          referenceId: '33',
        ),
      ),
    );

    adLog(obj.toString());
  }

  /* void openCountryCodeBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: ADCountryCodeBottomSheet(
        onTap: (value) => onTapCountryCodeBottomSheet(value),
        countryListCodes: countryCodesList ?? [],
      ),
      headerTitle: 'Country Code',
    );
  }*/

  // void cartListBottomsSheet(
  //   BuildContext context,
  // ) {
  //   BottomSheetUtils.showDraggableBottomSheetDialog(
  //     context,
  //     // ReschedulePage(),
  //     CartDetailsList(
  //       isBottomSheet: false,
  //     ).paddingAllSide(context.k_16),
  //     'Items in your order (6)',
  //   );
  //   adLog('$bottomSheet');
  //
  //   // final bottomSheet = showModalBottomSheet(
  //   //   backgroundColor: context.adColors.transparentColor,
  //   //   context: context,
  //   //   useRootNavigator: true,
  //   //   isScrollControlled: true,
  //   //   isDismissible: true,
  //   //   enableDrag: true,
  //   //   builder: (BuildContext context) {
  //   //     return DraggableScrollableSheet(
  //   //       initialChildSize: 0.95, //set this as you want
  //   //       maxChildSize: 0.95, //set this as you want
  //   //       minChildSize: 0.95, //set this as you want
  //   //       expand: true,
  //   //       builder: (context, scrollController) {
  //   //         return CartDetailsList(
  //   //           isBottomSheet: true,
  //   //         );
  //   //       },
  //   //     );
  //   //   },
  //   // );
  // }

  void onTapCountryCodeBottomSheet(CountryCodeData value2) {
    // CountryCodesList value2 = value;
    if (countryCodeController.text != value2.callingCode) {
      mobileNumberController.text = '';
    }
    countryCodeController.text = value2.callingCode.validateWithDefaultValue();

    /// this is comment for only parnaam
    // otpViaWhatsAppEnabled =
    //     value2.callingCode.validateWithDefaultValue() != '+86';
    flag.value = value2.flag.validateWithDefaultValue();
    selectedCountryCode = value2.countryCode ?? 'IN';
    // setState(() {
    //   try {
    //     mobileTextLength = int.parse(value2.max ?? '13');
    //     selectedCountryCode = value2.countryCode ?? 'IN';
    //   } catch (e) {
    //     mobileTextLength = int.parse('10');
    //     selectedCountryCode = 'IN';
    //   }
    // });
    countryCodeData = value2;
  }

//to skip login process, save login status false and user id ='GuestUser'
  void skipLoginProcess(BuildContext context) {
    DeepLinkManager.referCode = '';
    if (widget.signInStatusModel?.isNotFromSplash ?? false) {
      navigatorPopScreen(context);
      widget.signInStatusModel?.isLoginStatusTap(false);
    } else {
      navigateUsingPushNamedAndRemoveUntil(
        context,
        tabRoute,
        (Route<dynamic> route) => false,
      );
    }
  }
}
