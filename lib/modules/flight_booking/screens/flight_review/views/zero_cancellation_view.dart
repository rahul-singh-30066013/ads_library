/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/zero_cancellation_sheet.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/site_core_insurance_data_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/zero_cancellation_field.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ZeroCancellationView extends StatefulWidget {
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  const ZeroCancellationView({this.flightViewItineraryResponseModel, Key? key})
      : super(key: key);

  @override
  State<ZeroCancellationView> createState() => _ZeroCancellationViewState();
}

class _ZeroCancellationViewState extends State<ZeroCancellationView> {
  double sizeOfCheckBox = 1.1;
  double withOfSizeBox = 0.9;
  double heightOfText = 13.sp;

  @override
  Widget build(BuildContext context) {
    final netAmount = (widget.flightViewItineraryResponseModel
                ?.zeroCancellationSummary?.netAmt ??
            0)
        .toDouble();
    final totalDiscountAmount = (widget.flightViewItineraryResponseModel
                ?.zeroCancellationSummary?.total ??
            0)
        .toDouble();
    return Selector<SiteCoreStateManagement, SiteCoreInsuranceDataResponse>(
      selector: (context, stateClass) =>
          stateClass.insuranceData ?? const SiteCoreInsuranceDataResponse(),
      builder: (BuildContext context, model, Widget? child) {
        final zeroCancellationField = model.fields?.zeroCancellationDetails;
        final parts =
            zeroCancellationField?.description?.labelText?.split('__price__') ??
                [];
        return zeroCancellationField != null &&
                (zeroCancellationField.zeroCancellationHeading?.trim() ?? '')
                    .isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        SvgAssets.zeroCancellationIcon,
                        height: context.k_36,
                        width: context.k_36,
                      ).paddingBySide(
                        right: context.k_10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              zeroCancellationField.zeroCancellationHeading ??
                                  '',
                              style: ADTextStyle700.size18.setTextColor(
                                context.adColors.black,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: parts.isNotEmpty ? parts.first : '',
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FlightUtils.getPriceFormatWithSymbol(
                                      price: _getTotalClearTripCharges(
                                        widget.flightViewItineraryResponseModel
                                                ?.pricedItineraries ??
                                            [],
                                      ).roundToDouble(),
                                    ),
                                    style: ADTextStyle500.size14.setTextColor(
                                      context.adColors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: parts.length > 1 ? parts[1] : '',
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ).paddingBySide(
                              top: context.k_10,
                            ),
                            GestureDetector(
                              onTap: () => _openSheet(
                                context,
                                zeroCancellationField,
                                widget.flightViewItineraryResponseModel,
                              ),
                              child: Text(
                                zeroCancellationField
                                        .description?.placeholder?.howToWork ??
                                    '',
                                style: ADTextStyle400.size14
                                    .setTextColor(context.adColors.black)
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ).paddingBySide(top: context.k_4),
                          ],
                        ),
                      ),
                      //  const Icon(Icons.flight_outlined),
                    ],
                  ),
                  Selector<ReviewFlightDetailsState, bool?>(
                    selector: (context, stateClass) =>
                        stateClass.valueForZeroCancellation,
                    builder: (
                      BuildContext context,
                      value,
                      Widget? child,
                    ) {
                      return GestureDetector(
                        onTap: () => !(widget.flightViewItineraryResponseModel
                                    ?.zeroCancellationSummary?.isActive ??
                                false)
                            ? setValueForZeroCancellation(
                                context,
                                valueOfZeroCancellation: true,
                              )
                            : setValueForZeroCancellation(
                                context,
                                valueOfZeroCancellation: false,
                              ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.adColors.greyReviewShade,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                context.k_8,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: context.k_2,
                              left: context.k_4,
                              bottom: context.k_2,
                              right: context.k_8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: sizeOfCheckBox,
                                      child: Checkbox(
                                        side: BorderSide(
                                          width: withOfSizeBox,
                                          color: context.adColors.black,
                                        ),
                                        activeColor: context.adColors.black,
                                        value: value,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              context.k_4,
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            setValueForZeroCancellation(
                                          context,
                                          valueOfZeroCancellation:
                                              value ?? false,
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          if (value ?? false)
                                            TextSpan(
                                              text: zeroCancellationField
                                                  .amountLabel,
                                              style: ADTextStyle500.size16
                                                  .setTextColor(
                                                context.adColors.black,
                                              ),
                                            )
                                          else
                                            TextSpan(
                                              text: 'add_for'.localize(context),
                                              style: ADTextStyle500.size16
                                                  .setTextColor(
                                                context.adColors.black,
                                              ),
                                            ),
                                          // if (netAmount == 0)
                                          //   TextSpan(
                                          //     text:
                                          //         ' ${'free'.localize(context)}',
                                          //     style: ADTextStyle700.size16
                                          //         .setTextColor(
                                          //       context.adColors.greenColor,
                                          //     ),
                                          //   ),
                                          TextSpan(
                                            text:
                                                ' ${FlightUtils.getPriceFormatWithSymbol(
                                              price: netAmount,
                                            )} ',
                                            style: ADTextStyle700.size24
                                                .setTextColor(
                                              context.adColors.black,
                                            ),
                                          ),
                                          if (netAmount != totalDiscountAmount)
                                            TextSpan(
                                              text: FlightUtils
                                                  .getPriceFormatWithSymbol(
                                                price: totalDiscountAmount,
                                              ),
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                    context.adColors.black,
                                                  )
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: value ?? false,
                                  child: SvgPicture.asset(
                                    SvgAssets.icCircleSuccess,
                                    color: const Color(0xff01ad75),
                                    width: context.k_22,
                                    height: context.k_22,
                                  ),
                                ).paddingBySide(right: context.k_8),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).paddingBySide(top: context.k_24),
                  SizedBox(
                    height: context.k_15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'exclude_fee'.localize(context)} ',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .setFontSize(heightOfText),
                        ),
                        TextSpan(
                          text: zeroCancellationField.tnCLabel ?? '',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .setFontSize(heightOfText)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _openPdf(
                                  zeroCancellationField.tnCLabelLink ?? '',
                                ),
                        ),
                        TextSpan(
                          text: '.',
                          style: ADTextStyle400.size12.setTextColor(
                            context.adColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
                bottom: context.k_40,
                top: context.k_40,
              )
            : const SizedBox.shrink();
      },
    );
  }

  double _getTotalClearTripCharges(List<PricedItinerary> priceItinerary) {
    double total = 0;
    for (final element in priceItinerary) {
      total =
          total + (element.miniRule?.airlineCharges?.cancel ?? 0).toDouble();
    }
    return total * getCountOfPassenger();
  }

  double getCountOfPassenger() {
    final List<PaxInfoList> paxInfoList =
        widget.flightViewItineraryResponseModel?.paxInfoList ?? [];
    double totalPassenger = 0;
    for (final element in paxInfoList) {
      if (element.passengerTypeCode == 'ADT' ||
          element.passengerTypeCode == 'CHD') {
        totalPassenger++;
      }
    }
    return totalPassenger;
  }

  Future<void> _openPdf(String tncLink) async {
    if (!(await FlightUtils.openPdf(
      tncLink,
    ))) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: WebViewModel(
          title: 'terms_and_condition'.localize(
            context,
          ),
          url: tncLink,
        ),
      );
    }
  }

  void setValueForZeroCancellation(
    BuildContext context, {
    required bool valueOfZeroCancellation,
  }) {
    context.read<ReviewFlightDetailsState>().setValueForVisibilityForStrip(
          value: false,
        );
    context
        .read<ReviewFlightDetailsState>()
        .setValueForZeroCancellation(valueOfZeroCan: valueOfZeroCancellation);
    context.read<ReviewFlightDetailsState>().viewItineraryDetails(
          context
                  .read<ReviewFlightDetailsState>()
                  .flightItineraryResponseModel
                  ?.itineraryId ??
              '',
          context.read<FlightCommonState>().reviewedUserID ?? '',
          requiredZeroCancellation: true,
          isZeroCancellation: valueOfZeroCancellation,
        );
  }

  void _openSheet(
    BuildContext context,
    ZeroCancellationField zeroCancellationField,
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
  ) {
    adShowBottomSheet(
      context: context,
      headerTitle:
          zeroCancellationField.description?.placeholder?.howToWork ?? '',
      childWidget: ZeroCancellationSheet(
        zeroCancellationField: zeroCancellationField,
        flightViewItineraryResponseModel: flightViewItineraryResponseModel,
      ),
    );
  }
}
