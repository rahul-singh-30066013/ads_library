import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/train/train_man_order.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class TrainBookingView extends StatefulWidget {
  const TrainBookingView({
    Key? key,
    this.onTap,
    required this.myBookingListItem,
    required this.isFromMoreScreen,
    this.bookingHistory,
  }) : super(key: key);
  static const double borderWidth = 0.5;
  static double boxHeight = 66.sp;
  static int oneWayColor = 0xff868686;
  static int confirmedBookingColor = 0xff13a180;
  static int stringInterpolation = 3;
  final ADTapCallback? onTap;

  final MyBookingListItem myBookingListItem;
  final bool isFromMoreScreen;
  final BookingHistory? bookingHistory;

  @override
  State<TrainBookingView> createState() => _TrainBookingViewState();
}

class _TrainBookingViewState extends State<TrainBookingView> {
  @override
  Widget build(BuildContext context) {
    final date =
        widget.myBookingListItem.orderDetail?.trainManOrder?.boardingDate;
    //final dateTime = DateFormat('dd MMM yyyy').format(DateTime(int.parse(date.)));
    final TrainManOrder? order =
        widget.myBookingListItem.orderDetail?.trainManOrder;
    //final boarding=widget.myBookingListItem.fields?.trainManOrder?.dest;
    final status = widget.myBookingListItem.status ?? '';
    Color statusColor = Colors.red;
    // final String originNameWithCode;
    // final String destinationNameWithCode;
    //
    // originNameWithCode = (order?.originName?.length ?? 0) >
    //         TrainBookingView.stringInterpolation
    //     ? '${((order?.originName ?? '').trim()).substring(0, TrainBookingView.stringInterpolation)}..(${order?.origin ?? ''})'
    //     : '${(order?.originName ?? '').trim()}..(${order?.origin ?? ''})';
    //
    // destinationNameWithCode = (order?.DestName?.length ?? 0) >
    //         TrainBookingView.stringInterpolation
    //     ? '${((order?.DestName ?? '').trim()).substring(0, TrainBookingView.stringInterpolation)}..(${order?.dest ?? ''})'
    //     : '${(order?.DestName ?? '').trim()}..(${order?.dest ?? ''})';

    switch (status) {
      case 'Confirmed':
      case 'CONFIRMED':
      case 'Booked':
        statusColor = Color(TrainBookingView.confirmedBookingColor);
        break;
      case 'PENDING':
        statusColor = Colors.orange;
        break;
    }
    final dateTime = DateTime.parse(date.toString());
    final journeyDate = DateFormat('dd MMM yyyy').format(dateTime);

    return InkWell(
      onTap: () => navigateToScreenUsingNamedRouteWithArguments(
        context,
        trainBooking,
        argumentObject:
            widget.myBookingListItem.orderDetail?.trainManOrder?.tmBookingId,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: TrainBookingView.boxHeight,
              height: TrainBookingView.boxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(context.k_4),
                ),
                border: Border.all(
                  color: context.adColors.tileBorderColor,
                  width: TrainBookingView.borderWidth,
                ),
                color: context.adColors.whiteTextColor,
              ),
              child:
                  // Icons.train,
                  SvgPicture.asset('lib/assets/images/svg/icons/train.svg'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        order?.origin ?? '',
                        style: ADTextStyle700.size16,
                      ),
                      //Image.asset('assets/images/trainman/trainman_svg/roundTrip.svg'),
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/one way.svg',
                        //SvgAssets.roundTrip,
                        height: context.k_8,

                        width: context.k_11,
                        color: Color(TrainBookingView.oneWayColor),
                        fit: BoxFit.cover,
                      ).paddingBySide(
                        left: context.k_6,
                        right: context.k_6,
                      ),
                      // Icon(
                      //   Icons.keyboard_arrow_right,
                      //   size: context.k_20,
                      //   color: context.adColors.blackTextColor,
                      // ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            order?.destination ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: ADTextStyle700.size16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_8,
                  ),
                  Text(
                    journeyDate,
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  Row(
                    children: [
                      Text(
                        order?.trainNumber.toString() ?? '',
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                      //oval
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: context.k_6),
                        width: context.k_4,
                        height: context.k_4,
                        decoration: BoxDecoration(
                          color: context.adColors.circleGreyTextColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.k_10,
                      ),
                      Text(
                        order?.trainName ?? '',
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  if (widget.myBookingListItem.status?.toLowerCase() ==
                      'tdr entered')
                    Text(
                      widget.myBookingListItem.status ?? '',

                      style: ADTextStyle600.size14
                          .copyWith(color: statusColor), //TextStyle(
                      // fontStyle:
                      //   height: 14,
                      //   color: Color.fromARGB(255, 19, 161, 128),
                      // ),
                    )
                  else if (widget.myBookingListItem.status?.toLowerCase() ==
                      'manually_cancelled')
                    Text(
                      'Cancelled',

                      style: ADTextStyle600.size14
                          .copyWith(color: statusColor), //TextStyle(
                      // fontStyle:
                      //   height: 14,
                      //   color: Color.fromARGB(255, 19, 161, 128),
                      // ),
                    )
                  else
                    Text(
                      (widget.myBookingListItem.status ?? '')
                          .toLowerCase()
                          .capitalizeFirstChar(),

                      style: ADTextStyle600.size14
                          .copyWith(color: statusColor), //TextStyle(
                      // fontStyle:
                      //   height: 14,
                      //   color: Color.fromARGB(255, 19, 161, 128),
                      // ),
                    ),
                ],
              ).paddingBySide(left: context.k_16),
            ),
            Align(
              child: Icon(
                Icons.keyboard_arrow_right,
                size: context.k_20,
                color: context.adColors.blackTextColor,
              ).paddingBySide(left: context.k_20),
              //Icon(
              //   Icons.keyboard_arrow_right,
              //   size: context.k_20,
              //   color: context.adColors.blackTextColor,
              // ),
            ).paddingBySide(left: context.k_20),
          ],
        ).paddingAllSide(context.k_16),
      ),
    );
  }
}
