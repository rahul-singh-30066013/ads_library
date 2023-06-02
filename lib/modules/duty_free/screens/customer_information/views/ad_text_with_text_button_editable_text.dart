/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is created as component for Text Field with customize text button. Here we provides
/// lot of customized options like cross icon for to clear text field and text button
/// for with customize text and its action.
///
/// And, we also handle error messages those use this class return error message
/// widget for showing message for user.
class ADTextWithTextButtonEditableText extends StatefulWidget {
  const ADTextWithTextButtonEditableText({
    Key? key,
    required this.componentData,
  }) : super(key: key);

  /// this is an use for action perform on edittext
  final ADEditableTextModel componentData;

  @override
  State<ADTextWithTextButtonEditableText> createState() =>
      _ADTextWithTextButtonEditableTextState();
}

class _ADTextWithTextButtonEditableTextState
    extends State<ADTextWithTextButtonEditableText> {
  bool _isActive = false;
  int boxDecorationColorShade = 100;
  final double boxDecorationHeight = 60.sp;
  double activeNumber = 1;

  final double defaultEditableTextHeight = 60.sp;
  final double defaultEditableTextHeightForMaxLine = 100.sp;
  int maxLine = 6;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.componentData.isActive != null) {
      _isActive = widget.componentData.isActive ?? false;
      _focusNode.requestFocus();
    }
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isActive = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.componentData.onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.k_16),
            height: widget.componentData.maxLines == maxLine
                ? defaultEditableTextHeightForMaxLine
                : defaultEditableTextHeight,
            decoration: BoxDecoration(
              color: ADColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(context.k_8),
              ),
              border: Border.all(
                color: _borderColor(),
                width: _isActive ? activeNumber : 1,
              ),
            ),
            child: Align(
              child: IgnorePointer(
                child: TextField(
                  enabled: widget.componentData.enable,
                  controller: widget.componentData.controller,
                  keyboardType: widget.componentData.keyBoardType,
                  textInputAction: widget.componentData.textInputAction,
                  readOnly: widget.componentData.readonly,
                  focusNode: _focusNode,
                  onTap: () => setState(() {
                    _isActive = true;
                    widget.componentData.onTap?.call();
                  }),
                  onChanged: (value) => setState(() {
                    widget.componentData.text = value;
                    widget.componentData.onChange();
                  }),
                  maxLength: widget.componentData.length,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    suffixIconConstraints: BoxConstraints(
                      minHeight: context.k_16,
                      minWidth: context.k_16,
                    ),
                    labelText: widget.componentData.placeHolder,
                    // contentPadding: EdgeInsets.all(context.k_2),
                    labelStyle: ADTextStyle400.size16.copyWith(
                      color: _isActive
                          ? widget.componentData.focusedBorderColor
                          : context.adColors.darkGreyTextColor,
                    ),
                    suffixIcon: (widget.componentData.svgAssets != null)
                        ? SvgPicture.asset(
                            widget.componentData.svgAssets ?? '',
                            color: context.adColors.darkGreyTextColor,
                            fit: BoxFit.fitWidth,
                            // width: 10,
                            // height: 10,
                          )
                        : Icon(
                            widget.componentData.icon,
                            color: context.adColors.darkGreyTextColor,
                          ),

                    // Padding(
                    //   padding: EdgeInsets.only(left: context.k_2),
                    //   child: (widget.componentData.svgAssets != null)
                    //       ? SvgPicture.asset(
                    //           widget.componentData.svgAssets ?? '',
                    //           color: context.adColors.darkGreyTextColor,
                    //           fit: BoxFit.fitWidth,
                    //           // width: 10,
                    //           // height: 10,
                    //         )
                    //       : Icon(
                    //           widget.componentData.icon,
                    //           color: context.adColors.darkGreyTextColor,
                    //         ),
                    //   // Row(
                    //   //   // mainAxisAlignment:
                    //   //   //     MainAxisAlignment.spaceBetween, // added line
                    //   //   mainAxisSize: MainAxisSize.min,
                    //   //   children: [
                    //   //     // Spacer(),
                    //   //     // IconButton(
                    //   //     //   onPressed: () => null,
                    //   //     //   //     setState(() {
                    //   //     //   //   widget.componentData.onClearTextAction();
                    //   //     //   //   widget.componentData.controller.clear();
                    //   //     //   //   widget.componentData.isHideCrossIcon = false;
                    //   //     //   // }),
                    //   //     //   icon: widget.componentData.text != null
                    //   //     //       ? const Icon(Icons.close)
                    //   //     //       : const SizedBox.shrink(),
                    //   //     //   color: context.adColors.black,
                    //   //     // ),
                    //   //     if (widget.componentData.svgAssets != null)
                    //   //       SvgPicture.asset(
                    //   //         widget.componentData.svgAssets ?? '',
                    //   //         color: context.adColors.darkGreyTextColor,
                    //   //       )
                    //   //     else
                    //   //       Icon(
                    //   //         widget.componentData.icon,
                    //   //         color: context.adColors.darkGreyTextColor,
                    //   //       ),
                    //   //   ],
                    //   // ),
                    // ),
                  ),
                  cursorColor: widget.componentData.cursorColor,
                  style: widget.componentData.style,
                  onSubmitted: widget.componentData.onSubmitted,
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.k_4,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child:
                widget.componentData.errorMsgWidget ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  // Check which border color is using
  Color _borderColor() {
    if (widget.componentData.errorMsgWidget != null) {
      return widget.componentData.errorMessageColor;
    } else if (_isActive) {
      return widget.componentData.focusedBorderColor;
    } else {
      return context.adColors.greyReviewShade;
    }
  }
}
