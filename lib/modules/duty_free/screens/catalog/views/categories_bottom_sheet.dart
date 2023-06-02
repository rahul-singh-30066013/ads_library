/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/category/product_categories.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_age_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/expansion_tile/custom_expansion_tile.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const backGroundColor = Color(0xfff5f5f5);
final tileHeight = 110.sp;
const shimmerCount = 5;

class CategoriesBottomSheet extends StatelessWidget {
  final ADGenericCallback<SelectedItem> callBack;

  const CategoriesBottomSheet({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeState>(
      builder: (context, value, child) {
        switch (value.categoriesListState.viewStatus) {
          case Status.loading:
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ADSizedBox(
                  height: context.k_64,
                ),
                ADShimmerBuilder(
                  itemCount: shimmerCount,
                  shimmerBuilderType: ShimmerBuilderType.listVertical,
                  shimmerWidget: ADShimmerWidget.shimmerShape(
                    height: tileHeight,
                    type: ShimmerType.rectangleBox,
                  ),
                ),
              ],
            );
          case Status.complete:
            return SliverAppBarBaseComponent(
              closeScreenWidget: IconButton(
                key: const Key(FlightAutomationKeys.headerIconKey),
                iconSize: context.k_48,
                visualDensity: VisualDensity.compact,
                splashRadius: context.k_20,
                padding: EdgeInsets.zero,
                onPressed: () => navigatorPopScreen(context),
                icon: SvgPicture.asset(
                  SvgAssets.closeIcon,
                  height: context.k_14,
                  width: context.k_14,
                  color: closeIconColor,
                ),
              ),
              appBarLeftPadding: context.k_2,
              titleTextStyle: ADTextStyle700.size22.setTextColor(
                context.adColors.blackTextColor,
              ),
              title: 'categories'.localize(context),
              leadingTitleTextStyle: ADTextStyle700.size20
                  .setTextColor(context.adColors.blackTextColor),
              flexibleTitleTopPadding: context.k_16,
              flexibleTitleBottomPadding: context.k_10,
              body: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: context.k_22,
                ),
                shrinkWrap: true,
                itemCount: value.productCategoriesList.length,
                itemBuilder: (context, index) {
                  final category = value.productCategoriesList[index];
                  return CategoriesTile(
                    title: category.title ?? '',
                    callBack: callBack,
                    materialGroup: category.materialGroup ?? '',
                    isLocked:
                        (category.restricted ?? false) && !value.ageAbove25,
                    disable: category.disableForAirport,
                    backgroundImage: category.mimageSrc,
                    children: List.generate(
                      category.children?.length ?? 0,
                      (index) => SubCategoriesTile(
                        callBack: callBack,
                        materialGroupTitle: category.title ?? '',
                        materialGroup: category.materialGroup ?? '',
                        title: category.children?[index].title ?? '',
                        categoryCode: category.children?[index].code ?? '',
                        children: category.children?[index].children,
                      ),
                    ),
                  );
                },
              ),
            );
          case Status.error:
            return NoDataFoundErrorScreen(
              paddingBetweenImageAndErrorTitle: context.k_20,
              paddingBetweenErrorMessageAndRetry: context.k_30,
              errorTitle: 'oops_no_results_found'.localize(context),
              hyperlinkTitle: 'reset_filter'.localize(context),
            );
          default:
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ADSizedBox(
                  height: context.k_64,
                ),
                ADShimmerBuilder(
                  itemCount: shimmerCount,
                  shimmerBuilderType: ShimmerBuilderType.listVertical,
                  shimmerWidget: ADShimmerWidget.shimmerShape(
                    height: tileHeight,
                    type: ShimmerType.rectangleBox,
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final ADGenericCallback<SelectedItem>? callBack;
  final String title;
  final String materialGroup;
  final List<Widget> children;
  final String? backgroundImage;
  final bool isLocked;
  final bool disable;

  const CategoriesTile({
    Key? key,
    required this.materialGroup,
    required this.title,
    required this.children,
    this.isLocked = false,
    this.backgroundImage,
    this.callBack,
    required this.disable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      disabled: disable,
      onEmptyTileTap: () => onEmptyTileTap(context),
      onLockedTileTap: () => onLockedTileTap(context),
      showSpacing: false,
      isLocked: isLocked,
      title: title,
      tileHeight: tileHeight,
      backGroundImage: backgroundImage ?? '',
      tilePadding: EdgeInsets.symmetric(
        horizontal: context.k_16,
      ),
      borderRadius: BorderRadius.circular(
        context.k_16,
      ),
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,
      textStyle: ADTextStyle700.size18,
      collapsedTextStyle: ADTextStyle400.size18,
      children: children,
    ).paddingBySide(
      top: context.k_6,
      bottom: context.k_6,
    );
  }

  void onEmptyTileTap(
    BuildContext context,
  ) {
    callBack?.call(
      SelectedItem(
        materialGroup: materialGroup,
        materialGroupTitle: title,
      ),
    );
    navigatorPopScreen(context);
  }

  void onLockedTileTap(BuildContext context) {
    openAgeConfirmationDialog(context);
  }
}

void openAgeConfirmationDialog(
  BuildContext context,
) {
  final bottomSheet = showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: context.adColors.whiteTextColor,
    elevation: context.k_8,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(context.k_22),
      ),
    ),
    context: context,
    builder: (dialogContext) {
      return DutyFreeAgeConfirmation(
        detailString: 'age_confirmation_message'.localize(context).replaceAll(
          '#1',
          (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
        ),
        titleString: 'age_confirmation'.localize(context),
        yesCallBack: () =>
            popFromDialog(context, dialogContext, isAgeAbove25: true),
        noCallBack: () =>
            popFromDialog(context, dialogContext, isAgeAbove25: false),
      );
    },
  );
  adLog('$bottomSheet');
}

void popFromDialog(
  BuildContext context,
  BuildContext dialogContext, {
  required bool isAgeAbove25,
}) {
  context.read<DutyFreeState>().toggleAgeAbove25(value: isAgeAbove25);

  navigatorPopScreen(dialogContext);
}

class SubCategoriesTile extends StatelessWidget {
  final String materialGroupTitle;
  final String materialGroup;
  final String title;
  final ADGenericCallback<SelectedItem> callBack;
  final List<ProductCategories>? children;
  final String categoryCode;

  const SubCategoriesTile({
    Key? key,
    required this.materialGroupTitle,
    required this.materialGroup,
    required this.title,
    required this.children,
    required this.callBack,
    required this.categoryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: title,
      backgroundColor: backGroundColor,
      iconColor: Colors.black,
      collapsedIconColor: Colors.black,
      rowAlignment: MainAxisAlignment.spaceBetween,
      textStyle: ADTextStyle700.size16,
      collapsedTextStyle: ADTextStyle400.size16,
      tilePadding: EdgeInsets.symmetric(
        vertical: context.k_16,
      ),
      children: List.generate(
        children?.length ?? 0,
        (index) => CustomListTile(
          title: children?[index].title ?? '',
          onPressed: () => onCustomListTilePressed(
            brands: [children?[index].brand ?? ''],
            context: context,
          ),
        ),
      )..insert(
          0,
          CustomListTile(
            title: 'See All',
            onPressed: () => onSeeAllPressed(
              context: context,
              children: children ?? [],
            ),
          ),
        ),
    );
  }

  void onSeeAllPressed({
    required List<ProductCategories> children,
    required BuildContext context,
  }) {
    final List<String> allBrands = [];
    for (final ProductCategories element in children) {
      allBrands.add(element.brand ?? '');
    }
    callBack.call(
      SelectedItem(
        materialGroup: materialGroup,
        materialGroupTitle: materialGroupTitle,
        categoryCode: categoryCode,
        brand: allBrands,
      ),
    );
    navigatorPopScreen(context);
  }

  void onCustomListTilePressed({
    required List<String> brands,
    required BuildContext context,
  }) {
    callBack.call(
      SelectedItem(
        categoryCode: categoryCode,
        materialGroupTitle: materialGroupTitle,
        materialGroup: materialGroup,
        brand: brands,
      ),
    );
    navigatorPopScreen(context);
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.k_32,
      ),
      onTap: onPressed,
      title: Text(
        title,
        style: ADTextStyle400.size16,
      ),
    );
  }
}

class SelectedItem {
  final String materialGroup;
  final List<String>? brand;
  final String materialGroupTitle;
  final String? categoryCode;

  SelectedItem({
    required this.materialGroup,
    this.brand,
    required this.materialGroupTitle,
    this.categoryCode,
  });

  @override
  String toString() =>
      'materialGroup => $materialGroup  categoryCode => $categoryCode  brand => $brand materialGroupTitle => $materialGroupTitle';
}
