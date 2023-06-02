import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/checkout_error_code.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class IncorrectCardDetails extends StatelessWidget {
  final double loyaltyAmount;
  final double? discount;
  final String? errorCode;
  final num amount;
  final ADTapCallback continueTap;
  final String couponCode;
  final PaymentModule paymentModule;

  const IncorrectCardDetails({
    Key? key,
    required this.loyaltyAmount,
    required this.amount,
    required this.continueTap,
    required this.errorCode,
    required this.discount,
    required this.couponCode,
    required this.paymentModule,
  }) : super(key: key);

  double getFinalAmount() {
    return (errorCode == CheckoutErrorCode.invalidCardAmountCashDiscount.name ||
            errorCode == CheckoutErrorCode.invalidCardAmountCashBack.name ||
            errorCode == CheckoutErrorCode.exceeededClaimLimit.name ||
            errorCode ==
                CheckoutErrorCode.invalidPaymentMethodCashDiscountUpi.name ||
            errorCode == CheckoutErrorCode.invalidPaymentMethodCashBackUpi.name
        /*errorCode == 'ERR_INSUFFICIENT_AMOUNT_3' ||
            errorCode == 'ERR_CARD_MAX_CLAIM_REACHED_3' ||
            errorCode == 'ERR_INVALID_MOP_1'*/
        )
        ? amount + (discount ?? 0.0)
        : amount == 0
            ? (discount ?? 0.0)
            : (discount ?? 0.0) + amount;
  }

  String getErrorMessage(String? errorCode) {
    switch (errorCode) {
      // case 'ERR_INSUFFICIENT_AMOUNT_3':
      case 'invalid_card_amount_cash_discount':
      case 'invalid_card_amount_cash_back':
        return "Payable amount is insufficient to avail this coupon as you've"
            ' used ${FlightUtils.getPriceFormatWithSymbol(
          price: loyaltyAmount,
        )} Reward Points.';
      // case 'ERR_CARD_MAX_CLAIM_REACHED_3':
      case 'exceeeded_claim_limit':
        return "You've already availed this coupon using this card";
      // case 'ERR_INVALID_MOP_1':
      case 'invalid_payment_method_cash_discount_upi':
      case 'invalid_payment_method_cash_back_upi':
        return 'Oops! Coupon applicable on payment done through UPI only.';
      default:
        return 'Oops! This payment method is invalid to avail this coupon.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.k_10,
        ),
        Text(
          getErrorMessage(errorCode),
          style: ADTextStyle400.size16.setTextColor(
            context.adColors.black,
          ),
        ),
        SizedBox(
          height: context.k_30,
        ),
        ElevatedButton(
          onPressed: () => addEventsForContinueWithoutPayment(
            context,
            couponCode,
            'continue_without_discount'.localize(context),
          ),
          style: ElevatedButton.styleFrom(
            shadowColor: context.adColors.transparentColor,
            shape: const StadiumBorder(),
          ),
          child: Container(
            height: context.k_48,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'continue_without_discount'.localize(context),
                  style: ADTextStyle700.size16
                      .setTextColor(context.adColors.whiteTextColor),
                ),
                Text(
                  "${'Amount Payable ${FlightUtils.getPriceFormatWithSymbol(
                    price: getFinalAmount(),
                  )}'} ",
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.whiteTextColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.k_20,
        ),
        ElevatedButton(
          onPressed: () => addEvents(context, couponCode, 'Back To Payment'),
          style: ElevatedButton.styleFrom(
            shadowColor: context.adColors.transparentColor,
            primary: context.adColors.whiteTextColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: context.adColors.black,
              ),
            ),
          ),
          child: Container(
            height: context.k_48,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'back_to_payment'.localize(context),
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: context.k_20,
        ),
        GestureDetector(
          onTap: () => changeCouponOnTap(context),
          child: Text(
            'change_coupon'.localize(context),
            style: ADTextStyle500.size16
                .setTextColor(context.adColors.black)
                .copyWith(
                  decoration: TextDecoration.underline,
                ),
          ).paddingBySide(bottom: context.k_30),
        ),
      ],
    );
  }

  void changeCouponOnTap(context) {
    addEvents(context, couponCode, 'Change Coupon');
    switch (paymentModule) {
      case PaymentModule.flight:
        Navigator.of(context).popUntil(
          (route) => route.settings.name == reviewFlightDetails,
        );
        break;
      case PaymentModule.pranaam:
        Navigator.of(context).popUntil(
          (route) => route.settings.name == genericCartScreen,
        );
        break;
      default:
        Navigator.of(context).popUntil(
          (route) => route.settings.name == genericCartScreen,
        );
    }
  }

  void addEvents(
    BuildContext context,
    String couponCode,
    String labelName,
  ) {
    FlightBookingGaAnalytics().backToPaymentOptionsAnalyticsData(
      couponCode,
      labelName,
      getCategory(),
      discount,
      getFinalAmount(),
    );
    navigatorPopScreen(context);
  }

  void addEventsForContinueWithoutPayment(
    BuildContext context,
    String couponCode,
    String labelName,
  ) {
    FlightBookingGaAnalytics().backToPaymentOptionsAnalyticsData(
      couponCode,
      labelName,
      getCategory(),
      discount,
      getFinalAmount(),
    );
    navigatorPopScreen(context);
    continueTap();
  }

  String getCategory() {
    switch (paymentModule) {
      case PaymentModule.flight:
        return 'book_flight';
      case PaymentModule.pranaam:
        return 'pranaam';
      case PaymentModule.dutyFree:
        return 'duty_free';
      case PaymentModule.cabBooking:
        return 'cab_booking';
      default:
        return 'book_flight';
    }
  }
}
