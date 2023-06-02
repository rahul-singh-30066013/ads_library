/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/content_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/important_info.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/line.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ShowImportantInformation extends StatelessWidget {
  final FlightViewTripResponseModel flightBookingResponseModel;
  const ShowImportantInformation({
    Key? key,
    required this.flightBookingResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImportantInfo? flightImportantInformation = context
        .read<FlightBookingConfirmationState>()
        .flightInformationPoliciesResponse;
    final List<ContentList> contentList =
        flightImportantInformation?.fields?.contentList ?? [];
    final List<FlightReviewDetailInfo> flightReviewDetailInfoList =
        flightBookingResponseModel
                .flightReviewDetailModel?.flightReviewDetailInfo ??
            [];
    final double textHeight = 1.3.sp;
    return contentList.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final contentTitle = contentList[index].title ?? '';
              final transitVisaContent =
                  transitVisaText(flightReviewDetailInfoList);
              final terminalAirportChangeContent = terminalAirportChangeText(
                context,
                flightReviewDetailInfoList,
              );
              final List<Line> linesWithTransitAndVisa = [];
              if (index == 0) {
                if (transitVisaContent.isNotEmpty) {
                  linesWithTransitAndVisa.add(Line(line: transitVisaContent));
                }
                if (terminalAirportChangeContent.isNotEmpty) {
                  linesWithTransitAndVisa
                      .add(Line(line: terminalAirportChangeContent));
                }
              }
              final List<Line> lines =
                  contentList.isNotEmpty ? contentList.first.lines ?? [] : [];
              linesWithTransitAndVisa.addAll(lines);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contentTitle,
                    style: ADTextStyle700.size22
                        .setTextColor(context.adColors.blackTextColor),
                  ).paddingBySide(top: context.k_10, bottom: context.k_20),
                  if (linesWithTransitAndVisa.isNotEmpty)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: linesWithTransitAndVisa.length,
                      itemBuilder: (context, index) {
                        final contentToDisplay =
                            linesWithTransitAndVisa[index].line ?? '';

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•  ',
                              style: ADTextStyle700.size24.setTextColor(
                                context.adColors.greyChartTextColor,
                              ),
                            ),
                            // Expanded(
                            //   child: Text(
                            //     contentToDisplay,
                            //     style: ADTextStyle400.size14
                            //         .setTextColor(context.adColors.black)
                            //         .copyWith(height: textHeight),
                            //   ).paddingBySide(top: context.k_2),
                            // ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          contentToDisplay.contains('__tnc__.')
                                              ? contentToDisplay.replaceAll(
                                                  '__tnc__.',
                                                  '',
                                                )
                                              : contentToDisplay.replaceAll(
                                                  '__tnc__',
                                                  '',
                                                ),
                                      style: ADTextStyle400.size14
                                          .setTextColor(context.adColors.black)
                                          .copyWith(height: textHeight),
                                    ),
                                    TextSpan(
                                      text: (linesWithTransitAndVisa[index]
                                                      .links ??
                                                  [])
                                              .isNotEmpty
                                          ? linesWithTransitAndVisa[index]
                                              .links
                                              ?.first
                                              .linkText
                                          : '',
                                      style: ADTextStyle400.size14
                                          .setTextColor(context.adColors.black)
                                          .copyWith(height: textHeight)
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _openPdf(
                                              linesWithTransitAndVisa[index]
                                                  .links
                                                  ?.first
                                                  .linkURL,
                                              context,
                                            ),
                                    ),
                                    TextSpan(
                                      text: contentToDisplay
                                                  .contains('__tnc__.') ||
                                              contentToDisplay
                                                  .contains('__tnc__')
                                          ? '.'
                                          : '',
                                      style: ADTextStyle400.size14
                                          .setTextColor(context.adColors.black)
                                          .copyWith(height: textHeight),
                                    ),
                                  ],
                                ),
                              ).paddingBySide(top: context.k_2),
                            ),
                          ],
                        ).paddingBySide(bottom: context.k_10);
                      },
                    ),
                ],
              );
            },
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_30,
          )
        : const SizedBox.shrink();
  }

  Future<void> _openPdf(String? linkUrl, BuildContext context) async {
    if (!(await FlightUtils.openPdf(
      linkUrl ?? '',
    ))) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: WebViewModel(
          title: 'terms_and_condition'.localize(
            context,
          ),
          url: linkUrl ?? '',
        ),
      );
    }
  }

  ///This is used to make the transitVisa Text
  String transitVisaText(
    List<FlightReviewDetailInfo> flightReviewDetailInfoList,
  ) {
    final visaTexts = StringBuffer();
    for (final FlightReviewDetailInfo objectReviewItem
        in flightReviewDetailInfoList) {
      for (final JourneyFlightDetails object
          in objectReviewItem.journeyFlightDetails ?? []) {
        final transitText = object.transitVisaMessage ?? '';
        final isValid = transitText.isNotEmpty &&
            !visaTexts.toString().contains(transitText);
        if (visaTexts.isNotEmpty && isValid) {
          visaTexts.write('\n');
        }
        if (isValid) {
          visaTexts.write(object.transitVisaMessage ?? '');
        }
      }
    }
    return visaTexts.toString();
  }

  ///This is used to make the terminal and airport text for the important information.
  String terminalAirportChangeText(
    BuildContext context,
    List<FlightReviewDetailInfo> flightReviewDetailInfoList,
  ) {
    bool isTerminalChange = false;
    bool isAirportChange = false;

    for (final FlightReviewDetailInfo objectReviewItem
        in flightReviewDetailInfoList) {
      for (final JourneyFlightDetails object
          in objectReviewItem.journeyFlightDetails ?? []) {
        if ((object.isTerminalChange ?? false) && !isTerminalChange) {
          isTerminalChange = true;
        }
        if ((object.isAirportChange ?? false) && !isAirportChange) {
          isAirportChange = true;
        }
      }
    }

    final terminalTexts = StringBuffer();
    if (isTerminalChange) {
      terminalTexts.write(
        'terminal_change'.localize(context),
      );
    }
    if (isAirportChange) {
      if (terminalTexts.isNotEmpty) {
        terminalTexts.write('\n');
      }
      terminalTexts.write(
        'airport_change'.localize(context),
      );
    }
    return terminalTexts.toString();
  }
}
