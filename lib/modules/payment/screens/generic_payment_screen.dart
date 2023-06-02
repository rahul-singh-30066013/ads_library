/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/review_cab_booking_details_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_payment_screen/views/cab_detail_view.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_review_order_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/views/fare_update_popup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_review_flight_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/jus_pay/payment_sdk_manager.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyality_potential_response_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_potential_request_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/sale_sku_set.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/adani_reward_balance.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/payment_options_type.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/payment_transaction_failed_view.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/review_pranaam_booking.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/show_available_offers.dart';
import 'package:adani_airport_mobile/modules/payment/screens/payment_bottom_navigation_button.dart';
import 'package:adani_airport_mobile/modules/payment/screens/payment_shimmer.dart';
import 'package:adani_airport_mobile/modules/payment/screens/show_safe_secure_widget.dart';
import 'package:adani_airport_mobile/modules/payment/utils/extensions/tappable_widget.dart';
import 'package:adani_airport_mobile/modules/payment_view_wrapper/payment_price_detail_wrapper.dart';
import 'package:adani_airport_mobile/modules/payment_view_wrapper/payment_upper_view_wrapper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/auto_text_size/auto_size_text_main.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

String paymentType = '';
String paymentProvider = '';

//This class is used for listing out all kinds of payment methods, in an expandable-collapsable list view.
class GenericPaymentScreen extends StatefulWidget {
  final SelectedTravelPassengerDetail? selectedTravelPassengerDetail;
  final CabCartDetailResponseModel? cabCartDetailResponseModel;
  const GenericPaymentScreen({
    Key? key,
    this.selectedTravelPassengerDetail,
    this.cabCartDetailResponseModel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GenericPaymentScreenState();
  }
}

class _GenericPaymentScreenState extends State<GenericPaymentScreen> {
  // View-Model for payment method listing.
  PaymentMethodState? _paymentMethodViewModel;

  final ScrollController controllerAll = ScrollController();

  /// it is use for redeem point
  bool isRedeemPointsChecked = true;

  /// it is use for list of description
  List<String> description = [
    'Get 10% Unlimited Cashback on Flipkart Axis Bank Credit Card.',
    '15% Unlimited Cashback on Axis Bank Credit Card.',
    'Get 10% Unlimited Cashback on Flipkart Axis Bank Credit Card.',
    '5% Cashback upto Rs 150 on a minimum spend of Rs 1,500 with PayZapp.',
  ];

  double pciIconWidth = 270.sp;
  double underlineHeight = 1;

  final double disabledOpacity = 0.3;
  final double stepTextSize = 13;
  final int totalElementsCount = 2;
  final int numberOfPrimeBanks = 2;
  num grossAmount = 0;
  num nonLoyaltyAmount = 0;
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final formKey = GlobalKey<FormState>();
  final formKeyForUpi = GlobalKey<FormState>();
  GlobalKey? globalKeyForFocus = GlobalKey();
  GlobalKey? globalKeyForUpiFocus = GlobalKey();
  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  List<FlightReviewDetailInfo> flightReviewDetailInfo = [];

  List<PricedItinerary> get _pricedList =>
      flightViewItineraryResponseModel?.pricedItineraries ??
      [PricedItinerary()];
  PricingSummary? oldPricingSummary;
  TripType? tripType;
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  PackageDetail? packageSelected;
  PricingInfo? pricingInfo;
  CartResponse? cartResponse;
  String mobileNo = '';
  String storeCode = '';
  String businessSubType = '';
  String businessType = '';
  final List<SaleSkuSet> skuList = [];
  double stepGranularity = 0.1;

  @override
  void initState() {
    super.initState();
    _paymentMethodViewModel = context.read<PaymentMethodState>();
    _paymentMethodViewModel?.readData(context.read<SiteCoreStateManagement>());
    if (_paymentMethodViewModel?.paymentModule == PaymentModule.cabBooking) {
      _paymentMethodViewModel?.cabCartDetailResponseModel =
          widget.cabCartDetailResponseModel;
      _paymentMethodViewModel?.totalAmountToDisplayAtBottom =
          _paymentMethodViewModel?.cabCartDetailResponseModel?.cartDetail
                  ?.priceInfo?.discountPrice
                  ?.toDouble() ??
              0;
      _paymentMethodViewModel?.totalAmount =
          _paymentMethodViewModel?.totalAmountToDisplayAtBottom ?? 0;
    }
    context.read<AppSessionState>().getBalance().then((value) {
      _paymentMethodViewModel
          ?.rewardPoint.value = ((_paymentMethodViewModel?.totalAmount ?? 0) <
              context.read<AppSessionState>().rewardBalance.value.toDouble())
          ? _paymentMethodViewModel?.totalAmount ?? 0
          : context.read<AppSessionState>().rewardBalance.value.toDouble();

      if (_paymentMethodViewModel?.paymentModule != PaymentModule.flight) {
        _checkLoyaltyPotential(true);
      }
    });
    if (_paymentMethodViewModel?.paymentModule == PaymentModule.flight) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _getInitializedData();
      });
    } else if (_paymentMethodViewModel?.paymentModule ==
        PaymentModule.cabBooking) {
      _paymentMethodViewModel?.paymentResponseState =
          ADResponseState.completed('');
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _paymentMethodViewModel?.rewardPoint.value =
            ((_paymentMethodViewModel?.totalAmount ?? 0) < _getBalance(context))
                ? _paymentMethodViewModel?.totalAmount ?? 0
                : _getBalance(context);
      });
    } else {
      pranaamAppDataStateManagement =
          context.read<PranaamAppDataStateManagement>();
      _paymentMethodViewModel?.paymentResponseState =
          ADResponseState.completed('');
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _paymentMethodViewModel?.rewardPoint.value =
            ((_paymentMethodViewModel?.totalAmount ?? 0) < _getBalance(context))
                ? _paymentMethodViewModel?.totalAmount ?? 0
                : _getBalance(context);
      });
    }
  }

  @override
  void dispose() {
    PaymentSdkManager.instance.terminateSdk();
    super.dispose();
  }

  void _checkLoyaltyPotential(bool check) {
    _paymentMethodViewModel
        ?.potentialEarning(
      _paymentMethodViewModel?.createPotentialEarningModel(
            context,
            check,
            getCouponCode(context),
          ) ??
          const LoyaltyPotentialRequestModel(),
    )
        .then((value) {
      checkLoyaltyValue(value, check);
    });
  }

  void checkLoyaltyValue(
    ADResponseState responseState,
    check,
  ) {
    if (responseState.viewStatus == Status.complete) {
      LoyalityPotentialResponseModel model = LoyalityPotentialResponseModel();
      model = responseState.data;
      if (check) {
        _paymentMethodViewModel?.checkLoyalityPoint =
            model.potentialEarning ?? 0;
        _checkLoyaltyPotential(false);
      } else {
        _paymentMethodViewModel?.initiateSDK(
          fetched: (value) {
            _paymentMethodViewModel?.unCheckLoyalityPoint =
                model.potentialEarning ?? 0;
            _paymentMethodViewModel?.paymentResponseState =
                ADResponseState.completed('');
            _paymentMethodViewModel?.itenaryResponseState =
                ADResponseState.completed('');
            _paymentMethodViewModel?.notifyListeners();
            showRewardSnakbar();
          },
        );
      }
      _paymentMethodViewModel?.updatePoint();
    }
  }

  void showRewardSnakbar() {
    if (_isPaymentByLoyaltyOnly(
      _paymentMethodViewModel?.totalAmount ?? 0,
    )) {
      _paymentMethodViewModel?.allModeCollapsed(
        context.read<SiteCoreStateManagement>(),
      );
      SnackBarUtil.showSnackBar(
        context,
        'uncheck_the_adani_Rewards_toast'.localize(context),
      );
    }
  }

  void _getInitializedData() {
    oldPricingSummary = widget.selectedTravelPassengerDetail
        ?.flightViewItineraryResponseModel?.pricingSummary;
    _paymentMethodViewModel?.populate().then((value) {
      final String itineraryId = widget.selectedTravelPassengerDetail
              ?.flightViewItineraryResponseModel?.itineraryId ??
          '';
      _paymentMethodViewModel?.viewItineraryDetails(itineraryId).then((value) {
        adLog('itinerary data $value');
        if (value.data != null) {
          _paymentMethodViewModel?.updateItineraryDetailsState(value);
          flightViewItineraryResponseModel =
              _paymentMethodViewModel?.flightViewItineraryResponseModel;
          _paymentMethodViewModel?.travelInsuranceAmount =
              flightViewItineraryResponseModel
                      ?.pricingSummary?.travelInsuranceFare ??
                  0;
          _paymentMethodViewModel?.zeroCancellationAmount =
              (flightViewItineraryResponseModel
                          ?.zeroCancellationSummary?.isActive ??
                      false)
                  ? (flightViewItineraryResponseModel
                          ?.zeroCancellationSummary?.netAmt ??
                      0)
                  : 0;
          final FlightReviewDetailModel? flightReviewDetailModel =
              flightViewItineraryResponseModel?.flightReviewDetailModel;
          flightReviewDetailInfo =
              flightReviewDetailModel?.flightReviewDetailInfo ?? [];
          tripType = flightViewItineraryResponseModel?.tripType == 'O'
              ? TripType.oneWay
              : TripType.roundTrip;
          final PricingSummary currentPricingSummary =
              flightViewItineraryResponseModel?.pricingSummary ??
                  const PricingSummary();
          if (oldPricingSummary?.baseFare != currentPricingSummary.baseFare) {
            final double oldTotalPrice =
                (oldPricingSummary?.totalFare ?? 0).toDouble();
            final double currentPrice =
                (currentPricingSummary.totalFare ?? 0).toDouble();
            final PriceChangeType priceChangeType = oldTotalPrice > currentPrice
                ? PriceChangeType.D
                : PriceChangeType.I;
            _fareChangePopUp(
              context: context,
              oldPrice: oldTotalPrice,
              currentPricingSummary: currentPricingSummary,
              priceChangeType: priceChangeType,
              onOkPressedCallBack: () => Navigator.pop(context),
            );
          }
          _paymentMethodViewModel?.totalAmount =
              (_paymentMethodViewModel?.getAmountPayable(_pricedList) ?? 0)
                  .toDouble();
          _paymentMethodViewModel?.totalAmountToDisplayAtBottom =
              (currentPricingSummary.totalFare ?? 0).toDouble();
          _paymentMethodViewModel?.rewardPoint.value =
              ((_paymentMethodViewModel?.totalAmount ?? 0) <
                      _getBalance(context))
                  ? _paymentMethodViewModel?.totalAmount ?? 0
                  : _getBalance(context);
          _paymentMethodViewModel?.itenaryResponseState = value;
          _paymentMethodViewModel?.notifyListeners();
          _checkLoyaltyPotential(true);
        } else {
          _paymentMethodViewModel?.itenaryResponseState =
              ADResponseState.error(value.message);
          _paymentMethodViewModel?.notifyListeners();
        }
      });
    });

    ScreenEvents.payments.log();
  }

  /*double _getAmountPayable() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalFare?.amount ?? 0).toDouble();
    }
    return total;
  }*/

  void initBuildData() {
    if (_paymentMethodViewModel?.paymentModule != PaymentModule.flight) {
      _paymentMethodViewModel?.initPriceDetails(context);
    }
    cartResponse = pranaamAppDataStateManagement.cartDataResponse;
    packageSelected = cartResponse?.packageDetail ?? const PackageDetail();
    pricingInfo = packageSelected?.pricingInfo;
  }

  bool showCouponAppliedStrip(BuildContext context) {
    return (_paymentMethodViewModel?.paymentModule == PaymentModule.flight &&
            flightViewItineraryResponseModel?.promoCoupon != null) ||
        (_paymentMethodViewModel?.paymentModule == PaymentModule.pranaam &&
            (pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                    .pricingInfo.discountCouponDetail.couponCode.isNotEmpty ??
                false)) ||
        (_paymentMethodViewModel?.paymentModule == PaymentModule.dutyFree &&
            (context
                    .read<DutyFreeState>()
                    .dutyFreeCartResponse
                    ?.promoCoupon
                    ?.promoCode
                    ?.isNotEmpty ??
                false)) ||
        (_paymentMethodViewModel?.paymentModule == PaymentModule.cabBooking &&
            (_paymentMethodViewModel?.cabCartDetailResponseModel?.cartDetail
                    ?.promoDetails?.promoCode?.isNotEmpty ??
                false));
  }

  String? getCouponCode(BuildContext context) {
    switch (_paymentMethodViewModel?.paymentModule) {
      case PaymentModule.cabBooking:
        return _paymentMethodViewModel
            ?.cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode;
      case PaymentModule.pranaam:
        return pranaamAppDataStateManagement.cartDataResponse?.packageDetail
            .pricingInfo.discountCouponDetail.couponCode;
      case PaymentModule.dutyFree:
        return context
            .read<DutyFreeState>()
            .dutyFreeCartResponse
            ?.promoCoupon
            ?.promoCode;
      default:
        return flightViewItineraryResponseModel?.promoCoupon?.promoCode;
    }
  }

  double getCouponAmount(BuildContext context) {
    switch (_paymentMethodViewModel?.paymentModule) {
      case PaymentModule.cabBooking:
        return _paymentMethodViewModel?.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue
                ?.toDouble() ??
            0;
      case PaymentModule.pranaam:
        return pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                .pricingInfo.discountCouponDetail.couponDiscountAmount ??
            0;
      case PaymentModule.dutyFree:
        return context
                .read<DutyFreeState>()
                .dutyFreeCartResponse
                ?.promoCoupon
                ?.offerValue ??
            0;
      default:
        return flightViewItineraryResponseModel?.promoCoupon?.offerValue ?? 0;
    }
  }

  Future<bool> handleWillPop() async {
    final checkForPop =
        _paymentMethodViewModel?.paymentResponseState.viewStatus !=
                Status.loading ||
            _paymentMethodViewModel?.paymentResponseState.viewStatus !=
                Status.error;
    if (checkForPop) {
      if (Platform.isAndroid) {
        final backPressResult =
            await PaymentSdkManager.instance.jusPaySdk.onBackPress();
        return !(backPressResult.toLowerCase() == 'true') &&
            !(_paymentMethodViewModel?.isPaymentConfirmed ?? false);
      } else {
        return !(_paymentMethodViewModel?.isPaymentConfirmed ?? false);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext outerContext) {
    initBuildData();
    return WillPopScope(
      onWillPop: handleWillPop,
      child: Consumer<PaymentMethodState>(
        builder: (BuildContext context, value, Widget? child) {
          final rewardsPoints = getLoyaltyPoints(
            value.paymentModule ?? PaymentModule.flight,
            context,
          );
          adLog('Loyalty Points $rewardsPoints');
          return Scaffold(
            appBar: AppBar(
              backgroundColor: context.adColors.whiteTextColor,
              elevation: 0,
              scrolledUnderElevation: 1,
              title: Text(
                'payment'.localize(context),
                style:
                    ADTextStyle700.size22.setTextColor(context.adColors.black),
              ),
              actions: [
                Center(
                  child: Text(
                    'step_3/3'.localize(context),
                    style: ADTextStyle400.size14.setFontSize(stepTextSize),
                  ).paddingBySide(right: context.k_16),
                ),
              ],
            ),
            body: Selector<PaymentMethodState, ADResponseState>(
              selector: (context, model) => model.paymentResponseState,
              builder: (context, model, child) => AbsorbPointer(
                absorbing:
                    _paymentMethodViewModel?.paymentResponseState.viewStatus ==
                        Status.loading,
                child: _paymentMethodViewModel
                            ?.itenaryResponseState.viewStatus ==
                        Status.loading
                    ? const PaymentShimmer()
                    : _paymentMethodViewModel
                                ?.itenaryResponseState.viewStatus ==
                            Status.error
                        ? NoInternetView(
                            pageMainDesc: _paymentMethodViewModel
                                ?.itenaryResponseState.message,
                          )
                        : Stack(
                            children: [
                              SingleChildScrollView(
                                controller: controllerAll,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Selector<PaymentMethodState, bool>(
                                      selector: (context, model) =>
                                          model.isTransactionFailed,
                                      builder: (
                                        context,
                                        isTransactionFailed,
                                        child,
                                      ) {
                                        return Visibility(
                                          visible: isTransactionFailed,
                                          child:
                                              const PaymentTransactionFailedView(),
                                        );
                                      },
                                    ),
                                    if (value.paymentModule ==
                                        PaymentModule.dutyFree)
                                      PaymentUpperViewWrapper(
                                        paymentModule: PaymentModule.dutyFree,
                                        onInfoTap: () => adShowBottomSheet(
                                          context: context,
                                          childWidget:
                                              const DutyFreeReviewOrderBottomSheet(),
                                          headerTitle:
                                              'review_order'.localize(context),
                                        ),
                                      ).paddingBySide(
                                        bottom: context.k_20,
                                      ),
                                    if (value.paymentModule ==
                                        PaymentModule.pranaam)
                                      PaymentUpperViewWrapper(
                                        paymentModule: PaymentModule.pranaam,
                                        onInfoTap: () => {
                                          HapticFeedback.heavyImpact(),
                                          adShowFareDetailsBottomSheet(
                                            context: context,
                                            childWidget:
                                                const ReviewPranaamBooking(),
                                            headerTitle: 'Review Booking',
                                          ),
                                        },
                                      ).paddingBySide(
                                        bottom: context.k_20,
                                      ),
                                    if (value.paymentModule ==
                                        PaymentModule.standAlone)
                                      PaymentUpperViewWrapper(
                                        paymentModule: PaymentModule.standAlone,
                                        onInfoTap: () => {
                                          HapticFeedback.heavyImpact(),
                                          adShowFareDetailsBottomSheet(
                                            context: context,
                                            childWidget:
                                                const ReviewPranaamBooking(),
                                            headerTitle: 'Review Booking',
                                          ),
                                        },
                                      ).paddingBySide(
                                        bottom: context.k_20,
                                      ),
                                    if (value.paymentModule ==
                                        PaymentModule.cabBooking)
                                      CabDetailView(
                                        cabCartDetailResponseModel:
                                            widget.cabCartDetailResponseModel,
                                        onTapDetails: () => {
                                          HapticFeedback.heavyImpact(),
                                          adShowFareDetailsBottomSheet(
                                            context: context,
                                            childWidget:
                                                ReviewCabBookingDetailsBottomSheet(
                                              cabCartDetailResponseModel: widget
                                                  .cabCartDetailResponseModel,
                                              paymentMethodState:
                                                  _paymentMethodViewModel,
                                            ),
                                            headerTitle: 'Review Booking',
                                          ),
                                        },
                                      ).paddingBySide(
                                        left: context.k_16,
                                        top: context.k_20,
                                        right: context.k_16,
                                        bottom: context.k_20,
                                      ),
                                    if (value.paymentModule ==
                                        PaymentModule.flight)
                                      PaymentUpperViewWrapper(
                                        paymentModule: PaymentModule.flight,
                                        flightReviewDetailInfo:
                                            flightReviewDetailInfo,
                                        tripType: tripType,
                                        passengerCount: widget
                                                .selectedTravelPassengerDetail
                                                ?.travellerPassengerResponseModel
                                                ?.paxInfoList
                                                ?.length ??
                                            0,
                                        onTapDetails: () => callViewItinerary(),
                                      ).paddingBySide(
                                        left: context.k_16,
                                        top: context.k_20,
                                        right: context.k_16,
                                        bottom: context.k_20,
                                      ),
                                    if (showCouponAppliedStrip(context))
                                      Container(
                                        height: context.k_38,
                                        width: double.infinity,
                                        //TODO: Add this color in style
                                        color: const Color(0xffebf8f3),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'lib/assets/images/svg/icons/flight/percentage_icon.svg',
                                            ),
                                            SizedBox(
                                              width: context.k_10,
                                            ),
                                            Expanded(
                                              child: AutoSizeText.rich(
                                                TextSpan(
                                                  style: TextStyle(
                                                    fontSize: context.k_16,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${getCouponCode(context)} ',
                                                      style: ADTextStyle600
                                                          .size16
                                                          .setTextColor(
                                                        context.adColors
                                                            .successInfoMsg,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${'coupon_applied'.localize(context)}. ',
                                                      style: ADTextStyle400
                                                          .size16
                                                          .setTextColor(
                                                        context.adColors
                                                            .successInfoMsg,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 't_and_c_apply'
                                                          .localize(context),
                                                      style: ADTextStyle400
                                                          .size12
                                                          .setTextColor(
                                                        context.adColors
                                                            .successInfoMsg,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              adLog(
                                                                'onTap T&C',
                                                              );
                                                              /* if (getCouponCode(
                                                                    context,
                                                                  )?.isNotEmpty ==
                                                                  true) {
                                                                navigateToScreenUsingNamedRouteWithArguments(
                                                                  context,
                                                                  offerDetail,
                                                                  rootNavigator:
                                                                      false,
                                                                  argumentObject:
                                                                      OfferKeyModel(
                                                                    id: getCouponCode(
                                                                      context,
                                                                    ),
                                                                    title:
                                                                        getCouponCode(
                                                                      context,
                                                                    ),
                                                                    fetchDataFromPromoCode:
                                                                        true,
                                                                    showBookNowButton:
                                                                        false,
                                                                  ),
                                                                );
                                                              }*/
                                                            },
                                                    ),
                                                  ],
                                                ),
                                                minFontSize: 0,
                                                maxLines: 1,
                                                stepGranularity:
                                                    stepGranularity,
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(
                                          left: context.k_16,
                                        ),
                                      ).paddingBySide(
                                        left: context.k_16,
                                        right: context.k_16,
                                        bottom: context.k_20,
                                      ),
                                    Container(
                                      height: context.k_8,
                                      color: context.adColors.containerGreyBg,
                                    ),
                                    if ((_paymentMethodViewModel
                                                ?.filteredOfferList ??
                                            [])
                                        .isNotEmpty)
                                      ShowAvailableOffers(
                                        paymentMethodViewModel:
                                            _paymentMethodViewModel,
                                        offerList: _paymentMethodViewModel
                                                ?.filteredOfferList ??
                                            [],
                                        isBorderRequired: false,
                                      ).paddingAllSide(
                                        context.k_16,
                                      ),
                                    if ((_paymentMethodViewModel
                                                ?.filteredOfferList ??
                                            [])
                                        .isNotEmpty)
                                      Container(
                                        height: context.k_8,
                                        color: context.adColors.containerGreyBg,
                                      ),
                                    ValueListenableBuilder(
                                      valueListenable: context
                                          .read<AppSessionState>()
                                          .rewardBalance,
                                      builder: (
                                        context,
                                        num values,
                                        child,
                                      ) =>
                                          Opacity(
                                        opacity: _getBalance(context) > 0
                                            ? 1
                                            : disabledOpacity,
                                        child: AdaniRewardBalance(
                                          totalAmount: _paymentMethodViewModel
                                                      ?.paymentModule ==
                                                  PaymentModule.flight
                                              ? _paymentMethodViewModel
                                                      ?.totalAmountToDisplayAtBottom ??
                                                  0
                                              : _paymentMethodViewModel
                                                      ?.totalAmount ??
                                                  0,
                                          excludedAmount:
                                              _paymentMethodViewModel
                                                          ?.paymentModule ==
                                                      PaymentModule.flight
                                                  ? _paymentMethodViewModel
                                                          ?.excludedAmount ??
                                                      0
                                                  : 0,
                                        ).paddingBySide(
                                          top: context.k_20,
                                          bottom: context.k_8,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: context.k_8,
                                      color: context.adColors.containerGreyBg,
                                    ),
                                    Selector<PaymentMethodState, bool>(
                                      selector: (context, model) =>
                                          model.isRedeemPointsChecked,
                                      builder: (context, model, child) {
                                        final totalPrice =
                                            _paymentMethodViewModel
                                                    ?.totalAmount ??
                                                0;
                                        return Opacity(
                                          opacity: _isPaymentByLoyaltyOnly(
                                            totalPrice,
                                          )
                                              ? disabledOpacity
                                              : 1,
                                          child: AbsorbPointer(
                                            absorbing: _isPaymentByLoyaltyOnly(
                                              totalPrice,
                                            ),
                                            child: PaymentOptionsType(
                                              totalAmount:
                                                  _paymentMethodViewModel
                                                          ?.totalAmount
                                                          .toString() ??
                                                      '',
                                              keyForCreditCard: formKey,
                                              keyForUpi: formKeyForUpi,
                                              controllerAll: controllerAll,
                                              globalKeyForFocus:
                                                  globalKeyForFocus,
                                              globalKeyForUpiFocus:
                                                  globalKeyForUpiFocus,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      height: context.k_8,
                                      color: context.adColors.containerGreyBg,
                                    ).paddingBySide(
                                      top: context.k_4,
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: context
                                          .read<AppSessionState>()
                                          .rewardBalance,
                                      builder: (
                                        context,
                                        num values,
                                        child,
                                      ) {
                                        _paymentMethodViewModel?.rewardPoint
                                            .value = _getBalance(context);
                                        if (_paymentMethodViewModel
                                                ?.paymentModule ==
                                            PaymentModule.flight) {
                                          return PaymentPriceDetailWrapper(
                                            paymentModule: PaymentModule.flight,
                                            baseFare:
                                                '${_paymentMethodViewModel?.getTotalBaseFare() ?? 0}',
                                            discountOnFare: '${0}',
                                            taxes:
                                                '${_paymentMethodViewModel?.getTotalTax() ?? 0}',
                                            totalAmount: _paymentMethodViewModel
                                                ?.getTotalAmount(),
                                            convenienceFee:
                                                '${flightViewItineraryResponseModel?.pricingSummary?.ccfFee ?? 0}',
                                            shakeKey: shakeKey,
                                            paxInfoList:
                                                flightViewItineraryResponseModel
                                                        ?.paxInfoList ??
                                                    [],
                                            pricedItineraryList:
                                                flightViewItineraryResponseModel
                                                    ?.pricedItineraries,
                                            reward: (_paymentMethodViewModel
                                                        ?.isRedeemPointsChecked ??
                                                    false)
                                                ? _paymentMethodViewModel
                                                    ?.calculateLoyaltyAmountToPay(
                                                    (flightViewItineraryResponseModel
                                                                ?.pricingSummary
                                                                ?.totalFare ??
                                                            0)
                                                        .toDouble(),
                                                  )
                                                : 0,
                                            discountedCCFFee:
                                                (flightViewItineraryResponseModel
                                                            ?.pricingSummary
                                                            ?.discountedCCFFee ??
                                                        0)
                                                    .toDouble(),
                                            priceSummary:
                                                flightViewItineraryResponseModel
                                                    ?.pricingSummary,
                                            insurance:
                                                flightViewItineraryResponseModel
                                                    ?.insurance,
                                            zeroCancellationSummary:
                                                flightViewItineraryResponseModel
                                                    ?.zeroCancellationSummary,
                                          );
                                        } else if (_paymentMethodViewModel
                                                ?.paymentModule ==
                                            PaymentModule.pranaam) {
                                          return PaymentPriceDetailWrapper(
                                            pranaamAddOnList:
                                                cartResponse?.packageAddOn,
                                            promoType: cartResponse
                                                    ?.packageDetail
                                                    .pricingInfo
                                                    .discountCouponDetail
                                                    .promoType ??
                                                '0',
                                            paymentModule:
                                                PaymentModule.pranaam,
                                            expressFareAmount: pricingInfo
                                                    ?.totalExpressFare
                                                    ?.baseFare ??
                                                0,
                                            totalMRP: pricingInfo
                                                ?.totalBaseFare.amount,
                                            cGst: cartResponse?.totalTax.cgst,
                                            sGst: cartResponse?.totalTax.sgst,
                                            totalAmount: getCartTotalPrice(
                                              cartResponse,
                                            ),
                                            addOnsAmount: getAddonsTotalPrice(
                                              cartResponse,
                                            ),
                                            discountAmount: pricingInfo
                                                ?.discountCouponDetail
                                                .couponDiscountAmount,
                                            //showApplyCoupon: true,
                                            packageName: packageSelected?.name,
                                            shakeKey: shakeKey,
                                            reward: (_paymentMethodViewModel
                                                        ?.isRedeemPointsChecked ??
                                                    false)
                                                ? _paymentMethodViewModel
                                                        ?.rewardPoint.value ??
                                                    0
                                                : 0,
                                          );
                                        } else if (_paymentMethodViewModel
                                                ?.paymentModule ==
                                            PaymentModule.standAlone) {
                                          return PaymentPriceDetailWrapper(
                                            promoType: cartResponse
                                                    ?.packageDetail
                                                    .pricingInfo
                                                    .discountCouponDetail
                                                    .promoType ??
                                                '0',
                                            paymentModule:
                                                PaymentModule.standAlone,
                                            expressFareAmount: pricingInfo
                                                    ?.totalExpressFare
                                                    ?.baseFare ??
                                                0,
                                            totalMRP: cartResponse
                                                ?.standaloneProductDetails
                                                .pricingInfo
                                                .totalBaseFare
                                                .amount,
                                            cGst: cartResponse?.totalTax.cgst,
                                            sGst: cartResponse?.totalTax.sgst,
                                            totalAmount: cartResponse
                                                ?.standaloneProductDetails
                                                .pricingInfo
                                                .totalFare
                                                .amount,
                                            discountAmount: pricingInfo
                                                ?.discountCouponDetail
                                                .couponDiscountAmount,
                                            //showApplyCoupon: true,
                                            packageName: cartResponse
                                                ?.standaloneProductDetails.name,
                                            shakeKey: shakeKey,
                                            reward: (_paymentMethodViewModel
                                                        ?.isRedeemPointsChecked ??
                                                    false)
                                                ? _paymentMethodViewModel
                                                        ?.rewardPoint.value ??
                                                    0
                                                : 0,
                                          );
                                        } else if (_paymentMethodViewModel
                                                ?.paymentModule ==
                                            PaymentModule.cabBooking) {
                                          return PaymentPriceDetailWrapper(
                                            paymentModule:
                                                PaymentModule.cabBooking,
                                            shakeKey: shakeKey,
                                            cabPriceInfo:
                                                _paymentMethodViewModel
                                                    ?.cabCartDetailResponseModel
                                                    ?.cartDetail
                                                    ?.priceInfo,
                                            discountAmount:
                                                _paymentMethodViewModel
                                                    ?.cabCartDetailResponseModel
                                                    ?.cartDetail
                                                    ?.promoDetails
                                                    ?.promoValue
                                                    ?.toDouble(),
                                            totalAmount: _paymentMethodViewModel
                                                ?.getTotalAmount(),
                                            reward: ((_paymentMethodViewModel
                                                                ?.isRedeemPointsChecked ??
                                                            false)
                                                        ? _paymentMethodViewModel
                                                                ?.rewardPoint
                                                                .value ??
                                                            0
                                                        : 0) >
                                                    (_paymentMethodViewModel
                                                            ?.totalAmountToDisplayAtBottom ??
                                                        0)
                                                ? _paymentMethodViewModel
                                                        ?.totalAmountToDisplayAtBottom ??
                                                    0
                                                : (_paymentMethodViewModel
                                                            ?.isRedeemPointsChecked ??
                                                        false)
                                                    ? _paymentMethodViewModel
                                                            ?.rewardPoint
                                                            .value ??
                                                        0
                                                    : 0,
                                          );
                                        } else {
                                          return PaymentPriceDetailWrapper(
                                            paymentModule:
                                                PaymentModule.dutyFree,
                                            priceDetailList:
                                                value.priceDetailsList,
                                            totalAmount: value.totalAmount,
                                            shakeKey: shakeKey,
                                            reward: (_paymentMethodViewModel
                                                        ?.isRedeemPointsChecked ??
                                                    false)
                                                ? _paymentMethodViewModel
                                                        ?.rewardPoint.value ??
                                                    0
                                                : 0,
                                          );
                                        }
                                      },
                                    ),
                                    LoyaltyPointsComponent(
                                      points: rewardsPoints,
                                      bottomMargin: context.k_20,
                                      topMargin: context.k_20,
                                    ).paddingBySide(
                                      left: context.k_16,
                                      right: context.k_16,
                                    ),
                                    if ((_paymentMethodViewModel
                                                ?.isRedeemPointsChecked ??
                                            false) &&
                                        ((_paymentMethodViewModel
                                                    ?.checkLoyalityPoint ??
                                                0) >
                                            0))
                                      Container(
                                        height: 1,
                                        color: context.adColors.paleGrey,
                                      ).paddingBySide(
                                        left: context.k_16,
                                        right: context.k_16,
                                      )
                                    else if (!(_paymentMethodViewModel
                                                ?.isRedeemPointsChecked ??
                                            false) &&
                                        ((_paymentMethodViewModel
                                                    ?.unCheckLoyalityPoint ??
                                                0) >
                                            0))
                                      Container(
                                        height: 1,
                                        color: context.adColors.paleGrey,
                                      ).paddingBySide(
                                        left: context.k_16,
                                        right: context.k_16,
                                      ),
                                    ShowSafeSecureWidget(
                                      paymentMethodViewModel:
                                          _paymentMethodViewModel ??
                                              PaymentMethodState(),
                                    ),
                                  ],
                                ),
                              ),
                              if (_paymentMethodViewModel?.isPaymentConfirmed ??
                                  false) ...[
                                Center(
                                  child: ADSizedBox(
                                    height: context.k_20,
                                    child: const ADDotProgressView(),
                                  ),
                                ),
                              ],
                            ],
                          ),
              ),
            ),
            bottomNavigationBar: Selector<PaymentMethodState, bool>(
              selector: (context, model) => model.isRedeemPointsChecked,
              builder: (context, model, child) {
                return value.itenaryResponseState.viewStatus != Status.loading
                    ? ValueListenableBuilder(
                        valueListenable:
                            context.read<AppSessionState>().rewardBalance,
                        builder: (context, num values, child) {
                          switch (_paymentMethodViewModel?.paymentModule) {
                            case PaymentModule.flight:
                              return flightViewItineraryResponseModel != null
                                  ? PaymentBottomNavigationButton(
                                      controllerAll: controllerAll,
                                      flightViewItineraryResponseModel:
                                          flightViewItineraryResponseModel,
                                      totalAmount: _paymentMethodViewModel
                                              ?.getTotalAmount() ??
                                          0,
                                      paymentMethodViewModel:
                                          _paymentMethodViewModel ??
                                              PaymentMethodState(),
                                      shakeKey: shakeKey,
                                      globalKey: formKey,
                                      keyForUpi: formKeyForUpi,
                                      flightReviewDetailInfo:
                                          flightReviewDetailInfo,
                                      rewardPoint: (_paymentMethodViewModel
                                                  ?.isRedeemPointsChecked ??
                                              false)
                                          ? _paymentMethodViewModel
                                                  ?.calculateLoyaltyAmountToPay(
                                                (flightViewItineraryResponseModel
                                                            ?.pricingSummary
                                                            ?.totalFare ??
                                                        0)
                                                    .toDouble(),
                                              ) ??
                                              0
                                          : 0,
                                      globalKeyForFocus: globalKeyForFocus,
                                      globalKeyForUpiFocus:
                                          globalKeyForUpiFocus,
                                      couponCode: '${getCouponCode(context)} ',
                                      discountAmount: getCouponAmount(context),
                                      excludedAmount: _paymentMethodViewModel
                                              ?.excludedAmount ??
                                          0,
                                    )
                                  : const SizedBox.shrink();
                            default:
                              return PaymentBottomNavigationButton(
                                totalAmount: _totalAmount(
                                  grossAmount:
                                      _paymentMethodViewModel?.totalAmount ?? 0,
                                  rewardPoints: double.parse(getBalance()),
                                  rewardCheck: _paymentMethodViewModel
                                          ?.isRedeemPointsChecked ??
                                      false,
                                ),
                                paymentMethodViewModel:
                                    _paymentMethodViewModel ??
                                        PaymentMethodState(),
                                shakeKey: shakeKey,
                                globalKey: formKey,
                                keyForUpi: formKeyForUpi,
                                rewardPoint: (_paymentMethodViewModel
                                            ?.isRedeemPointsChecked ??
                                        false)
                                    ? _paymentMethodViewModel
                                            ?.rewardPoint.value ??
                                        0
                                    : 0,
                                controllerAll: controllerAll,
                                globalKeyForFocus: globalKeyForFocus,
                                globalKeyForUpiFocus: globalKeyForUpiFocus,
                                couponCode: '${getCouponCode(context)} ',
                                discountAmount: getCouponAmount(context),
                              );
                          }
                        },
                      )
                    : const ADSizedBox.shrink();
              },
            ),
          );
        },
      ).onTap(() => FocusScope.of(context).unfocus()),
    );
  }

  double _totalAmount({
    required double grossAmount,
    required double rewardPoints,
    required bool rewardCheck,
  }) {
    return rewardCheck
        ? rewardPoints > grossAmount
            ? 0
            : grossAmount - rewardPoints
        : grossAmount;
  }

  bool _isPaymentByLoyaltyOnly(double totalPrice) {
    final double excludedAmount = (_paymentMethodViewModel?.rewardPoint.value ??
                0) >=
            (flightViewItineraryResponseModel?.pricingSummary?.totalFare ?? 0)
                .toDouble()
        ? (_paymentMethodViewModel?.travelInsuranceAmount ?? 0).toDouble() +
            (_paymentMethodViewModel?.zeroCancellationAmount ?? 0).toDouble()
        : 0;
    return _paymentMethodViewModel?.isRedeemPointsChecked == true &&
        (_getBalance(context) > totalPrice - excludedAmount) &&
        excludedAmount < 1;
  }

  String getBalance() {
    final AppSessionState appSessionState = context.read<AppSessionState>();
    return appSessionState.loyaltyPoint;
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return context.adColors.greyCircleColor;
    }
    return context.adColors.blackTextColor;
  }

  void callViewItinerary() {
    showDraggableListBottomSheet(
      context: context,
      headerTitle: 'booking_details',
    );
  }

  void showDraggableListBottomSheet({
    required BuildContext context,
    required String headerTitle,
  }) {
    const double minChildSize = 0.78;
    ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: tripType == TripType.oneWay
            ? minChildSize
            : ADDraggableScrollableSheetBody.minChildSize,
        maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
        minChildSize: tripType == TripType.oneWay
            ? minChildSize
            : ADDraggableScrollableSheetBody.minChildSize,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return ADDraggableScrollableSheetBody(
            headerTitle: headerTitle,
            childWidget: SafeArea(
              child: ShowReviewFlightDetails(
                reviewScreenType: ReviewScreenType.flightPayment,
                flightViewItineraryResponseModel:
                    _paymentMethodViewModel?.flightViewItineraryResponseModel,
                scrollController: scrollController,
                paymentMethodViewModel: _paymentMethodViewModel,
              ),
            ),
          );
        },
      ),
    ).then((value) {
      if (value == 0) {
        navigateToScreenUsingNamedRoute(
          context,
          loyaltyDashboard,
          rootNavigator: false,
        );
      }
    });
  }

  double _getBalance(BuildContext context) {
    final AppSessionState appSessionState = context.read<AppSessionState>();
    return double.parse(
      appSessionState.loyaltyPoint,
    );
  }

  num getLoyaltyPoints(
    PaymentModule paymentModule,
    BuildContext context,
  ) {
    adLog('$paymentModule');
    adLog('$context');

    return _paymentMethodViewModel?.isRedeemPointsChecked ?? false
        ? _paymentMethodViewModel?.checkLoyalityPoint ?? 0
        : _paymentMethodViewModel?.unCheckLoyalityPoint ?? 0;

    // if (paymentModule == PaymentModule.flight) {
    //   return flightViewItineraryResponseModel?.loyaltyPotentialPoint ?? 0;
    // } else if (paymentModule == PaymentModule.dutyFree) {
    //   return context
    //           .read<DutyFreeState>()
    //           .dutyFreeCartResponse
    //           ?.loyaltyPotentialPoint ??
    //       0;
    // } else if (paymentModule == PaymentModule.pranaam) {
    //   return cartResponse?.potentialLoyaltyEarning ?? 0;
    // } else {
    //   return 0;
    // }
  }

// double _getAmountPayable() {
//   double total = 0;
//   for (final element in _pricedList) {
//     total = total + (element.priceInfo.totalFare?.amount ?? 0).toDouble();
//   }
//   return total;
// }
}

void _fareChangePopUp({
  required BuildContext context,
  required double oldPrice,
  required PricingSummary currentPricingSummary,
  required PriceChangeType priceChangeType,
  required ADTapCallback onOkPressedCallBack,
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
      final double mainObjTotalPrice = oldPrice;
      final PricingSummary? pricingSummary = currentPricingSummary;
      final String popUpContent = priceChangeType == PriceChangeType.I
          ? 'flight_increased_content'.localize(context)
          : 'flight_decreased_content'.localize(context);
      return FareUpdatePopup(
        detailString: '$popUpContent${FlightUtils.getPriceFormatWithSymbol(
          price: mainObjTotalPrice.toDouble(),
        )} to ${FlightUtils.getPriceFormatWithSymbol(
          price: pricingSummary?.totalFare?.toDouble() ?? 0.0,
        )}',
        titleString: priceChangeType == PriceChangeType.I
            ? 'fare_increased'.localize(context)
            : 'fare_decreased'.localize(context),
        onCrossCallback: () => navigatorPopScreenUntil(
          context,
          ModalRoute.withName(flightBooking),
        ),
        onChangeCallBack: () => navigatorPopScreenUntil(
          context,
          ModalRoute.withName(flightListingScreen),
        ),
        onProceedCallBack: onOkPressedCallBack,
      );
    },
  );
}
