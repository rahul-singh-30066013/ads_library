/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/categories_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/circular_background.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/story_view/story_screen.dart';

/// _CircularBackground class is used for creating SliverAppBar
class CatalogSliverAppBar extends StatelessWidget {
  final bool isFromAirportMall;
  final double expandedHeight;
  final String catalogType;
  final bool? showSearchIcon;

  const CatalogSliverAppBar({
    Key? key,
    required this.isFromAirportMall,
    required this.expandedHeight,
    required this.catalogType,
    this.showSearchIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Story> stories = [
      Story(
        url:
            'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg',
        mediaType: MediaType.image,
        duration: 5,
      ),
      Story(
        url:
            'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
        mediaType: MediaType.image,
        duration: 5,
      ),
    ];
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      expandedHeight: isFromAirportMall ? expandedHeight.sp : null,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: !isFromAirportMall
          ? GestureDetector(
              onTap: () => onTitleTapped(context: context),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      catalogType,
                      style: ADTextStyle700.size22,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: ADColors.black,
                  ),
                ],
              ).paddingBySide(
                right: context.k_6,
              ),
            )
          : null,
      leading: const BackButton(),
      flexibleSpace: isFromAirportMall
          ? FlexibleSpaceBar(
              background: Container(
                color: context.adColors.whiteTextColor,
                child: const StoryScreen(
                  stories: stories,
                ),
              ),
            )
          : null,
      actions: [
        if (showSearchIcon == true)
          CircularBackground(
            onTap: () => adLog(''),
            icon: Icons.search_outlined,
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }

  void onTitleTapped({required BuildContext context}) {
    if (!DeBounce.isRedundantClick()) {
      final val = BottomSheetUtils.showAdDraggableBottomSheetDialog(
        context,
        CategoriesBottomSheet(
          callBack: (data) => onCallBackFromCategoryDialog(data, context),
        ),
      );
      context.read<DutyFreeState>().saveCategories();
      adLog(val.toString());
    }
  }

  void onCallBackFromCategoryDialog(
    SelectedItem data,
    BuildContext context,
  ) {
    if (data.categoryCode != null) {
      context
          .read<DutyFreeState>()
          .onCallBackFromCategoryDialogWithCategoryCode(
            data: data,
          );
    } else {
      context
          .read<DutyFreeState>()
          .onCallBackFromCategoryDialogWithoutCategoryCode(
            data: data,
          );
    }
  }
}
