import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class ZeroCancellationAmountView extends StatefulWidget {
  final String label;
  final String? code;
  final String? hint;
  final double? cancellationFee;
  final double? refundAmount;
  final bool? cancellationWithZeroBreakup;
  const ZeroCancellationAmountView({
    required this.label,
    this.code,
    this.hint,
    this.cancellationFee,
    this.refundAmount,
    this.cancellationWithZeroBreakup,
    Key? key,
  }) : super(key: key);

  @override
  _ZeroCancellationAmountViewState createState() =>
      _ZeroCancellationAmountViewState();
}

class _ZeroCancellationAmountViewState
    extends State<ZeroCancellationAmountView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.black,
              ),
            ),
            Row(
              children: [
                if (widget.code == 'CCF')
                  Visibility(
                    visible: widget.cancellationWithZeroBreakup ?? false,
                    child: Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: widget.cancellationFee ?? 0,
                      ),
                      style: ADTextStyle400.size16
                          .setTextColor(
                            context.adColors.greyTextColor,
                          )
                          .copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ),
                if (widget.code == 'REFAMT')
                  if ((widget.refundAmount ?? 0) > 0)
                    Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: widget.refundAmount ?? 0,
                      ),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.black,
                      ),
                    )
                  else
                    Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: 0,
                      ),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.black,
                      ),
                    ),
                if (widget.code == 'CCF' &&
                    (widget.cancellationWithZeroBreakup ?? false))
                  SizedBox(
                    width: context.k_6,
                  ),
                if (widget.code == 'CCF' &&
                    (widget.cancellationWithZeroBreakup ?? false))
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(
                      price: 0,
                    ),
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                if (widget.code == 'CCF' &&
                    !(widget.cancellationWithZeroBreakup ?? false))
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(
                      price: widget.cancellationFee ?? 0,
                    ),
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.black,
                    ),
                  ),
              ],
            ),
          ],
        ),
        if ((widget.hint ?? '').isNotEmpty)
          SizedBox(
            height: context.k_4,
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.hint ?? '',
            style: ADTextStyle400.size12.setTextColor(
              context.adColors.darkGreyTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
