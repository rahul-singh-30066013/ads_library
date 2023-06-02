/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_lists/food_lists.dart';
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

String title = 'Starbucks';
String selectedCategoryBanner = 'lib/assets/images/food/chai-station.png';

///This class is used to show Shop detail screen.
class AirportFoodDetailScreen extends StatefulWidget {
  final Items? shopItem;
  const AirportFoodDetailScreen({Key? key, this.shopItem}) : super(key: key);

  @override
  _AirportFoodDetailScreenState createState() =>
      _AirportFoodDetailScreenState();
}

class _AirportFoodDetailScreenState extends State<AirportFoodDetailScreen> {
  @override
  void initState() {
    super.initState();
    //set text for read more/less
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
              child: StoryScreen(
                stories: foodStories,
              ),
            ),
          ],
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ItemDescriptionView(
                title: title,
                subTitle: 'Beverages',
                description:
                    'By bringing people together over coffee, Starbucks has become one of the world’s best-known and best-loved companies. We purchase, roast and serve award-winning coffee. Starbucks enter',
              ),
              Text(
                'location'.localize(context),
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.filterBlackText),
              ).paddingBySide(top: context.k_48, bottom: context.k_20),
              const LocationView(
                labelCheckInArea: 'Terminal 2',
                locationTerminal: 'Check in Area',
                shopLocation: 'Level P6 - Arrivals',
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
                  itemCount: recommendedFoodList.length,
                  itemBuilder: (context, index) {
                    final Items shopObject = recommendedFoodList[index];
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
