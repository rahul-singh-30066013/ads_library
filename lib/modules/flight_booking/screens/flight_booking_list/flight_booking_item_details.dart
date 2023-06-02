/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';
import 'dart:ui';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/important_information_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/booking_payment_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/pricing_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/loyalty_points.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/booking_confirmation.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/pranaam_banner_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/pranaam_banner_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/views/fare_refund_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/views/show_flight_booking_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_list/views/booking_detail_header_sliver.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_list/views/itinerary_email_popup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_list/views/show_important_information.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/header_dialog.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/wallet/repository/wallet_state.dart';
import 'package:adani_airport_mobile/modules/wallet/view/add_to_wallet_button.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double _expandedAppBarHeight = 270.sp;

final double bookingConfirmExpandedHeight = 206.sp;

class FlightBookingItemDetails extends StatefulWidget {
  final String orderRefID;
  final String? cancelId;

  const FlightBookingItemDetails({
    Key? key,
    required this.orderRefID,
    this.cancelId,
  }) : super(key: key);

  @override
  State<FlightBookingItemDetails> createState() =>
      _FlightBookingItemDetailsState();
}

class _FlightBookingItemDetailsState extends State<FlightBookingItemDetails> {
  final FlightBookingConfirmationState flightBookingConfirmationState =
      FlightBookingConfirmationState();
  WalletState walletState = WalletState();
  int textMaxLines = 2;
  double borderRadius = 4;
  final double spacingBetweenWidgets = 20.sp;

  final double mediumSpacingBetweenWidgets = 40.sp;

  final double largeSpacingBetweenWidgets = 52.sp;

  final double bottomNavBarHeight = 71.sp;

  final double iconSize = 20.sp;

  final int transactionPoints = 21;
  String pnrNo = '';
  double totalBaseFare = 0;
  double totalTaxes = 0;
  double totalFees = 0;
  double totalAmount = 0;

  final Color greyBackgroundColor = const Color(0xfffbfbfb);

  final double fontSize = 15;

  final double statusFontSize = 11;

  final double opacity = 0.07;

  final double bottomPadding = 20.sp;
  String endPointURL = '';

  @override
  void initState() {
    super.initState();
    context.read<AppSessionState>().flightBookingType = FlightBookingType.none;
    flightBookingConfirmationState.viewTripDetails(widget.orderRefID);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<AppSessionState>().getUpcomingBookings();
      },
    );
  }

  Future<void> _pullRefresh() async {
    await flightBookingConfirmationState.viewTripDetails(
      widget.orderRefID,
      pullToFresh: true,
    );
  }

  String getPaymentModeText(
    // List<String> modes,
    String modes,
    BuildContext context,
  ) {
    // final _modes = modes;
    // final combinedString =
    //     _modes.map((val) => val.toLowerCase().localize(context)).join(' + ');
    return '${'paid_with'.localize(context)} $modes';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: ADSelectorStateLessWidget<FlightBookingConfirmationState>(
        key: const Key('BookingConfirmation'),
        viewModel: flightBookingConfirmationState,
        child: Scaffold(
          body: Selector<FlightBookingConfirmationState, ADResponseState>(
            selector: (context, viewModel) =>
                viewModel.flightBookingConfirmation,
            builder: (context, value, Widget? child) {
              switch (value.viewStatus) {
                case Status.loading:
                  return BookingConfirmationShimmer(
                    isReviewHeader: true,
                  );
                case Status.error:
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                    ),
                    body: NoInternetView(
                      statusCode: value.errorCode.toString(),
                      pageMainDesc: value.errorCode.isNullOrEmpty
                          ? 'oops_something_went_wrong'.localize(context)
                          : value.errorCode.toString() == '51'
                              ? 'cant_find_you'.localize(context)
                              : value.errorCode.toString().localize(context),
                      pageSubDesc: value.errorCode.isNullOrEmpty
                          ? ''
                          : value.errorCode.toString() == '51'
                              ? 'please_check_your_internet'.localize(context)
                              : '',
                    ),
                  );
                case Status.complete:
                  final FlightViewTripResponseModel?
                      flightBookingResponseModel =
                      flightBookingConfirmationState
                          .commonOrderDetailBaseResponse
                          .orderDetail
                          ?.flightbookingDetail;
                  flightBookingResponseModel?.orderReferenceId =
                      flightBookingConfirmationState
                          .commonOrderDetailBaseResponse.orderReferenceId;
                  final ItineraryContactDetail? contactDetail =
                      flightBookingResponseModel?.contactDetail;
                  final List<PricingBreakup> pricingBreakup =
                      flightBookingResponseModel?.paymentDetails
                              ?.bookingPaymentBreakup?.pricingBreakup ??
                          [];
                  totalBaseFare = _getTotalBaseFare(pricingBreakup);
                  totalTaxes = _getTotalTax(pricingBreakup);
                  totalFees = _getTotalFees(pricingBreakup);
                  totalAmount = _getAmountPayable();
                  final String countryCode =
                      contactDetail?.contactNumber?.first.countryAccessCode ??
                          '';
                  final String phoneNo =
                      contactDetail?.contactNumber?.first.phoneNumber ?? '';
                  flightBookingConfirmationState.contactNo =
                      countryCode.isNotEmpty
                          ? '$countryCode-$phoneNo'
                          : phoneNo;
                  final getOrderPaymentModes = flightBookingConfirmationState
                      .commonOrderDetailBaseResponse
                      .getOrderedPaymentModes();
                  final isRefundAvailable =
                      flightBookingResponseModel?.isRefundAvailable() ?? false;
                  final flightBookingType =
                      context.read<AppSessionState>().flightBookingType;
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) =>
                            buildReviewDetailsHeader(
                      innerBoxIsScrolled: innerBoxIsScrolled,
                    ),
                    body: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      color: context.adColors.neutralInfoMsg,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        children: [
                          // booking details pnr, id, status
                          SizedBox(
                            height: context.k_4,
                          ),
                          if (flightBookingType == FlightBookingType.none)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: {
                                'status':
                                    flightBookingResponseModel?.orderStatus ??
                                        '',
                                'reference_id':
                                    flightBookingResponseModel?.bookingID ?? '',
                              }
                                  .entries
                                  .map(
                                    (element) => Flexible(
                                      child: Column(
                                        children: [
                                          ADSizedBox(
                                            height: context.k_14,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                element.key.localize(context),
                                                style: ADTextStyle400.size14
                                                    .setTextColor(
                                                      context.adColors
                                                          .greyTextColor,
                                                    )
                                                    .setFontSize(fontSize),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              // Rectangle 2
                                              if (element.key == 'status')
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: context.k_8,
                                                    vertical: context.k_4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                    color: FlightUtils
                                                        .getBookingStatusTypeColor(
                                                      element.value,
                                                      context,
                                                    ).withOpacity(opacity),
                                                  ),
                                                  child: Text(
                                                    element.value.toUpperCase(),
                                                    style: ADTextStyle500.size16
                                                        .setTextColor(
                                                          FlightUtils
                                                              .getBookingStatusTypeColor(
                                                            element.value,
                                                            context,
                                                          ),
                                                        )
                                                        .setFontSize(
                                                          statusFontSize,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              else
                                                Text(
                                                  element.value,
                                                  style: ADTextStyle500.size16
                                                      .setTextColor(
                                                    context.adColors
                                                        .neutralInfoMsg,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            ],
                                          ),
                                          ADSizedBox(
                                            height: context.k_14,
                                          ),
                                          const Divider(
                                            height: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                            )
                          else
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: {
                                'booking_id': flightBookingResponseModel
                                        ?.orderReferenceId ??
                                    '',
                                'reference_id': flightBookingConfirmationState
                                        .commonOrderDetailBaseResponse
                                        .orderDetail
                                        ?.flightbookingDetail
                                        ?.bookingID ??
                                    '',
                                'status':
                                    flightBookingResponseModel?.orderStatus ??
                                        '',
                              }
                                  .entries
                                  .map(
                                    (element) => Flexible(
                                      child: Column(
                                        children: [
                                          ADSizedBox(
                                            height: context.k_14,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                element.key.localize(context),
                                                style: ADTextStyle400.size14
                                                    .setTextColor(
                                                      context.adColors
                                                          .greyTextColor,
                                                    )
                                                    .setFontSize(fontSize),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              // Rectangle 2
                                              if (element.key == 'status')
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: context.k_8,
                                                    vertical: context.k_4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                    color: FlightUtils
                                                        .getBookingStatusTypeColor(
                                                      element.value,
                                                      context,
                                                    ).withOpacity(opacity),
                                                  ),
                                                  child: Text(
                                                    element.value.toUpperCase(),
                                                    style: ADTextStyle500.size16
                                                        .setTextColor(
                                                          FlightUtils
                                                              .getBookingStatusTypeColor(
                                                            element.value,
                                                            context,
                                                          ),
                                                        )
                                                        .setFontSize(
                                                          statusFontSize,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              else
                                                Text(
                                                  element.value,
                                                  style: ADTextStyle500.size16
                                                      .setTextColor(
                                                    context.adColors
                                                        .neutralInfoMsg,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            ],
                                          ),
                                          ADSizedBox(
                                            height: context.k_14,
                                          ),
                                          const Divider(
                                            height: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                            ),

                          if ((flightBookingResponseModel?.isZeroCancellation ??
                                  false) &&
                              flightBookingResponseModel?.orderStatus
                                      ?.toLowerCase() !=
                                  'failed')
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'zero_cancellation'.localize(context),
                                      style: ADTextStyle400.size14
                                          .setTextColor(
                                            context.adColors.greyTextColor,
                                          )
                                          .setFontSize(fontSize),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'included'.localize(context),
                                          style: ADTextStyle500.size14
                                              .setTextColor(
                                                context.adColors.black,
                                              )
                                              .setFontSize(fontSize),
                                        ),
                                        SvgPicture.asset(
                                          SvgAssets.zeroCancellationIcon,
                                          height: context.k_20,
                                          width: context.k_22,
                                        ).paddingBySide(
                                          left: context.k_6,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ADSizedBox(
                                  height: context.k_14,
                                ),
                                const Divider(
                                  height: 1,
                                ),
                              ],
                            ).paddingBySide(
                              top: context.k_16,
                              left: context.k_16,
                              right: context.k_16,
                            ),
                          if (flightBookingResponseModel
                                  ?.isAddToWalletEnabled() ??
                              false)
                            AddToWalletButton(
                              onTapHandler: () => {
                                HapticFeedback.mediumImpact(),
                                walletState.getApplePassbookForFlight(
                                  '${FLightsApiUrls.getApplePassBook}/${widget.orderRefID}',
                                  context,
                                  flightBookingConfirmationState
                                      .flightbookingDetail?.tripType,
                                ),
                              },
                            ),
                          if (isRefundAvailable)
                            SizedBox(
                              height: context.k_20,
                            ),
                          if (isRefundAvailable)
                            FareRefundDetails(
                              orderStatus:
                                  flightBookingResponseModel?.orderStatus ?? '',
                              paymentDetails:
                                  flightBookingResponseModel?.paymentDetails,
                              isEnableZeroCancellation:
                                  flightBookingResponseModel
                                      ?.isZeroCancellation,
                              cancellationClaimActive:
                                  flightBookingResponseModel
                                      ?.cancellationClaimActive,
                              cancellationClaimURL: flightBookingResponseModel
                                  ?.cancellationClaimURL,
                              cancellationClaimDate: flightBookingResponseModel
                                  ?.cancellationClaimDate,
                              isInfantCancelOnly: flightBookingResponseModel
                                  ?.isInfantCancelOnly,
                              flightBookingType: context
                                  .read<AppSessionState>()
                                  .flightBookingType,
                              // cancelId: widget.cancelId,
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                            ),
                          SizedBox(
                            height: context.k_30,
                          ),
                          ShowFlightBookingDetails(
                            bookingConfirmationScreenType:
                                BookingConfirmationScreenType
                                    .flightBookingOrder,
                            flightBookingResponseModel:
                                flightBookingResponseModel ??
                                    FlightViewTripResponseModel(),
                          ),

                          Selector<FlightBookingConfirmationState,
                              ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.pranaamUpSellState,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.loading:
                                  return Center(
                                    child: PranaamBannerShimmer()
                                        .paddingBySide(top: context.k_40),
                                  );
                                case Status.error:
                                  return const SizedBox.shrink();
                                case Status.complete:
                                  final List<UpSellLink> responseOfferList =
                                      (value.data as PranaamBannerModel)
                                              .offerLink ??
                                          [];
                                  return responseOfferList.isNotEmpty
                                      ? PranaamBannerView(
                                          item: responseOfferList,
                                        ).paddingBySide(
                                          top: context.k_24,
                                          bottom: context.k_24,
                                        )
                                      : const SizedBox.shrink();
                                default:
                                  return Container();
                              }
                            },
                          ),

                          if (((flightBookingResponseModel?.orderStatus ?? '')
                                      .toLowerCase() ==
                                  'cancelled') ||
                              ((flightBookingResponseModel?.orderStatus ?? '')
                                      .toLowerCase() ==
                                  'failed') ||
                              ((flightBookingResponseModel?.orderStatus ?? '')
                                      .toLowerCase() ==
                                  'pending'))
                            const SizedBox.shrink()
                          else
                            Selector<FlightBookingConfirmationState, bool>(
                              selector: (context, viewModel) =>
                                  viewModel.isEarnPointsLoading,
                              builder: (
                                context,
                                isEarnPointsLoading,
                                Widget? child,
                              ) {
                                return LoyaltyPointsComponent(
                                  points: flightBookingConfirmationState
                                          .commonOrderDetailBaseResponse
                                          .earning
                                          ?.total ??
                                      0,
                                  routeThankYou: true,
                                  loyaltyShowScreenType:
                                      LoyaltyShowScreenType.flight,
                                  isEarnPointsLoading: isEarnPointsLoading,
                                  routeConfirmation:
                                      flightBookingConfirmationState
                                          .commonOrderDetailBaseResponse
                                          .isRewardEarned,
                                ).paddingBySide(
                                  left: context.k_16,
                                  right: context.k_16,
                                  bottom: context.k_32,
                                );
                              },
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'fare_summary'.localize(context),
                                    style: ADTextStyle700.size22.setTextColor(
                                      context.adColors.filterBlackText,
                                    ),
                                  ),
                                ],
                              ),
                              Semantics(
                                label: '',
                                container: true,
                                child: Row(
                                  key: const Key(
                                    FlightAutomationKeys.adRowKey,
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'base_fare'.localize(context),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      FlightUtils.getPriceFormatWithSymbol(
                                        price: flightBookingResponseModel
                                                ?.paymentDetails
                                                ?.bookingPaymentBreakup
                                                ?.calculatedAirfareCharges ??
                                            0,
                                      ),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(top: context.k_20),
                              ),
                              Semantics(
                                label: '',
                                container: true,
                                child: Row(
                                  key: const Key(
                                    FlightAutomationKeys.adRowKey,
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'taxes_and_fees'.localize(context),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      FlightUtils.getPriceFormatWithSymbol(
                                        price: flightBookingResponseModel
                                                ?.paymentDetails
                                                ?.bookingPaymentBreakup
                                                ?.calculateTaxFees ??
                                            0,
                                      ),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(
                                  top: context.k_16,
                                ),
                              ),
                              if ((flightBookingResponseModel?.paymentDetails
                                              ?.travelInsuranceFare ??
                                          0)
                                      .toDouble() >
                                  0)
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    key: const Key(
                                      FlightAutomationKeys.adRowKey,
                                    ),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'travel_insurance'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        FlightUtils.getPriceFormatWithSymbol(
                                          price: (flightBookingResponseModel
                                                      ?.paymentDetails
                                                      ?.travelInsuranceFare ??
                                                  0)
                                              .toDouble(),
                                        ),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ).paddingBySide(
                                    top: context.k_16,
                                  ),
                                ),
                              if (flightBookingResponseModel
                                      ?.isZeroCancellation ??
                                  false)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'zero_cancellation'.localize(context),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      FlightUtils.getPriceFormatWithSymbol(
                                        price: (flightBookingResponseModel
                                                    ?.paymentDetails
                                                    ?.zeroCancellationFee ??
                                                0)
                                            .toDouble(),
                                      ),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(top: context.k_20),
                              if (flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .isPromoApplied() >
                                  0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'coupon_discount'.localize(context),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      '- ${FlightUtils.getPriceFormatWithSymbol(
                                        price: flightBookingConfirmationState
                                            .commonOrderDetailBaseResponse
                                            .isPromoApplied(),
                                      )}',
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.greenTextColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(
                                  top: context.k_16,
                                ),
                              if (flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .isLoyaltyApplied() >
                                  0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'reward_points'.localize(context),
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      '- ${FlightUtils.getPriceFormatWithSymbol(
                                        price: flightBookingConfirmationState
                                            .commonOrderDetailBaseResponse
                                            .isLoyaltyApplied(),
                                      )}',
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.darkGreenColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(
                                  top: context.k_16,
                                ),
                              if ((flightBookingResponseModel?.ccfApplied ??
                                      0) >=
                                  0)
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    key: const Key(
                                      FlightAutomationKeys.adRowKey,
                                    ),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'convenienceFee'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        FlightUtils.getPriceFormatWithSymbol(
                                          price: flightBookingResponseModel
                                                  ?.ccfApplied ??
                                              0,
                                        ),
                                        style: ADTextStyle500.size16,
                                      ),
                                    ],
                                  ).paddingBySide(top: context.k_16),
                                )
                              else
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    key: const Key(
                                      FlightAutomationKeys.adRowKey,
                                    ),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'convenienceFee'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        FlightUtils.getPriceFormatWithSymbol(
                                          price: flightBookingResponseModel
                                                  ?.cCFFee ??
                                              0,
                                        ),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ).paddingBySide(top: context.k_16),
                                ),
                              Container(
                                color: context.adColors.tileBorderColor,
                                height: 1,
                              ).paddingBySide(top: context.k_16),
                              Semantics(
                                label: '',
                                container: true,
                                child: Row(
                                  key: const Key(
                                    FlightAutomationKeys.adRowKey,
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total_amount_paid'.localize(context),
                                      style: ADTextStyle700.size18.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      FlightUtils.getPriceFormatWithSymbol(
                                        price: (flightBookingResponseModel
                                                    ?.paymentDetails
                                                    ?.bookingPaymentBreakup
                                                    ?.total ??
                                                0)
                                            .toDouble(),
                                      ),
                                      style: ADTextStyle700.size18.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(
                                  top: context.k_16,
                                  bottom: context.k_16,
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                          if (getOrderPaymentModes.isNotEmpty)
                            Container(
                              padding: EdgeInsets.only(
                                top: context.k_16,
                                bottom: context.k_16,
                                left: context.k_20,
                                right: context.k_20,
                              ),
                              width: context.widthOfScreen,
                              decoration: BoxDecoration(
                                color:
                                    context.adColors.lightGreyBackgroundColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'lib/assets/images/svg/icons/flight/credit_card.svg',
                                    height: context.k_18,
                                    color: context.adColors.greyCircleColor,
                                  ),
                                  SizedBox(
                                    width: context.k_12,
                                  ),
                                  Text(
                                    getPaymentModeText(
                                      getOrderPaymentModes,
                                      context,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: ADTextStyle500.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            height: context.k_20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'contact_details'.localize(context),
                                style: ADTextStyle700.size22.setTextColor(
                                  context.adColors.filterBlackText,
                                ),
                              ),
                              SizedBox(
                                height: spacingBetweenWidgets,
                              ),
                              Text(
                                'mobile_number'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                              ),
                              SizedBox(
                                height: context.k_6,
                              ),
                              Text(
                                '${flightBookingConfirmationState.contactNo}',
                                style: ADTextStyle600.size16.setTextColor(
                                  context.adColors.filterBlackText,
                                ),
                              ),
                              SizedBox(
                                height: context.k_20,
                              ),
                              Text(
                                'email_id'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                              ),
                              SizedBox(
                                height: context.k_6,
                              ),
                              Text(
                                contactDetail?.email?.first.emailId ?? '',
                                style: ADTextStyle600.size16.setTextColor(
                                  context.adColors.filterBlackText,
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                            top: spacingBetweenWidgets,
                          ),

                          Selector<FlightBookingConfirmationState,
                              ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.pranaamUpSellState,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.loading:
                                  return Center(
                                    child: PranaamBannerShimmer()
                                        .paddingBySide(top: context.k_40),
                                  );
                                case Status.error:
                                  return const SizedBox.shrink();
                                case Status.complete:
                                  final List<UpSellLink> responseUpsellList =
                                      (value.data as PranaamBannerModel)
                                              .upSellLink ??
                                          [];

                                  return responseUpsellList.isNotEmpty
                                      ? PranaamBannerView(
                                          item: responseUpsellList,
                                        ).paddingBySide(top: context.k_24)
                                      : const SizedBox.shrink();
                                default:
                                  return Container();
                              }
                            },
                          ),
                          //to show important information
                          Selector<FlightBookingConfirmationState,
                              ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.importantInformation,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.loading:
                                  return ImportantInformationShimmer()
                                      .paddingBySide(
                                    top: context.k_32,
                                    left: context.k_8,
                                  );
                                case Status.error:
                                  return const SizedBox.shrink();
                                case Status.complete:
                                  return ShowImportantInformation(
                                    flightBookingResponseModel:
                                        flightBookingResponseModel ??
                                            FlightViewTripResponseModel(),
                                  );
                                default:
                                  return const SizedBox.shrink();
                              }
                            },
                          ),
                          ADSizedBox(
                            height: context.k_16,
                          ),
                        ],
                      ),
                    ),
                  );
                case Status.none:
                  return const SizedBox.shrink();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          bottomNavigationBar:
              Selector<FlightBookingConfirmationState, ADResponseState>(
            selector: (context, viewModel) =>
                viewModel.flightBookingConfirmation,
            builder: (context, value, Widget? child) {
              return value.viewStatus == Status.complete
                  ? BottomBarItem(
                      flightBookingResponseModel:
                          flightBookingConfirmationState.flightbookingDetail ??
                              FlightViewTripResponseModel(),
                      refreshCallBack: _refreshCallBackOnCancellation,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  List<Widget> buildReviewDetailsHeader({
    required bool innerBoxIsScrolled,
  }) {
    final flightBookingType = context.read<AppSessionState>().flightBookingType;
    return [
      if (flightBookingType == FlightBookingType.none)
        buildReviewHeader(
          context,
          flightBookingConfirmationState
              .commonOrderDetailBaseResponse.orderDetail?.flightbookingDetail,
          innerBoxIsScrolled: innerBoxIsScrolled,
        )
      else
        buildUpdateBookingHeader(
          innerBoxIsScrolled: innerBoxIsScrolled,
        ),
    ];
  }

  dynamic buildReviewHeader(
    BuildContext context,
    FlightViewTripResponseModel? flightViewTripResponseModel, {
    required bool innerBoxIsScrolled,
  }) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.adColors.transparentColor,
      ),
      expandedHeight:
          /*value.viewStatus == Status.loading ? 0 :*/ _expandedAppBarHeight,
      pinned: true,
      backgroundColor: innerBoxIsScrolled
          ? context.adColors.whiteTextColor
          : context.adColors.blueColor,
      // elevation: 0,
      leading: IconButton(
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
          color: innerBoxIsScrolled
              ? context.adColors.blackTextColor
              : context.adColors.whiteTextColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        innerBoxIsScrolled
            ? '${'booking_id'.localize(context)} \n${flightViewTripResponseModel?.orderReferenceId ?? ''}'
            : '',
        style: ADTextStyle700.size16.setTextColor(
          innerBoxIsScrolled
              ? context.adColors.blackTextColor
              : context.adColors.whiteTextColor,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Utils.helpBottomSheet(
            context,
            Utils.getHelpContactDetail(),
          ),
          child: Text(
            'help'.localize(context),
            style: ADTextStyle600.size14.setTextColor(
              innerBoxIsScrolled
                  ? context.adColors.blackTextColor
                  : context.adColors.whiteTextColor,
            ),
          ).paddingBySide(
            right: context.k_12,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        centerTitle: true,
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // if (value.viewStatus != Status.loading)
            Image.asset(
              'lib/assets/images/flight/flight_my_booking_new.png',
              width: double.infinity,
              height: _expandedAppBarHeight +
                  MediaQueryData.fromWindow(window).padding.top,
              fit: BoxFit.cover,
            ),
            Selector<FlightBookingConfirmationState, ADResponseState>(
              selector: (context, viewModel) =>
                  viewModel.flightBookingConfirmation,
              builder: (context, value, Widget? child) {
                if (value.viewStatus == Status.complete) {
                  CommonOrderDetailBaseResponse res =
                      CommonOrderDetailBaseResponse();
                  res = value.data;
                  final siteCore = context.read<SiteCoreStateManagement>();
                  final FlightViewTripResponseModel? flightBookingDetails =
                      res.orderDetail?.flightbookingDetail;

                  final ItineraryContactDetail? contactDetail =
                      flightBookingDetails?.contactDetail;
                  final FlightReviewDetailModel? flightReviewDetailModel =
                      flightBookingDetails?.flightReviewDetailModel;
                  final List<FlightReviewDetailInfo> flightReviewDetailInfo =
                      flightReviewDetailModel?.flightReviewDetailInfo ?? [];
                  final String countryCode =
                      contactDetail?.contactNumber?.first.countryAccessCode ??
                          '';
                  final String phoneNo =
                      contactDetail?.contactNumber?.first.phoneNumber ?? '';
                  flightBookingConfirmationState.contactNo =
                      countryCode.isNotEmpty
                          ? '$countryCode-$phoneNo'
                          : phoneNo;
                  return BookingDetailHeaderSliver(
                    fromLocation:
                        '${siteCore.airportCityMap[flightReviewDetailInfo.first.passengerJourneyInfo?.fromLocation]?.cityName}',
                    tripId: flightBookingDetails?.orderReferenceId ?? '',
                    toLocation:
                        '${siteCore.airportCityMap[flightReviewDetailInfo.first.passengerJourneyInfo?.toLocation]?.cityName}',
                    isOneway:
                        flightBookingDetails?.tripType == ItineraryTripType.O,
                  );
                } else {
                  return const ADSizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  dynamic buildUpdateBookingHeader({
    required bool innerBoxIsScrolled,
  }) {
    return Selector<FlightBookingConfirmationState, ADResponseState>(
      selector: (context, viewModel) => viewModel.flightBookingConfirmation,
      builder: (context, value, Widget? child) {
        if (value.viewStatus == Status.complete) {
          CommonOrderDetailBaseResponse res = CommonOrderDetailBaseResponse();
          res = value.data;
          final FlightViewTripResponseModel? flightBookingDetails =
              res.orderDetail?.flightbookingDetail;
          final ItineraryContactDetail? contactDetail =
              flightBookingDetails?.contactDetail;
          final String countryCode =
              contactDetail?.contactNumber?.first.countryAccessCode ?? '';
          final String phoneNo =
              contactDetail?.contactNumber?.first.phoneNumber ?? '';
          flightBookingConfirmationState.contactNo =
              countryCode.isNotEmpty ? '$countryCode-$phoneNo' : phoneNo;
          return SliverAppBar(
            backgroundColor: context.adColors.whiteTextColor,
            expandedHeight: value.viewStatus == Status.loading
                ? 0
                : bookingConfirmExpandedHeight,
            pinned: true,
            floating: true,
            titleSpacing: 0,
            leadingWidth: context.k_48,
            leading: GestureDetector(
              onTap: () => navigatorPopScreenUntil(
                context,
                ModalRoute.withName(tabRoute),
              ),
              child: SvgPicture.asset(
                SvgAssets.closeIcon,
                color: innerBoxIsScrolled ||
                        flightBookingDetails?.orderStatus ==
                            'Partially Cancelled'
                    ? Colors.black
                    : Colors.white,
              ).paddingBySide(
                left: context.k_20,
                right: context.k_10,
                bottom: context.k_4,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                innerBoxIsScrolled
                    ? 'Booking ${flightBookingDetails?.orderStatus}'
                    : '',
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.blackTextColor),
              ),
              background: HeaderDialog(
                orderStatus: flightBookingDetails?.orderStatus ?? 'Confirmed',
                bookingDetailMessage:
                    FlightUtils.getBookingStatusTypeDescription(
                  flightBookingDetails?.orderStatus ?? '',
                ),
                backgroundColor: FlightUtils.getBookingStatusTypeColor(
                  flightBookingDetails?.orderStatus ?? '',
                  context,
                ),
                bookingConfirmationMessage:
                    FlightUtils.getBookingStatusTypeMessage(
                  flightBookingDetails?.orderStatus ?? '',
                ),
                emailId: contactDetail?.email?.first.emailId ?? '',
                phoneNumber: flightBookingConfirmationState.contactNo ?? '',
                isForBookingConfirmationScreen: true,
              ),
            ),
          );
        } else {
          return const ADSizedBox.shrink();
        }
      },
    );
  }

  void _refreshCallBackOnCancellation() {
    if (context.read<AppSessionState>().updateBookingValue &&
        context.read<AppSessionState>().flightBookingType !=
            FlightBookingType.none) {
      flightBookingConfirmationState.viewTripDetails(widget.orderRefID);
    }
  }

  double _getTotalBaseFare(List<PricingBreakup> pricingBreakup) {
    double total = 0;
    for (final element in pricingBreakup) {
      total = total + (element.baseFare ?? 0);
    }
    return total;
  }

  double _getTotalTax(List<PricingBreakup> pricingBreakup) {
    double total = 0;
    for (final element in pricingBreakup) {
      total = total + (element.totalTaxes ?? 0);
    }
    return total;
  }

  double _getTotalFees(List<PricingBreakup> pricingBreakup) {
    double total = 0;
    for (final element in pricingBreakup) {
      total = total + (element.convenienceFees ?? 0).toDouble();
    }
    return total;
  }

  double _getAmountPayable() {
    final double total = totalBaseFare + totalTaxes + totalFees;

    return total;
  }

  Color getColorAsPerType(String key, BuildContext context) {
    if (key.isEmpty) {
      return context.adColors.greenColor;
    } else if (key == 'Cancelled' || key == 'Refunded') {
      return context.adColors.red900;
    } else if (key == 'Partially Cancelled') {
      return const Color(0xffeb9845);
    } else {
      return context.adColors.greenColor;
    }
  }

  LoyaltyPoints? getLoyaltyObj(List<PaymentModes?> list) {
    LoyaltyPoints? loyaltyPointsObj;
    if (list.isNotEmpty) {
      for (int index = 0; index < list.length; index++) {
        final PaymentModes? paymentObj = list[index];
        if (paymentObj?.loyaltyPoints != null) {
          loyaltyPointsObj = paymentObj?.loyaltyPoints;
        }
      }
    }
    return loyaltyPointsObj;
  }
}

// to show bottom bar items for booking confirmation item
class BottomBarItem extends StatelessWidget {
  final FlightViewTripResponseModel flightBookingResponseModel;
  final ADTapCallback refreshCallBack;

  const BottomBarItem({
    Key? key,
    required this.flightBookingResponseModel,
    required this.refreshCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double opacity = 0.3;
    final TextEditingController emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return (flightBookingResponseModel.isBottomBarVisible())
        ? Container(
            width: context.widthOfScreen,
            decoration: BoxDecoration(
              color: context.adColors.cardBgColor,
              borderRadius: BorderRadius.circular(context.k_8),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    color: context.adColors.neutralInfoMsg,
                    height: 1.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (flightBookingResponseModel.isInvoiceButtonEnable())
                        Expanded(
                          child: Material(
                            child: InkWell(
                              onTap: () => context
                                  .read<FlightBookingConfirmationState>()
                                  .downloadTripInvoice(
                                    tripId: flightBookingResponseModel
                                            .orderReferenceId ??
                                        '',
                                    bookingId:
                                        flightBookingResponseModel.bookingID ??
                                            '',
                                    businessSubType: 'FlightBooking',
                                    context: context,
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    SvgAssets.bottomBarMyOrder,
                                    height: context.k_18,
                                    color: context.adColors.black,
                                  ),
                                  SizedBox(
                                    height: context.k_4,
                                  ),
                                  Text(
                                    'downloadInvoice'.localize(context),
                                    style: ADTextStyle400.size12
                                        .setTextColor(context.adColors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ).paddingBySide(
                                top: context.k_12,
                                bottom: context.k_12,
                              ),
                            ),
                          ),
                        ),
                      if (flightBookingResponseModel.isEmailButtonEnable())
                        Expanded(
                          child: Material(
                            child: Opacity(
                              opacity: (flightBookingResponseModel
                                      .isEmailButtonEnable())
                                  ? 1
                                  : opacity,
                              child: InkWell(
                                onTap: () => {
                                  FlightBookingGaAnalytics()
                                      .emailItineraryStartEndAnalyticsData(0),
                                  emailItineraryPopUp(
                                    context: context,
                                    emailController: emailController
                                      ..text = flightBookingResponseModel
                                              .contactDetail
                                              ?.email
                                              ?.first
                                              .emailId ??
                                          '',
                                    formKey: _formKey,
                                    onSendPressedCallBack: () => _formKey
                                                .currentState
                                                ?.validate() ==
                                            true
                                        ? {
                                            Navigator.pop(context),
                                            context
                                                .read<
                                                    FlightBookingConfirmationState>()
                                                .emailItinerary(
                                                  flightBookingResponseModel
                                                          .orderReferenceId ??
                                                      '',
                                                  emailController.value.text,
                                                  context,
                                                ),
                                          }
                                        : null,
                                  ),
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //downloads  it.svg
                                    SvgPicture.asset(
                                      SvgAssets.mailIcon,
                                      height: context.k_18,
                                      color: context.adColors.black,
                                    ),
                                    SizedBox(
                                      height: context.k_4,
                                    ),
                                    Text(
                                      'email_itinerary'.localize(context),
                                      style: ADTextStyle400.size12
                                          .setTextColor(context.adColors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ).paddingBySide(
                                  left: context.k_6,
                                  top: context.k_12,
                                  bottom: context.k_12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (flightBookingResponseModel.isItineraryCancellable())
                        Expanded(
                          child: Material(
                            child: Opacity(
                              opacity: flightBookingResponseModel
                                      .isItineraryCancellable()
                                  ? 1
                                  : opacity,
                              child: InkWell(
                                onTap: flightBookingResponseModel
                                        .isItineraryCancellable()
                                    ? () {
                                        // GA method for start cancel booking
                                        FlightBookingGaAnalytics()
                                            .bookingCancelStartAnalyticsData(
                                          flightBookingResponseModel,
                                        );

                                        context
                                                .read<AppSessionState>()
                                                .flightBookingType =
                                            FlightBookingType.none;
                                        navigateToScreenWithRootNavigatorResult(
                                          context,
                                          selectFlightTraveller,
                                          argumentObject:
                                              flightBookingResponseModel,
                                        ).then(
                                          (value) {
                                            adLog(
                                              'calling refresh inside then',
                                            );
                                            refreshCallBack.call();
                                          },
                                        );
                                      }
                                    : null,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //downloads  it.svg
                                    Image.asset(
                                      'lib/assets/images/flight/flight_cancel.png',
                                      height: context.k_18,
                                      color: context.adColors.black,
                                    ),
                                    SizedBox(
                                      height: context.k_4,
                                    ),
                                    Text(
                                      'cancel_booking'.localize(context),
                                      style: ADTextStyle400.size12
                                          .setTextColor(context.adColors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ).paddingBySide(
                                  left: context.k_6,
                                  top: context.k_12,
                                  bottom: context.k_12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if ((flightBookingResponseModel.cancellationClaimActive ??
                              false) &&
                          !(flightBookingResponseModel.isInfantCancelOnly ??
                              false))
                        Expanded(
                          child: Material(
                            child: InkWell(
                              onTap: () =>
                                  navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                webViewContainer,
                                argumentObject: WebViewModel(
                                  title: '',
                                  url: flightBookingResponseModel
                                          .cancellationClaimURL ??
                                      '',
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //downloads  it.svg
                                  SvgPicture.asset(
                                    SvgAssets.savings,
                                    height: context.k_18,
                                    color: context.adColors.black,
                                  ),
                                  SizedBox(
                                    height: context.k_4,
                                  ),
                                  Text(
                                    'claim_refund_small'.localize(context),
                                    style: ADTextStyle400.size12
                                        .setTextColor(context.adColors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ).paddingBySide(
                                left: context.k_6,
                                top: context.k_12,
                                bottom: context.k_12,
                              ),
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

// to send email -  booking related
  void emailItineraryPopUp({
    required BuildContext context,
    required ADTapCallback onSendPressedCallBack,
    required TextEditingController emailController,
    required GlobalKey<FormState> formKey,
  }) {
    // to send GA event for email itinerary start

    showModalBottomSheet<void>(
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ItineraryEmailPopup(
            titleString: 'email_itinerary'.localize(context),
            emailController: emailController,
            onSendCallBack: onSendPressedCallBack,
            formKey: formKey,
          ),
        );
      },
    );
  }

  List<PassengerListInJourney> getPassengerListJourney(
    List<FlightReviewDetailInfo> flightReviewList,
  ) {
    final List<PassengerListInJourney> passengerListInJourneyList = [];
    if (flightReviewList.isNotEmpty) {
      for (int reviewList = 0;
          reviewList < flightReviewList.length;
          reviewList++) {
        final PassengerListInJourney passengerListInJourneyObj =
            flightReviewList[reviewList].passengerListInJourney ??
                PassengerListInJourney();
        passengerListInJourneyList.add(passengerListInJourneyObj);
      }
    }
    return passengerListInJourneyList;
  }
}
