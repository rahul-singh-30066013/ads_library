/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is Add Ons Screen which is opened from pranaam dashboard
///where user can select any add ons on their selected package.
///This screen has 2 tabs: Flowers and Cakes
///User can select and add any flower and cake of their choice.
///
const itemCount = 3;
const double height = 300;

class AddonsScreen extends StatelessWidget {
  static const int tabBarLength = 2;

  const AddonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'add_ons_service'.localize(context),
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ///TODO
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              ///TODO
            },
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: DefaultTabController(
        length: tabBarLength,
        child: SingleChildScrollView(
          child: Column(
            // shrinkWrap: true,
            children: [
              Image.asset(
                'lib/assets/images/pranaam/hero image.png',
              ),
              Padding(
                padding: EdgeInsets.all(context.k_10),
                child: Text(
                  'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ),
              TabBar(
                labelColor: context.adColors.black,
                unselectedLabelColor: context.adColors.greyTextColor,
                labelStyle: ADTextStyle500.size14,
                indicatorColor: context.adColors.black,
                unselectedLabelStyle: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor),
                tabs: [
                  Tab(
                    text: 'flowers'.localize(context),
                  ),
                  Tab(
                    text: 'cakes'.localize(context),
                  ),
                ],
              ),
              SizedBox(
                height: height,
                child: TabBarView(
                  ///Tabs ( Flowers and Cakes)
                  children: [
                    ///First Tab (Flowers)
                    ListView.builder(
                      //        physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        return const AddOnsItemView();
                      },
                    ),

                    ///Second Tab (Cakes)
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddOnsItemView extends StatelessWidget {
  const AddOnsItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.k_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.k_8),
            child: Image.asset('lib/assets/images/pranaam/red_roses.png'),
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          Text(
            'bouquet_of_red_roses'.localize(context),
            style: ADTextStyle700.size18
                .setTextColor(context.adColors.blackTextColor),
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              Text(
                '₹1100 ',
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.brownishGrey)
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
              Text(
                '₹800',
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
