/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/cabs_not_found_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/booking_confirmation.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/transaction_failed.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/views/fare_update_popup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/jus_pay/payment_sdk_manager.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/payment_info/payload_information.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/check_out_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/pay_now_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/payment_confirm_request/payment_confirm_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/payment_confirm_request/placement_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/check_out_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/pay_now_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/payment_confirm_response/placement_response.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/incorrect_card_details.dart';
import 'package:adani_airport_mobile/modules/payment/screens/generic_payment_screen.dart';
import 'package:adani_airport_mobile/modules/payment/screens/please_wait_payment_popup.dart';
import 'package:adani_airport_mobile/modules/payment/screens/something_wrong.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/checkout_error_code.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/jwt_token_decoder.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

String paymentType = '';
String paymentProvider = '';

const placeValue = 2;
bool isCouponRemovedFromBackend = false;
String userId = '';

class PaymentBottomNavigationButton extends StatelessWidget {
  final double totalAmount;
  final double rewardPoint;
  final double? discountAmount;
  final PaymentMethodState paymentMethodViewModel;
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  final List<FlightReviewDetailInfo>? flightReviewDetailInfo;
  final GlobalKey<ShakeWidgetState>? shakeKey;
  final GlobalKey<FormState> globalKey;
  final GlobalKey<FormState> keyForUpi;
  final ScrollController controllerAll;
  final GlobalKey? globalKeyForFocus;
  final GlobalKey? globalKeyForUpiFocus;
  final String couponCode;
  final double? excludedAmount;

  const PaymentBottomNavigationButton({
    Key? key,
    required this.totalAmount,
    required this.paymentMethodViewModel,
    required this.shakeKey,
    required this.globalKey,
    required this.keyForUpi,
    this.flightViewItineraryResponseModel,
    required this.rewardPoint,
    required this.controllerAll,
    this.flightReviewDetailInfo,
    this.globalKeyForFocus,
    this.globalKeyForUpiFocus,
    required this.couponCode,
    required this.discountAmount,
    this.excludedAmount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double payNowButtonHeight = 52.sp;
    final double payNowButtonWidth = 172.sp;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: context.adColors.paleGrey,
          ),
          StickyPriceBar(
            price: FlightUtils.getPriceFormatWithSymbol(
              price: totalAmount < 1 ? 0 : totalAmount,
            ),
            onSubtitleTap: () => scrollToDown(controllerAll),
            customButton: ADSizedBox(
              width: payNowButtonWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.adColors.blueColor,
                  minimumSize: Size(
                    payNowButtonWidth,
                    payNowButtonHeight,
                  ),
                  shape: const StadiumBorder(),
                ),
                onPressed: () =>
                    paymentMethodViewModel.paymentResponseState.viewStatus ==
                            Status.loading
                        ? adLog('disabled')
                        : validatePayment(context),
                child: paymentMethodViewModel.paymentResponseState.viewStatus ==
                        Status.loading
                    ? ADDotProgressView(
                        color: context.adColors.whiteTextColor,
                      )
                    : Text(
                        'pay_now'.localize(context),
                        style: ADTextStyle700.size16.setTextColor(
                          context.adColors.whiteTextColor,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void scrollToDown(ScrollController controllerAll) {
    if (controllerAll.position.pixels ==
        controllerAll.position.maxScrollExtent) {
      shakeKey?.currentState?.shake();
    } else {
      controllerAll.animateTo(
        controllerAll.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void scrollToTop(ScrollController controllerAll) {
    controllerAll.animateTo(
      controllerAll.position.minScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
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
      margin: EdgeInsets.all(context.k_16),
      backgroundColor: color,
      duration: Duration(seconds: toastDuration ?? 3),
      content: Row(
        children: [
          IconFromAsset(
            iconPath: iconPath,
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

  void validatePayment(BuildContext context) {
    if (paymentMethodViewModel.isRedeemPointsChecked &&
        paymentMethodViewModel.rewardPoint.value >=
            (flightViewItineraryResponseModel?.pricingSummary?.totalFare ??
                paymentMethodViewModel.totalAmount) &&
        (excludedAmount ?? 0) < 1) {
      ///For Full Loyalty Payment
      validatePaymentRequest(context: context);
      if (paymentMethodViewModel.paymentModule == PaymentModule.pranaam ||
          paymentMethodViewModel.paymentModule == PaymentModule.standAlone) {
        PranaamBookingGaAnalytics().ecommerceAddPaymentInfoGaAnalytics(
          ClickEvents.add_payment_info,
          context.read<PranaamAppDataStateManagement>(),
          context.read<PaymentMethodState>(),
          context.read<AppSessionState>(),
        );
      } else {
        /// Other Payment Process like Duty Free and Pranaam
        context.read<DutyFreeState>().dutyFreeEventState.addPaymentInfo(
              context.read<DutyFreeState>(),
              context.read<PaymentMethodState>(),
              context.read<AppSessionState>(),
            );
      }
    } else {
      /// For partial and Payment Method Payment
      paymentMethodViewModel.setExpandableValue(value: false);
      if (paymentMethodViewModel.expendedPaymentMode == null) {
        showToast(
          context,
          ADColors.black,
          SvgAssets.icPaymentValidation,
          Text('please_select_an_option_to_proceed'.localize(context)),
        );
      } else if (paymentMethodViewModel.expendedPaymentMode ==
              PaymentMode.creditordebitcard &&
          globalKey.currentState?.validate() == false) {
        Scrollable.ensureVisible(
          globalKeyForFocus?.currentContext ?? context,
        );
      } else if (paymentMethodViewModel.expendedPaymentMode ==
              PaymentMode.upi &&
          (keyForUpi.currentState?.validate() == false ||
              paymentMethodViewModel.selectedOption == null)) {
        Scrollable.ensureVisible(
          globalKeyForUpiFocus?.currentContext ?? context,
        );
      } else if (paymentMethodViewModel.selectedOption?.mode ==
          PaymentMode.creditordebitcard) {
        if (paymentMethodViewModel.cardNumberController.text.isNotEmpty &&
            paymentMethodViewModel.cardOwnerNameController.text.isNotEmpty &&
            paymentMethodViewModel.cardCvvController.text.isNotEmpty &&
            paymentMethodViewModel.cardExpiryMonthController.text.isNotEmpty) {
          validatePaymentRequest(context: context);

          if (paymentMethodViewModel.paymentModule == PaymentModule.pranaam ||
              paymentMethodViewModel.paymentModule ==
                  PaymentModule.standAlone) {
            PranaamBookingGaAnalytics().ecommerceAddPaymentInfoGaAnalytics(
              ClickEvents.add_payment_info,
              context.read<PranaamAppDataStateManagement>(),
              context.read<PaymentMethodState>(),
              context.read<AppSessionState>(),
            );
          } else {
            context.read<DutyFreeState>().dutyFreeEventState.addPaymentInfo(
                  context.read<DutyFreeState>(),
                  context.read<PaymentMethodState>(),
                  context.read<AppSessionState>(),
                );
          }
        }
      } else {
        if (paymentMethodViewModel.selectedOption == null) {
          showToast(
            context,
            ADColors.black,
            SvgAssets.icPaymentValidation,
            Text('please_select_an_option_to_proceed'.localize(context)),
          );
        } else {
          validatePaymentRequest(context: context);
          if (paymentMethodViewModel.paymentModule == PaymentModule.pranaam ||
              paymentMethodViewModel.paymentModule ==
                  PaymentModule.standAlone) {
            PranaamBookingGaAnalytics().ecommerceAddPaymentInfoGaAnalytics(
              ClickEvents.add_payment_info,
              context.read<PranaamAppDataStateManagement>(),
              context.read<PaymentMethodState>(),
              context.read<AppSessionState>(),
            );
          } else if (paymentMethodViewModel.paymentModule ==
              PaymentModule.dutyFree) {
            context.read<DutyFreeState>().dutyFreeEventState.addPaymentInfo(
                  context.read<DutyFreeState>(),
                  context.read<PaymentMethodState>(),
                  context.read<AppSessionState>(),
                );
          }
        }
      }
    }
  }

  void updatePriceDetails(
    BuildContext context,
    String itineraryId,
  ) {
    Navigator.pop(context);
    paymentMethodViewModel.viewItineraryDetails(itineraryId).then((value) {
      paymentMethodViewModel.updateItineraryDetailsState(value);
      updateTotalPriceInCaseOFChange();
      validatePaymentRequest(
        context: context,
        isPriceChanged: true,
      );
    });
  }

  void updateTotalPriceInCaseOFChange() {
    paymentMethodViewModel
      ..totalAmount = paymentMethodViewModel.getAmountPayable(
        paymentMethodViewModel
                .flightViewItineraryResponseModel?.pricedItineraries ??
            [],
      )
      ..totalAmountToDisplayAtBottom = (paymentMethodViewModel
                  .flightViewItineraryResponseModel
                  ?.pricingSummary
                  ?.totalFare ??
              0)
          .toDouble();
  }

  void validatePaymentRequest({
    required BuildContext context,
    bool? isPriceChanged,
  }) {
    if (paymentMethodViewModel.isRedeemPointsChecked &&
        paymentMethodViewModel.rewardPoint.value >=
            (flightViewItineraryResponseModel?.pricingSummary?.totalFare ??
                paymentMethodViewModel.totalAmount) &&
        ((excludedAmount ?? 0) < 1)) {
      checkOutRequest(
        mode: PaymentMode.loyalty,
        context: context,
        isPriceChanged: isPriceChanged ?? false,
      );
    } else {
      checkOutRequest(
        mode: paymentMethodViewModel.selectedOption?.mode ??
            PaymentMode.creditordebitcard,
        context: context,
      );
    }
  }

  ///Checkout request
  Future<void> checkOutRequest({
    required PaymentMode mode,
    required BuildContext context,
    bool isRemoveCoupon = false,
    bool isPriceChanged = false,
  }) async {
    String businessType = '';
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);

    final String jwtToken = accessToken ?? '';
    final Map<String, dynamic>? decodedTokenData =
        JwtTokenDecoder.decode(jwtToken);
    userId = decodedTokenData?['sub'];

    String? expMonth;
    String? expYear;
    if (mode == PaymentMode.wallet) {
      paymentType = 'walletTxn';
      paymentProvider = paymentMethodViewModel.selectedOption?.name ?? '';
    } else if (mode == PaymentMode.netbanking) {
      paymentType = 'nbTxn';
      paymentProvider = paymentMethodViewModel.selectedOption?.name ?? '';
    } else if (mode == PaymentMode.upi) {
      paymentType = 'upiTxn';
      final isPackageAvailable =
          paymentMethodViewModel.selectedOption?.packageName != null &&
              paymentMethodViewModel.selectedOption?.packageName != '';
      if (isPackageAvailable) {
        paymentType = 'UPI_Intent';
      }
      paymentProvider = paymentMethodViewModel.selectedOption?.name ?? '';
    } else if (mode == PaymentMode.creditordebitcard) {
      final cardExp = paymentMethodViewModel.cardExpiryMonthController.text
          .toString()
          .split('/');
      final String calculateExpMonth = cardExp.first.toString();
      final String calculateExpYear = cardExp[1].toString();
      expMonth = calculateExpMonth;
      expYear = '20$calculateExpYear';
      paymentType = 'cardTxn';
      paymentProvider = paymentMethodViewModel.selectedOption?.name ?? '';
    } else if (mode == PaymentMode.loyalty) {
      paymentType = 'Loyalty';
      paymentProvider = paymentMethodViewModel.selectedOption?.name ?? '';
    }

    // GA method calling on pay now submit success
    paymentGAEvents(
      paymentMethodViewModel,
      flightViewItineraryResponseModel,
      flightReviewDetailInfo,
      ClickEvents.book_flight_payment_submit,
      context,
    );
    double loyaltyAmount = paymentMethodViewModel.isRedeemPointsChecked
        ? paymentMethodViewModel.rewardPoint.value
        : 0;
    // adding - full loyalty,coupon amount mismatch
    if (loyaltyAmount > paymentMethodViewModel.totalAmountToDisplayAtBottom) {
      loyaltyAmount =
          paymentMethodViewModel.paymentModule == PaymentModule.cabBooking
              ? paymentMethodViewModel.totalAmountToDisplayAtBottom
              : (excludedAmount ?? 0) > 0
                  ? paymentMethodViewModel.totalAmountToDisplayAtBottom -
                      (excludedAmount ?? 0)
                  : paymentMethodViewModel.totalAmountToDisplayAtBottom;
    }

    if (paymentMethodViewModel.paymentModule == PaymentModule.flight) {
      loyaltyAmount = paymentMethodViewModel.isRedeemPointsChecked
          ? paymentMethodViewModel.calculateLoyaltyAmountToPay(
              paymentMethodViewModel.totalAmountToDisplayAtBottom,
            )
          : 0;
    }

    if (paymentMethodViewModel.paymentModule == PaymentModule.dutyFree ||
        paymentMethodViewModel.paymentModule == PaymentModule.pranaam ||
        paymentMethodViewModel.paymentModule == PaymentModule.standAlone) {
      loyaltyAmount = paymentMethodViewModel.isRedeemPointsChecked
          ? paymentMethodViewModel.rewardPoint.value
          : 0;
      if (loyaltyAmount > paymentMethodViewModel.totalAmount) {
        loyaltyAmount = paymentMethodViewModel.totalAmount;
      }
    }

    double modifyAmount = 0;

    if (mode == PaymentMode.loyalty) {
      modifyAmount = double.parse(
        (loyaltyAmount - loyaltyAmount.floor()).toStringAsFixed(
          placeValue,
        ),
      );
    }
    if (paymentMethodViewModel.paymentModule != null) {
      switch (paymentMethodViewModel.paymentModule) {
        case PaymentModule.dutyFree:
          businessType = businessTypeDutyFree;
          break;
        case PaymentModule.pranaam:
        case PaymentModule.standAlone:
          businessType = businessTypePranaam;
          break;
        case PaymentModule.cabBooking:
          businessType = businessTypeCabBooking;
          break;
        case PaymentModule.flight:
          businessType = businessTypeFlightBooking;
          break;
        default:
      }
    }

    final CheckOutRequest checkOutRequest = CheckOutRequest(
      orderReferenceId: context
              .read<PranaamAppDataStateManagement>()
              .cartDataResponse
              ?.oldBookingReferenceId ??
          '',
      paymentCallbackUrl: 'https://shop.merchant.com/payments/handleResponse',
      businessSubType: businessType,
      itineraryId: flightViewItineraryResponseModel?.itineraryId,
      cardNumber: paymentMethodViewModel.cardNumberController.text == ''
          ? null
          : int.parse(
              paymentMethodViewModel.cardNumberController.text
                  .replaceAll(RegExp(r'\s+\b|\b\s'), ''),
            ),
      loyaltyAmount: loyaltyAmount.floor(),
      paymentMethodType: paymentType == 'nbTxn'
          ? 'NetBanking'
          : paymentType == 'cardTxn'
              ? 'Card'
              : paymentType == 'upiTxn'
                  ? 'UPI'
                  : paymentType == 'UPI_Intent'
                      ? 'UPI_Intent'
                      : paymentType == 'walletTxn'
                          ? 'Wallet'
                          : 'Loyalty',
      channelid: Platform.isAndroid ? 'ANDROID' : 'IOS',
      upi: (paymentType == 'upiTxn' &&
              paymentMethodViewModel.selectedOption?.packageName == null)
          ? paymentMethodViewModel.upiController.text.toString()
          : null,
      isRemoveCoupon: isRemoveCoupon,
      isPriceChanged: isPriceChanged,
    );
    final Map map = (jsonDecode(jsonEncode(checkOutRequest))) as Map
      ..removeWhere((key, value) => key == null || value == null || value == 0);

    final PayloadInformation payloadInformation = PayloadInformation(
      action: paymentType,
      paymentMethod: paymentMethodViewModel.selectedOption?.code,
      cardNumber: paymentMethodViewModel.cardNumberController.text
          .replaceAll(RegExp(r'\s+\b|\b\s'), ''),
      cardExpMonth: expMonth,
      cardExpYear: expYear,
      cardSecurityCode: paymentMethodViewModel.cardCvvController.text,
      saveToLocker: true,
      clientAuthToken: 'tkn_0e37edc631d647fdb606ab48ccfc4213',
      tokenize: true,
      cardNickName: '',
      orderId: '',
      directWalletToken: 'tkn_nvtQf8DP1A2oGoZu',
      custVpa: paymentMethodViewModel.upiController.text.toString(),
      upiSdkPresent: false,
      endUrls: [
        'https:\\/\\/shop\\.merchant\\.com\\/payments\\/handleResponse.*',
      ],
      loyality: loyaltyAmount.floor(),
      packageName: paymentMethodViewModel.selectedOption?.packageName,
      amount: paymentMethodViewModel.paymentModule == PaymentModule.flight
          ? (modifyAmount == 0)
              ? paymentMethodViewModel.getTotalAmount()
              : modifyAmount
          : totalAmount,
    );
    await paymentMethodViewModel
        .checkoutApiCall(
      jsonEncode(map),
      context,
    )
        .then((value) {
      checkOutResponse(value, payloadInformation, context, loyaltyAmount, mode);
      // parsePaymentApi(value, context, mode, loyaltyAmount, payNowRequest);
    });
  }

  void checkOutResponse(
    ADResponseState value,
    PayloadInformation payloadInfo,
    BuildContext context,
    double loyaltyAmount,
    PaymentMode mode,
  ) {
    final ADResponseState responseState = value;
    if (responseState.viewStatus == Status.complete) {
      final CheckOutResponse data = value.data;
      payloadInfo.orderId = data.transactionReferenceId;
      paymentMethodViewModel.statePayloadInfo = payloadInfo;
      if (data.paymentMethodType?.toLowerCase() == 'juspay') {
        processPayment(context);
      } else if (data.paymentMethodType?.toLowerCase() == 'loyalty') {
        placementApi(context);
      } else {
        placementApi(context);
      }
    } else if (responseState.viewStatus == Status.error) {
      paymentMethodViewModel.updatePaymentError(value);
      if (responseState.errorCode ==
              CheckoutErrorCode.fbCheckPriceFailed.name ||
          responseState.errorCode ==
              CheckoutErrorCode.flightBookingNoLongerAvailable.name) {
        fareChangeErrorPopUp(
          context: context,
          onOkPressedCallBack: null,
        );
      } else if (responseState.errorCode ==
          CheckoutErrorCode.fbPriceDecreased.name) {
        fareChangePopUp(
          context: context,
          onOkPressedCallBack: () => updatePriceDetails(
            context,
            flightViewItineraryResponseModel?.itineraryId ?? '',
          ),
          errorDescription: responseState.message ??
              'flight_booking_price_decreased'.localize(context),
          errorHeader: 'fare_decreased'.localize(context),
        );
      } else if (responseState.errorCode ==
          CheckoutErrorCode.fbPriceIncreased.name) {
        fareChangePopUp(
          context: context,
          onOkPressedCallBack: () => updatePriceDetails(
            context,
            flightViewItineraryResponseModel?.itineraryId ?? '',
          ),
          errorDescription: responseState.message ??
              'flight_booking_price_increased'.localize(context),
          errorHeader: 'fare_increased'.localize(context),
        );
      } else if (responseState.errorCode ==
          CheckoutErrorCode.cbUnavailableIntercity.name) {
        _showCabNotFoundBottomSheet(
          context: context,
          imagePath: 'lib/assets/images/cab_booking/no_cab_available.png',
          title: 'cab_not_available_at_this_moment'.localize(context),
          subTitle: '',
        );
      } else if (responseState.errorCode ==
          CheckoutErrorCode.cbTimeDifference.name) {
        isCabScheduleDateTimeNeedsToUpdate = true;
        _showCabNotFoundBottomSheet(
          context: context,
          imagePath:
              'lib/assets/images/cab_booking/cab_time_slot_not_available.png',
          title: 'oops_the_time_slot_selected_is_no_longer_available'
              .localize(context),
          subTitle: '',
        );
      } else if (responseState.errorCode == CheckoutErrorCode.invalidVPA.name) {
        paymentMethodViewModel
          ..upiServerMessage = responseState.message ?? ''
          ..upiError = true;
        if (keyForUpi.currentState?.validate() == false) {
          adLog('data');
        }
        paymentMethodViewModel
          ..upiError = false
          ..upiServerMessage = ''
          ..updatePaymentError(responseState);
      } else if (responseState.errorCode ==
              CheckoutErrorCode.invalidPaymentMethodCashDiscount.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidPaymentMethodCashBack.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidCardBinCashDiscount.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidCardBinCashBack.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidCardAmountCashDiscount.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidCardAmountCashBack.name ||
          responseState.errorCode ==
              CheckoutErrorCode.exceeededClaimLimit.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidPaymentMethodCashDiscountUpi.name ||
          responseState.errorCode ==
              CheckoutErrorCode.invalidPaymentMethodCashBackUpi.name) {
        adLog('need To uncomment below code');
        adShowBottomSheetWithWrap(
          context: context,
          childWidget: IncorrectCardDetails(
            loyaltyAmount: loyaltyAmount,
            amount: paymentMethodViewModel.paymentModule == PaymentModule.flight
                ? paymentMethodViewModel.getTotalAmount()
                : totalAmount,
            errorCode: responseState.errorCode,
            discount: discountAmount,
            paymentModule:
                paymentMethodViewModel.paymentModule ?? PaymentModule.flight,
            continueTap: () => checkOutRequest(
              mode: mode,
              context: context,
              isRemoveCoupon: true,
            ),
            couponCode: couponCode,
          ).paddingBySide(left: context.k_16, right: context.k_16),
          headerTitle: '$couponCode Coupon Not Applicable!',
        );
      } else if (responseState.errorCode ==
          CheckoutErrorCode.loyaltyInsufficientBalance.name) {
        refreshPaymentScreen(context);
      } else if (paymentType != 'UPI') {
        openSomethingWrongPopup(context);
      } else {
        SnackBarUtil.showSnackBar(
          context,
          'something_went_wrong_try_again'.localize(context),
        );
      }
    }
  }

  void processPayment(BuildContext context) {
    PaymentSdkManager.instance.processPayment(
      action: paymentMethodViewModel.statePayloadInfo.action ?? '',
      payloadInfo: paymentMethodViewModel.statePayloadInfo,
      hyperSDKCallbackHandler: (methodCall) =>
          PaymentSdkManager.instance.processCallHandler(
        methodCall: methodCall,
        processCallback: (value) {
          placementApi(context);
        },
      ),
    );
  }

  void placementApi(BuildContext context) {
    paymentMethodViewModel.isLoaderVisible = true;
    shoPleaseWaitDialog(
      context,
    );
    final PlacementRequest placementRequest = PlacementRequest(
      transactionReferenceId: paymentMethodViewModel.statePayloadInfo.orderId,
    );
    paymentMethodViewModel
        .placementApiCall(
      jsonEncode(
        placementRequest.toJson()..removeWhere((key, value) => value == null),
      ),
      context,
    )
        .then((value) {
      paymentMethodViewModel.shouldShowLoader();
      checkValue(
        value,
        context,
        '',
        true,
      );
    });
  }

  void callApiPayment(
    PayNowRequest payNowRequest,
    PaymentMethodState paymentMethodViewModel,
    BuildContext context,
    PaymentMode mode,
    double loyaltyAmount,
    String? errorCode,
  ) {
    final errorText = errorCode == 'ERR_INVALID_PAYMENT_METHOD_3'
        ? '$couponCode Coupon Not Applicable'
        : '$couponCode Coupon Not Applicable';
    const labelValue = 'Continue without discount';
    isCouponRemovedFromBackend = true;

    if (paymentMethodViewModel.paymentModule == PaymentModule.flight) {
      // GA method calling on pay now submit success
      paymentGAEvents(
        paymentMethodViewModel,
        flightViewItineraryResponseModel,
        flightReviewDetailInfo,
        ClickEvents.book_flight_payment_submit,
        context,
        {
          'msg': errorText,
          'label': labelValue,
        },
      );
    } else if (paymentMethodViewModel.paymentModule ==
        PaymentModule.standAlone) {
      // GA method calling on pay now submit success
      paymentGAEvents(
        paymentMethodViewModel,
        flightViewItineraryResponseModel,
        flightReviewDetailInfo,
        ClickEvents.book_flight_payment_submit,
        context,
        {
          'msg': errorText,
          'label': labelValue,
        },
      );
    } else if (paymentMethodViewModel.paymentModule == PaymentModule.pranaam) {
      PranaamBookingGaAnalytics().ecommerceAddPaymentInfoGaAnalytics(
        ClickEvents.add_payment_info,
        context.read<PranaamAppDataStateManagement>(),
        context.read<PaymentMethodState>(),
        context.read<AppSessionState>(),
        label: labelValue,
        errorText: errorText,
      );
    } else if (paymentMethodViewModel.paymentModule == PaymentModule.dutyFree) {
      context.read<DutyFreeState>().dutyFreeEventState.addPaymentInfo(
            context.read<DutyFreeState>(),
            context.read<PaymentMethodState>(),
            context.read<AppSessionState>(),
            label: labelValue,
            errorText: errorText,
          );
    } else {
      CabGoogleAnalytics().sendGAParametersAddPaymentInfo(
        paymentMethodViewModel,
        label: labelValue,
        errorText: errorText,
      );
    }
    payNowRequest.removeInstantDiscount = true;
    navigatorPopScreen(context);
    paymentMethodViewModel
        .checkoutApiCall(
          jsonEncode(payNowRequest),
          context,
        )
        .then(
          (value) => parsePaymentApi(
            value,
            context,
            mode,
            loyaltyAmount,
            payNowRequest,
          ),
        );
  }

  void parsePaymentApi(
    ADResponseState value,
    BuildContext context,
    PaymentMode mode,
    double loyaltyAmount,
    PayNowRequest payNowRequest,
  ) {
    final ADResponseState responseState = value;
    paymentMethodViewModel.updatePaymentError(value);
    if (responseState.viewStatus == Status.complete) {
      final PayNowResponse data = value.data;
      // means payment is done through all loyalty points ex : payment amount 200 and we are using 200 loyalty points
      if (data.referenceId != null && mode == PaymentMode.loyalty) {
        paymentMethodViewModel.isLoaderVisible = true;
        shoPleaseWaitDialog(
          context,
        );
        confirmPayment(
          context: context,
          data: data,
          backPressedFromPaymentPage: false,
        );
      } else {
        if (mode != PaymentMode.loyalty) {
          openWebView(value, context);
        }
      }
    } else if (responseState.viewStatus == Status.error &&
        responseState.errorCode == CabBookingErrorCode.cabB11.name) {
      _showCabNotFoundBottomSheet(
        context: context,
        imagePath: 'lib/assets/images/cab_booking/no_cab_available.png',
        title: 'cab_not_available_at_this_moment'.localize(context),
        subTitle: '',
      );
    } else if (responseState.viewStatus == Status.error &&
        responseState.errorCode == CabBookingErrorCode.cabB13.name) {
      isCabScheduleDateTimeNeedsToUpdate = true;
      _showCabNotFoundBottomSheet(
        context: context,
        imagePath:
            'lib/assets/images/cab_booking/cab_time_slot_not_available.png',
        title: 'oops_the_time_slot_selected_is_no_longer_available'
            .localize(context),
        subTitle: '',
      );
    } else if (responseState.viewStatus == Status.error) {
      paymentMethodViewModel
        ..upiServerMessage = responseState.message ?? ''
        ..upiError = true;
      if (keyForUpi.currentState?.validate() == false) {
        adLog('data');
      }
      paymentMethodViewModel
        ..upiError = false
        ..upiServerMessage = ''
        ..updatePaymentError(responseState);

      if (responseState.errorCode == 'ERR_INVALID_PAYMENT_METHOD_3' ||
          responseState.errorCode == 'ERR_INSUFFICIENT_AMOUNT_3' ||
          responseState.errorCode == 'ERR_CARD_MAX_CLAIM_REACHED_3' ||
          responseState.errorCode == 'ERR_INVALID_MOP_1') {
        adShowBottomSheetWithWrap(
          context: context,
          childWidget: IncorrectCardDetails(
            loyaltyAmount: loyaltyAmount,
            amount: paymentMethodViewModel.paymentModule == PaymentModule.flight
                ? paymentMethodViewModel.getTotalAmount()
                : totalAmount,
            errorCode: responseState.errorCode,
            discount: discountAmount,
            paymentModule:
                paymentMethodViewModel.paymentModule ?? PaymentModule.flight,
            continueTap: () => callApiPayment(
              payNowRequest,
              paymentMethodViewModel,
              context,
              mode,
              loyaltyAmount,
              responseState.errorCode,
            ),
            couponCode: couponCode,
          ).paddingBySide(left: context.k_16, right: context.k_16),
          headerTitle: '$couponCode Coupon Not Applicable!',
        );
      } else if (responseState.errorCode == 'LErr001') {
        refreshPaymentScreen(context);
      } else if (paymentType != 'UPI') {
        openSomethingWrongPopup(context);
      }
    }
  }

  void openSomethingWrongPopup(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SomethingWrong(
            tapCallbackWithValue: (value) => {
              if (value != null)
                {
                  if (paymentMethodViewModel.selectedOption?.mode ==
                          PaymentMode.creditordebitcard ||
                      paymentMethodViewModel.selectedOption?.mode ==
                          PaymentMode.upi)
                    {
                      paymentMethodViewModel.resetCreditAndUpi(),
                    },
                },
            },
          );
        },
      );

  void paymentRequest(
    PayNowRequest payNowRequest,
    PaymentMode mode,
    BuildContext context,
    double loyaltyAmount,
  ) {
    final Map map = (jsonDecode(jsonEncode(payNowRequest))) as Map
      ..removeWhere((key, value) => key == null || value == null);
    paymentMethodViewModel
        .checkoutApiCall(
      jsonEncode(map),
      context,
    )
        .then((value) {
      parsePaymentApi(value, context, mode, loyaltyAmount, payNowRequest);
    });
  }

  Future<void> _showCabNotFoundBottomSheet({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subTitle,
  }) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.k_22, //
            ),
          ),
        ),
        child: CabsNotFoundView(
          imagePath: imagePath,
          title: title,
          subTitle: subTitle,
          buttonTittle: 'try_again'.localize(context),
          buttonAction: () => navigatorPopScreenUntil(
            context,
            ModalRoute.withName(
              cabSrpScreen,
            ),
          ),
        ).paddingBySide(
          top: context.k_32,
          bottom: context.k_16,
          left: context.k_16,
          right: context.k_16,
        ),
      ),
    );
  }

  void confirmPayment({
    required BuildContext context,
    required PayNowResponse data,
    required backPressedFromPaymentPage,
  }) {
    final PaymentConfirmRequest paymentConfirmRequest = PaymentConfirmRequest(
      orderId: data.orderID,
      paymentId: data.paymentID,
      referenceId: data.referenceId,
      // loyaltyReferenceId: data.loyaltyReferenceId ?? data.loyaltyReferenceID,
    );
    paymentMethodViewModel
        .placementApiCall(
      jsonEncode(
        paymentConfirmRequest.toJson()
          ..removeWhere((key, value) => value == null),
      ),
      context,
    )
        .then((value) {
      paymentMethodViewModel.shouldShowLoader();
      checkValue(
        value,
        context,
        data.referenceId,
        backPressedFromPaymentPage,
      );
      // context.read<AppSessionState>().getBalance();
    });
  }

  /// confirm payment check value
  void checkValue(
    ADResponseState responseState,
    BuildContext context,
    String? referenceId,
    backPressedFromPaymentPage,
  ) {
    if (responseState.viewStatus == Status.complete) {
      paymentGAEvents(
        paymentMethodViewModel,
        flightViewItineraryResponseModel,
        flightReviewDetailInfo,
        ClickEvents.book_flight_payment_success,
        context,
        {
          'transactionId': referenceId ?? '',
          'order_id':
              paymentMethodViewModel.flightItineraryPriceChange?.tripId ?? '0',
        },
      );
      final PlacementResponse response = responseState.data;
      if (response.transactionStatus?.toUpperCase() == 'FAILED') {
        paymentMethodViewModel.isTransactionFailed = true;
        if (paymentMethodViewModel.isLoaderVisible) {
          Navigator.pop(context);
          paymentMethodViewModel.isLoaderVisible = false;
        }
        paymentMethodViewModel.updatePaymentError(responseState);
        scrollToTop(controllerAll);
      } else {
        PaymentSdkManager.instance.terminateSdk();
        if (paymentMethodViewModel.paymentModule == PaymentModule.flight) {
          paymentMethodViewModel.tripId =
              paymentMethodViewModel.flightItineraryPriceChange?.tripId ?? '0';
          openFlightConfirmationScreen(context, response);
        } else if (paymentMethodViewModel.paymentModule ==
            PaymentModule.pranaam) {
          paymentMethodViewModel.handlePaymentSuccess(
            context,
            response,
          );
        } else {
          paymentMethodViewModel.handlePaymentSuccess(
            context,
            response,
          );
        }
      }
    } else if (responseState.viewStatus == Status.error) {
      paymentMethodViewModel.updatePaymentError(responseState);
      // GA method calling on pay now fail
      paymentGAEvents(
        paymentMethodViewModel,
        flightViewItineraryResponseModel,
        flightReviewDetailInfo,
        ClickEvents.book_flight_payment_fail,
        context,
        {'msg': responseState.errorCode.toString()},
      );
      if (paymentMethodViewModel.paymentModule == PaymentModule.dutyFree) {
        context.read<DutyFreeState>().dutyFreeEventState.purchasePaymentFailed(
              paymentMethodViewModel,
              responseState,
              referenceId ?? '',
            );
      }
      Navigator.pop(context);
      getAmount(context, responseState, backPressedFromPaymentPage);
      SnackBarUtil.showSnackBar(
        context,
        'something_went_wrong_try_again'.localize(context),
      );
    }
  }

  void getAmount(
    BuildContext context,
    ADResponseState responseState,
    backPressedFromPaymentPage,
  ) {
    if (paymentMethodViewModel.paymentModule == PaymentModule.cabBooking) {
      CabGoogleAnalytics().sendGAParametersCabBookingFailed(
        paymentMethodViewModel,
        responseState,
      );
    }
    if (backPressedFromPaymentPage) {
      transactionFailed(context);
    } else {
      Navigator.pop(context);
      transactionFailed(context);
    }
    context.read<AppSessionState>().getBalance().then(
      (value) {
        adLog('value');
      },
    );

    context.read<AppSessionState>().getBalance().then(
      (value) {
        adLog('value');
      },
    );
  }

  Future<void> openFlightConfirmationScreen(
    BuildContext context,
    PlacementResponse response,
  ) async {
    final PaymentStatus paymentStatus =
        paymentMethodViewModel.getPaymentStatusFromOrderStatus(
      orderStatus: response.orderStatus ?? '',
    );
    final val = Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) => PleaseWaitPaymentPopup(
          confirmationWidget: BookingConfirmation(
            selectedItineraryToConfirmation: SelectedItineraryToConfirmation(
              tripId: response.orderReferenceId ?? '0',
              flightViewItineraryResponseModel:
                  paymentMethodViewModel.flightViewItineraryResponseModel ??
                      FlightViewItineraryResponseModel(),
            ),
          ),
          paymentModule: PaymentModule.flight,
          isPaymentDone: true,
          paymentStatus: paymentStatus,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
    adLog(val.toString());
  }

  void refreshPaymentScreen(
    BuildContext context,
  ) {
    if (paymentMethodViewModel.paymentModule == PaymentModule.dutyFree) {
      final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
      final response = dutyFreeState
          .getCartDetails(
        context,
        viewCartEvent: true,
        callYouMayAlsoLike: true,
      )
          .then(
        (value) {
          pushReplaceScreen(context);
        },
      );
      adLog('$response');
    } else if (paymentMethodViewModel.paymentModule == PaymentModule.flight) {
      context.read<FlightCommonState>().isCouponRemovedFromBackend = true;
      pushReplaceScreen(context);
    }
    SnackBarUtil.showSnackBar(
      context,
      'Coupon $couponCode Removed',
    );
  }

  void pushReplaceScreen(BuildContext context) {
    PaymentModule paymentModule = PaymentModule.flight;
    SelectedTravelPassengerDetail selectedTravelPassengerDetail =
        SelectedTravelPassengerDetail();
    CabCartDetailResponseModel cabCartDetailResponseModel =
        CabCartDetailResponseModel();
    if (ModalRoute.of(context)?.settings.arguments is PaymentModule) {
      paymentModule =
          ModalRoute.of(context)?.settings.arguments as PaymentModule;
    } else {
      if (ModalRoute.of(context)?.settings.arguments
          is SelectedTravelPassengerDetail) {
        selectedTravelPassengerDetail = ModalRoute.of(context)
            ?.settings
            .arguments as SelectedTravelPassengerDetail;
      } else if (ModalRoute.of(context)?.settings.arguments
          is CabCartDetailResponseModel) {
        cabCartDetailResponseModel = ModalRoute.of(context)?.settings.arguments
            as CabCartDetailResponseModel;
        paymentModule = PaymentModule.cabBooking;
      }
    }
    final dummy = Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            ADSelectorStateLessWidget(
          viewModel: PaymentMethodState.fromModule(paymentModule),
          child: GenericPaymentScreen(
            selectedTravelPassengerDetail: selectedTravelPassengerDetail,
            cabCartDetailResponseModel: cabCartDetailResponseModel,
          ),
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
    adLog(dummy.toString());
  }

  void transactionFailed(BuildContext context) {
    final SiteCoreStateManagement siteCoreStateManagement =
        context.read<SiteCoreStateManagement>();
    if (isCouponRemovedFromBackend) {
      isCouponRemovedFromBackend = false;
      refreshPaymentScreen(context);
    } else {
      adTransactionFailedShowBottomSheet(
        context: context,
        childWidget: TransactionFailed(
          paymentModule:
              paymentMethodViewModel.paymentModule ?? PaymentModule.dutyFree,
          amount: FlightUtils.getPriceFormatWithSymbol(
            price: paymentMethodViewModel.paymentModule == PaymentModule.flight
                ? paymentMethodViewModel.getTotalAmount() < 1
                    ? 0
                    : paymentMethodViewModel.getTotalAmount()
                : paymentMethodViewModel.paymentModule ==
                        PaymentModule.cabBooking
                    ? totalAmount < 1
                        ? 0
                        : totalAmount
                    : paymentMethodViewModel.getCalculatedAmount(
                        grossAmount: paymentMethodViewModel.totalAmount,
                        rewardPoints: double.parse(
                          context.read<AppSessionState>().loyaltyPoint,
                        ),
                        rewardCheck:
                            paymentMethodViewModel.isRedeemPointsChecked,
                      ),
          ),
          tapCallbackWithValue: (value) => {
            if (value != null)
              {
                if (value)
                  {
                    if (paymentMethodViewModel.paymentModule ==
                        PaymentModule.dutyFree)
                      {
                        context
                            .read<DutyFreeState>()
                            .dutyFreeEventState
                            .retryPaymentEvent(),
                      },
                    if (paymentMethodViewModel.paymentModule ==
                        PaymentModule.cabBooking)
                      {
                        CabGoogleAnalytics()
                            .sendGAParametersCabBookingPaymentRetry(
                          paymentMethodViewModel,
                        ),
                      },
                    if (paymentMethodViewModel.selectedOption?.mode ==
                            PaymentMode.creditordebitcard ||
                        paymentMethodViewModel.selectedOption?.mode ==
                            PaymentMode.upi)
                      {
                        paymentMethodViewModel.resetCreditAndUpi(),
                      }
                    else
                      {
                        validatePayment(context),

                        // GA method for retry payment
                        paymentGAEvents(
                          paymentMethodViewModel,
                          flightViewItineraryResponseModel,
                          flightReviewDetailInfo,
                          ClickEvents.book_flight_failure_retry,
                          context,
                        ),
                      },
                  }
                else
                  {
                    // GA method for try other method for payment
                    paymentGAEvents(
                      paymentMethodViewModel,
                      flightViewItineraryResponseModel,
                      flightReviewDetailInfo,
                      ClickEvents.book_flight_failure_try_other_method,
                      context,
                    ),

                    if (paymentMethodViewModel.paymentModule ==
                        PaymentModule.dutyFree)
                      {
                        context
                            .read<DutyFreeState>()
                            .dutyFreeEventState
                            .otherPaymentEvent(),
                      },

                    if (paymentMethodViewModel.paymentModule ==
                        PaymentModule.cabBooking)
                      {
                        CabGoogleAnalytics()
                            .sendGAParametersCabBookingPaymentTryOther(
                          paymentMethodViewModel,
                        ),
                      },

                    // GA method for try other method for payment
                    paymentGAEvents(
                      paymentMethodViewModel,
                      flightViewItineraryResponseModel,
                      flightReviewDetailInfo,
                      ClickEvents.book_flight_failure_try_other_method,
                      context,
                    ),
                    paymentMethodViewModel.backToDefaultStage(
                      siteCoreStateManagement,
                    ),
                  },
              },
          },
        ),
        headerTitle: 'transaction_failed'.localize(context),
        tapCallbackWithValue: (value) => {
          paymentMethodViewModel.backToDefaultStage(
            siteCoreStateManagement,
          ),
        },
      );
    }
  }

  void openWebView(
    ADResponseState responseState,
    BuildContext context,
  ) {
    if (responseState.viewStatus == Status.complete) {
      final PayNowResponse data = responseState.data;
      navigateToScreenWithResult(
        context,
        paymentWebView,
        argumentObject: data,
      ).then((value) {
        if (value != null) {
          paymentMethodViewModel.isLoaderVisible = true;
          shoPleaseWaitDialog(
            context,
          );
          confirmPayment(
            context: context,
            data: data,
            backPressedFromPaymentPage: false,
          );
        } else {
          paymentMethodViewModel.shouldShowLoader(show: true);
          confirmPayment(
            context: context,
            data: data,
            backPressedFromPaymentPage: true,
          );
        }
      });
    } else if (responseState.viewStatus == Status.error) {
      transactionFailed(context);
    }
  }

  void shoPleaseWaitDialog(BuildContext context) => navigateToScreen(
        context,
        PleaseWaitPaymentPopup(
          paymentModule:
              paymentMethodViewModel.paymentModule ?? PaymentModule.flight,
          isPaymentDone: false,
        ),
      );

  void fareChangePopUp({
    required BuildContext context,
    required ADTapCallback onOkPressedCallBack,
    required String errorDescription,
    required String errorHeader,
  }) {
    showModalBottomSheet<void>(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return FareUpdatePopup(
          detailString: errorDescription,
          titleString: errorHeader,
          onCrossCallback: onOkPressedCallBack,
          onChangeCallBack: () => navigatorPopScreenUntil(
            context,
            ModalRoute.withName(flightListingScreen),
          ),
          onProceedCallBack: onOkPressedCallBack,
        );
      },
    );
  }

  void fareChangeErrorPopUp({
    required BuildContext context,
    required ADTapCallback? onOkPressedCallBack,
    String? errorDescription,
    String? errorHeader,
  }) {
    // ScreenEvents.flight_not_available.log();
    paymentGAEvents(
      paymentMethodViewModel,
      flightViewItineraryResponseModel,
      flightReviewDetailInfo,
      ClickEvents.flight_not_available,
      context,
    );
    showModalBottomSheet<void>(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return FareUpdatePopup(
          detailString: errorDescription ?? 'CT533'.localize(context),
          titleString: errorHeader ?? 'flight_not_available'.localize(context),
          onChangeCallBack: () => {
            navigatorPopScreenUntil(
              context,
              ModalRoute.withName(flightListingScreen),
            ),
            // ClickEvents.change_flight.logEvent(),
            paymentGAEvents(
              paymentMethodViewModel,
              flightViewItineraryResponseModel,
              flightReviewDetailInfo,
              ClickEvents.change_flight,
              context,
            ),
          },
          onProceedCallBack: onOkPressedCallBack,
        );
      },
    );
  }
}

// this method is  used to track all the GA events
void paymentGAEvents(
  PaymentMethodState? paymentMethodViewModel,
  FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
  List<FlightReviewDetailInfo>? flightReviewDetailInfo,
  ClickEvents event,
  BuildContext context, [
  Map<String, String>? map,
]) {
  if (paymentMethodViewModel?.paymentModule == PaymentModule.flight) {
    FlightBookingGaAnalytics().payNowAnalyticsData(
      flightViewItineraryResponseModel,
      flightReviewDetailInfo ?? [],
      paymentType,
      paymentProvider,
      event,
      map,
    );
    if (event == ClickEvents.book_flight_payment_submit) {
      // GA event method for add payment info on payment submit
      FlightBookingGaAnalytics().purchaseAnalyticsData(
        flightViewItineraryResponseModel,
        flightReviewDetailInfo ?? [],
        paymentType,
        paymentProvider,
        ClickEvents.add_payment_info,
        map,
      );
    } else if (event == ClickEvents.book_flight_payment_success) {
      // GA event method for add payment info on payment success
      FlightBookingGaAnalytics().purchaseAnalyticsData(
        flightViewItineraryResponseModel,
        flightReviewDetailInfo ?? [],
        paymentType,
        paymentProvider,
        ClickEvents.purchase,
        map,
      );
    }
  }

  if (paymentMethodViewModel?.paymentModule == PaymentModule.pranaam) {
    if (event == ClickEvents.book_flight_failure_retry) {
      PranaamBookingGaAnalytics().ecommerceAddPaymentInfoGaAnalytics(
        ClickEvents.book_pranaam_retry_payment,
        context.read<PranaamAppDataStateManagement>(),
        context.read<PaymentMethodState>(),
        context.read<AppSessionState>(),
      );
    }
    if (event == ClickEvents.book_flight_failure_try_other_method) {
      PranaamBookingGaAnalytics().pranaamPaymentOtherGaEvent(
        ClickEvents.book_pranaam_retry_other_payment_bank,
        context.read<PranaamAppDataStateManagement>(),
      );
    }
    if (event == ClickEvents.book_flight_payment_fail) {
      PranaamBookingGaAnalytics().pranaamPaymentFailGaEvent(
        ClickEvents.book_pranaam_payment_fail,
        context.read<PranaamAppDataStateManagement>(),
      );
    }
  }

  if (paymentMethodViewModel?.paymentModule == PaymentModule.standAlone) {
    if (event == ClickEvents.book_flight_payment_submit) {
      // GA event method for add payment info on payment submit
      StandAloneGaAnalytics()
          .paymentEcommerceEvent(context, ClickEvents.add_payment_info);
      StandAloneGaAnalytics().paymentEvent(
        context,
        StandAloneGaName(context).paymentSubmitName(),
      );
    } else if (event == ClickEvents.book_flight_payment_success) {
      // GA event method for payment success
      StandAloneGaAnalytics().paymentEcommerceEvent(
        context,
        StandAloneGaName(context).paymentSuccessName(),
      );
    } else if (event == ClickEvents.book_flight_failure_retry) {
      // GA event method for fail retry
      StandAloneGaAnalytics()
          .paymentEvent(context, StandAloneGaName(context).paymentRetryName());
    } else if (event == ClickEvents.book_flight_payment_fail) {
      // GA event method for fail
      StandAloneGaAnalytics()
          .paymentEvent(context, StandAloneGaName(context).paymentFailName());
      StandAloneGaAnalytics()
          .paymentEvent(context, StandAloneGaName(context).bookFailName());
    } else if (event == ClickEvents.book_flight_failure_try_other_method) {
      // GA event method for fail try other method
      StandAloneGaAnalytics().paymentEvent(
        context,
        StandAloneGaName(context).paymentFailTryOtherName(),
      );
    }
  }
}
