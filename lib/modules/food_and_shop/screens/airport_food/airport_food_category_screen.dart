/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_lists/food_lists.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_linear_progress_indicator.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_load_more_button.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/adsliver_app_bar.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/item_heading_view.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/shop_list_view_item.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/*variables that we need to use inside this file only
* header max line - used for app bar
* _expansionHeaderHeight- used to set header height, sliver bar
* _categoryTitle - to show title of category
* */
String _categoryTitle = 'Accessories';
final List<Items> _bannerList = [];
const _index = 2;
final double _progressViewHorizontalPadding = 85.sp;

///
///This class is used to show shop category item.
///As per json response, it will show banner image related selected show category from AirportShopListScreen screen
///
class AirportFoodCategoryScreen extends StatefulWidget {
  final int selectedItem;
  const AirportFoodCategoryScreen({Key? key, required this.selectedItem})
      : super(key: key);

  @override
  _AirportFoodCategoryScreenState createState() =>
      _AirportFoodCategoryScreenState();
}

class _AirportFoodCategoryScreenState extends State<AirportFoodCategoryScreen> {
  @override
  void initState() {
    super.initState();
    prepareListToShow(widget.selectedItem);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            ADSliverAppBar(
              child: Image.asset(
                _bannerList[_index].banner.validateWithDefaultValue(),
                fit: BoxFit.cover,
              ),
            ),
          ],
          body: MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            context: context,
            child: ListView(
              children: [
                ItemHeadingView(
                  listLength: _bannerList.length,
                  listTitle: _categoryTitle,
                ).paddingBySide(
                  left: context.k_16,
                  bottom: context.k_20,
                  top: context.k_28,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _bannerList.length,
                  itemBuilder: (context, index) {
                    final Items shopObject = _bannerList[index];
                    return ShopListViewItem(
                      shopBannerImage:
                          shopObject.banner.validateWithDefaultValue(),
                      shopBadgeImage:
                          shopObject.icon.validateWithDefaultValue(),
                      shopName: shopObject.title.validateWithDefaultValue(),
                      shopAddress:
                          shopObject.address.validateWithDefaultValue(),
                      bannerWidth: double.infinity,
                      key: const Key(
                        ShopListAutomationKeys.shopListBackTapKey,
                      ),
                      onTapHandler: () =>
                          navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        airportFoodDetail,
                        argumentObject: shopObject,
                      ),
                    ).paddingBySide(left: context.k_16, right: context.k_16);
                  },
                ),
                const ADLinearProgressIndicator(
                  ///TODO:- values are static for now.
                  visibleItems: 15,
                  totalItems: 150,
                ).paddingBySide(
                  bottom: context.k_24,
                  left: _progressViewHorizontalPadding,
                  right: _progressViewHorizontalPadding,
                ),
                const ADLoadMoreButton().paddingBySide(
                  left: _progressViewHorizontalPadding,
                  right: _progressViewHorizontalPadding,
                  bottom: context.k_40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void prepareListToShow(int selectedItem) {
  const int snacksIndex = 0;
  const int beveragesIndex = 2;
  const int diningIndex = 4;
  const int cafeIndex = 1;
  _bannerList.clear();
  if (selectedItem == snacksIndex) {
    _categoryTitle = 'Snacks';
    _bannerList.addAll(snacksList);
  } else if (selectedItem == beveragesIndex) {
    _categoryTitle = 'Beverages';
    _bannerList.addAll(beveragesList);
  } else if (selectedItem == diningIndex) {
    _categoryTitle = 'Dining';
    _bannerList.addAll(diningList);
  } else if (selectedItem == cafeIndex) {
    _categoryTitle = 'Cafe';
    _bannerList.addAll(cafeList);
  } else {
    _categoryTitle = 'Snacks';
    _bannerList.addAll(snacksList);
  }
}
