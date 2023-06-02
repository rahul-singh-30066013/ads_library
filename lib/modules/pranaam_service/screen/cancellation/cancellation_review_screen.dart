import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/cancel_booking/api_request_model/cancel_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class CancellationReviewScreen extends StatefulWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  final List<pranaam_detail.Traveler> travellersModel;
  final String bookingId;

  const CancellationReviewScreen({
    Key? key,
    required this.bookingDetailsResponseModel,
    required this.travellersModel,
    required this.bookingId,
  }) : super(
          key: key,
        );

  @override
  _CancellationReviewScreenState createState() =>
      _CancellationReviewScreenState();
}

class _CancellationReviewScreenState extends State<CancellationReviewScreen> {
  final double _heightOfConfirmButton = 54.sp;
  final double _footerHeight = 60.sp;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final BookingAndCancellationState bookingAndCancellationState =
      BookingAndCancellationState();

// class CancellationReviewScreen extends StatefulWidget {
//   final BookingDetailsResponseModel bookingDetailsResponseModel;
//   final List<TravellersModel> travellersModel;
//
//   // CancellationReviewScreen(
//   //   {
//   //   required this.bookingDetailsResponseModel,
//   //   required this.travellersModel,
//   //   Key? key,
//   // }) : super(
//   //         key: key,
//   //       );
//
//   CancellationReviewScreen({
//     Key? key,
//     required this.bookingDetailsResponseModel,
//     required this.travellersModel,
//   }) : super(key: key);
//
//   @override
//   State<CancellationReviewScreen> createState() => _CancellationReviewScreenState();
// }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Review Details',
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check details and confirm cancellation',
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
                FlightDetailView(
                  bookingDetailsResponseModel:
                      widget.bookingDetailsResponseModel,
                ),
              ],
            ).paddingBySide(left: context.k_16, top: context.k_16),
            PaxDetails(
              bookingDetailsResponseModel: widget.bookingDetailsResponseModel,
              travellersModel: widget.travellersModel,
            ),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (_, bool value, __) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.adColors.blueColor,
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.k_28),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      _heightOfConfirmButton,
                    ),
                  ),
                  onPressed: () => {
                    if (!value)
                      {
                        prepareCancellationRequest(context),
                      },
                  },

                  // {
                  //   navigateToScreenUsingNamedRoute(
                  //     context,
                  //     pranaamCancellationConfirmation,
                  //   ),
                  // },
                  child: value
                      ? ADDotProgressView(
                          color: context.adColors.whiteTextColor,
                        )
                      : Text(
                          'confirm'.localize(context),
                          style: ADTextStyle700.size18.setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                        ),
                ).paddingBySide(
                  left: context.k_16,
                  top: context.k_40,
                  right: context.k_16,
                );
              },
            ),
            InkWell(
              onTap: () => {
                if (!DeBounce.isRedundantClick())
                  {
                    initCancellationPoliciesApi(context),
                  },
              },
              child: Text(
                'View Cancellation Policy',
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                textAlign: TextAlign.center,
              ).paddingBySide(top: context.k_20),
            ),
            SizedBox(
              height: context.k_36,
            ),
            Container(
              alignment: Alignment.center,
              height: _footerHeight,
              child: Text(
                'Note: Cancellation (full/partial) can only be done once.',
                textAlign: TextAlign.center,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.greyTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> prepareCancellationRequest(
    BuildContext context,
  ) async {
    final List<int> passengerList = [];
    if (widget.travellersModel.isNotEmpty) {
      for (int index = 0; index < widget.travellersModel.length; index++) {
        passengerList.add(widget.travellersModel[index].passengerId ?? 0);
      }
    }

    final CancellationData cancellationData = CancellationData()
      ..bookingId = widget.bookingId
      ..passengersList = passengerList;

    updateLoading(value: true);
    final ADResponseState responseState =
        await bookingAndCancellationState.cancelBookingDetails(
      CancelBookingRequestModel(
        orderReferenceId: cancellationData.bookingId,
        // countryDialCode: bookingAndCancellationState.bookingDetailsResponse
        //         ?.orderDetail?.pranaamDetail?.billingInfo?.countryDialCode
        //         .toString() ??
        //     '91',
        passengerIdList: cancellationData.passengersList,
      ),
    );
    context.read<AppSessionState>().getUpcomingBookings();
    final String isPartial =
        widget.travellersModel.length > passengerList.length
            ? 'Complete'
            : 'Partial';
    if (responseState.viewStatus == Status.complete) {
      PranaamBookingGaAnalytics().pranaamCancelPartialCancelGaAnalytics(
        widget.bookingDetailsResponseModel,
        ClickEvents.book_pranaam_cancel_order_confirm,
        isPartial,
        passengerList.length,
      );
      final ADResponseState getBookingState =
          await bookingAndCancellationState.getBookingDetails(
        orderId: '',
        fromInit: true,
      );
      navigateUsingPushNamedAndRemoveUntil(
        context,
        pranaamCancellationConfirmation,
        (route) => route.isFirst,
        argumentsData: widget.bookingId,
      );

      context.read<AppSessionState>().updateValueOfBooking(updateValue: true);
      if (getBookingState.viewStatus == Status.complete) {
        updateLoading(value: false);
      }
    } else {
      updateLoading(value: false);
      PranaamBookingGaAnalytics().pranaamCancelOrderFailGaAnalytics(
        bookingAndCancellationState,
        ClickEvents.book_pranaam_cancel_order_fail,
        responseState,
        isPartial,
        passengerList.length,
      );
      SnackBarUtil.showSnackBar(
        context,
        responseState.message ?? '',
      );
    }
  }

  void updateLoading({required bool value}) {
    adLog('update Loading');
    isLoading.value = value;
  }
}

class FlightDetailView extends StatelessWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;

  const FlightDetailView({
    Key? key,
    required this.bookingDetailsResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pranaam_detail.PranaamDetail? pranaamDetail =
        bookingDetailsResponseModel.orderDetail?.pranaamDetail;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff4f9ff),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getCityName(
              pranaamDetail?.tripDetails?.serviceAirport ?? '',
              context.read<SiteCoreStateManagement>(),
            ),
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.neutralInfoMsg),
          ).paddingBySide(top: context.k_22, left: context.k_22),
          FlightDetailRow(
            bookingDetailsResponseModel: bookingDetailsResponseModel,
          ),
          // FlightDetailRow(
          //     bookingDetailsResponseModel: bookingDetailsResponseModel,),
        ],
      ),
    ).paddingBySide(
      top: context.k_20,
      right: context.k_20,
    );
  }
}

class FlightDetailRow extends StatelessWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;

  const FlightDetailRow({
    Key? key,
    required this.bookingDetailsResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _circleRadius = 8;
    const Color _iconColor = Color(0xffbbbbbb);
    final pranaam_detail.TripDetails? tripDetails =
        bookingDetailsResponseModel.orderDetail?.pranaamDetail?.tripDetails;
    final pranaam_detail.TripDetails? roundTripDetails =
        bookingDetailsResponseModel.orderDetail?.pranaamDetail?.roundTripDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: context.k_8,
          children: [
            Text(
              tripDetails?.serviceTypeId == id_3
                  ? 'Departure (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})'
                  : '${ServiceBookingDetails.getInstance().getServiceName(tripDetails?.serviceTypeId ?? 0)} (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})',
              style: ADTextStyle400.size18
                  .setTextColor(context.adColors.blackTextColor),
            ),
            const Icon(
              Icons.circle,
              size: _circleRadius,
              color: _iconColor,
            ).paddingBySide(right: context.k_10, left: context.k_10),
            Text(
              tripDetails?.flightName ?? '',
              style: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ],
        ),
        Text(
          '${formatDateTimeFlightServiceDate(
            tripDetails?.serviceDateTime,
          )} , ${formatDateTimeFlightService12Time(
            tripDetails?.serviceDateTime,
          )}',
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ).paddingBySide(top: context.k_10),
        if (tripDetails?.serviceTypeId == id_3)
          Row(
            children: [
              Text(
                'Arrival (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})',
                style: ADTextStyle400.size18
                    .setTextColor(context.adColors.blackTextColor),
              ),
              const Icon(
                Icons.circle,
                size: _circleRadius,
                color: _iconColor,
              ).paddingBySide(
                left: context.k_10,
                right: context.k_10,
              ),
              Text(
                roundTripDetails?.flightName ?? '',
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ],
          ).paddingBySide(top: context.k_10),
        if (tripDetails?.serviceTypeId == id_3)
          Text(
            '${formatDateTimeFlightServiceDate(
              roundTripDetails?.serviceDateTime,
            )} , ${formatDateTimeFlightService12Time(
              roundTripDetails?.serviceDateTime,
            )}',
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(
            top: context.k_14,
          ),
        SizedBox(
          height: context.k_20,
        ),
      ],
    ).paddingBySide(
      left: context.k_22,
      top: context.k_14,
    );
  }
}

class PaxDetails extends StatelessWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  final List<pranaam_detail.Traveler> travellersModel;

  const PaxDetails({
    Key? key,
    required this.bookingDetailsResponseModel,
    required this.travellersModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripTypeCount = bookingDetailsResponseModel
                .orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
            id_3
        ? 2
        : 1;
    final paxCount = travellersModel.length;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tripTypeCount,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  getCityName(
                    index == 1
                        ? bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.roundTripDetail?.originAirport ??
                            ''
                        : bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.tripDetails?.originAirport ??
                            '',
                    context.read<SiteCoreStateManagement>(),
                  ),
                  style: ADTextStyle500.size16
                      .setTextColor(context.adColors.blackTextColor),
                ).paddingBySide(right: context.k_6),
                SvgPicture.asset(
                  'lib/assets/images/svg/icons/flight/one way.svg',
                  width: context.k_12,
                  fit: BoxFit.cover,
                ).paddingBySide(right: context.k_6),
                Text(
                  getCityName(
                    index == 1
                        ? bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.roundTripDetail?.destinationAirport ??
                            ''
                        : bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                ?.tripDetails?.destinationAirport ??
                            '',
                    context.read<SiteCoreStateManagement>(),
                  ),
                  style: ADTextStyle500.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              top: context.k_30,
            ),
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: paxCount,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        '${getSalutationsTitleById(
                          travellersModel[index].salutationId.toString(),
                          context.read<SiteCoreStateManagement>().salutation,
                        )} '
                        '${travellersModel[index].firstName} '
                        '${travellersModel[index].lastName}',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      Text(
                        ServiceBookingDetails.getInstance().getPassengerType[
                                travellersModel[index].passengerTypeId] ??
                            '',
                        style: ADTextStyle400.size12
                            .setTextColor(context.adColors.greyTextColor),
                      ).paddingBySide(
                        left: context.k_8,
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    top: context.k_20,
                  );
                },
              ),
            ),
            if (index < tripTypeCount - 1)
              const Divider(
                height: 1,
              ).paddingBySide(
                top: context.k_30,
                left: context.k_16,
                right: context.k_16,
              )
            else
              const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
