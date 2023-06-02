/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PickupAndDestinationAddressView extends StatelessWidget {
  final String pickUpLocationText;
  final String destinationLocationText;

  const PickupAndDestinationAddressView({
    Key? key,
    required this.pickUpLocationText,
    required this.destinationLocationText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddressRow(
          address: pickUpLocationText,
          iconAddress: SvgAssets.sourceAddress,
        ),
        AddressRow(
          address: destinationLocationText,
          iconAddress: SvgAssets.destinationAddress,
          isLast: true,
        ),
      ],
    );
  }
}

class AddressRow extends StatefulWidget {
  const AddressRow({
    Key? key,
    required this.address,
    required this.iconAddress,
    this.isLast = false,
  }) : super(key: key);
  final String address;
  final String iconAddress;
  final bool isLast;

  @override
  State<AddressRow> createState() => _AddressRowState();
}

class _AddressRowState extends State<AddressRow> {
  final GlobalKey contentWidgetKey = GlobalKey();
  double dashedHeight = 0;
  final maxLine = 2;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => {
        setState(() {
          {
            dashedHeight = contentWidgetKey.currentContext?.size?.height ?? 0.0;
          }
        }),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.k_18,
              width: context.k_18,
              child: Center(
                child: SvgPicture.asset(
                  widget.iconAddress,
                  height: context.k_16,
                  width: context.k_16,
                  color: context.adColors.neutralInfoMsg,
                ),
              ),
            ),
            if (!widget.isLast)
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: context.k_4,
                ),
                color: context.adColors.neutralInfoMsg,
                height: dashedHeight,
                width: 1,
              ),
          ],
        ),
        ADSizedBox(
          width: context.k_11,
        ),
        Flexible(
          key: contentWidgetKey,
          child: Text(
            widget.address,
            maxLines: maxLine,
            style: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
