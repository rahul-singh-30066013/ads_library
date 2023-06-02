/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/our_airports.dart';
import 'package:adani_airport_mobile/modules/confetti/confetti_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/customer_information_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/apply_coupon/flight_coupon_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const double textFieldContainerRadius = 8;

class FlightBookingCouponList extends StatefulWidget {
  final String itineraryId;
  final BuildContext context;
  final ADTapCallback? onTapHandler;
  final bool? isInternational;

  /// this varible is use of back data of coupon
  final ADTapCallbackWithValue? viewIntee;

  const FlightBookingCouponList({
    required this.itineraryId,
    required this.context,
    this.onTapHandler,
    this.viewIntee,
    this.isInternational,
    Key? key,
  }) : super(key: key);

  @override
  State<FlightBookingCouponList> createState() =>
      _FlightBookingCouponListState();
}

class _FlightBookingCouponListState extends State<FlightBookingCouponList> {
  int color = 0x080d67ca;
  double imageHeight = 109.sp;
  double imageWidth = 125.sp;

  ///set as 4 so that sheet does not close immediately after scrolling a lil bit
  final double dragSheetOffset = 4;

  FlightCouponState flightCouponState = FlightCouponState();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    flightCouponState.getCouponListApi(widget.itineraryId);
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<FlightCouponState>(
      viewModel: flightCouponState,
      child: Scaffold(
        body: Selector<FlightCouponState, ADResponseState>(
          selector: (context, state) => state.reviewDetailsState,
          builder: (context, value, child) {
            return AbsorbPointer(
              absorbing: value.viewStatus == Status.loading,
              child: WillPopScope(
                onWillPop: () async => value.viewStatus != Status.loading,
                child: GestureDetector(
                  onVerticalDragUpdate: (val) =>
                      (val.delta.dy > dragSheetOffset &&
                              scrollController.position.pixels == 0)
                          ? navigatorPopScreen(context)
                          : null,
                  child: Container(
                    color: context.adColors.whiteTextColor,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: context.k_10),
                          child: ADBottomSheetDragBar(
                            height: context.k_4,
                            width: context.k_40,
                          ),
                        ),
                        ADDraggableSheetHeader(
                          headerTitle: 'applyCouponLabel'.localize(context),
                          closeCallBack: (value) => navigatorPopScreen(context),
                        ).paddingBySide(
                          top: context.k_6,
                          bottom: context.k_20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder(
                              valueListenable:
                                  flightCouponState.selectedCouponNotFound,
                              builder: (context, int value, child) {
                                return InputViewController(
                                  border: value == 1
                                      ? context.adColors.black
                                      : (value == 0
                                          ? context.adColors.textFieldBorderGrey
                                          : errorColor),
                                  viewIntee: widget.viewIntee,
                                  itineraryId: widget.itineraryId,
                                );
                              },
                            ),
                            ValueListenableBuilder(
                              valueListenable:
                                  flightCouponState.selectedCouponNotFound,
                              builder: (context, int value, child) {
                                return value == two
                                    ? Column(
                                        children: [
                                          ADSizedBox(
                                            height: context.k_12,
                                          ),
                                          Text(
                                            flightCouponState
                                                .reviewDetailsState.message
                                                .toString(),
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                              errorColor,
                                            ),
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      )
                                    : const ADSizedBox();
                              },
                            ),
                          ],
                        ).paddingBySide(
                          left: context.k_16,
                          right: context.k_16,
                        ),
                        Text(
                          'or_choose'.localize(context),
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.greyTextColor),
                        ).paddingBySide(
                          top: context.k_10,
                          left: context.k_16,
                          bottom: context.k_6,
                        ),
                        Expanded(
                          child: Selector<FlightCouponState, ADResponseState>(
                            selector: (context, viewModel) =>
                                viewModel.couponListState,
                            builder: (context, value, Widget? child) {
                              switch (value.viewStatus) {
                                case Status.complete:
                                  final List<CouponDetails> couponList =
                                      flightCouponState
                                          .couponListResponse.elgibleOfferInfo;
                                  return couponList.isNotEmpty
                                      ? Selector<FlightCouponState,
                                          ADResponseState>(
                                          selector: (context, vm) =>
                                              vm.reviewDetailsState,
                                          builder: (
                                            context,
                                            reviewDetailsState,
                                            child,
                                          ) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                              (timeStamp) {
                                                if (reviewDetailsState
                                                        .viewStatus ==
                                                    Status.complete) {
                                                  navigatorPopScreen(context);
                                                  final Future future =
                                                      showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      PlaySound.playAudioSound(
                                                        'coupon_code.mp3',
                                                      );
                                                      final couponCode =
                                                          flightCouponState
                                                                  .flightViewItineraryResponseModel
                                                                  ?.promoCoupon
                                                                  ?.promoCode
                                                                  ?.toString() ??
                                                              '';
                                                      final amount =
                                                          flightCouponState
                                                                  .flightViewItineraryResponseModel
                                                                  ?.promoCoupon
                                                                  ?.offerValue ??
                                                              0.0;
                                                      final mesage =
                                                          flightCouponState
                                                                  .flightViewItineraryResponseModel
                                                                  ?.promoCoupon
                                                                  ?.appliedMsg ??
                                                              '';
                                                      Analytics.flightBookingGAObject?[
                                                              Parameters.coupon
                                                                  .name] =
                                                          couponCode;
                                                      Analytics
                                                              .flightBookingGAObject?[
                                                          Parameters
                                                              .coupon_value
                                                              .name] = amount;

                                                      return ConfettiView(
                                                        couponCode: couponCode,
                                                        amount: amount,
                                                        couponMessage: mesage,
                                                      );
                                                    },
                                                  );
                                                  adLog(future.toString());
                                                }
                                              },
                                            );
                                            return ListView.builder(
                                              controller: scrollController,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: couponList.length,
                                              itemBuilder: (context, index) {
                                                /// this varible is use for set date format
                                                final DateTime date;
                                                String formattedDate;
                                                try {
                                                  date = DateTime.parse(
                                                    couponList[index].endDate,
                                                  );
                                                  formattedDate = DateFormat(
                                                    Constant.dateFormat19,
                                                  ).format(date);
                                                } catch (e) {
                                                  formattedDate = '';
                                                }
                                                return Column(
                                                  children: [
                                                    ADSizedBox(
                                                      height: context.k_10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () => couponList[
                                                                              index]
                                                                          .eligible ==
                                                                      true
                                                                  ? flightCouponState
                                                                      .applyCoupon(
                                                                        widget
                                                                            .itineraryId,
                                                                        couponList[index]
                                                                            .couponCode,
                                                                        index,
                                                                        couponList[index]
                                                                            .description,
                                                                        context,
                                                                      )
                                                                      .then(
                                                                        (value) =>
                                                                            updateDataResponse(
                                                                          widget
                                                                              .viewIntee,
                                                                          value,
                                                                        ),
                                                                      )
                                                                  : null,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      context
                                                                          .k_4,
                                                                    ),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: context
                                                                        .adColors
                                                                        .blue,
                                                                  ),
                                                                  color: Color(
                                                                    color,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    if (couponList[
                                                                            index]
                                                                        .promoImgUrl
                                                                        .isNotEmpty)
                                                                      SizedBox(
                                                                        width: context
                                                                            .k_24,
                                                                        height:
                                                                            context.k_22,
                                                                        child: couponList[index].promoImgUrl.contains('.svg')
                                                                            ? SvgPicture.network(
                                                                                couponList[index].promoImgUrl,
                                                                              )
                                                                            : Image.network(
                                                                                couponList[index].promoImgUrl,
                                                                              ),
                                                                      ).paddingBySide(
                                                                        left: context
                                                                            .k_6,
                                                                      ),
                                                                    Text(
                                                                      couponList[
                                                                              index]
                                                                          .couponCode,
                                                                      style: ADTextStyle600
                                                                          .size14
                                                                          .copyWith(
                                                                        color: context
                                                                            .adColors
                                                                            .blackColor,
                                                                      ),
                                                                    ).paddingAllSide(
                                                                      context
                                                                          .k_10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                minimumSize:
                                                                    Size.zero,
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  top: context
                                                                      .k_6,
                                                                ),
                                                                tapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                              ),
                                                              onPressed: () => couponList[
                                                                              index]
                                                                          .eligible ==
                                                                      true
                                                                  ? flightCouponState
                                                                      .applyCoupon(
                                                                        widget
                                                                            .itineraryId,
                                                                        couponList[index]
                                                                            .couponCode,
                                                                        index,
                                                                        couponList[index]
                                                                            .description,
                                                                        context,
                                                                      )
                                                                      .then(
                                                                        (value) =>
                                                                            updateDataResponse(
                                                                          widget
                                                                              .viewIntee,
                                                                          value,
                                                                        ),
                                                                      )
                                                                  : null,
                                                              child: Selector<
                                                                  FlightCouponState,
                                                                  bool>(
                                                                selector: (
                                                                  context,
                                                                  state,
                                                                ) =>
                                                                    state
                                                                        .couponListResponse
                                                                        .elgibleOfferInfo[
                                                                            index]
                                                                        .isSelected ??
                                                                    false,
                                                                builder: (
                                                                  BuildContext
                                                                      context,
                                                                  value,
                                                                  Widget? child,
                                                                ) {
                                                                  return value
                                                                      ? ADDotProgressView(
                                                                          color: context
                                                                              .adColors
                                                                              .blackColor,
                                                                          size:
                                                                              context.k_4,
                                                                        )
                                                                      : Text(
                                                                          'apply'
                                                                              .localize(
                                                                            context,
                                                                          ),
                                                                          style: ADTextStyle500
                                                                              .size14
                                                                              .setTextColor(
                                                                                couponList[index].eligible == true ? context.adColors.neutralInfoMsg : context.adColors.greyReviewShade,
                                                                              )
                                                                              .copyWith(
                                                                                decoration: TextDecoration.underline,
                                                                              ),
                                                                        );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          couponList[index]
                                                              .promoName,
                                                          style: ADTextStyle600
                                                              .size16
                                                              .setTextColor(
                                                            context.adColors
                                                                .blackTextColor,
                                                          ),
                                                        ).paddingBySide(
                                                          top: context.k_16,
                                                        ),
                                                        Text(
                                                          couponList[index]
                                                              .description,
                                                          style: ADTextStyle400
                                                              .size14
                                                              .setTextColor(
                                                            context.adColors
                                                                .greyTextColor,
                                                          ),
                                                        ).paddingBySide(
                                                          top: context.k_10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            if (formattedDate
                                                                .isNotEmpty)
                                                              Text(
                                                                '${'expires'.localize(
                                                                  context,
                                                                )} $formattedDate',
                                                                style: ADTextStyle400
                                                                    .size14
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .greyTextColor,
                                                                ),
                                                              ).paddingBySide(
                                                                right:
                                                                    context.k_8,
                                                              ),
                                                            Text.rich(
                                                              TextSpan(
                                                                text:
                                                                    'T&Cs Apply',
                                                                style: ADTextStyle400
                                                                    .size14
                                                                    .copyWith(
                                                                      color: context
                                                                          .adColors
                                                                          .blackTextColor,
                                                                    )
                                                                    .copyWith(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                                recognizer:
                                                                    TapGestureRecognizer()
                                                                      ..onTap =
                                                                          () {
                                                                        if (!couponList[index]
                                                                            .couponCode
                                                                            .isNullOrEmpty) {
                                                                          navigateToScreenUsingNamedRouteWithArguments(
                                                                            context,
                                                                            offerDetail,
                                                                            rootNavigator:
                                                                                false,
                                                                            argumentObject:
                                                                                OfferKeyModel(
                                                                              id: couponList[index].couponCode,
                                                                              title: couponList[index].promoName,
                                                                              fetchDataFromPromoCode: true,
                                                                              showBookNowButton: false,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                              ),
                                                            ),
                                                          ],
                                                        ).paddingBySide(
                                                          top: context.k_10,
                                                        ),
                                                        if (couponList[index]
                                                            .narration
                                                            .isNotEmpty)
                                                          Text(
                                                            couponList[index]
                                                                .narration,
                                                            style: ADTextStyle500
                                                                .size14
                                                                .setTextColor(
                                                              context.adColors
                                                                  .greenTextColor,
                                                            ),
                                                          ).paddingBySide(
                                                            top: context.k_10,
                                                          ),
                                                        if (couponList[index]
                                                            .recommendations
                                                            .amount
                                                            .isNotEmpty)
                                                          Text(
                                                            couponList[index]
                                                                .recommendations
                                                                .amount,
                                                            style: ADTextStyle400
                                                                .size14
                                                                .setTextColor(
                                                              context.adColors
                                                                  .rustyOrangeColor,
                                                            ),
                                                          ).paddingBySide(
                                                            top: context.k_10,
                                                          ),
                                                      ],
                                                    ).paddingBySide(
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                    ),
                                                    ADSizedBox(
                                                      height: context.k_20,
                                                    ),
                                                    Divider(
                                                      color: context.adColors
                                                          .lightGreyGridSeparatorColor,
                                                      thickness: 1,
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                SvgAssets.couponNotAvailable,
                                                width: imageWidth,
                                                height: imageHeight,
                                                color: context
                                                    .adColors.greyTextColor,
                                              ),
                                              Text(
                                                'coupons_not_found'
                                                    .localize(context),
                                                textAlign: TextAlign.center,
                                                style: ADTextStyle700.size16
                                                    .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                              ).paddingAllSide(context.k_16),
                                            ],
                                          ),
                                        );
                                case Status.loading:
                                  return const ShowShimmerForCouponList();
                                case Status.error:
                                  return ADErrorPage(
                                    message: value.message,
                                  );

                                default:
                                  return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void updateDataResponse(
    ADTapCallbackWithValue? viewIntee,
    ADResponseState value,
  ) {
    if (value.viewStatus == Status.complete) {
      viewIntee?.call(value.data);
      // navigatorPopScreen(context);
    }
    FlightBookingGaAnalytics().applyCouponClick(
      ClickEvents.book_flight_apply_coupon_click,
      'book_flight',
      'purchase',
      (widget.isInternational ?? false) ? 'international' : 'domestic',
      'login',
    );
  }
}

class InputViewController extends StatelessWidget {
  final Color border;
  final String itineraryId;
  final ADTapCallbackWithValue? viewIntee;

  const InputViewController({
    Key? key,
    required this.border,
    required this.itineraryId,
    required this.viewIntee,
  }) : super(key: key);

  void onChangeValueEdit(String text, FlightCouponState state) {
    state.couponTextErrorNotifier.value = text;
    state.selectedCouponNotFound.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final FlightCouponState state = context.read<FlightCouponState>();
    return Container(
      width: double.infinity,
      height: context.k_60,
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(textFieldContainerRadius),
        ),
        border: Border.all(
          color: border,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: FocusScope(
              //  onFocusChange: (focus) => state.selectedCouponNotFound.value = 1,
              child: TextField(
                cursorColor: context.adColors.black,
                controller: state.applyCouponController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'enterCouponCode'.localize(context),
                  labelStyle: ADTextStyle400.size16.setTextColor(
                    context.adColors.greyTextColor,
                  ),
                ),
                onChanged: (text) => onChangeValueEdit(text, state),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: state.couponTextErrorNotifier,
            builder: (context, String value, child) => value.isNotEmpty
                ? InkWell(
                    onTap: () => state.cancelIconClick(),
                    child: state.applyCouponController.text.isEmpty
                        ? const ADSizedBox()
                        : Icon(
                            Icons.close,
                            color: context.adColors.darkGreyTextColor,
                            size: context.k_20,
                          ),
                  )
                : const ADSizedBox(),
          ),
          ValueListenableBuilder(
            valueListenable: state.applyButtonEnableNotifier,
            builder: (context, String value, child) => value.isEmpty
                ? Row(
                    children: [
                      ADSizedBox(
                        width: context.k_24,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.only(
                            top: context.k_6,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () =>
                            state.applyCouponController.text.trim().isNotEmpty
                                ? state
                                    .applyCoupon(
                                      itineraryId,
                                      state.applyCouponController.text.trim(),
                                      -1,
                                      '',
                                      context,
                                    )
                                    .then(
                                      (value) => updateDataResponse(
                                        viewIntee,
                                        value,
                                      ),
                                    )
                                : null,
                        child: Selector<FlightCouponState, bool?>(
                          selector: (context, stateClass) =>
                              stateClass.isCouponAppliedFromInput,
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return value == true
                                ? Container(
                                    width: context.k_48,
                                    child: ADDotProgressView(
                                      color: context.adColors.blackColor,
                                      size: context.k_4,
                                    ),
                                  )
                                : ValueListenableBuilder(
                                    valueListenable:
                                        state.selectedCouponNotFound,
                                    builder: (
                                      context,
                                      int value,
                                      child,
                                    ) {
                                      return value != two
                                          ? Container(
                                              width: context.k_48,
                                              child: ValueListenableBuilder(
                                                valueListenable: state
                                                    .couponTextErrorNotifier,
                                                builder: (
                                                  context,
                                                  String value,
                                                  child,
                                                ) =>
                                                    value.isNotEmpty
                                                        ? Text(
                                                            'apply'.localize(
                                                              context,
                                                            ),
                                                            style: ADTextStyle500
                                                                .size14
                                                                .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .neutralInfoMsg,
                                                                )
                                                                .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          )
                                                        : Text(
                                                            'apply'.localize(
                                                              context,
                                                            ),
                                                            style: ADTextStyle500
                                                                .size14
                                                                .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .greyReviewShade,
                                                                )
                                                                .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                              ),
                                            )
                                          : const ADSizedBox();
                                    },
                                  );
                          },
                        ),
                      ),
                    ],
                  )
                : const ADSizedBox(),
          ),
        ],
      ),

      //
    );
  }

  void updateDataResponse(
    ADTapCallbackWithValue? viewIntee,
    ADResponseState value,
  ) {
    if (value.viewStatus == Status.complete) {
      viewIntee?.call(value.data);
    }
  }
}

/// this class is use for shimmer effect of coupon list
class ShowShimmerForCouponList extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForCouponList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int shimmerCount = 6;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: context.k_10),
      itemCount: shimmerCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.k_64,
                  height: context.k_30,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.k_40,
                  height: context.k_26,
                ),
              ],
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: double.infinity,
              height: context.k_26,
            ).paddingBySide(right: context.k_64),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: double.infinity,
              height: context.k_20,
            ).paddingBySide(right: context.k_30),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.k_64,
              height: context.k_16,
            ),
          ],
        ).paddingBySide(
          bottom: context.k_40,
        );
      },
    );
  }
}
