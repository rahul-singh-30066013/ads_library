/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const trimLines = 2;

/// this class is used to toggle between readMore and readLess.
class ReadMore extends StatefulWidget {
  const ReadMore(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  ReadMoreState createState() => ReadMoreState();
}

class ReadMoreState extends State<ReadMore> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final widgetColor = context.adColors.black;
    final TextSpan link = TextSpan(
      text: _readMore ? '...' : '',
      children: [
        TextSpan(
          text: _readMore
              ? '\n${'read_more'.localize(context)}'
              : '\n${'read_less'.localize(context)}',
          style: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor)
              .copyWith(decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = _onTapLink,
        ),
      ],
    );
    final Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        );
        // Layout and measure link
        final TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: trimLines,
          ellipsis: '...',
        )
          ..layout(minWidth: constraints.minWidth, maxWidth: maxWidth)
          ..text = text
          ..layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(
          Offset(
            textSize.width - linkSize.width,
            textSize.height,
          ),
        );
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        textSpan = textPainter.didExceedMaxLines
            ? TextSpan(
                text: _readMore
                    ? widget.text.substring(0, endIndex)
                    : widget.text,
                style: TextStyle(color: widgetColor),
                children: <TextSpan>[link],
              )
            : TextSpan(text: widget.text);
        return RichText(
          text: textSpan,
        );
      },
    );
    return result;
  }
}
