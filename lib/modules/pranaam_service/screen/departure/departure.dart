/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/departure/view/charges_and_service_offering_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/departure/view/how_it_works_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///
///This is the departure screen which is opened from pranaam dashboard.
///this shows the packages that we offer in departure
///currently there are two packages elite and platinum
///there are two tabs Elite and Platinum
///here we are showing services that we offer in international and domestic departure and their charges.
///

const int tabLength = 2;
const double fontHeight = 1.4;
final double sizedBoxHeight = 52.sp;
const double heightMultiplier = 3;

class Departure extends StatelessWidget {
  const Departure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'departure'.localize(context),
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ),
      ),
      body: DefaultTabController(
        length: tabLength,
        child: ListView(
          children: [
            Image.asset(
              'lib/assets/images/pranaam/hero image.png',
            ),
            Text(
              'Founded in Rome, Italy, Fendi is a fashion house that has been helmed by the exceptional Karl Lagerfeld for Womenswear and Silvia Venturini Fendi for Accessories and Menswear since the brand’s renaissance in the 1960s. ',
              style: ADTextStyle400.size16.setFontHeight(fontHeight),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
              top: context.k_20,
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: context.k_20),
                labelColor: context.adColors.black,
                unselectedLabelColor: context.adColors.greyTextColor,
                labelStyle: ADTextStyle500.size16,
                indicatorColor: context.adColors.black,
                unselectedLabelStyle: ADTextStyle400.size16
                    .setTextColor(context.adColors.greyTextColor),
                tabs: [
                  Tab(
                    text: 'elite'.localize(context),
                  ),
                  Tab(
                    text: 'platinum'.localize(context),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.adColors.black,
            ),
            Container(
              height: context.heightOfScreen * heightMultiplier,

              ///Tab Bar
              child: TabBarView(
                children: [
                  /// First Tab (Elite)
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: context.k_24,
                      horizontal: context.k_16,
                    ),
                    children: [
                      Text(
                        'elite'.localize(context),
                        style: ADTextStyle700.size22
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Text(
                        'Pranaam Elite is specially curated services for guests who need best of the services and appreciate time value of money. It offers guests with special benefits like flexibility of rescheduling of services, truly personalised experience, dedicated golf cart, personal shopper or a unique guided tour through Jaya He Adani New Museum. ',
                        style: ADTextStyle400.size16,
                      ),
                      ADSizedBox(
                        height: sizedBoxHeight,
                      ),
                      ChargesAndServiceOfferingView(
                        typeOfDeparture:
                            'international_departure'.localize(context),
                      ),
                      ChargesAndServiceOfferingView(
                        typeOfDeparture: 'domestic_departure'.localize(context),
                      ),
                      Text(
                        'how_it_works'.localize(context),
                        style: ADTextStyle700.size22
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      const HowItWorksView(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.adColors.blueColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.k_18,
                            vertical: context.k_14,
                          ),
                        ),
                        onPressed: () => {},
                        child: Text('book_now'.localize(context)),
                      ).paddingAllSide(context.k_20),
                    ],
                  ),

                  ///Second Tab (Platinum)
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
