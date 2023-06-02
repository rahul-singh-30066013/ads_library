/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/utils/enums/cell_type.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class can be used to generate expansion tile with
/// [paymentOptionType] as the title of the header and in
class ADPaymentOptionTile extends StatelessWidget {
  const ADPaymentOptionTile({
    Key? key,
    this.paymentOptionType,
    required this.onExpandCallback,
    required this.isExpanded,
    this.paymentType,
    this.expansionChildren,
    this.icon,
    this.totalAmount,
    this.index,
    this.activeRule,
  }) : super(key: key);

  /// This defines the type of payment.
  final int? index;

  /// This defines the type of payment.
  final String? paymentOptionType;

  /// icon or the logo of the payment option
  final String? icon;

  final ADPaymentOptionTileType? paymentType;

  final bool isExpanded;
  final String? totalAmount;

  final ADGenericCallback onExpandCallback;
  final ActiveRule? activeRule;

  final List<Widget>? expansionChildren;

  @override
  Widget build(BuildContext context) {
    if (paymentOptionType != null) {
      return PaymentOptionTileWidget(
        onExpandCallback: (value) => onExpandCallback(value),
        isExpanded: isExpanded,
        expansionChildren: expansionChildren,
        paymentType: paymentOptionType.validateWithDefaultValue(),
        paymentTypeLogo: icon.validateWithDefaultValue(),
        activeRule: activeRule,
        totalAmount: totalAmount ?? '0',
      );
    }

    return const SizedBox.shrink();
  }
}

class PaymentOptionTileWidget extends StatefulWidget {
  const PaymentOptionTileWidget({
    Key? key,
    required this.onExpandCallback,
    required this.isExpanded,
    this.expansionChildren,
    required this.paymentType,
    required this.paymentTypeLogo,
    required this.activeRule,
    required this.totalAmount,
  }) : super(key: key);

  final bool isExpanded;
  final ADGenericCallback onExpandCallback;
  final List<Widget>? expansionChildren;
  final String paymentType;
  final String paymentTypeLogo;
  final String totalAmount;
  final ActiveRule? activeRule;

  @override
  State<PaymentOptionTileWidget> createState() =>
      _PaymentOptionTileWidgetState();
}

class _PaymentOptionTileWidgetState extends State<PaymentOptionTileWidget> {
  final lineHeight = 1.5;

  bool isPaymentRestricted() {
    final limit = double.parse(widget.activeRule?.amountlimit ?? '0');
    return widget.activeRule != null &&
        limit > 0 &&
        double.parse(widget.totalAmount) > limit &&
        (widget.paymentType == 'UPI' || widget.paymentType == 'Wallet');
  }

  @override
  Widget build(BuildContext context) {
    const Color _disablePaymentColor = Color.fromRGBO(193, 194, 199, 1);

    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) =>
            isPaymentRestricted() ? null : callBack(isExpanded),
        animationDuration: const Duration(milliseconds: 500),
        elevation: 0,
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Row(
                children: [
                  Row(
                    children: [
                      if (widget.paymentTypeLogo.isNotEmpty)
                        if (Utils.startsWithHttp(widget.paymentTypeLogo))
                          SvgPicture.network(
                            widget.paymentTypeLogo,
                            width: context.scaled(context.k_24),
                            height: context.scaled(context.k_24),
                            color: isPaymentRestricted()
                                ? _disablePaymentColor
                                : null,
                          )
                        else
                          Image.asset(
                            widget.paymentTypeLogo,
                            width: context.scaled(context.k_24),
                            height: context.scaled(context.k_24),
                            color: isPaymentRestricted()
                                ? _disablePaymentColor
                                : null,
                          ),
                      SizedBox(
                        width: context.scaled(context.k_16),
                      ),
                    ],
                  ),
                  Expanded(
                    child: isExpanded
                        ? Text(
                            widget.paymentType,
                            overflow: TextOverflow.ellipsis,
                            style: ADTextStyle700.size16.setTextColor(
                              isPaymentRestricted()
                                  ? _disablePaymentColor
                                  : context.adColors.black,
                            ),
                          )
                        : Text(
                            widget.paymentType,
                            overflow: TextOverflow.ellipsis,
                            style: ADTextStyle500.size16.setTextColor(
                              isPaymentRestricted()
                                  ? _disablePaymentColor
                                  : context.adColors.black,
                            ),
                          ),
                  ),
                  if (isPaymentRestricted())
                    Row(
                      children: [
                        Text(
                          widget.activeRule?.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size12
                              .setTextColor(context.adColors.neutralInfoMsg),
                        ),
                        TooltipScreen(
                          richTextHeader: '${widget.activeRule?.title}\n',
                          richTextMessage: '${widget.activeRule?.message}',
                          textStyleMessage: ADTextStyle400.size14
                              .setTextColor(
                                context.adColors.brownishGrey,
                              )
                              .setFontHeight(lineHeight),
                          textStyleHeader: ADTextStyle700.size16
                              .setTextColor(
                                context.adColors.whiteTextColor,
                              )
                              .setFontHeight(lineHeight),
                        ),
                      ],
                    ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_2,
                top: isExpanded ? 0 : context.k_24,
                bottom: isExpanded ? 0 : context.k_24,
              );
            },
            isExpanded: widget.isExpanded,
            canTapOnHeader: true,
            body: Column(
              children: widget.expansionChildren ?? [],
            ),
          ),
        ],
      ),
    );
  }

  void callBack(isExpanded) {
    widget.onExpandCallback(isExpanded);
  }
}
