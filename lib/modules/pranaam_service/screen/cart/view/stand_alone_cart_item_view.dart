import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneCartItemView extends StatelessWidget {
  const StandAloneCartItemView({
    Key? key,
    required this.serviceName,
    required this.serviceAirportCityName,
    required this.tripDetail,
    required this.price,
    required this.removeButtonWidget,
    required this.quantitySectionWidget,
    this.imageUrl,
  }) : super(key: key);
  final String serviceName;
  final String serviceAirportCityName;
  final TripDetail tripDetail;
  final double price;
  final Widget removeButtonWidget;
  final Widget quantitySectionWidget;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = 155.sp;
    final double containerWidth = 114.sp;
    const int flex = 3;
    const int maxLines = 2;
    final double imageWidth = 100.sp;
    final double imageHeight = 106.sp;
    final double paddingFive = 5.sp;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.k_4),
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          height: containerHeight,
          width: containerWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.k_10),
            child: (imageUrl != null && (imageUrl ?? '').isNotEmpty)
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: imageWidth,
                    height: imageHeight,
                    imageUrl: imageUrl ?? '',
                  )
                : Image.asset(
                    'lib/assets/images/pranaam/porter2.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(
          width: context.k_20,
        ),
        Expanded(
          flex: flex,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: ADTextStyle700.size18,
              ),
              SizedBox(
                height: context.k_16,
              ),
              Text(
                serviceAirportCityName,
                style: ADTextStyle500.size16,
              ),
              Row(
                children: [
                  Text(
                    getServiceType(tripDetail.serviceType) == roundTripServiceId
                        ? 'Departure'
                        : tripDetail.serviceType,
                    style: ADTextStyle500.size16,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: context.k_4,
                  ),
                  Expanded(
                    child: Text(
                      '(${tripDetail.travelSector})',
                      style: ADTextStyle500.size16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ).paddingBySide(
                top: paddingFive,
                bottom: paddingFive,
              ),
              Row(
                children: [
                  Text(
                    formatDateTime(
                      dateTimeType: formatFlightDateForCartScreen(
                        tripDetail.flightDate,
                      ),
                      dateTimeFormat: dateTimeFormatDayMonthYear,
                    ),
                    style: ADTextStyle500.size16,
                  ),
                  Text(
                    ', ${formatPaymentServiceTime(tripDetail.serviceDateTime)}',
                    style: ADTextStyle500.size16,
                  ),
                ],
              ).paddingBySide(bottom: paddingFive),
              if (getServiceType(tripDetail.serviceType) == roundTripServiceId)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'arrival'.localize(context),
                          style: ADTextStyle500.size16,
                          maxLines: maxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ).paddingBySide(
                      top: paddingFive,
                      bottom: paddingFive,
                    ),
                    Row(
                      children: [
                        Text(
                          formatDateTime(
                            dateTimeType: formatFlightDateForCartScreen(
                              tripDetail.transitRoundTripSecFlightDate,
                            ),
                            dateTimeFormat: dateTimeFormatDayMonthYear,
                          ),
                          style: ADTextStyle500.size16,
                        ),
                        Text(
                          ', ${reviewArrivalTime(tripDetail.transitRoundTripSecFlightTime)}',
                          style: ADTextStyle500.size16,
                        ),
                      ],
                    ).paddingBySide(bottom: paddingFive),
                  ],
                ),
              ADSizedBox(
                height: context.k_8,
              ),
              quantitySectionWidget,
              ADSizedBox(
                height: context.k_16,
              ),
              Row(
                children: [
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(
                      price: price,
                    ),
                    //'₹${cartItemModel.price}',
                    style: ADTextStyle700.size18,
                  ),
                  const Spacer(),
                  removeButtonWidget,
                ],
              ),
              ADSizedBox(
                height: context.k_12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
