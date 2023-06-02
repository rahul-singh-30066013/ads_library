/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/ad_coupon_list/views/ad_coupon_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/ad_coupon_list/coupon_list_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/json_assets.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/custom_progress/ad_circular_progress_bar.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_profile.dart';

/// this class is use to show Coupon list available in app
/// User can select coupon as application T&C,  apply for shopping
class AdCouponList extends StatefulWidget {
  const AdCouponList({Key? key}) : super(key: key);

  @override
  State<AdCouponList> createState() => _AdCouponListState();
}

class _AdCouponListState extends State<AdCouponList> {
  final CouponListState couponListViewModel = CouponListState();

  @override
  void initState() {
    couponListViewModel.getCouponList(JsonAssets.couponListJson);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'applyCouponLabel'.localize(context),
        ),
        actions: [
          ADProfile(
            profileIcon: context
                    .read<AppSessionState>()
                    .profileModel
                    .personInfo
                    ?.profileImage ??
                'lib/assets/images/airports/avtar.png',
          ),
        ],
      ),

      /// this widget is use for search coupon code in list
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'enterCouponCode'.localize(context),
                hintStyle: ADTextStyle400.size12
                    .setTextColor(context.adColors.greyTextColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.adColors.blackShade600,
                  ),
                ),
              ),
              cursorColor: context.adColors.blackShade600,
            ).paddingBySide(
              top: context.k_10,
              left: context.k_20,
              right: context.k_2,
            ),
            Text(
              'availableCoupon'.localize(context),
              style: ADTextStyle700.size24
                  .setTextColor(context.adColors.blackTextColor),
            ).paddingBySide(
              top: context.k_30,
              left: context.k_20,
            ),
            Expanded(
              child: ADBaseStateLessWidget<CouponListState>(
                key: const Key('Coupon_list'),
                viewModel: couponListViewModel,
                initViewModel: (_) => adLog(''),
                builder: (context, couponData, child) {
                  switch (couponData.state) {
                    case ViewState.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: couponData.couponListModel.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_24,
                          vertical: context.k_10,
                        ),
                        itemBuilder: (context, index) {
                          final listData = couponData.couponListModel[index];
                          return ADCouponItem(
                            images: listData.icon.validateWithDefaultValue(),
                            couponTitle:
                                listData.couponTitle.validateWithDefaultValue(),
                            couponDescription: listData.couponDescription
                                .validateWithDefaultValue(),
                            couponCode:
                                listData.couponCode.validateWithDefaultValue(),
                          );
                        },
                      );
                    case ViewState.loading:
                      return const Center(
                        child: ADCircularProgressBar(),
                      );
                    case ViewState.error:
                      return ADErrorPage(message: couponData.error);

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
