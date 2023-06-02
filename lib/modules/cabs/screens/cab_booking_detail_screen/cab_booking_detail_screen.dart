/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/cabs/mixin/apply_coupon.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_traveller_details_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/bottom_bar_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_booking_detail_shimmer_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_fare_details_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/car_info_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_new_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_reward_points_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/coupon/cab_booking_coupon_list.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_coupon_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_detail_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/cabs/view/cab_booking_applied_coupon.dart';
import 'package:adani_airport_mobile/modules/cabs/view/cab_booking_apply_coupon.dart';
import 'package:adani_airport_mobile/modules/confetti/confetti_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabBookingDetailScreen extends StatefulWidget {
  const CabBookingDetailScreen({Key? key}) : super(key: key);

  @override
  State<CabBookingDetailScreen> createState() => _CabBookingDetailScreenState();
}

class _CabBookingDetailScreenState extends State<CabBookingDetailScreen>
    with ApplyCoupon {
  final CabBookingDetailState _cabBookingDetailState = CabBookingDetailState();
  final ScrollController _scrollController = ScrollController();
  final double _stepTextSize = 13;

  /// this key use for fare summery
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    _cabBookingDetailState.fetchCabCartDetail();
    context.read<AppSessionState>().getProfileDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CabBookingDetailState>(
      viewModel: _cabBookingDetailState,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 1,
          title: Text(
            'booking_detail'.localize(context),
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
          ),
          actions: [
            Center(
              child: Text(
                'step_1/3'.localize(context),
                style: ADTextStyle400.size14
                    .setFontSize(_stepTextSize)
                    .setTextColor(context.adColors.blackTextColor),
              ).paddingBySide(right: context.k_16),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                bottom: false,
                child: Selector<CabBookingDetailState, ADResponseState>(
                  selector: (context, viewModel) =>
                      viewModel.cabCartDetailState,
                  builder: (context, cabCartDetailState, Widget? child) {
                    switch (cabCartDetailState.viewStatus) {
                      case Status.loading:
                        return const CabBookingDetailShimmerView();
                      case Status.error:
                        return Center(
                          child: Text(
                            cabCartDetailState.message.toString(),
                          ),
                        );
                      case Status.complete:
                        return SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.k_20,
                              ),
                              CarInfoView(
                                bookingDate: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.tripInfo
                                    ?.bookingDate,
                                providerImage: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.securityKey
                                    ?.providerImage,
                                vehicleImage: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.vehicleDetails
                                    ?.vehicleImage,
                                vehicleType: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.vehicleDetails
                                    ?.vehicleType,
                                vehicleTypeID: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.vehicleDetails
                                    ?.adlCabCategory,
                                isFromPreBooking: true,
                                isRideNow: _cabBookingDetailState
                                        .cabCartDetailResponseModel
                                        ?.cartDetail
                                        ?.tripInfo
                                        ?.isRideNow ??
                                    false,
                                cabInfo: _cabBookingDetailState
                                    .cabCartDetailResponseModel
                                    ?.cartDetail
                                    ?.cabInfo,
                              ).paddingBySide(
                                left: context.k_16,
                                right: context.k_16,
                              ),
                              SizedBox(
                                height: context.k_34,
                              ),
                              PickupAndDestinationAddressView(
                                pickUpLocationText: _cabBookingDetailState
                                        .cabCartDetailResponseModel
                                        ?.cartDetail
                                        ?.pickup
                                        ?.locationCode ??
                                    '',
                                destinationLocationText: _cabBookingDetailState
                                        .cabCartDetailResponseModel
                                        ?.cartDetail
                                        ?.drop
                                        ?.locationCode ??
                                    '',
                              ).paddingBySide(
                                left: context.k_16,
                                right: context.k_16,
                                bottom: context.k_48 + context.k_4,
                              ),
                              Container(
                                height: context.k_8,
                                decoration: BoxDecoration(
                                  color: context.adColors.containerGreyBg,
                                ),
                              ),
                              Selector<CabBookingDetailState, String>(
                                selector: (
                                  context,
                                  stateClassObject,
                                ) =>
                                    stateClassObject.cabCartDetailResponseModel
                                        ?.cartDetail?.promoDetails?.promoCode ??
                                    '',
                                builder: (
                                  BuildContext context,
                                  value,
                                  Widget? child,
                                ) {
                                  return value.isEmpty
                                      ? InkWell(
                                          onTap: () =>
                                              _callCouponScreenWidget(),
                                          child: CabBookingApplyCoupon(
                                            leftHeader:
                                                'apply_coupon_code'.localize(
                                              context,
                                            ),
                                          ),
                                        )
                                      : CabBookingAppliedCoupon(
                                          amount: FlightUtils
                                              .getPriceFormatWithSymbol(
                                            price: (_cabBookingDetailState
                                                        .cabCartDetailResponseModel
                                                        ?.cartDetail
                                                        ?.promoDetails
                                                        ?.promoValue ??
                                                    0)
                                                .toDouble(),
                                          ),
                                          couponCode: _cabBookingDetailState
                                                  .cabCartDetailResponseModel
                                                  ?.cartDetail
                                                  ?.promoDetails
                                                  ?.promoCode ??
                                              '',
                                          onTap: () => _cabBookingDetailState
                                              .removeCoupon(
                                            context: context,
                                            applyCoupon: this,
                                          ),
                                        );
                                },
                              ),
                              Container(
                                height: context.k_8,
                                decoration: BoxDecoration(
                                  color: context.adColors.containerGreyBg,
                                ),
                              ),
                              Visibility(
                                visible: _cabBookingDetailState
                                    .isImportantInformationAvailable,
                                child: ImportantInformationNewView(
                                  carInfoDetail:
                                      _cabBookingDetailState.carInfoDetail,
                                ).paddingBySide(
                                  top: context.k_48 + context.k_4,
                                  left: context.k_16,
                                  right: context.k_16,
                                ),
                              ),
                              Selector<CabBookingDetailState, CartDetail?>(
                                selector: (
                                  context,
                                  stateClassObject,
                                ) =>
                                    _cabBookingDetailState
                                        .cabCartDetailResponseModel?.cartDetail,
                                builder: (
                                  BuildContext context,
                                  cartDetail,
                                  Widget? child,
                                ) {
                                  return Column(
                                    children: [
                                      CabFareDetailsView(
                                        shakeKey: shakeKey,
                                        priceInfo: _cabBookingDetailState
                                            .cabCartDetailResponseModel
                                            ?.cartDetail
                                            ?.priceInfo,
                                        couponDiscount: cartDetail
                                                ?.promoDetails?.promoValue
                                                ?.toDouble() ??
                                            0.0,
                                        totalAmount: _cabBookingDetailState
                                                .cabCartDetailResponseModel
                                                ?.cartDetail
                                                ?.priceInfo
                                                ?.discountPrice ??
                                            0,
                                      ).paddingBySide(
                                        top: context.k_38 + context.k_14,
                                        bottom: !_cabBookingDetailState
                                                .isRewardPointsAvailable
                                            ? context.k_30
                                            : 0,
                                      ),
                                      if (_cabBookingDetailState
                                          .isRewardPointsAvailable)
                                        CabRewardPointsView(
                                          loyaltyPoints: _cabBookingDetailState
                                                  .cabCartDetailResponseModel
                                                  ?.cartDetail
                                                  ?.priceInfo
                                                  ?.loyalty ??
                                              0,
                                        ).paddingBySide(
                                          top: context.k_20,
                                          bottom: context.k_30,
                                        )
                                      else
                                        const SizedBox.shrink(),
                                    ],
                                  ).paddingBySide(
                                    left: context.k_16,
                                    right: context.k_16,
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ),
            Selector<CabBookingDetailState, ADResponseState>(
              selector: (context, viewModel) => viewModel.cabCartDetailState,
              builder: (context, cabCartDetailState, Widget? child) {
                return Visibility(
                  visible: cabCartDetailState.viewStatus == Status.complete,
                  child: SafeArea(
                    child: Selector<CabBookingDetailState, CartDetail?>(
                      selector: (
                        context,
                        stateClassObject,
                      ) =>
                          _cabBookingDetailState
                              .cabCartDetailResponseModel?.cartDetail,
                      builder: (
                        BuildContext context,
                        cartDetail,
                        Widget? child,
                      ) {
                        return BottomBarView(
                          price: FlightUtils.getAmountWithTwoDecimalPoint(
                            double.parse(
                              '${_cabBookingDetailState.cabCartDetailResponseModel?.cartDetail?.priceInfo?.discountPrice ?? 0}',
                            ),
                          ),
                          onSubtitleTap: () =>
                              _viewDetailTap(_scrollController),
                          onButtonTap: () =>
                              _navigateToCabTravellerDetailScreen(),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _viewDetailTap(ScrollController scrollController) {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      shakeKey.currentState?.shake();
    } else {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  Future<void> _navigateToCabTravellerDetailScreen() async {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      CabGoogleAnalytics()
          .sendGAParametersCabBookingDetail(_cabBookingDetailState);
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        cabTravellerDetailScreen,
        argumentObject: CabTravellerDetailsNavigateModel(
          cabCartDetailResponseModel:
              _cabBookingDetailState.cabCartDetailResponseModel,
          adTapCallbackWithValue: (cabCartDetailCallbackResponse) =>
              _cabBookingDetailState
                  .updateCabCartDetailState(cabCartDetailCallbackResponse),
        ),
      );
    } else {
      CabGoogleAnalytics()
          .sendGAParametersCabBookingLogin(_cabBookingDetailState);
      _cabBookingDetailState.oldAgentId =
          ProfileSingleton.profileSingleton.userID;
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          currentRouteName: cabBookingDetailScreen,
          isLoginStatusTap: (value) => value
              ? Future.delayed(
                  const Duration(milliseconds: 500),
                  () => _cabBookingDetailState.fetchCabCartDetail().then(
                        (value) => _navigateToCabTravellerDetailScreen(),
                      ),
                )
              : null,
          isNotFromSplash: true,
          lob: CabConstants.cabBooking,
        ),
      );
    }
  }

  @override
  void applyCallBack(CartDetail cartDetail) {
    _cabBookingDetailState.cabCartDetailResponseModel?.cartDetail = cartDetail;
    _cabBookingDetailState.notifyListeners();
    if (cartDetail.promoDetails?.promoCode?.isNotEmpty ?? false) {
      final Future future = showDialog(
        context: context,
        builder: (BuildContext context) {
          PlaySound.playAudioSound('coupon_code.mp3');
          return ConfettiView(
            couponCode: cartDetail.promoDetails?.promoCode ?? '',
            amount: (cartDetail.promoDetails?.promoValue ?? 0).toDouble(),
            couponMessage: '',
          );
        },
      );
      adLog(future.toString());
    }
  }

  ///to call coupon list screen
  void _callCouponScreenWidget() {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      CabGoogleAnalytics().sendGAParametersApplyCouponStart(
        _cabBookingDetailState.cabCartDetailResponseModel,
      );
      adShowBottomSheet(
        context: context,
        childWidget: ADSelectorStateLessWidget(
          viewModel: CabBookingCouponState(),
          child: CabBookingCouponList(
            cabCartDetailResponseModel:
                _cabBookingDetailState.cabCartDetailResponseModel,
            applyCoupon: this,
            amount: _cabBookingDetailState.cabCartDetailResponseModel
                    ?.cartDetail?.priceInfo?.totalAmount ??
                0,
            oldAgentID: _cabBookingDetailState.oldAgentId ?? '',
          ),
        ),
        headerTitle: 'applyCouponLabel'.localize(
          context,
        ),
      );
    } else {
      CabGoogleAnalytics()
          .sendGAParametersCabBookingLogin(_cabBookingDetailState);
      _cabBookingDetailState.oldAgentId =
          ProfileSingleton.profileSingleton.userID;
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          currentRouteName: cabBookingDetailScreen,
          isLoginStatusTap: (value) => value
              ? Future.delayed(
                  const Duration(milliseconds: 500),
                  () => _cabBookingDetailState.fetchCabCartDetail().then(
                        (value) => _callCouponScreenWidget(),
                      ),
                )
              : null,
          isNotFromSplash: true,
          lob: CabConstants.cabBooking,
        ),
      );
    }
  }
}
