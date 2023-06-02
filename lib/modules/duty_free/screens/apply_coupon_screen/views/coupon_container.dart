/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/responce_model/apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/apply_coupon_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this is widget view of apply coupon
class CouponContainer extends StatelessWidget {
  CouponContainer({
    Key? key,
    required this.adGenericCallback,
    required this.coupon,
    required this.couponIndex,
    required this.selectedIndex,
    // required this.couponCode,
  }) : super(key: key);
  static const int data = 100;

  // /// name or code of the coupon
  // final String couponCode;

  final double imageWidth = 100.sp;
  final Coupon coupon;
  final int couponIndex;
  final String selectedIndex;

  final ADGenericCallback adGenericCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADSizedBox(
                  height: context.k_12,
                ),
                AbsorbPointer(
                  absorbing: coupon.eligible == false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => coupon.eligible == true
                            ? onApplyPressed(
                                context: context,
                                index: couponIndex,
                                coupon: coupon,
                              )
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_4),
                            ),
                            border: Border.all(
                              color: context.adColors.blue,
                            ),
                            color: const Color(0x080d67ca),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: context.k_24,
                                height: context.k_22,
                                child: coupon.pcmPromoImgUrl.contains('.svg')
                                    ? SvgPicture.network(
                                        coupon.pcmPromoImgUrl,
                                      )
                                    : Image.network(
                                        coupon.pcmPromoImgUrl,
                                      ),
                              ).paddingBySide(
                                left: context.k_6,
                              ),
                              Text(
                                coupon.couponCode,
                                style: ADTextStyle600.size14.copyWith(
                                  color: context.adColors.blackColor,
                                ),
                              ).paddingAllSide(context.k_10),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => coupon.eligible == true
                            ? onApplyPressed(
                                context: context,
                                index: couponIndex,
                                coupon: coupon,
                              )
                            : null,
                        child: Selector<PranaamAppDataStateManagement, bool>(
                          selector: (context, model) => coupon.isSelected,
                          builder: (context, value, child) => value
                              ? ADDotProgressView(
                                  color: context.adColors.blackColor,
                                  size: dotSize,
                                )
                              : Text(
                                  'apply'.localize(context),
                                  style: ADTextStyle400.size14
                                      .setTextColor(
                                        coupon.eligible == true
                                            ? context.adColors.blackColor
                                            : context.adColors.greyReviewShade,
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: coupon.eligible == true
                                            ? context.adColors.blackColor
                                            : context.adColors.greyReviewShade,
                                      ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  coupon.promoName,
                  style: ADTextStyle600.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ).paddingBySide(top: context.k_16),
                Text(
                  coupon.description,
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.greyTextColor,
                  ),
                ).paddingBySide(top: context.k_10),
                Row(
                  children: [
                    if (!coupon.endDate.isNullOrEmpty)
                      Text(
                        'Expires ${DateFormat(Constant.dateFormat19).format(DateTime.parse(coupon.endDate ?? ''))}',
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.greyTextColor),
                      ).paddingBySide(right: context.k_8),
                    Text.rich(
                      TextSpan(
                        text: 'T&Cs Apply',
                        style: ADTextStyle400.size14
                            .copyWith(
                              color: context.adColors.blackTextColor,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (!coupon.couponCode.isNullOrEmpty) {
                              navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                offerDetail,
                                rootNavigator: false,
                                argumentObject: OfferKeyModel(
                                  id: coupon.couponCode,
                                  title: coupon.promoName,
                                  showBookNowButton: false,
                                  fetchDataFromPromoCode: true,
                                ),
                              );
                            }
                          },
                      ),
                    ),
                  ],
                ).paddingBySide(top: context.k_10),
                if (coupon.recommendations.amount.isNotEmpty)
                  Text(
                    coupon.recommendations.amount,
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.rustyOrangeColor,
                    ),
                  ).paddingBySide(top: context.k_10),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
            ADSizedBox(
              height: context.k_30,
            ),
            Divider(
              color: context.adColors.lightGreyGridSeparatorColor,
              thickness: 1,
            ),
          ],
        ),
        /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://images.moneycontrol.com/static-mcnews/2018/03/Amazon-1.jpg',
                  width: imageWidth,
                  height: context.k_40,
                  fit: BoxFit.cover,
                  key: Key(
                    ApplyCouponAutomationKey.itemImage + coupon.couponCode,
                  ),
                ),
                TextButton(
                  key: Key(
                    ApplyCouponAutomationKey.itemAppplyButton +
                        coupon.couponCode,
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.only(top: context.k_6),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () => onApplyPressed(
                    context: context,
                    index: couponIndex,
                    coupon: coupon,
                  ),
                  //onPressed: () => navigatorPopScreenWithData(context, data),
                  child: Selector<PranaamAppDataStateManagement, bool>(
                    selector: (context, model) => coupon.isSelected,
                    builder: (context, value, child) => value
                        ? ADDotProgressView(
                            color: context.adColors.blackColor,
                            size: dotSize,
                          )
                        : Text(
                            'apply'.localize(context),
                            style: ADTextStyle500.size14
                                .setTextColor(context.adColors.neutralInfoMsg)
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                  ),
                ),
              ],
            ),
            ADSizedBox(
              height: context.k_12,
            ),
            Text(
              coupon.description,
              key: Key(
                ApplyCouponAutomationKey.itemCouponTitle + coupon.couponCode,
              ),
              style: ADTextStyle600.size16
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ],
        ).paddingBySide(left: context.k_16, right: context.k_16),
        ADSizedBox(
          height: context.k_20,
        ),
        Divider(
          color: context.adColors.lightGreyGridSeparatorColor,
          thickness: 1,
        ),*/
      ],
    );
  }

  void onApplyPressed({
    required BuildContext context,
    required int index,
    required Coupon coupon,
  }) {
    context.read<PranaamAppDataStateManagement>().toucheEffectListener.value =
        true;
    //set coupon value
    context.read<PranaamAppDataStateManagement>().getCouponValue =
        coupon.couponCode;

    ///GA Event book pranam coupon
    // PranaamBookingGaAnalytics().applyCouponCodeGaAnalytics(
    //   context.read<PranaamAppDataStateManagement>(),
    // );
    // GaEvent.getInstance()
    //     .applyCouponEventMap(context.read<PranaamAppDataStateManagement>());
    // PranaamClickEvents.book_pranaam_coupon_applied
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);

    ///GA Offers coupon apply
    GaEvent.getInstance().offersCouponApplyEvent(
      coupon.description,
      coupon.couponCode,
      'pranaam',
    );
    ClickEvents.offers_coupon_apply
        .logEvent(parameters: GaEvent.getInstance().parameterMap);

    coupon = coupon.copyWith(isSelected: true);
    context.read<ApplyCouponState>().applyCouponResponse?.coupons[index] =
        coupon;
    context.read<ApplyCouponState>().notifyListeners();
    adGenericCallback(coupon);
    //TODO bhaskar why we have this logic
    /*if (baseFareAmount >= minimumBillingAmount) {
      adGenericCallback(coupon);
      navigatorPopScreen(context);
    } else {
      adLog(
        'Base fare is $baseFareAmount and Min. Billing amount of coupon is $minimumBillingAmount',
      );
      SnackBarUtil.showSnackBar(
        context,
        'coupon_not_applicable'.localize(context),
      );
    }*/
  }
}
