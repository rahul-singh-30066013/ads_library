/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_lists/shop_lists.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/adsliver_app_bar.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/item_description_view.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/location_view.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/shop_list_view_item.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/story_view/story_screen.dart';

const double _expansionHeaderHeight = 250;
const double _horizontalListHeight = 320;

String title = 'Fendi';
String selectedCategoryBanner = 'lib/assets/images/duty_free/banner11.png';

/// This class is used to show Shop detail screen.
class AirportShopDetailScreen extends StatefulWidget {
  final Items? shopItem;
  const AirportShopDetailScreen({Key? key, this.shopItem}) : super(key: key);

  @override
  _AirportShopDetailScreenState createState() =>
      _AirportShopDetailScreenState();
}

class _AirportShopDetailScreenState extends State<AirportShopDetailScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.shopItem != null) {
      title = widget.shopItem?.title ?? '';
      selectedCategoryBanner =
          widget.shopItem?.banner ?? 'lib/assets/images/food/chai-station.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            ADSliverAppBar(
              child: Container(
                color: context.adColors.whiteTextColor,
                child: StoryScreen(
                  stories: shopStories,
                ),
              ),
            ),
          ],
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ItemDescriptionView(
                title: title,
                subTitle: 'Fashion Accessories',
                description:
                    'Founded in Rome, Italy, Fendi is a fashion house that has been helmed by the exceptional Karl Lagerfeld for Womenswear and Silvia Venturini Fendi for Accessories and Mensw…',
              ),
              Text(
                'location'.localize(context),
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.filterBlackText),
              ).paddingBySide(top: context.k_48, bottom: context.k_20),
              const LocationView(
                labelCheckInArea: 'Terminal 2',
                locationTerminal: 'Check in Area',
                shopLocation: 'Behind island N, W6-4106',
              ),
              const LocationView(
                labelCheckInArea: 'Terminal 2',
                locationTerminal: 'Domestic',
                shopLocation: 'Opp Theobroma post SHA',
                isSelected: true,
              ),
              Text(
                'you_might_also_like'.localize(context),
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.filterBlackText),
              ).paddingBySide(top: context.k_48, bottom: context.k_8),
              ADSizedBox(
                height: context.scaled(_horizontalListHeight),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedItemsList.length,
                  itemBuilder: (context, index) {
                    final Items shopObject = recommendedItemsList[index];
                    return ShopListViewItem(
                      shopBannerImage: shopObject.banner.toString(),
                      shopBadgeImage: shopObject.icon.toString(),
                      shopName: shopObject.title.toString(),
                      shopAddress: shopObject.address.toString(),
                      bannerWidth: context.scaled(_expansionHeaderHeight),
                      key: Key(
                        ShopListAutomationKeys.recommendedShopItemKey +
                            index.toString(),
                      ),
                    ).paddingBySide(right: context.k_16);
                  },
                ),
              ).paddingBySide(top: context.k_20),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_30,
            bottom: context.k_30,
          ),
        ),
      ),
    );
  }
}
