/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/duty_payment_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/payment_summary.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/payment_confirmation/views/payment_methods.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/ad_duty_free_shopping_cart_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/payment_confirmation/duty_payment_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/json_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/helper/helper.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/cards/ad_payoption_card.dart';
import 'package:superapp_mobile_style_guide/cards/ad_reward_points_card.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/custom_progress/ad_circular_progress_bar.dart';
import 'package:superapp_mobile_style_guide/expansiontile/ad_expansion_row.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// This class will used to represent DutyPaymentConfirmationScreen.
class DutyFreePaymentConfirmationScreen extends StatefulWidget {
  final CustomerInfoArguments? customerInfoArguments;

  const DutyFreePaymentConfirmationScreen({
    Key? key,
    this.customerInfoArguments,
  }) : super(key: key);

  @override
  State<DutyFreePaymentConfirmationScreen> createState() =>
      _DutyFreePaymentConfirmationScreenState();
}

class _DutyFreePaymentConfirmationScreenState
    extends State<DutyFreePaymentConfirmationScreen> {
  DealProductModel item = DealProductModel();

  //
  // late CustomerInfoArguments customerInfoArguments;

  int couponValue = 0;

  num cartValue = 0;

  num discount = 0;

  DutyPaymentConfirmationState dutyPaymentConfirmationViewModel =
      DutyPaymentConfirmationState();

  @override
  void initState() {
    dutyPaymentConfirmationViewModel
        .getDutyPaymentConfirmationSummary(JsonAssets.dutyPaymentConfirmation);
    if (widget.customerInfoArguments != null) {
      item = widget.customerInfoArguments?.item ?? DealProductModel();
      couponValue = widget.customerInfoArguments?.couponValue ?? 0;
      cartValue = Helper.getDiscountedPrice(
        actualPrice: item.price ?? 0,
        discount: item.discount ?? 0,
      );
      discount = (item.price ?? 0) - cartValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'reviewAndPay'.localize(context),
          style: ADTextStyle700.size22,
        ),
      ),
      body: ADSelectorStateLessWidget(
        viewModel: dutyPaymentConfirmationViewModel,
        child: Consumer<DutyPaymentConfirmationState>(
          builder: (context, value, child) {
            switch (value.dutyPaymentConfirmationState.viewStatus) {
              case Status.complete:
                final DutyPaymentConfirmation dutyPaymentConfirmation =
                    value.dutyPaymentConfirmationState.data;
                return ListView(
                  children: [
                    /// this method used to get the summary related to hotel booking ,this includes all the price details.
                    _PriceDetailSummary(
                      paymentSummary: dutyPaymentConfirmation,
                      couponValue: 0,
                      price: context
                              .read<DutyFreeState>()
                              .dutyFreeCartResponse
                              ?.totalAmount
                              ?.amount ??
                          0,
                      discount: context
                              .read<DutyFreeState>()
                              .dutyFreeCartResponse
                              ?.preOrderDiscount
                              ?.amount ??
                          0,
                    ),
                    SizedBox(
                      height: context.k_10,
                    ),
                    _TotalAmountView(
                      couponValue: 0,
                      cartValue: context
                              .read<DutyFreeState>()
                              .dutyFreeCartResponse
                              ?.finalAmount
                              ?.amount ??
                          0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ADRewardPointsCard(
                          message: 'You will earn 72 reward points ',
                          imagePath: 'lib/assets/images/duty_free/badge.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.k_10,
                    ),
                    Divider(
                      height: context.scaled(1),
                      color: context.adColors.greyTextColor,
                    ),
                    SizedBox(
                      height: context.k_20,
                    ),

                    /// this method is used to show the available ADANI Pay Balance and your total hotel booking cost.
                    ADPayCard(
                      firstString: '${'use'.localize(context)} ',
                      purchaseAmount: '₹$cartValue ',
                      thirdString: '${'ofYour'.localize(context)} ',
                      adaniBalance:
                          '₹${dutyPaymentConfirmation.adaniBalance.validateWithDefaultValue()} ${'adaniPayBalance'.localize(context)}',
                      fifthString:
                          '${'adaniPayBalance'.localize(context)}  ${'isRecommendedForYou'.localize(context)}',
                      sixthString: '${'why'.localize(context)}?',
                      adGenericValueChanged: _adGenericValueChanged,
                    ),
                    SizedBox(
                      height: context.k_20,
                    ),
                    PaymentMethods(
                      dutyPaymentConfirmationModel: dutyPaymentConfirmation,
                    ),
                    SizedBox(
                      height: context.k_40,
                    ),
                  ],
                );
              case Status.loading:
                return const Center(
                  child: ADCircularProgressBar(),
                );
              case Status.error:
                return const ADErrorPage();
              default:
                return Text('default'.localize(context));
            }
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.k_20),
          child: ElevatedButton(
            onPressed: () => onBackButtonPressed(context),
            style: ElevatedButton.styleFrom(
              primary: context.adColors.blueColor,
              shape: const StadiumBorder(),
              padding: EdgeInsets.all(context.k_14),
            ),
            child: Text(
              'pay_now'.localize(context),
              style: ADTextStyle700.size18
                  .copyWith(color: context.adColors.whiteTextColor),
            ),
          ),
        ),
      ),
    );
  }

  void onBackButtonPressed(BuildContext context) {
    ///Todo commented for now, it will be remove later
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      dutyFreeOrderConfirmation,
      argumentObject: item,
    );
    adLog('');
  }

  void _adGenericValueChanged(value) {
    adLog(value.toString());
  }
}

/// this class is use to show total amount view.
class _TotalAmountView extends StatelessWidget {
  final num couponValue;
  final num cartValue;

  const _TotalAmountView({
    Key? key,
    required this.couponValue,
    required this.cartValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.k_10),
      child: Column(
        children: [
          Divider(
            height: context.scaled(1),
            color: context.adColors.greyTextColor,
          ),
          SizedBox(
            height: context.k_14,
          ),
          ADRow(
            leftText: 'totalAmount'.localize(context),
            rightText:
                couponValue > 0 ? '₹${cartValue - couponValue}' : '₹$cartValue',
            rightTextStyle: ADTextStyle600.size20,
            leftTextStyle: ADTextStyle500.size20,
          ),
          SizedBox(
            height: context.k_14,
          ),
          Divider(
            height: context.scaled(1),
            color: context.adColors.greyTextColor,
          ),
        ],
      ),
    );
  }
}

/// This class is use to show summary of price details.
class _PriceDetailSummary extends StatelessWidget {
  final DutyPaymentConfirmation paymentSummary;
  final num couponValue;

  final num price;

  final num discount;

  const _PriceDetailSummary({
    Key? key,
    required this.paymentSummary,
    required this.couponValue,
    required this.price,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PriceDetails> priceList = paymentSummary.priceList ?? [];
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: context.adColors.transparentColor),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(context.k_10),
        initiallyExpanded: true,
        iconColor: context.adColors.black,
        collapsedIconColor: context.adColors.black,
        title: Text(
          'priceDetails'.localize(context),
          style: ADTextStyle700.size22,
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: priceList.length,
            itemBuilder: (context, index) {
              return ADExpansionRow(
                paymentType: priceList[index].title.validateWithDefaultValue(),
                price: index == 0
                    ? '₹${price.toString()}'
                    : index == 1
                        ? '₹${discount.toString()}'
                        : '₹${couponValue.toString()}',
                priceColor:
                    priceList[index].priceTypeColor.validateWithDefaultValue(),
                onTapHandlerApplyCoupon: () => adLog('Tap'),
                onTapHandlerRedeemCross: () => adLog('Tap'),
              );
            },
          ),
        ],
      ),
    );
  }
}
