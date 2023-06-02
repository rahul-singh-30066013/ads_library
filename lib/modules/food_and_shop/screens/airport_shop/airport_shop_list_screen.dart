/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/state_management/airport_shop/airport_shop_list_state.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_get_app_bar_title.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_home_flexible_space_bar.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_home_sliver_app_bar.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_linear_progress_indicator.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/ad_load_more_button.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/item_heading_view.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/shop_list_view_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/custom_progress/ad_circular_progress_bar.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_circle_tile.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/*variables that we need to use inside this file only
* header max line - used for app bar
*_leadingIconWidth used to configure appbar, default value is 56
* _headerHeight- used to set header height, included all content
* _selectedAirport - airport value that we set upon user/location selection
* _defaultTitle-default value for appbar title
* _scrollController - scroll controller, using that manage sliver scroll
* _dynamicTitle - set dynamic title upon screen scroll
* */
const int _headerMaxLines = 2;
final double _headerHeight = 64.sp;
final double _expansionHeaderHeight = 110.sp;
final double _gridContainerHeight = 320.sp;
final double _progressViewHorizontalPadding = 85.sp;
const String _selectedAirport = 'DEPARTURE TERMINAL 2';
const String _defaultTitle = 'Shop';

///
///This class is used to show list of item in AirportShopDashboardScreen.
///As per json response, it will show banner or circular grid
///
class AirportShopListScreen extends StatefulWidget {
  const AirportShopListScreen({
    Key? key,
  }) : super(key: key);
  @override
  _AirportShopListScreenState createState() => _AirportShopListScreenState();
}

class _AirportShopListScreenState extends State<AirportShopListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> _dynamicTitle = ValueNotifier<String>('');
  final AirportShopListState airportShopListState = AirportShopListState();
  @override
  void initState() {
    super.initState();
    airportShopListState.getShopListData(JsonAssets.airportShopListJson);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _dynamicTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            ADHomeSliverAppBar(
              title: ADGetAppbarTitle(
                dynamicTitle: _dynamicTitle,
                headerMaxLines: _headerMaxLines,
              ),
              flexibleSpace: const ADHomeFlexibleSpaceBar(
                selectedAirport: _selectedAirport,
                defaultTitle: _defaultTitle,
                headerMaxLines: _headerMaxLines,
              ).paddingBySide(left: context.k_16),
              expandedHeight: _expansionHeaderHeight,
              backTap: backTap,
              searchTap: searchTap,
              favoriteTap: favoriteTap,
            ),
          ],
          body: ADSelectorStateLessWidget(
            viewModel: airportShopListState,
            child: Selector<AirportShopListState, ADResponseState>(
              selector: (context, viewModel) => viewModel.shopListState,
              builder: (_context, airportShopListDetail, Widget? child) {
                switch (airportShopListDetail.viewStatus) {
                  case Status.loading:
                    return const Center(
                      child: ADCircularProgressBar(),
                    );
                  case Status.error:
                    return Text(airportShopListDetail.message ?? 'NA');
                  case Status.complete:
                    final AirportShop airportShop = airportShopListDetail.data;
                    final AirportShopCategory? airportShopCategoryData =
                        airportShop.airportShopCategory;
                    final List<Items> shopListItems =
                        airportShop.airportShopList?.items ?? [];
                    return ListView(
                      children: [
                        SizedBox(
                          height: _gridContainerHeight.sp,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                            ),
                            itemBuilder: (_, index) => ADCircleTile(
                              key: Key(
                                ShopListAutomationKeys.shopListCategoryGridKey +
                                    index.toString(),
                              ),
                              borderType: ADCircleBorderType.none,
                              centerIcon: Image.asset(
                                airportShopCategoryData?.items[index].icon ??
                                    '',
                                fit: BoxFit.cover,
                              ),
                              title:
                                  airportShopCategoryData?.items[index].title ??
                                      '',
                              textStyle: ADTextStyle400.size16.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                              onTapHandler: () =>
                                  navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                airportShopCategory,
                                argumentObject: index,
                              ),
                            ),
                            itemCount: airportShopCategoryData?.items.length,
                          ).paddingBySide(
                            left: context.k_8,
                            top: context.k_20,
                          ),
                        ),
                        ItemHeadingView(
                          listTitle: 'label_outlet'.localize(context),
                        ).paddingBySide(
                          top: context.k_20,
                          bottom: context.k_20,
                          left: context.k_16,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: shopListItems.length,
                          itemBuilder: (context, index) {
                            final Items shopObject = shopListItems[index];
                            return ShopListViewItem(
                              shopBannerImage:
                                  shopObject.banner.validateWithDefaultValue(),
                              shopBadgeImage:
                                  shopObject.icon.validateWithDefaultValue(),
                              shopName:
                                  shopObject.title.validateWithDefaultValue(),
                              shopAddress:
                                  shopObject.address.validateWithDefaultValue(),
                              bannerWidth: double.infinity,
                              key: const Key(
                                ShopListAutomationKeys.shopListBackTapKey,
                              ),
                              onTapHandler: () =>
                                  navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                airportShopDetail,
                                argumentObject: shopObject,
                              ),
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                            );
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
                    );
                  default:
                    const ADSizedBox.shrink();
                }
                return const ADSizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  void backTap() {
    Navigator.pop(context);
  }

  void searchTap() {
    adLog('searchTap');
  }

  void favoriteTap() {
    adLog('favoriteTap');
  }

  /// this method will use to manage scroll listener and
  /// update app bar title as per offset value
  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            _expansionHeaderHeight;

    _dynamicTitle.value =
        percentageOfScroll <= _headerHeight ? _defaultTitle : '';
  }
}
