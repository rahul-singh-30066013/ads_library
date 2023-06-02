/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/search_results_enum.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

final double _originContainerHeight = 42.sp;

class DestinationSearchWidget extends StatelessWidget {
  final SelectDestinationState? viewModel;
  final ADTapCallback? onTapAirport;
  final ADTapCallback? onTapOtherLocations;
  final bool isAirportField;
  final bool isIconsSourceLocations;

  const DestinationSearchWidget({
    Key? key,
    this.viewModel,
    this.onTapAirport,
    this.onTapOtherLocations,
    required this.isAirportField,
    required this.isIconsSourceLocations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 14;
    return SizedBox(
      height: _originContainerHeight,
      child: TextFormField(
        scrollController: isAirportField
            ? viewModel?.airportTextFieldScrollController
            : viewModel?.otherLocationsTextFieldScrollController,
        focusNode: isAirportField
            ? viewModel?.sourceFocusNode
            : viewModel?.focusNodeDestination,
        keyboardType: TextInputType.streetAddress,
        cursorColor: context.adColors.blackTextColor,
        controller: isAirportField
            ? viewModel?.airportController
            : viewModel?.destinationController,
        decoration: InputDecoration(
          isDense: true,
          fillColor: context.adColors.transparentColor,
          hintText:
              viewModel?.selectDestinationNavigateModel?.isFromAirport ?? true
                  ? isAirportField
                      ? 'enter_airport_name'.localize(context)
                      : 'enter_drop_location'.localize(context)
                  : isAirportField
                      ? 'enter_airport_name'.localize(context)
                      : 'enter_pick_up_location'.localize(context),
          hintStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.greyTextColor,
          ),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(right: context.k_2),
          border: getBorder(context),
          focusedBorder: getBorder(context, isFocused: true),
          enabledBorder: getBorder(context),
          prefixIcon: SizedBox(
            width: iconSize,
            child: Center(
              child: SvgPicture.asset(
                !isIconsSourceLocations
                    ? SvgAssets.destinationAddress
                    : SvgAssets.sourceAddress,
                color: context.adColors.darkGreyTextColor,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          suffixIcon: (!isAirportField &&
                  (viewModel?.headerWidget == SearchResultsEnum.loading))
              ? ADDotProgressView(
                  size: context.k_4,
                  color: context.adColors.blackTextColor,
                )
              : (((viewModel?.airportController.text.isNotEmpty ?? false) &&
                          (viewModel?.sourceFocusNode.hasFocus ?? false) &&
                          isAirportField) ||
                      ((viewModel?.destinationController.text.isNotEmpty ??
                              false) &&
                          (viewModel?.focusNodeDestination.hasFocus ?? false) &&
                          !isAirportField))
                  ? InkWell(
                      splashColor: context.adColors.transparentColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_26)),
                      onTap: () => isAirportField
                          ? viewModel?.resetSearchQuery(
                              isTextControllerAirport: true,
                            )
                          : viewModel?.resetSearchQuery(
                              isTextControllerAirport: false,
                            ),
                      child: Icon(
                        Icons.clear,
                        color: context.adColors.darkGreyTextColor,
                        size: context.k_20,
                      ),
                    )
                  : null,
        ),
        textInputAction: TextInputAction.done,
        onTap: isAirportField ? onTapAirport : onTapOtherLocations,
        onChanged: (value) => isAirportField
            ? viewModel?.updateAirportSearchQuery(text: value)
            : viewModel?.updateDestinationsSearchQuery(queryInput: value),
        onEditingComplete: () => {},
        onFieldSubmitted: (value) => {
          if (isAirportField)
            viewModel?.updateAirportSearchQuery(text: value)
          else
            viewModel?.updateDestinationsSearchQuery(queryInput: value),
        },
      ),
    );
  }

  /// this method is use for set border on search bar
  InputBorder getBorder(BuildContext context, {bool isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        width: 1.sp,
        color: isFocused
            ? context.adColors.blackTextColor
            : context.adColors.textFieldBorderGrey,
      ),
    );
  }
}
