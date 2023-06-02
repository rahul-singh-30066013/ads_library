/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/components/confirmation_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as important_information;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation_comfirmation/view/cancel_confirmation_summary.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation_comfirmation/view/cancellation_confirmation_shimmer.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation_comfirmation/view/cancelled_confirmed_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation_comfirmation/view/guest_detail_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/important_information.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class PranaamCancellationConfirmation extends StatefulWidget {
  final String bookingId;
  const PranaamCancellationConfirmation({Key? key, required this.bookingId})
      : super(key: key);
  @override
  State<PranaamCancellationConfirmation> createState() =>
      _PranaamCancellationConfirmationState();
}

class _PranaamCancellationConfirmationState
    extends State<PranaamCancellationConfirmation> {
  BookingAndCancellationState getBookingDetailsState =
      BookingAndCancellationState();

  @override
  void initState() {
    super.initState();
    _fetchBookingData();
  }

  void _fetchBookingData() {
    Future.wait([
      getBookingDetailsState.getBookingDetails(
        fromInit: true,
        orderId: widget.bookingId,
      ),
    ]).then((value) {
      adLog('getBookingResponse  $value');
      getBookingDetailsState
          .getImportantInformation(
        infoType: getBookingDetailsState.bookingDetailsResponse?.cancelType ==
                'Partial'
            ? 'PartiallyCancelled'
            : 'Cancelled',
      )
          .then((value) {
        adLog(' getImportantInformation response $value');
        context
            .read<AppSessionState>()
            .getBookings(bookType: context.read<AppSessionState>().mainTabType)
            .then((value) {
          final MyBookingResponseModel? bookingDetails = value.data;
          context.read<AppSessionState>().allOrders?.history =
              bookingDetails?.all;
          context.read<AppSessionState>().allOrders?.totalRecords =
              bookingDetails?.totalRecord;
          context.read<AppSessionState>().allOrders?.pageIndex = 1;
          context
              .read<AppSessionState>()
              .allOrders
              ?.setValueForReload(value: true);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const _cancelColor = Color(0xffcb5150);
    const _partialColor = Color(0xfffff7ef);
    const _rectangleCancelColor = Color(0xffdc464b);
    const _rectanglePartialColor = Color(0xffdd9551);
    const _rectangleOpacity = 0.07000000029802322;
    const _greyTextColor = Color(0xff666666);
    const int id_3 = 3;

    return ADSelectorStateLessWidget(
      viewModel: getBookingDetailsState,
      child: Consumer<BookingAndCancellationState>(
        builder: (BuildContext context, value, Widget? child) {
          switch (value.getBookingDetailsState.viewStatus) {
            case Status.complete:
              final CommonOrderDetailBaseResponse bookingDetailsResponseModel =
                  value.getBookingDetailsState.data;
              final upgradeBooking = isUpgradeBooking(
                bookingDetailsResponseModel
                        .orderDetail?.pranaamDetail?.pranaamBookingType ??
                    '',
              );
              final statusHistory =
                  getBookingDetailsState.bookingDetailsResponse?.statusHistory;
              final bool isPartial = getBookingDetailsState.bookingDetailsResponse?.cancelType == 'Partial';
              final tripDetails = bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.tripDetails;
              final roundTripDetails = bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.roundTripDetail;
              final packageDetails = bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.packageDetail;
              final isRescheduleBooking = isReschedule(
                bookingDetailsResponseModel
                        .orderDetail?.pranaamDetail?.pranaamBookingType ??
                    '',
              );
              int cancelCount = 0;
              for (final pranaam_detail.Traveler element
                  in bookingDetailsResponseModel
                          .orderDetail?.pranaamDetail?.travelers ??
                      []) {
                if (element.passengerStatus == 'Cancelled') {
                  cancelCount += 1;
                }
              }
              PranaamBookingGaAnalytics().pranaamCancelPartialCancelGaAnalytics(
                bookingDetailsResponseModel,
                ClickEvents.book_pranaam_cancel_order_complete,
                bookingDetailsResponseModel.cancelType == 'Partial'
                    ? 'Partial'
                    : 'Complete',
                cancelCount,
              );
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: isPartial ? _partialColor : _cancelColor,
                  leading: InkWell(
                    onTap: () => onCloseTap(
                      isRoundTrip: tripDetails?.serviceTypeId == id_3,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: context.k_4),
                      child: Icon(
                        Icons.close,
                        size: context.k_30,
                        color: isPartial ? Colors.black : null,
                      ),
                    ),
                  ),
                  foregroundColor: context.adColors.whiteTextColor,
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: ConfirmationBottomBar(
                  buttons: [
                    ConfirmationBottomButtonModel(
                      icon: SvgAssets.bottomBarHome,
                      title: 'home'.localize(context),
                      onTap: () => {
                        Navigator.pop(context),
                        (BottomBarState.key.currentWidget as CustomTabScaffold)
                            .controller
                            ?.index = 0,
                        BottomTabNavKeys.homeTabItemKey.currentState
                            ?.popUntil((route) => route.isFirst),
                      },
                    ),
                    // ConfirmationBottomButtonModel(
                    //   icon: SvgAssets.confirmationBarModify,
                    //   title: 'modify'.localize(context),
                    //   onTap: () => onCloseTap(
                    //     isRoundTrip: bookingDetailsResponseModel
                    //             .createBooking.serviceTypeId ==
                    //         id_3,
                    //   ),
                    // ),
                    ConfirmationBottomButtonModel(
                      icon: SvgAssets.help,
                      title: 'help'.localize(context),
                      onTap: () => {
                        PranaamOrderDetailController().initHelpAPi(
                          context,
                          tripDetails?.serviceAirport ?? '',
                        ),
                      },
                    ),
                  ],
                ),
                body: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    CancelledConfirmedView(
                      phoneNumber:
                          '${bookingDetailsResponseModel.orderDetail?.pranaamDetail?.billingInfo?.countryDialCode} ${bookingDetailsResponseModel.orderDetail?.pranaamDetail?.billingInfo?.mobile}',
                      email:
                          'sent to ${bookingDetailsResponseModel.orderDetail?.pranaamDetail?.billingInfo?.email}',
                      title: isPartial
                          ? 'Partial Cancellation\nConfirmed!'
                          : 'Cancellation Confirmed!',
                      subTitle: 'Confirmation email has been',
                      backgroundColor: isPartial ? _partialColor : _cancelColor,
                      isPartial: isPartial,
                    ),
                    ADSizedBox(
                      height: context.k_19,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Booking Id',
                              style: ADTextStyle400.size14
                                  .setTextColor(_greyTextColor),
                            ),
                            // if (tripDetails?.serviceTypeId == id_3)
                            //   Column(
                            //     children: [
                            //       ADSizedBox(
                            //         height: context.k_13 - context.k_8,
                            //       ),
                            //       Row(
                            //         children: [
                            //           Text(
                            //             '(${getCityName(
                            //               tripDetails?.originAirport ?? '',
                            //               context
                            //                   .read<SiteCoreStateManagement>(),
                            //             )}',
                            //             style: ADTextStyle400.size12
                            //                 .setTextColor(_greyTextColor),
                            //           ),
                            //           const Icon(
                            //             Icons.arrow_forward,
                            //             size: 12,
                            //           ),
                            //           Text(
                            //             '${getCityName(
                            //               tripDetails?.destinationAirport ?? '',
                            //               context
                            //                   .read<SiteCoreStateManagement>(),
                            //             )})',
                            //             style: ADTextStyle400.size12
                            //                 .setTextColor(_greyTextColor),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   )
                            // else
                            //   const ADSizedBox(),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          getBookingDetailsState
                                  .bookingDetailsResponse?.orderReferenceId ??
                              '',
                          style: ADTextStyle700.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ],
                    ).paddingBySide(left: context.k_16, right: context.k_16),
                    ADSizedBox(
                      height: context.k_19,
                    ),
                    Divider(
                      thickness: 1.sp,
                      height: 1.sp,
                      color: context.adColors.paleGrey,
                    ),
                    // if (tripDetails?.serviceTypeId == id_3)
                    //   Column(
                    //     children: [
                    //       ADSizedBox(
                    //         height: context.k_19,
                    //       ),
                    //       Row(
                    //         children: [
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Booking Id',
                    //                 style: ADTextStyle400.size14
                    //                     .setTextColor(_greyTextColor),
                    //               ),
                    //               ADSizedBox(
                    //                 height: context.k_13 - context.k_8,
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     '(${getCityName(
                    //                       roundTripDetails?.originAirport ?? '',
                    //                       context
                    //                           .read<SiteCoreStateManagement>(),
                    //                     )}',
                    //                     style: ADTextStyle400.size12
                    //                         .setTextColor(_greyTextColor),
                    //                   ),
                    //                   const Icon(
                    //                     Icons.arrow_forward,
                    //                     size: 12,
                    //                   ),
                    //                   Text(
                    //                     '${getCityName(
                    //                       roundTripDetails
                    //                               ?.destinationAirport ??
                    //                           '',
                    //                       context
                    //                           .read<SiteCoreStateManagement>(),
                    //                     )})',
                    //                     style: ADTextStyle400.size12
                    //                         .setTextColor(_greyTextColor),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           const Spacer(),
                    //           Text(
                    //             getBookingDetailsState.bookingDetailsResponse
                    //                     ?.orderReferenceId ??
                    //                 '',
                    //             style: ADTextStyle700.size16.setTextColor(
                    //               context.adColors.blackTextColor,
                    //             ),
                    //           ),
                    //         ],
                    //       ).paddingBySide(
                    //         left: context.k_16,
                    //         right: context.k_16,
                    //       ),
                    //       ADSizedBox(
                    //         height: context.k_19,
                    //       ),
                    //       Divider(
                    //         thickness: 1.sp,
                    //         height: 1.sp,
                    //         color: context.adColors.paleGrey,
                    //       ),
                    //     ],
                    //   )
                    // else
                    //   const SizedBox(),
                    ADSizedBox(
                      height: context.k_19,
                    ),
                    Row(
                      children: [
                        Text(
                          'status'.localize(context),
                          style: ADTextStyle400.size14
                              .setTextColor(_greyTextColor),
                        ),
                        const Spacer(),
                        if (!isPartial)
                          Container(
                            width: context.k_64 + context.k_22,
                            height: context.k_24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_8),
                              ),
                              color: _rectangleCancelColor
                                  .withOpacity(_rectangleOpacity),
                            ),
                            child: Center(
                              child: Text(
                                'cancelled_pranaam'.localize(context),
                                style: ADTextStyle700.size12
                                    .setTextColor(const Color(0xffdc464b)),
                              ),
                            ),
                          )
                        else
                          Container(
                            // width: context.k_64 + context.k_22,
                            height: context.k_24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_8),
                              ),
                              color: _rectanglePartialColor
                                  .withOpacity(_rectangleOpacity),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.k_8,
                                ),
                                child: Text(
                                  'partially_cancelled'.localize(context),
                                  style: ADTextStyle700.size12
                                      .setTextColor(const Color(0xffdd9551)),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ).paddingBySide(left: context.k_16, right: context.k_16),
                    ADSizedBox(
                      height: context.k_19,
                    ),
                    Divider(
                      thickness: 1.sp,
                      height: 1.sp,
                      color: context.adColors.paleGrey,
                    ),
                    ADSizedBox(
                      height: context.k_32,
                    ),
                    GuestDetailView(
                      pranaamDetail: bookingDetailsResponseModel
                          .orderDetail?.pranaamDetail,
                    ),
                    ADSizedBox(height: context.k_20),
                    CancelConfirmationSummary(
                      bookingDetailsResponseModel: bookingDetailsResponseModel,
                    ),
                    PriceDetailsView(
                      showApplyCoupon: true,
                      addOnsList: bookingDetailsResponseModel
                              .orderDetail?.pranaamDetail?.addOnServices ??
                          [],
                      promoType: bookingDetailsResponseModel
                              .orderDetail
                              ?.pranaamDetail
                              ?.packageDetail
                              ?.pricingInfo
                              ?.discountCouponDetails
                              ?.promoType ??
                          '',
                      reward: bookingDetailsResponseModel
                              .orderDetail?.pranaamDetail?.totalLoyalty
                              ?.floorToDouble() ??
                          0,
                      totalMRP: _getTotalMRP(bookingDetailsResponseModel),
                      cGst: _getCgstAmount(bookingDetailsResponseModel),
                      sGst: _getSgstAmount(bookingDetailsResponseModel),
                      totalAmount: _getTotalAmount(bookingDetailsResponseModel),
                      addOnsAmount: upgradeBooking || isRescheduleBooking
                          ? 0
                          : getAddOnTotalPricePostBooking(
                              bookingDetailsResponseModel.orderDetail
                                      ?.pranaamDetail?.addOnServices ??
                                  [],
                            ),
                      discountAmount: bookingDetailsResponseModel
                              .transactionHistory
                              ?.first
                              .paidBy
                              ?.promo
                              ?.amount ??
                          0,
                      expressFareAmount:
                          _getExpressFare(bookingDetailsResponseModel) ?? 0,
                      packageName: packageDetails?.name,
                      isForReschedule: isReschedule(
                        bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.pranaamBookingType ??
                            '',
                      ),
                      rescheduleAmount: isReschedule(
                        bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.pranaamBookingType ??
                            '',
                      )
                          ? packageDetails?.pricingInfo?.totalBaseFare?.amount
                          : null,
                      isPostBooking: true,
                    ),
                    ADSizedBox(
                      height: context.k_22,
                    ),
                    Selector<BookingAndCancellationState, ADResponseState>(
                      selector: (context, viewModel) => viewModel.impInfoState,
                      builder: (
                        context,
                        value,
                        child,
                      ) {
                        switch (value.viewStatus) {
                          case Status.complete:
                            final important_information.Element elements =
                                value.data;
                            final List<important_information.ContentList>
                                importantInfo = elements.fields.contentList;
                            return ImportantInformation(
                              infoList: importantInfo,
                            );
                          case Status.loading:
                            const shimmerCount = 4;
                            final containerHeight = context.k_19;
                            final containerWidth = context.widthOfScreen / 2;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ADShimmerWidget.shimmerShape(
                                  type: ShimmerType.rectangleBox,
                                  height: containerHeight,
                                  width: containerWidth,
                                ),
                                ADSizedBox(
                                  height: context.k_20,
                                ),
                                ADShimmerBuilder(
                                  itemCount: shimmerCount,
                                  shimmerBuilderType:
                                      ShimmerBuilderType.listVertical,
                                  shimmerWidget: ADShimmerWidget.shimmerShape(
                                    height: containerHeight,
                                    type: ShimmerType.rectangleBox,
                                  ),
                                ),
                              ],
                            );
                          default:
                            return const ADSizedBox();
                        }
                      },
                    ),
                    ADSizedBox(
                      height: context.k_64 + context.k_40,
                    ),
                  ],
                ),
              );
            case Status.loading:
              return const CancellationConfirmationShimmer();
            case Status.error:
              return ADErrorPage(
                message: value.getBookingDetailsState.message,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void onCloseTap({required bool isRoundTrip}) {
    final CustomTabScaffold scaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    BottomBarState.currentIndex = id_2;
    scaffold.controller?.index = id_2;
    Navigator.of(context).popUntil((route) => route.settings.name == tabRoute);
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      myAccountView,
      argumentObject: [
        (widget.bookingId),
        false,
        isRoundTrip,
      ],
    );
  }

  double _getCgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalPranaamTax?.cgstAmount ??
        0;
  }

  double? _getExpressFare(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    final isForUpgrade = isUpgradeBooking(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );
    final isForReschedule = isReschedule(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );
    final isForStandalone = isStandAloneService(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );

    if (isForUpgrade) {
      return bookingDetailsResponseModel
              .orderDetail
              ?.pranaamDetail
              ?.packageDetail
              ?.originalPricingInfo
              ?.totalExpressFare
              ?.baseFare ??
          0;
    }
    if (isForReschedule) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
          ?.packageDetail?.oldPricingInfo?.totalExpressFare?.baseFare;
    }
    if (isForStandalone) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
          ?.standaloneProductDetails?.pricingInfo?.totalExpressFare?.baseFare;
    }

    return bookingDetailsResponseModel.orderDetail?.pranaamDetail?.packageDetail
        ?.pricingInfo?.totalExpressFare?.baseFare;
  }

  double _getSgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalPranaamTax?.sgstAmount ??
        0;
  }

  double _getTotalMRP(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    if (isUpgradeBooking(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    )) {
      final originalPricingInfo = bookingDetailsResponseModel
          .orderDetail?.pranaamDetail?.packageDetail?.originalPricingInfo;
      return originalPricingInfo?.totalBaseFare?.amount ?? 0;
    } else if (isReschedule(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    )) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.oldPricingInfo?.totalBaseFare?.amount ??
          0;
    }
    final pricingInfo = bookingDetailsResponseModel
        .orderDetail?.pranaamDetail?.packageDetail?.pricingInfo;
    return pricingInfo?.totalBaseFare?.amount ?? 0;
  }

  double _getTotalAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalTotalAmount ??
        0;
  }
}
