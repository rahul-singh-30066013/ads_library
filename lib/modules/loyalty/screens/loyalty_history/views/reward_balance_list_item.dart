/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_booking_confirmation_navigate_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/duty_free_confirmation_order.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_history_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RewardBalanceListItem extends StatefulWidget {
  final LoyaltyHistoryData loyaltyHistoryModelList;
  final bool position;
  final bool selected;

  const RewardBalanceListItem({
    Key? key,
    required this.loyaltyHistoryModelList,
    required this.position,
    required this.selected,
  }) : super(key: key);

  @override
  State<RewardBalanceListItem> createState() => _RewardBalanceListItemState();
}

class _RewardBalanceListItemState extends State<RewardBalanceListItem> {
  //final ValueNotifier<bool> _notifier = ValueNotifier<bool>(false);
  LoyaltyStateManagement loyaltyHistoryProvider = LoyaltyStateManagement();
  LoyaltyStateManagement loyaltyItemDetailProvider = LoyaltyStateManagement();

  ///Todo add to style
  static const Color historyLightGreyColor = Color(0xff555555);
  static const Color historyOffGreyColor = Color(0xffbbbbbb);
  static const Color historyLightGreenColor = Color(0xff6DC976);
  final int k_5 = 5;

  String getOrderId() {
    return widget.loyaltyHistoryModelList.orderReferences.isNotEmpty
        ? widget.loyaltyHistoryModelList.orderReferences.first
        : widget.loyaltyHistoryModelList.orderReferenceId;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (widget.loyaltyHistoryModelList.partnerTransactionReferenceId != '')
          gaEvents(),
        if (getOrderId().isNotEmpty)
          productTap(
            getOrderId(),
            widget.loyaltyHistoryModelList.businessSubType,
          ),
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(context.k_8),
                margin: EdgeInsets.only(right: context.k_10),
                width: context.k_32,
                height: context.k_32,
                child: widget.position
                    ? SvgPicture.asset(
                        SvgAssets.historyArrowDown,
                        color: historyOffGreyColor,
                      )
                    : widget.loyaltyHistoryModelList.transactionType ==
                                TransactionTypeEnum.CREDIT.name ||
                            widget.loyaltyHistoryModelList.transactionType ==
                                TransactionTypeEnum.REFUND.name
                        ? SvgPicture.asset(
                            SvgAssets.historyArrowDown,
                            color: historyLightGreenColor,
                          )
                        : SvgPicture.asset(
                            SvgAssets.historyArrowUp,
                            color: historyLightGreyColor,
                          ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //  widget.loyaltyHistoryModelList.txnCrDbInd == '1'
                      //     ? widget.loyaltyHistoryModelList.txnBrandName
                      widget.loyaltyHistoryModelList.title,
                      style: ADTextStyle600.size16.setTextColor(
                        context.adColors.filterBlackText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ADSizedBox(
                      height: context.k_6,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.loyaltyHistoryModelList.transactionType ==
                                    TransactionTypeEnum.AWARD.name
                                ? 'will_credited'.localize(context) +
                                    DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(
                                        widget.loyaltyHistoryModelList
                                                    .completionDate ==
                                                ''
                                            ? DateTime.now().toString()
                                            : widget.loyaltyHistoryModelList
                                                .completionDate,
                                      ),
                                    )
                                : widget.loyaltyHistoryModelList
                                                .transactionType ==
                                            TransactionTypeEnum.CREDIT.name ||
                                        widget.loyaltyHistoryModelList
                                                .transactionType ==
                                            TransactionTypeEnum.REFUND.name
                                    ? 'credited_on'.localize(context) +
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            widget.loyaltyHistoryModelList
                                                .transactionDate,
                                          ),
                                        )
                                    : 'debited_on'.localize(context) +
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            widget.loyaltyHistoryModelList
                                                .transactionDate,
                                          ),
                                        ),
                            style: ADTextStyle400.size12.setTextColor(
                              context.adColors.circleGreyTextColor,
                            ),
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_6,
                        ),
                        // InkWell(
                        //   key: const Key(LoyaltyAutomationKeys.detailsKey),
                        //   onTap: () => updateScreen(
                        //     widget.loyaltyHistoryModelList.txnExternalRef,
                        //   ),
                        //   child: Container(
                        //     padding: EdgeInsets.all(context.k_4),
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           'Details',
                        //           style: ADTextStyle500.size12
                        //               .setTextColor(
                        //                 context.adColors.blackColor,
                        //               )
                        //               .copyWith(
                        //                 decoration: TextDecoration.underline,
                        //               ),
                        //         ),
                        //         ADSizedBox(
                        //           width: context.k_8,
                        //         ),
                        //         // ValueListenableBuilder<bool>(
                        //         //   valueListenable: _notifier,
                        //         //   builder: (context, value, child) => Icon(
                        //         //     _notifier.value
                        //         //         ? Icons.expand_less_outlined
                        //         //         : Icons.expand_more_outlined,
                        //         //     size: context.k_14,
                        //         //   ),
                        //         // ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                widget.loyaltyHistoryModelList.loyaltyPoints > 0
                    ? widget.loyaltyHistoryModelList.transactionType ==
                            TransactionTypeEnum.DEBIT.name
                        ? widget.selected
                            ? '${widget.loyaltyHistoryModelList.loyaltyPoints}'
                            : '- ${widget.loyaltyHistoryModelList.loyaltyPoints}'
                        : widget.selected
                            ? '${widget.loyaltyHistoryModelList.loyaltyPoints}'
                            : '+ ${widget.loyaltyHistoryModelList.loyaltyPoints}'
                    : '${widget.loyaltyHistoryModelList.loyaltyPoints}',
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.neutralInfoMsg,
                ),
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_28,
            bottom: context.k_22,
          ),
          Divider(
            indent: context.k_16,
            height: 1,
            endIndent: context.k_16,
            color: context.adColors.widgetDividerLine,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  /// GA event method
  void gaEvents() {
    final String txnDate = DateFormat(Constant.dateFormat21)
        .format(DateTime.parse(widget.loyaltyHistoryModelList.transactionDate));
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'view_rewards',
      Parameters.label.name: widget.loyaltyHistoryModelList.businessSubType,
      Parameters.date.name: txnDate,
      Parameters.value.name: widget.loyaltyHistoryModelList.loyaltyPoints,
      Parameters.type.name: widget.loyaltyHistoryModelList.transactionType ==
              TransactionTypeEnum.CREDIT.name
          ? 'debit'
          : widget.loyaltyHistoryModelList.transactionType ==
                  TransactionTypeEnum.AWARD.name
              ? 'pending'
              : 'credit',
    };
    ClickEvents.view_reward_history.logEvent(parameters: map);
  }

  void productTap(String orderId, String type) {
    switch (type) {
      case 'DutyFree':
        final Future obj = Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DutyFreeConfirmationOrder(
              referenceId: orderId,
            ),
          ),
        );
        adLog(obj.toString());
        break;
      case 'Pranaam':
        // if (orderId.length > context.k_10.toInt()) {
        //   orderId = '1234567890';
        // }
        navigateToScreenWithRootNavigatorResult(
          context,
          myAccountView,
          argumentObject: [orderId, false, false, false],
        ).then((value) => null);
        break;
      case 'FlightBooking':
        navigateToScreenWithRootNavigatorResult(
          context,
          flightBookingItemDetails,
          argumentObject: orderId,
        ).then((value) => null);
        break;
      case 'CabBooking':
        navigateToScreenWithRootNavigatorResult(
          context,
          cabBookingConfirmationScreen,
          argumentObject: CabBookingConfirmationNavigateModel(
            orderReferenceId: orderId,
          ),
        ).then((value) => null);
        break;
      default:
    }
  }
}
