/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/search_results_enum.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ListHeaderWidget extends StatelessWidget {
  final SearchResultsEnum headerWidget;
  final String searchQuery;
  final SelectDestinationState viewModel;
  static const int maxLinesForMessage = 2;
  static const int flexForMessage = 5;
  final int minimumCharacterCount;

  const ListHeaderWidget({
    Key? key,
    required this.headerWidget,
    required this.searchQuery,
    required this.viewModel,
    required this.minimumCharacterCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (headerWidget == SearchResultsEnum.noResult) {
      CabGoogleAnalytics().sendGAParametersLocationNotFound(viewModel);
      CabGoogleAnalytics().sendGACabBookingPickupDrop(
        viewModel,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: (headerWidget == SearchResultsEnum.recentSearches &&
              viewModel.recentDestinationsList.isNotEmpty)
          ? [
              SvgPicture.asset(
                SvgAssets.recentAddress,
                height: context.k_14,
                width: context.k_14,
                color: context.adColors.circleGreyTextColor,
              ).paddingBySide(
                top: context.k_8,
                bottom: context.k_8,
              ),
              SizedBox(
                width: context.k_10,
              ),
              Text(
                'recent_searches'.localize(context),
                style: ADTextStyle500.size12.setTextColor(
                  context.adColors.circleGreyTextColor,
                ),
              ).paddingBySide(
                top: context.k_8,
                bottom: context.k_8,
              ),
              const Spacer(),
            ]
          : headerWidget == SearchResultsEnum.minimumCharCount
              ? [
                  Expanded(
                    flex: flexForMessage,
                    child: Text(
                      'search_minimum_characters_message'
                          .localize(context)
                          .replaceFirst(
                            '##characterCount##',
                            '$minimumCharacterCount',
                          ),
                      style: ADTextStyle600.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                      maxLines: maxLinesForMessage,
                      textAlign: TextAlign.center,
                    ).paddingBySide(
                      top: context.k_8,
                      bottom: context.k_8,
                    ),
                  ),
                ]
              : headerWidget == SearchResultsEnum.noResult
                  ? [
                      Padding(
                        padding: EdgeInsets.only(
                          top: context.k_8,
                          bottom: context.k_8,
                        ),
                        child: NoDataFoundErrorScreen(
                          errorTitle: 'location_not_found'
                              .localize(context)
                              .replaceFirst('##query##', searchQuery),
                          errorMessage:
                              'check_for_spelling_errors_and_try_again'
                                  .localize(context),
                        ),
                      ),
                    ]
                  : [],
    );
  }
}
