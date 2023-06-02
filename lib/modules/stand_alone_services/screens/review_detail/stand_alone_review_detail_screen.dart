/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/important_information_shimmer.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/important_information.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/detail_form_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/review_detail_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/stand_alone_order_summary.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneReviewDetailScreen extends StatefulWidget {
  const StandAloneReviewDetailScreen({Key? key}) : super(key: key);

  @override
  State<StandAloneReviewDetailScreen> createState() =>
      _StandAloneReviewDetailScreenState();
}

class _StandAloneReviewDetailScreenState
    extends State<StandAloneReviewDetailScreen> {
  StandAloneReviewDetailStateManagement? standAloneReviewDetailStateManagement;
  @override
  void initState() {
    standAloneReviewDetailStateManagement =
        context.read<StandAloneReviewDetailStateManagement>()
          ..resetControllers()
          ..setInitials(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      standAloneReviewDetailStateManagement?.getImportantInformation(
        infoType: 'ReviewDetail',
        context: context,
      ); // todo change it according to LOB
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final cartData = pranaamAppDataStateManagement.cartDataResponse;
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        /// Bottom bar with continue button and price
        bottomNavigationBar: const ReviewDetailBottomBar(),

        /// Review and details appbar
        appBar: AppBar(
          backgroundColor: context.adColors.whiteTextColor,
          elevation: 0,
          title: Text(
            'review_details'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ),
          actions: [
            Center(
              child: Text(
                'step_2/3'.localize(context),
                style: ADTextStyle400.size14,
              ).paddingBySide(right: context.k_16),
            ),
          ],
        ),

        body: ListView(
          // controller: standAloneReviewDetailStateManagement?.scrollController,
          children: [
            Text(
              'enter_name_mention'.localize(context),
              style:
                  ADTextStyle400.size16.setTextColor(const Color(0xff555555)),
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,                          
            ),
            /// User detail form
            const DetailFormView(),

            /// Important information view
            Selector<StandAloneReviewDetailStateManagement, ViewState>(
              selector: (context, standAloneReviewDetailStateManagement) =>
                  standAloneReviewDetailStateManagement.state,
              builder: (context, state, _) {
                if (state == ViewState.success) {
                  return ImportantInformation(
                    infoList:
                        standAloneReviewDetailStateManagement?.impInfoState ??
                            [],
                  );
                } else if (state == ViewState.loading) {
                  return ImportantInformationShimmer()
                      .paddingBySide(left: context.k_12);
                } else {
                  return const ADSizedBox.shrink();
                }
              },
            ),
            StandAloneOrderSummary(
              name: cartData?.standaloneProductDetails.name ?? '',
              image: (cartData?.standaloneProductDetails.imageUrl.isNotEmpty ??
                      false)
                  ? cartData?.standaloneProductDetails.imageUrl ??
                      'lib/assets/images/pranaam/porter2.png'
                  : 'lib/assets/images/pranaam/porter2.png',
              packagePrice:
                  '${cartData?.standaloneProductDetails.pricingInfo.totalFare.amount}',
              packageType: cartData?.standaloneProductDetails.name ?? '',
              quantity: '${cartData?.standaloneProductDetails.itemCount}',
            ),
            PriceDetailsView(
              addOnsList: const [],
              promoType: cartData?.standaloneProductDetails.pricingInfo
                      .discountCouponDetail.promoType ??
                  '',
              shakeKey: standAloneReviewDetailStateManagement?.shakeKeyReview,
              totalMRP: cartData?.standaloneProductDetails.pricingInfo
                      .totalBaseFare.amount ??
                  0,
              cGst: cartData?.standaloneProductDetails.pricingInfo.totalTax.cgst
                      .amount ??
                  0,
              sGst: cartData?.standaloneProductDetails.pricingInfo.totalTax.sgst
                      .amount ??
                  0,
              totalAmount: cartData
                      ?.standaloneProductDetails.pricingInfo.totalFare.amount ??
                  0,
              expressFareAmount: cartData?.standaloneProductDetails.pricingInfo
                      .totalExpressFare?.baseFare ??
                  0,
              addOnsAmount: 0,
              discountAmount: cartData?.standaloneProductDetails.pricingInfo
                      .discountCouponDetail.couponDiscountAmount ??
                  0,
              packageName: cartData?.standaloneProductDetails.name,
            ),
            ADSizedBox(
              height: context.k_28,
            ),
            LoyaltyPointsComponent(
              points: cartData?.potentialLoyaltyEarning ?? 0,
            ),
            ADSizedBox(
              height: context.k_56,
            ),
          ],
        ),
      ),
    );
  }
}
