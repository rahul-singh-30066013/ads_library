/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double _borderWidth = 0.5.sp;

/// Dynamic Widget for DropDown
class DropDownGeneric extends StatefulWidget {
  const DropDownGeneric({
    Key? key,
    this.validation,
    this.notifyParent,
    this.onTap,
    this.type,
    this.showDivider = false,
    this.icon,
    this.iconColor,
    this.fieldKey,
    this.prefixIconUrl,
    required this.controller,
    this.errorMsg,
    this.isDisabled = false,
    this.isForCountyCode = false,
    this.isDropDownNearTitle = false,
    this.widthOfDropDown,
    this.needRightPadding = true,
    this.focus,
    this.svgIcon,
  }) : super(key: key);

  /// Final variables getting form pervious widget
  /// to change right side icon
  final IconData? icon;

  /// key of text field
  final Key? fieldKey;

  /// Text field controller
  final TextEditingController controller;

  /// to display right side divider
  final bool showDivider;

  /// icon url for prefix icon
  final ValueNotifier<String>? prefixIconUrl;

  /// notify parent if change in value
  final dynamic Function()? notifyParent;

  /// on tap action
  final void Function()? onTap;

  /// Label name
  final String? type;

  final Color? iconColor;

  final ValueNotifier<String>? errorMsg;
  final bool isDisabled;

  /// validation function
  final String? Function(String? value, BuildContext context)? validation;

  /// checks if widget is on login screen
  final bool isForCountyCode;
  final bool isDropDownNearTitle;

  final double? widthOfDropDown;

  final bool needRightPadding;

  final FocusNode? focus;

  final String? svgIcon;

  @override
  State<DropDownGeneric> createState() => _DropDownGeneric();
}

class _DropDownGeneric extends State<DropDownGeneric> {
  /// checking current textField validation
  static const Color errorColor = Color(0xffef645a);

  final double heightOfContainer = 56.sp;
  double widthOfContainer = 135.sp;
  final double prefixIconWidth = 30.sp;
  final double prefixIconHeight = 20.sp;
  static const double prefixAlignHeight = 0.5;
  static const double prefixAlignWidth = 1;

  FocusNode focusNode = FocusNode();

  /// empty Notifier
  final ValueNotifier<String> emptyNofifyer = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    widthOfContainer = widget.widthOfDropDown ?? widthOfContainer;
    widget.focus?.addListener(_onFocusChange);
    if (widget.isForCountyCode) {
      widget.controller.addListener(_onFocusChange);
    }
    if (widget.focus != null) {
      focusNode = widget.focus ?? FocusNode();
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.focus?.removeListener(_onFocusChange);
    emptyNofifyer.dispose();
    if (widget.isForCountyCode) {
      widget.controller.removeListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    setState(() {
      adLog('Focus: ${focusNode.hasFocus.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.type,//sematics provide meta data to help with automation testing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: IgnorePointer(
              child: ValueListenableBuilder(
                valueListenable: widget.errorMsg ?? emptyNofifyer,
                child: const ADSizedBox(),
                builder: (context, String value, child) => Container(
                  height: widget.showDivider ? heightOfContainer : context.k_60,
                  width: !widget.isForCountyCode
                      ? widget.showDivider
                          ? widthOfContainer
                          : double.infinity
                      : null,
                  padding: EdgeInsets.only(
                    left: widget.showDivider ? 0 : context.k_16,
                    right: widget.needRightPadding ? context.k_16 : 0,
                  ),
                  decoration: BoxDecoration(
                    border: !widget.showDivider
                        ? Border.all(
                            color: widget.isDisabled
                                ? context.adColors.tileBorderColor
                                : focusNode.hasFocus
                                    ? context.adColors.greyReviewShade
                                    : value.isEmpty
                                        ? context.adColors.greyReviewShade
                                        : errorColor,
                          )
                        : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_8),
                    ),
                  ),
                  child: widget.isForCountyCode
                      ? Row(
                          children: [
                            if (widget.prefixIconUrl != null)
                              Align(
                                widthFactor: prefixAlignWidth,
                                heightFactor: prefixAlignHeight,
                                child: ValueListenableBuilder(
                                  valueListenable:
                                      widget.prefixIconUrl ?? emptyNofifyer,
                                  builder: (context, String value, child) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      color: context.adColors.containerGreyBg,
                                      border: Border.all(
                                        width: _borderWidth,
                                        color:
                                            context.adColors.lightGreyTextColor,
                                      ),
                                    ),
                                    child: Image.network(
                                      value.validateWithDefaultValue(),
                                      height: prefixIconHeight,
                                      width: prefixIconWidth,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        width: prefixIconWidth,
                                        height: prefixIconHeight,
                                        color: context.adColors.containerGreyBg,
                                      ),
                                    ),
                                  ),
                                ),
                              ).paddingBySide(right: context.k_10),
                            Text(
                              widget.controller.text.split(',').first,
                              style: ADTextStyle500.size16.setTextColor(
                                widget.isDisabled
                                    ? context.adColors.greyReviewShade
                                    : context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              width: context.k_6,
                            ),
                            if (widget.svgIcon != null)
                              SvgPicture.asset(
                                widget.svgIcon ?? '',
                                color: context.adColors.darkGreyTextColor,
                                fit: BoxFit.fitWidth,
                                width: context.k_16,
                                height: context.k_16,
                              )
                            else
                              Icon(
                                widget.icon ??
                                    Icons.keyboard_arrow_down_outlined,
                                color: widget.iconColor ??
                                    context.adColors.darkGreyTextColor,
                                // size: context.k_16,
                              ),
                            ADSizedBox(
                              width: context.k_10,
                            ),
                            if (widget.showDivider)
                              Container(
                                margin: EdgeInsets.only(
                                  // left: context.k_4,
                                  top: context.k_10,
                                  bottom: context.k_10,
                                ),
                                width: 1,
                                color: context.adColors.greyReviewShade,
                              ),
                          ],
                        )
                      : Row(
                          children: [
                            Flexible(
                              child: TextField(
                                // onTap: null,
                                controller: widget.controller,
                                key: widget.fieldKey,
                                textInputAction: TextInputAction.next,
                                readOnly: true,
                                focusNode: widget.focus,
                                style: widget.isDisabled
                                    ? ADTextStyle500.size16.setTextColor(
                                        context.adColors.greyReviewShade,
                                      )
                                    : ADTextStyle500.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                decoration: InputDecoration(
                                  prefix: widget.prefixIconUrl != null
                                      ? Align(
                                          widthFactor: prefixAlignWidth,
                                          heightFactor: prefixAlignHeight,
                                          child: ValueListenableBuilder(
                                            valueListenable:
                                                widget.prefixIconUrl ??
                                                    emptyNofifyer,
                                            child: const ADSizedBox(),
                                            builder: (context, String value,
                                                    child,) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                color: context
                                                    .adColors.containerGreyBg,
                                                border: Border.all(
                                                  width: _borderWidth,
                                                  color: context.adColors
                                                      .lightGreyTextColor,
                                                ),
                                              ),
                                              child: Image.network(
                                                value
                                                    .validateWithDefaultValue(),
                                                height: prefixIconHeight,
                                                width: prefixIconWidth,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ).paddingBySide(right: context.k_4)
                                      : null,

                                  /// TODO : add color in color constant for error text
                                  errorStyle:
                                      ADTextStyle400.size12.setTextColor(
                                    const Color(0xffef645a),
                                  ),
                                  labelText: widget.isForCountyCode
                                      ? null
                                      : widget.type,
                                  labelStyle: widget.isDisabled
                                      ? ADTextStyle400.size16.setTextColor(
                                          context.adColors.greyReviewShade,
                                        )
                                      : ADTextStyle400.size16.setTextColor(
                                          context.adColors.greyTextColor,
                                        ),
                                  hintStyle: ADTextStyle400.size16.setTextColor(
                                    context.adColors.greyTextColor,
                                  ),
                                  border: InputBorder.none,
                                  suffixIconConstraints: BoxConstraints(
                                    minHeight: context.k_16,
                                    minWidth: context.k_16,
                                  ),
                                  suffixIcon: (widget.svgIcon != null)
                                      ? SvgPicture.asset(
                                          widget.svgIcon ?? '',
                                          color: context
                                              .adColors.darkGreyTextColor,
                                          fit: BoxFit.fitWidth,
                                        ).paddingBySide(right: context.k_17)
                                      : Icon(
                                          widget.icon ??
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                          color: widget.iconColor ??
                                              context
                                                  .adColors.darkGreyTextColor,
                                        ).paddingBySide(right: context.k_15),
                                ),
                              ),
                            ),
                            if (widget.isDropDownNearTitle) const Spacer(),
                            if (widget.showDivider)
                              Container(
                                margin: EdgeInsets.only(
                                  // left: context.k_4,
                                  top: context.k_10,
                                  bottom: context.k_10,
                                ),
                                width: 1,
                                color: context.adColors.greyReviewShade,
                              ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: widget.errorMsg ?? emptyNofifyer,
            child: const ADSizedBox(),
            builder: (context, String value, child) => (value != '')
                ? Text(
                    value,
                    style: ADTextStyle400.size12.setTextColor(
                      errorColor,
                    ),
                  ).paddingBySide(top: context.k_4)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
