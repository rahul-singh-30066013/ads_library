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
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/zero_cancellation_amount_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/zero_cancellation_field.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ZeroCancellationSheet extends StatefulWidget {
  final ZeroCancellationField zeroCancellationField;
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  const ZeroCancellationSheet({
    Key? key,
    required this.zeroCancellationField,
    this.flightViewItineraryResponseModel,
  }) : super(key: key);

  @override
  State<ZeroCancellationSheet> createState() => _ZeroCancellationSheetState();
}

class _ZeroCancellationSheetState extends State<ZeroCancellationSheet> {
  @override
  Widget build(BuildContext context) {
    final ModelBox modelBox =
        widget.zeroCancellationField.modelBox ?? const ModelBox();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_6,
                ),
              ),
              border: Border.all(
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
            ),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_8,
                      ),
                    ),
                    color: const Color(0xffeef4fb),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${modelBox.additionalBenefit} ',
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
                            style: ADTextStyle700.size14.setTextColor(
                              context.adColors.black,
                            ),
                          ),
                        ],
                      ),
                    ).paddingBySide(
                      top: context.k_16,
                      bottom: context.k_16,
                      left: context.k_64,
                      right: context.k_64,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_20,
                ),
                Row(
                  children: [
                    Text(
                      modelBox.withZeroBreakup?.heading ?? '',
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.black,
                      ),
                    ),
                    SizedBox(
                      width: context.k_4,
                    ),
                    SvgPicture.asset(
                      SvgAssets.zeroCancellationIcon,
                      height: context.k_22,
                      width: context.k_22,
                    ).paddingBySide(
                      right: context.k_10,
                    ),
                  ],
                ),
                SizedBox(
                  height: context.k_20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: modelBox.withZeroBreakup?.breakup?.length,
                  itemBuilder: (context, index) {
                    final List<Breakup>? breakUp =
                        modelBox.withZeroBreakup?.breakup;
                    return ZeroCancellationAmountView(
                      label: breakUp?[index].label ?? '',
                      code: breakUp?[index].code,
                      hint: breakUp?[index].hint,
                      cancellationWithZeroBreakup: true,
                      refundAmount: _getTotalRefundAmountWithZeroCancellation()
                          .roundToDouble(),
                      cancellationFee: _getTotalClearTripCharges(
                        widget.flightViewItineraryResponseModel
                                ?.pricedItineraries ??
                            [],
                      ).roundToDouble(),
                    );
                  },
                ),
                Divider(
                  color: context.adColors.lightGreyGridSeparatorColor,
                ).paddingBySide(
                  top: context.k_16,
                  bottom: context.k_16,
                ),
                Row(
                  children: [
                    Text(
                      modelBox.withoutZeroBreakup?.heading ?? '',
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.black,
                      ),
                    ),
                    SizedBox(
                      width: context.k_4,
                    ),
                    SvgPicture.asset(
                      SvgAssets.redCrossIcon,
                    ),
                  ],
                ),
                SizedBox(
                  height: context.k_20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: modelBox.withoutZeroBreakup?.breakup?.length,
                  itemBuilder: (context, index) {
                    final List<Breakup>? breakUp =
                        modelBox.withoutZeroBreakup?.breakup;
                    return ZeroCancellationAmountView(
                      label: breakUp?[index].label ?? '',
                      code: breakUp?[index].code,
                      hint: breakUp?[index].hint,
                      cancellationFee: _getTotalClearTripCharges(
                        widget.flightViewItineraryResponseModel
                                ?.pricedItineraries ??
                            [],
                      ).roundToDouble(),
                      refundAmount:
                          _getTotalRefundAmountWithOutZeroCancellation()
                              .roundToDouble(),
                      cancellationWithZeroBreakup: false,
                    );
                  },
                ),
              ],
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,
              top: context.k_26,
              bottom: context.k_16,
            ),
          ),
          SizedBox(
            height: context.k_48,
          ),
          Text(
            modelBox.pleaseNote?.heading ?? '',
            style: ADTextStyle700.size18.setTextColor(
              context.adColors.black,
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: modelBox.pleaseNote?.notes?.length ?? 0,
            itemBuilder: (context, index) {
              final List<Description>? notes = modelBox.pleaseNote?.notes;
              return NotesView(
                noteText: notes?[index].label ?? '',
                placeHolder: notes?[index].placeholder ?? const PlaceHolder(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.k_10,
              );
            },
          ).paddingBySide(top: context.k_20),
          SizedBox(
            height: context.k_48,
          ),
          Text(
            modelBox.cancellationProcess?.heading ?? '',
            style: ADTextStyle500.size16.setTextColor(
              context.adColors.black,
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: modelBox.cancellationProcess?.notes?.length ?? 0,
            itemBuilder: (context, index) {
              final List<Description>? notes =
                  modelBox.cancellationProcess?.notes;
              return CancellationProcessView(
                noteText: notes?[index].label ?? '',
                placeHolder: notes?[index].placeholder ?? const PlaceHolder(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.k_10,
              );
            },
          ).paddingBySide(
            top: context.k_20,
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_48,
      ),
    );
  }

  /// this is use for get total clearTrip charges
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

  /// this is use for get total refund amount
  double _getTotalRefundAmountWithZeroCancellation() {
    return (widget.flightViewItineraryResponseModel?.pricingSummary?.baseFare ??
                0)
            .toDouble() +
        (widget.flightViewItineraryResponseModel?.pricingSummary?.taxes ?? 0)
            .toDouble();
  }

  double _getTotalRefundAmountWithOutZeroCancellation() {
    return ((widget.flightViewItineraryResponseModel?.pricingSummary
                        ?.baseFare ??
                    0)
                .toDouble() +
            (widget.flightViewItineraryResponseModel?.pricingSummary?.taxes ??
                    0)
                .toDouble()) -
        _getTotalClearTripCharges(
          widget.flightViewItineraryResponseModel?.pricedItineraries ?? [],
        );
  }
}

class NotesView extends StatefulWidget {
  final String noteText;
  final PlaceHolder placeHolder;
  const NotesView({required this.noteText, required this.placeHolder, Key? key})
      : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.k_4,
          height: context.k_4,
          decoration: BoxDecoration(
            color: context.adColors.circleGreyTextColor,
            shape: BoxShape.circle,
          ),
        ).paddingBySide(
          top: context.k_6,
          right: context.k_12,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.noteText.replaceAll('__tnc__', '')} ',
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.black,
                  ),
                ),
                TextSpan(
                  text: widget.placeHolder.tnc,
                  style: ADTextStyle400.size12
                      .setTextColor(
                        context.adColors.black,
                      )
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _openPdf(widget.placeHolder.tncLink ?? ''),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
}

class CancellationProcessView extends StatefulWidget {
  final String noteText;
  final PlaceHolder placeHolder;
  const CancellationProcessView({
    required this.noteText,
    required this.placeHolder,
    Key? key,
  }) : super(key: key);

  @override
  _CancellationProcessViewState createState() =>
      _CancellationProcessViewState();
}

class _CancellationProcessViewState extends State<CancellationProcessView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.k_4,
          height: context.k_4,
          decoration: BoxDecoration(
            color: context.adColors.circleGreyTextColor,
            shape: BoxShape.circle,
          ),
        ).paddingBySide(
          top: context.k_6,
          right: context.k_12,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.noteText.replaceAll('__vendor__', '')} ',
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.black,
                  ),
                ),
                TextSpan(
                  text: widget.placeHolder.vendor,
                  style: ADTextStyle400.size12
                      .setTextColor(
                        context.adColors.black,
                      )
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => navigateToScreenUsingNamedRouteWithArguments(
                              context,
                              webViewContainer,
                              argumentObject: WebViewModel(
                                url: widget.placeHolder.vendorLink ?? '',
                                title: '',
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
