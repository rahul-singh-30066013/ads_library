/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/travel_insurance_field.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class PolicyBenefitsView extends StatelessWidget {
  const PolicyBenefitsView({
    Key? key,
    required this.data,
    this.info,
    this.brandLogo,
    this.insuranceProvider,
    this.discountedAmount,
    this.modelTitle,
  }) : super(key: key);

  final List<Breakups> data;
  final Info? info;
  final String? brandLogo;
  final String? insuranceProvider;
  final double? discountedAmount;
  final String? modelTitle;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = 81.sp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                modelTitle ?? '',
                style: ADTextStyle700.size22.setTextColor(
                  context.adColors.black,
                ),
              ).paddingBySide(
                left: context.k_16,
                right: context.k_4,
              ),
              SizedBox(
                height: context.k_24,
              ),
              Container(
                color: _PolicyBenefitsTableConstants.color,
                height: context.k_40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _PolicyBenefitsTableConstants.columnFirstHeader
                          .localize(context),
                      textAlign: TextAlign.right,
                      style: ADTextStyle700.size12.setTextColor(
                        context.adColors.black,
                      ),
                    ).paddingBySide(
                      left: context.k_14,
                    ),
                    Text(
                      'sum_insu'.localize(context),
                      style: ADTextStyle700.size12.setTextColor(
                        context.adColors.black,
                      ),
                    ).paddingBySide(
                      right: context.k_14,
                    ),
                  ],
                ),
              ).paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
              Table(
                border: TableBorder.all(
                  color: _PolicyBenefitsTableConstants.color,
                ),
                columnWidths: const <int, TableColumnWidth>{
                  // 0: IntrinsicColumnWidth(),

                  0: FlexColumnWidth(1.5),

                  1: FlexColumnWidth(),

                  // 2: FixedColumnWidth(64),
                },
                children: data
                    .map(
                      (e) => TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: context.k_14,
                                top: context.k_8,
                                bottom: context.k_8,
                              ),
                              child: Text(
                                e.label ?? '',
                                style: ADTextStyle400.size12.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: context.k_14,
                                top: context.k_8,
                                bottom: context.k_8,
                                left: context.k_14,
                              ),
                              child: Text(
                                e.amount ?? '',
                                textAlign: TextAlign.right,
                                style: ADTextStyle400.size12.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ).paddingBySide(
                left: context.k_20,
                right: context.k_20,
                bottom: context.k_20,
              ),
              // DataTable(
              //   border: TableBorder.all(
              //     color: _PolicyBenefitsTableConstants.color,
              //   ),
              //   headingRowColor: MaterialStateColor.resolveWith(
              //     (states) => _PolicyBenefitsTableConstants.color,
              //   ),
              //   horizontalMargin:
              //       _PolicyBenefitsTableConstants.horizontalMargin.sp,
              //   columnSpacing: 0,
              //   headingTextStyle: ADTextStyle700.size12.setTextColor(
              //     context.adColors.black,
              //   ),
              //   columns: [
              //     DataColumn(
              //       label: Text(
              //         _PolicyBenefitsTableConstants.columnFirstHeader
              //             .localize(context),
              //         style: ADTextStyle700.size12.setTextColor(
              //           context.adColors.black,
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Expanded(
              //         child: Align(
              //           alignment: Alignment.centerRight,
              //           child: Text(
              //             'sum_insu'.localize(context),
              //             style: ADTextStyle700.size12.setTextColor(
              //               context.adColors.black,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              //   rows: data
              //       .map(
              //         (entry) => DataRow(
              //           cells: [
              //             DataCell(
              //               Align(
              //                 alignment: Alignment.centerLeft,
              //                 child: Text(
              //                   entry.label ?? '',
              //                   style: ADTextStyle400.size12.setTextColor(
              //                     context.adColors.black,
              //                   ),
              //                 ),
              //               ).paddingBySide(right: context.k_6),
              //             ),
              //             DataCell(
              //               Align(
              //                 alignment: Alignment.centerRight,
              //                 child: Text(
              //                   entry.amount ?? '',
              //                   style: ADTextStyle400.size12.setTextColor(
              //                     context.adColors.black,
              //                   ),
              //                 ),
              //               ).paddingBySide(
              //                 left: context.k_6,
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //       .toList(),
              // ).paddingBySide(
              //   left: context.k_20,
              //   right: context.k_20,
              //   bottom: context.k_20,
              //   top: context.k_26,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: _PolicyBenefitsTableConstants.bannerColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.k_4),
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: (info?.label ?? '')
                                .replaceAll('₹', '')
                                .replaceAll(
                                  '__ammount__',
                                  FlightUtils.getPriceFormatWithSymbol(
                                    price: discountedAmount ?? 0,
                                  ).toString(),
                                )
                                .replaceAll('__tnc__', ''),
                            style: ADTextStyle400.size12.setTextColor(
                              context.adColors.black,
                            ),
                          ),
                          TextSpan(
                            text: info?.placeholder?.tnc,
                            style: ADTextStyle400.size12
                                .setTextColor(
                                  context.adColors.black,
                                )
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (!(await FlightUtils.openPdf(
                                  info?.placeholder?.tncLink ?? '',
                                ))) {
                                  navigateToScreenUsingNamedRouteWithArguments(
                                    context,
                                    webViewContainer,
                                    argumentObject: WebViewModel(
                                      title: 'more_details'.localize(
                                        context,
                                      ),
                                      url: Uri.encodeFull(
                                        info?.placeholder?.tncLink ?? '',
                                      ),
                                    ),
                                  );
                                }
                              },
                          ),
                        ],
                      ),
                    ).paddingBySide(
                      top: context.k_10,
                      bottom: context.k_10,
                      left: context.k_14,
                      right: context.k_14,
                    ),
                  ),
                  SizedBox(
                    height: context.k_12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        insuranceProvider ?? '',
                        style: ADTextStyle400.size10.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                      Image.network(
                        brandLogo ?? '',
                        width: imageWidth,
                        height: context.k_28,
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PolicyBenefitsTableConstants {
  static const String columnFirstHeader = 'coverages';
  // static const double horizontalMargin = 10;

  //TODO: Define these colors in styleguide,
  static const Color color = Color(0xffececec);
  static const Color bannerColor = Color(0xfff8efe7);
}
