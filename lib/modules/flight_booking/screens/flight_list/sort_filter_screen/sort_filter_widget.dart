/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_listing_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// builds the sort filter button for flight listing screen
class SortFilterWidget extends StatefulWidget {
  const SortFilterWidget({
    Key? key,
    required this.flightListingProvider,
    required this.isOneWay,
  }) : super(key: key);

  final FlightListingState? flightListingProvider;
  final bool isOneWay;

  @override
  State<SortFilterWidget> createState() => _SortFilterWidgetState();
}

class _SortFilterWidgetState extends State<SortFilterWidget> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.flightListingProvider?.isResetApply ?? false) {
      count = 0;
    }
    // return RawChip(
    //   shadowColor: context.adColors.transparentColor,
    //   elevation: 0,
    //   deleteIconColor: Colors.blue,
    //   onDeleted: (count != 0) ? () => onFilterTap() : null,
    //   deleteButtonTooltipMessage: '',
    //   deleteIcon: (count != 0)
    //       ? CircleAvatar(
    //           backgroundColor: context.adColors.whiteTextColor,
    //           child: Text(
    //             count.toString(),
    //             style: ADTextStyle600.size12,
    //             textAlign: TextAlign.center,
    //           ),
    //         )
    //       : const SizedBox.shrink(),
    //   padding: EdgeInsets.symmetric(
    //     vertical: context.k_12,
    //     horizontal: context.k_14,
    //   ),
    //   backgroundColor: context.adColors.blackColor,
    //   // backgroundColor: context.adColors.sortFilterButtonColor,
    //   label: Text(
    //     'sort_and_filter'.localize(context),
    //     style: ADTextStyle500.size14.setTextColor(
    //       context.adColors.whiteTextColor,
    //     ),
    //   ),
    //   avatar: SvgPicture.asset(
    //     SvgAssets.filterIcon,
    //     color: context.adColors.whiteTextColor,
    //     height: context.k_12,
    //   ),
    //   onSelected: (bool value) => onFilterTap(),
    // );
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: context.k_12,
            horizontal: context.k_18,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          context.adColors.blackColor,
        ),
      ),
      onPressed: () => onFilterTap(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgAssets.filterIcon,
            color: context.adColors.whiteTextColor,
            height: context.k_12,
          ),
          ADSizedBox(
            width: context.k_8,
          ),
          Text(
            'filters'.localize(context),
            style: ADTextStyle500.size14.setTextColor(
              context.adColors.whiteTextColor,
            ),
          ),
          if (count != 0)
            ADSizedBox(
              width: context.k_8,
            ),
          if (count != 0)
            CircleAvatar(
              radius: context.k_8,
              backgroundColor: context.adColors.whiteTextColor,
              child: Text(
                count.toString(),
                style: ADTextStyle600.size12,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  void onFilterTap() {
    HapticFeedback.mediumImpact();
    adShowFilterBottomSheet(
      context: context,
      childWidget: SortFilterScreen(
        flightListingProvider: widget.flightListingProvider,
        filterSortModel: widget.flightListingProvider?.filterSortModel ??
            FilterSortModel.defaultFilterSort(),
        isOneWay: widget.isOneWay,
        outBoundFilterPrice: widget.flightListingProvider?.outBoundFilterPrice,
        inBoundFilterPrice: widget.flightListingProvider?.inBoundFilterPrice,
      ),
      headerTitle: 'filter'.localize(context),
    ).then((value) {
      if (value is FilterSortStateModel) {
        setState(() {
          count = widget.isOneWay
              ? value.newFilter.outBoundFilterCount
              : value.newFilter.outBoundFilterCount +
                  value.newFilter.inBoundFilterCount;
        });

        if (widget.flightListingProvider?.sectorId == 'D') {
          widget.flightListingProvider?.applyFilter(
            value,
          );
        } else {
          widget.flightListingProvider?.applyInternationalFilter(
            value,
          );
        }
      }
      // else {
      //   if (count == 0) {
      //     widget.flightListingProvider?.setDefaultFilter(
      //       widget.flightListingProvider?.responseMainData,
      //     );
      //   }
      // }
    });
  }
}
