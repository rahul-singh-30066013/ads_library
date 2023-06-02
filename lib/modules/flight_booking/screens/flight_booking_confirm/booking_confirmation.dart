/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/confirmation_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/important_information_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/booking_payment_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/pricing_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/loyalty_points.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/pranaam_banner_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/pranaam_banner_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/unlocked_offers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/unlocked_offers_shimmer_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/views/fare_refund_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/views/show_flight_booking_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_list/views/show_important_information.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/header_dialog.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/wallet/repository/wallet_state.dart';
import 'package:adani_airport_mobile/modules/wallet/view/add_to_wallet_button.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_plugin/adani_mobile_plugin.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

Color infoBg = const Color(0xfffef6ea);

class BookingConfirmation extends StatefulWidget {
  final SelectedItineraryToConfirmation selectedItineraryToConfirmation;

  const BookingConfirmation({
    Key? key,
    required this.selectedItineraryToConfirmation,
  }) : super(key: key);

  static const int textMaxLines = 2;
  static const double borderRadius = 4;

  @override
  State<BookingConfirmation> createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  final FlightBookingConfirmationState flightBookingConfirmationState =
      FlightBookingConfirmationState();
  final double spacingBetweenWidgets = 4.sp;

  final double largeSpacingBetweenWidgets = 60.sp;

  final double bottomNavBarHeight = 71.sp;

  final double iconSize = 20.sp;

  final int transactionPoints = 21;

  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  String pnrNo = '';
  final Map<String, double> priceTaxMapData = {};

  ///controller for nested scroll view to handle appbar title
  final ScrollController _scrollController = ScrollController();

  double expandedHeight = 206.sp;

  bool lastStatus = true;

  double totalTaxes = 0;
  double totalFees = 0;

  final double fontSize = 15;

  final double statusFontSize = 11;

  final double statusOpacity = 0.07;

  final double bottomPadding = 100.sp;

  WalletState walletState = WalletState();

  void _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (expandedHeight - kToolbarHeight);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void initState() {
    flightBookingConfirmationState.getAllUnlockedOffers();
    _scrollController.addListener(_scrollListener);
    super.initState();
    createInitData();
    deletePreFilledAirportFromSharedPref();
  }

  Future<void> _pullRefresh() async {
    await createInitData(pullToRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _moveToPrevScreen(),
      child: ADSelectorStateLessWidget<FlightBookingConfirmationState>(
        key: const Key('BookingConfirmation'),
        viewModel: flightBookingConfirmationState,
        child: Scaffold(
          /* body: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) =>
                          buildHeaderSliver(
                    widget.selectedItineraryToConfirmation
                        .flightViewItineraryResponseModel.contactDetail,
                  ),*/
          body: Selector<FlightBookingConfirmationState, ADResponseState>(
            selector: (context, viewModel) =>
                viewModel.flightBookingConfirmation,
            builder: (context, value, Widget? child) {
              switch (value.viewStatus) {
                case Status.loading:
                  return BookingConfirmationShimmer();
                case Status.error:
                  return NoInternetView(
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
                  flightBookingConfirmationState.contactNo =
                      _getPhoneNumWithCountryCode(contactDetail);
                  /*final int convenienceFee = flightViewItineraryResponseModel
                            ?.pricingSummary?.convenienceFee ??
                        0;*/
                  // final rewardsPoints =
                  //     flightViewItineraryResponseModel?.loyaltyPotentialPoint ??
                  //         0;
                  // final LoyaltyPoints? loyaltyPoints = getLoyaltyObj(
                  //   flightBookingResponseModel
                  //           ?.paymentDetails?.paymentModes ??
                  //       [],
                  // );
                  // final pendingRewardsPoints =
                  //     loyaltyPoints?.pendingRewardPoints ?? 0;
                  // final paymentModes = flightBookingResponseModel
                  //         ?.paymentDetails
                  //         ?.getPaymentModes() ??
                  //     [];
                  // final earnRewardsPoints =
                  //     loyaltyPoints?.earnedRewardPoints ?? 0;
                  final getOrderPaymentModes = flightBookingConfirmationState
                      .commonOrderDetailBaseResponse
                      .getOrderedPaymentModes();
                  final List<PricingBreakup> pricingBreakup =
                      flightBookingResponseModel?.paymentDetails
                              ?.bookingPaymentBreakup?.pricingBreakup ??
                          [];
                  totalTaxes = _getTotalTax(pricingBreakup);
                  totalFees = _getTotalFees(pricingBreakup);
                  if (flightBookingResponseModel != null) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) async {
                        context.read<AppSessionState>().getUpcomingBookings();
                        context
                            .read<AppSessionState>()
                            .updateValueOfBooking(updateValue: true);
                      },
                    );
                  }
                  final isRefundAvailable = flightBookingResponseModel
                          ?.isRefundAvailableConfirmationPage() ??
                      false;
                  return NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) =>
                            buildHeaderSliver(
                      widget.selectedItineraryToConfirmation
                          .flightViewItineraryResponseModel.contactDetail,
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
                            height: spacingBetweenWidgets,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: {
                              'booking_id': flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .orderReferenceId ??
                                  '',
                              // 'pnr_number': pnrNo,
                              'reference_id': flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .orderDetail
                                      ?.flightbookingDetail
                                      ?.bookingID ??
                                  '',
                              'status':
                                  // 'payment_status_completed'.localize(context),
                                  flightBookingConfirmationState
                                          .commonOrderDetailBaseResponse
                                          .status ??
                                      '',
                            }
                                .entries
                                .map(
                                  (element) => Flexible(
                                    child: Column(
                                      children: [
                                        ADSizedBox(
                                          height: context.k_16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              element.key.localize(context),
                                              style: ADTextStyle400.size14
                                                  .setTextColor(
                                                    context
                                                        .adColors.greyTextColor,
                                                  )
                                                  .setFontSize(fontSize),
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                                                  ).withOpacity(
                                                    statusOpacity,
                                                  ),
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
                                                  context
                                                      .adColors.neutralInfoMsg,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                          ],
                                        ),
                                        ADSizedBox(
                                          height: context.k_16,
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
                              (flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse.status
                                      ?.toLowerCase() !=
                                  'failed'))
                            Column(
                              children: [
                                ADSizedBox(
                                  height: context.k_16,
                                ),
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
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
                                  ).paddingBySide(),
                                ),
                                ADSizedBox(
                                  height: context.k_16,
                                ),
                                const Divider(
                                  height: 1,
                                ),
                              ],
                            ).paddingBySide(
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
                                  '${FLightsApiUrls.getApplePassBook}/${flightBookingResponseModel?.orderReferenceId}',
                                  context,
                                  flightBookingResponseModel?.tripType,
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
                          // transaction points
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
                                return isEarnPointsLoading
                                    ? ADShimmerWidget.shimmerShape(
                                        rectanglePadding: EdgeInsets.zero,
                                        type: ShimmerType.rectangleBox,
                                        width: context.widthOfScreen -
                                            context.k_16,
                                        height: context.k_48,
                                      )
                                    : LoyaltyPointsComponent(
                                        points: flightBookingConfirmationState
                                                .commonOrderDetailBaseResponse
                                                .earning
                                                ?.total ??
                                            0,
                                        routeThankYou: true,
                                        loyaltyShowScreenType:
                                            LoyaltyShowScreenType.flight,
                                        routeConfirmation:
                                            flightBookingConfirmationState
                                                .commonOrderDetailBaseResponse
                                                .isRewardEarned,
                                      ).paddingBySide(
                                        top: context.k_20,
                                        left: context.k_16,
                                        right: context.k_16,
                                      );
                              },
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
                                        .paddingBySide(top: context.k_10),
                                  );
                                case Status.error:
                                  return const PranaamBanner(
                                    response: [],
                                  );
                                case Status.complete:
                                  final List<UpSellLink> responseOfferList =
                                      (value.data as PranaamBannerModel)
                                              .offerLink ??
                                          [];
                                  final List<UpSellLink> responseUpsellList =
                                      (value.data as PranaamBannerModel)
                                              .upSellLink ??
                                          [];
                                  return PranaamBanner(
                                    response: responseOfferList.isNotEmpty
                                        ? responseOfferList
                                        : responseUpsellList,
                                  );
                                default:
                                  return Container();
                              }
                            },
                          ),

                          // else
                          //   LoyaltyPointsComponent(
                          //     points: earnRewardsPoints,
                          //     routeThankYou: true,
                          //     bottomMargin: context.k_40,
                          //   ).paddingBySide(
                          //     left: context.k_16,
                          //     right: context.k_16,
                          //   ),

                          ShowFlightBookingDetails(
                            bookingConfirmationScreenType:
                                BookingConfirmationScreenType
                                    .flightBookingConfirmation,
                            flightBookingResponseModel:
                                flightBookingResponseModel ??
                                    FlightViewTripResponseModel(),
                          ).paddingBySide(
                            bottom: context.k_24,
                            top: context.k_40,
                          ),
                          // fare details
                          // SizedBox(
                          //   height: largeSpacingBetweenWidgets,
                          // ),

                          Selector<FlightBookingConfirmationState,
                              ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.pranaamUpSellState,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.loading:
                                  return Center(
                                    child: PranaamBannerShimmer()
                                        .paddingBySide(top: context.k_10),
                                  );
                                case Status.error:
                                  return const SizedBox.shrink();
                                case Status.complete:
                                  final List<UpSellLink> responseOfferList =
                                      (value.data as PranaamBannerModel)
                                              .offerLink ??
                                          [];
                                  final List<UpSellLink> responseUpsellList =
                                      (value.data as PranaamBannerModel)
                                              .upSellLink ??
                                          [];
                                  return PranaamBanner(
                                    response: (responseOfferList.isNotEmpty &&
                                            responseUpsellList.isNotEmpty)
                                        ? responseUpsellList
                                        : [],
                                  ).paddingBySide(
                                    bottom: (responseOfferList.isNotEmpty &&
                                            responseUpsellList.isNotEmpty)
                                        ? context.k_36
                                        : 0,
                                  );
                                default:
                                  return Container();
                              }
                            },
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'fare_details'.localize(context),
                                style: ADTextStyle700.size22.setTextColor(
                                  context.adColors.filterBlackText,
                                ),
                              ),
                              Semantics(
                                label: '',
                                container: true,
                                child: Row(
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
                                ).paddingBySide(top: context.k_20),
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
                                  ).paddingBySide(top: context.k_20),
                                ),
                              if (flightBookingResponseModel
                                      ?.isZeroCancellation ??
                                  false)
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'zero_cancellation'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
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
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ).paddingBySide(top: context.k_20),
                                ),
                              if (flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .isPromoApplied() >
                                  0) //rewards_points
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'coupon_discount'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        '-${FlightUtils.getPriceFormatWithSymbol(
                                          price: flightBookingConfirmationState
                                              .commonOrderDetailBaseResponse
                                              .isPromoApplied(),
                                        )}',
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.greenTextColor,
                                        ),
                                      ),
                                    ],
                                  ).paddingBySide(top: context.k_20),
                                ),
                              if (flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .isLoyaltyApplied() >
                                  0) //rewards_points
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'rewards_points'.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      Text(
                                        '-${FlightUtils.getPriceFormatWithSymbol(
                                          price: flightBookingConfirmationState
                                              .commonOrderDetailBaseResponse
                                              .isLoyaltyApplied(),
                                        )}',
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.greenTextColor,
                                        ),
                                      ),
                                    ],
                                  ).paddingBySide(top: context.k_20),
                                ),
                              if ((flightBookingResponseModel?.ccfApplied ??
                                      0) >
                                  0)
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
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
                                  ).paddingBySide(
                                    top: context.k_20,
                                  ),
                                )
                              else
                                Semantics(
                                  label: '',
                                  container: true,
                                  child: Row(
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
                                  ).paddingBySide(top: context.k_20),
                                ),
                              SizedBox(
                                height: context.k_16,
                              ),
                              Container(
                                color: context.adColors.tileBorderColor,
                                height: 1,
                              ),
                              Semantics(
                                label: '',
                                container: true,
                                child: Row(
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
                              Container(
                                color: context.adColors.tileBorderColor,
                                height: 1,
                              ),
                            ],
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                          // contact details
                          SizedBox(
                            height: context.k_20,
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
                                borderRadius:
                                    BorderRadius.circular(context.k_8),
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
                            height: context.k_30,
                          ),
                          ContactDetails(
                            mobileNumber:
                                flightBookingConfirmationState.contactNo ?? '',
                            emailId: contactDetail?.email?.first.emailId ?? '',
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),

                          Selector<FlightBookingConfirmationState,
                              ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.pranaamUpSellState,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.loading:
                                  return const SizedBox.shrink();
                                case Status.error:
                                  return const SizedBox.shrink();
                                case Status.complete:
                                  final List<UpSellLink> responseOfferList =
                                      (value.data as PranaamBannerModel)
                                              .offerLink ??
                                          [];
                                  final List<UpSellLink> responseUpsellList =
                                      (value.data as PranaamBannerModel)
                                              .upSellLink ??
                                          [];

                                  return responseOfferList.isNotEmpty &&
                                          responseUpsellList.isNotEmpty
                                      ? const OfferView().paddingBySide(
                                          bottom: context.k_30,
                                          top: context.k_30,
                                        )
                                      : const SizedBox.shrink();
                                default:
                                  return Container();
                              }
                            },
                          ),
                          // const ShowImportantInformation(),
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
                          Container(
                            padding: EdgeInsets.all(
                              context.k_4,
                            ),
                            width: context.widthOfScreen,
                            decoration: BoxDecoration(
                              color: infoBg,
                              borderRadius: BorderRadius.circular(context.k_8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: context.k_20,
                                ).paddingAllSide(context.k_6),
                                RichText(
                                  text: TextSpan(
                                    text: 'clear_trip_booking_query_msg'
                                        .localize(context),
                                    style: ADTextStyle400.size16.setTextColor(
                                      context.adColors.black,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: InkWell(
                                          child: Text(
                                            'support@adanione.com',
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                          onTap: () =>
                                              Utils.redirectToPhoneEmail(
                                            'support@adanione.com',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).paddingBySide(
                                  top: context.k_6,
                                  bottom: context.k_8,
                                ),
                              ],
                            ),
                          ).paddingBySide(
                            left: context.k_14,
                            top: context.k_14,
                            right: context.k_14,
                            bottom: bottomPadding,
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
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              Selector<FlightBookingConfirmationState, ADResponseState>(
            selector: (context, viewModel) =>
                viewModel.flightBookingConfirmation,
            builder: (context, value, Widget? child) {
              final isInvoiceButtonEnable = flightBookingConfirmationState
                  .flightbookingDetail
                  ?.isInvoiceButtonEnable();
              return value.viewStatus == Status.complete
                  ? ConfirmationBottomBar(
                      buttons: [
                        ConfirmationBottomButtonModel(
                          icon: SvgAssets.bottomBarHome,
                          title: 'Home',
                          onTap: () => navigatorPopScreenUntil(
                            context,
                            ModalRoute.withName(tabRoute),
                          ),
                        ),
                        ConfirmationBottomButtonModel(
                          icon: SvgAssets.confirmationBarModify,
                          title: 'Modify',
                          onTap: () => {
                            // GA method for start cancel booking
                            //FlightBookingGaAnalytics()
                            //     .bookingCancelStartAnalyticsData(
                            //   flightBookingConfirmationState
                            //       .flightBookingResponseModel,
                            // ),

                            context.read<AppSessionState>().flightBookingType =
                                FlightBookingType.none,
                            navigateToScreenWithRootNavigatorResult(
                              context,
                              flightBookingItemDetails,
                              argumentObject: flightBookingConfirmationState
                                      .flightbookingDetail?.orderReferenceId ??
                                  '',
                            ).then(
                              (value) {
                                adLog(value);
                              },
                            ),
                          },
                          // isDisabled: !isCancellable,
                        ),
                        if (isInvoiceButtonEnable ?? false)
                          ConfirmationBottomButtonModel(
                            icon: SvgAssets.bottomBarMyOrder,
                            title: 'Invoice',
                            onTap: () => flightBookingConfirmationState
                                .downloadTripInvoice(
                              tripId: flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .orderReferenceId ??
                                  '',
                              bookingId: flightBookingConfirmationState
                                      .commonOrderDetailBaseResponse
                                      .orderDetail
                                      ?.flightbookingDetail
                                      ?.bookingID ??
                                  '',
                              businessSubType: 'FlightBooking',
                              context: context,
                            ),
                          ),
                        ConfirmationBottomButtonModel(
                          icon: SvgAssets.help,
                          title: 'help'.localize(context),
                          onTap: () => Utils.helpBottomSheet(
                            context,
                            Utils.getHelpContactDetail(),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  String _getPhoneNumWithCountryCode(ItineraryContactDetail? contactDetail) {
    final String countryCode =
        contactDetail?.contactNumber?.first.countryAccessCode ?? '';
    final String phoneNo =
        contactDetail?.contactNumber?.first.phoneNumber ?? '';
    return countryCode.isNotEmpty ? '$countryCode-$phoneNo' : phoneNo;
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

  Future<bool> _moveToPrevScreen() {
    navigateUsingPushNamedAndRemoveUntil(
      context,
      flightBooking,
      ModalRoute.withName(tabRoute),
    );
    return Future.value(true);
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

/*

  /// Save Data to Preference for current order
  void saveToPreference(
    String key,
    FlightViewTripResponseModel flightBookingResponseModel,
  ) {
    final List<FlightOrderItem> flightBookingOrderList = [];
    final dataObjToRead = <String, Object>{
      'key': key,
      'dataType': 'string',
      'value': '',
    };
    //to read previous added booking
    AdaniMobilePlugin.readSharedPref(dataObjToRead).then((value) {
      if (value.toString().isNotEmpty) {
        final FlightOrderList flightOrder =
            FlightOrderList.fromJson(json.decode(value));
        flightBookingOrderList.addAll(flightOrder.flightOrderList ?? []);
      }

      //to get current booking item detail to add
      final FlightReviewDetailModel? flightReviewDetailModel =
          flightBookingResponseModel.flightReviewDetailModel;
      final List<FlightReviewDetailInfo> flightReviewDetailInfo =
          flightReviewDetailModel?.flightReviewDetailInfo ?? [];
      final List<JourneyFlightDetails> journeyFlightDetails =
          flightReviewDetailInfo.first.journeyFlightDetails ?? [];
      final FlightOrderItem flightOrderItem = FlightOrderItem(
        tripId: flightBookingResponseModel.tripID ?? '',
        tripType: flightBookingResponseModel.tripType?.name.toString(),
        bookingStatus: flightBookingResponseModel.bookingStatus ?? 'P',
        toLocation: journeyFlightDetails.last.flightArrivalCityName,
        fromLocation: journeyFlightDetails.first.flightDepartureCityName,
        departureData: journeyFlightDetails.first.flightDepartureDate,
        arrivalDate: journeyFlightDetails.last.flightArrivalDate,
      );
      //insert current object to db
      flightBookingOrderList.insert(0, flightOrderItem);
      final dataObj = <String, Object>{
        'key': key,
        'dataType': 'string',
        'value': jsonEncode(
          FlightOrderList(flightOrderList: flightBookingOrderList),
        ),
      };
      AdaniMobilePlugin.writeSharedPref(dataObj);
    });
  }
*/

  Future<void> createInitData({bool pullToRefresh = false}) async {
    await flightBookingConfirmationState.viewTripDetails(
      widget.selectedItineraryToConfirmation.tripId,
      pullToFresh: pullToRefresh,
    );
    flightViewItineraryResponseModel =
        widget.selectedItineraryToConfirmation.flightViewItineraryResponseModel;
    if (!pullToRefresh) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () => Utils.appReviewMethod(),
      );
      // getPriceMapData();
    }
  }

  Future<void> deletePreFilledAirportFromSharedPref() async {
    final recentAirportDataObj = <String, Object>{'key': keyToLastSearch};
    await AdaniMobilePlugin.deleteSharedPref(recentAirportDataObj);
  }

  void callPreviousScreen() {
    navigateUsingPushNamedAndRemoveUntil(
      context,
      flightBooking,
      ModalRoute.withName(tabRoute),
    );
  }

  List<Widget> buildHeaderSliver(ItineraryContactDetail? contactDetail) {
    return <Widget>[
      SliverAppBar(
        backgroundColor: context.adColors.whiteTextColor,
        expandedHeight: expandedHeight,
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
            color: isShrink ? Colors.black : Colors.white,
          ).paddingBySide(
            left: context.k_20,
            right: context.k_10,
            bottom: context.k_4,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text(
            isShrink
                ? (flightBookingConfirmationState
                                    .commonOrderDetailBaseResponse.status ??
                                '')
                            .toLowerCase() ==
                        'pending'
                    ? 'Booking Pending'
                    : 'Booking Confirmed'
                : '',
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
          ),
          background: HeaderDialog(
            emailId: contactDetail?.email?.first.emailId ?? '',
            phoneNumber: _getPhoneNumWithCountryCode(contactDetail),
            isForBookingConfirmationScreen: true,
            backgroundColor: FlightUtils.getBookingStatusTypeColor(
              flightBookingConfirmationState
                      .commonOrderDetailBaseResponse.status ??
                  '',
              context,
            ),
            orderStatus: flightBookingConfirmationState
                    .commonOrderDetailBaseResponse.status ??
                '',
            bookingConfirmationMessage: FlightUtils.getBookingStatusTypeMessage(
              flightBookingConfirmationState
                      .commonOrderDetailBaseResponse.status ??
                  '',
            ),
          ),
        ),
      ),
    ];
  }
}

const double opacity = 0.3;

class BookingConfirmationShimmer extends StatelessWidget {
  final bool isReviewHeader;

  BookingConfirmationShimmer({
    Key? key,
    this.isReviewHeader = false,
  }) : super(key: key);

  final double width237 = 237.sp;
  final double width59 = 59.sp;
  final double width228 = 228.sp;
  final double width112 = 112.sp;
  final double width152 = 152.sp;
  final double width170 = 170.sp;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack(
          //   alignment: Alignment.bottomLeft,
          //   children: [
          //     ADShimmerWidget.shimmerShape(
          //       type: ShimmerType.rectangleBox,
          //       height: width237,
          //       width: double.infinity,
          //       rectanglePadding: EdgeInsets.zero,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.symmetric(
          //         horizontal: context.k_16,
          //         vertical: context.k_28,
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 height: width59,
          //                 width: width228,
          //                 decoration: BoxDecoration(
          //                   borderRadius:
          //                       const BorderRadius.all(Radius.circular(5)),
          //                   color: context.adColors.whiteTextColor,
          //                 ),
          //               ),
          //               if (!isReviewHeader)
          //                 CircleAvatar(
          //                   radius: context.k_24,
          //                   backgroundColor: context.adColors.whiteTextColor,
          //                 ).paddingBySide(right: context.k_8),
          //             ],
          //           ),
          //           ADSizedBox(
          //             height: context.k_26,
          //           ),
          //           Container(
          //             height: context.k_14,
          //             width: width228,
          //             decoration: BoxDecoration(
          //               borderRadius:
          //                   const BorderRadius.all(Radius.circular(5)),
          //               color: context.adColors.whiteTextColor,
          //             ),
          //           ),
          //           ADSizedBox(
          //             height: context.k_14,
          //           ),
          //           Container(
          //             height: context.k_14,
          //             width: width228,
          //             decoration: BoxDecoration(
          //               borderRadius:
          //                   const BorderRadius.all(Radius.circular(5)),
          //               color: context.adColors.whiteTextColor,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.k_6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADSizedBox(
                  height: context.k_10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      height: context.k_22,
                      width: width112,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      height: context.k_22,
                      width: width112,
                    ),
                  ],
                ),
                ADSizedBox(
                  height: context.k_6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      height: context.k_22,
                      width: width112,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      height: context.k_22,
                      width: width112,
                    ),
                  ],
                ),
                ADSizedBox(
                  height: context.k_6,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_20,
                  width: width152,
                ),
                ADSizedBox(
                  height: context.k_16,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_40,
                  width: double.infinity,
                ),
                ADSizedBox(
                  height: context.k_22,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_20,
                  width: width152,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_24,
                  width: double.infinity,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_18,
                  width: width152,
                ),
                ADSizedBox(
                  height: context.k_32,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: width170,
                  width: double.infinity,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_24,
                  width: double.infinity,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_24,
                  width: double.infinity,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_18,
                  width: width152,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_18,
                  width: width152,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnlockOfferView extends StatelessWidget {
  const UnlockOfferView({
    Key? key,
    required this.item,
  }) : super(key: key);
  final List<WidgetItem> item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'unlocked_offers'.localize(context),
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.filterBlackText,
          ),
        ).paddingBySide(left: context.k_16),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          'unlock_offers_description'.localize(context),
          style: ADTextStyle400.size16.setTextColor(
            context.adColors.filterBlackText,
          ),
          maxLines: context.k_2.toInt(),
        ).paddingBySide(
          left: context.k_16,
          bottom: context.k_6,
          right: context.k_16,
        ),
        UnlockedOffers(
          offerItems: item,
        ),
      ],
    );
  }
}

class PranaamBanner extends StatelessWidget {
  const PranaamBanner({
    Key? key,
    required this.response,
  }) : super(key: key);
  final List<UpSellLink> response;

  @override
  Widget build(BuildContext context) {
    return response.isNotEmpty
        ? PranaamBannerView(item: response)
            .paddingBySide(top: context.k_4, bottom: context.k_10)
        : const OfferView().paddingBySide(top: context.k_24);
  }
}

class OfferView extends StatelessWidget {
  const OfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingConfirmationState, ADResponseState>(
      selector: (context, viewModel) => viewModel.offersState,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.loading:
            return Center(
              child: UnlockedOffersShimmerWidget(),
            );
          case Status.error:
            return const SizedBox.shrink();
          case Status.complete:
            final List<WidgetItem> response = (value.data as OfferItems).result;
            return response.isNotEmpty
                ? UnlockOfferView(item: response)
                : const SizedBox.shrink();
          default:
            return Container();
        }
      },
    );
  }
}
