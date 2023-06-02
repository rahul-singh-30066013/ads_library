/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabsTimelineView extends StatelessWidget {
  const CabsTimelineView({
    Key? key,
    required this.supplier,
    required this.wayToKioskText,
    required this.showYourOTPText,
    required this.getTheCabTextText,
  }) : super(key: key);
  final String supplier;
  final String wayToKioskText;
  final String showYourOTPText;
  final String getTheCabTextText;

  @override
  Widget build(BuildContext context) {
    const two = 2;
    const three = 3;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'steps_to_board_your_cab'.localize(context),
          style: ADTextStyle700.size20,
        ).paddingBySide(bottom: context.k_28),
        TimelineRow(
          srNo: 1,
          title: 'way_to_supplier_kiosk'
              .localize(context)
              .replaceAll('supplier_', supplier.isNotEmpty ? '$supplier ' : ''),
          subTile: wayToKioskText,
        ),
        TimelineRow(
          srNo: two,
          title: 'show_your_otp'.localize(context),
          subTile: showYourOTPText.isNotEmpty
              ? showYourOTPText
              : 'show_the_otp_at_kiosk_counter'.localize(context),
        ),
        TimelineRow(
          srNo: three,
          title: 'get_the_cab'.localize(context),
          subTile: getTheCabTextText.isNotEmpty
              ? getTheCabTextText
              : 'sit_back_and_relax'.localize(context),
          isLast: true,
        ),
      ],
    );
  }
}

class TimelineRow extends StatefulWidget {
  const TimelineRow({
    Key? key,
    required this.srNo,
    required this.title,
    required this.subTile,
    this.isLast = false,
  }) : super(key: key);
  final int srNo;
  final String title;
  final String subTile;
  final bool isLast;

  @override
  State<TimelineRow> createState() => _TimelineRowState();
}

class _TimelineRowState extends State<TimelineRow> {
  final GlobalKey contentWidgetKey = GlobalKey();
  double dashedHeight = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => {
        setState(() {
          {
            dashedHeight =
                (contentWidgetKey.currentContext?.size?.height ?? 0.0) +
                    context.k_10;
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.adColors.greyTextColor,
                ),
                shape: BoxShape.circle,
                color: context.adColors.whiteTextColor,
              ),
              width: context.k_24,
              height: context.k_24,
              child: Center(
                child: Text(
                  widget.srNo.toString(),
                  style: ADTextStyle600.size14
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ),
            ),
            if (!widget.isLast)
              CustomPaint(
                size: Size(1, dashedHeight),
                painter: DashedLineVerticalPainter(context: context),
              ),
          ],
        ),
        ADSizedBox(
          width: context.k_12,
        ),
        Expanded(
          child: Column(
            key: contentWidgetKey,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
              ADSizedBox(
                height: context.k_4,
              ),
              Text(
                widget.subTile,
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  final BuildContext context;

  const DashedLineVerticalPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    const double dashHeight = 6, dashSpace = 4;
    double startY = 0;
    final paint = Paint()
      ..color = context.adColors.greyTextColor
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
