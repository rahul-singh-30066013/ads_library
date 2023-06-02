/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is created as component for Text Field. Here we provides
/// lot of customized options cross icon for to clear text field.
///
/// And, we also handle error messages those use this class return error message
/// widget for showing message for user.
class ADDutyFreeEditableDefaultText extends StatefulWidget {
  const ADDutyFreeEditableDefaultText({Key? key, required this.componentData})
      : super(key: key);

  /// this is an use for action perform on edittext
  final ADEditableTextModel componentData;

  @override
  State<ADDutyFreeEditableDefaultText> createState() =>
      _ADDutyFreeEditableDefaultTextState();
}

class _ADDutyFreeEditableDefaultTextState
    extends State<ADDutyFreeEditableDefaultText> {
  bool _isActive = false;
  bool showIcon = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      showIcon = _focusNode.hasFocus;
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
    final double defaultEditableTextHeight = 60.sp;
    final double defaultEditableTextHeightForMaxLine = 100.sp;
    const int maxLine = 6;
    // const int colorValue = 100;
    const double activeNumber = 1;
    const int textLength = 10;

    /// TODO colour will be implement in style guide
    const int colourValue = 0xffFCFCFC;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: context.k_16, right: context.k_8),
          height: widget.componentData.maxLines == maxLine
              ? defaultEditableTextHeightForMaxLine
              : defaultEditableTextHeight,
          decoration: BoxDecoration(
            color: widget.componentData.enable
                ? context.adColors.whiteTextColor
                : const Color(colourValue),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: _borderColor(),
              width: _isActive ? activeNumber : 1,
            ),
          ),
          child: Align(
            child: TextField(
              key: widget.componentData.key,
              enabled: widget.componentData.enable,
              controller: widget.componentData.controller,
              keyboardType: widget.componentData.keyBoardType,
              textInputAction: widget.componentData.textInputAction,
              minLines: widget.componentData.minLines,
              maxLines: widget.componentData.maxLines,
              readOnly: widget.componentData.readonly,
              autofocus: widget.componentData.autoFocus ?? false,
              focusNode: _focusNode,
              textCapitalization: widget.componentData.textCapitalization ??
                  TextCapitalization.none,
              onTap: () => setState(() {
                _isActive = true;
                widget.componentData.onTap?.call();
              }),
              onChanged: (value) => setState(() {
                widget.componentData.text = value;
                widget.componentData.onChange();
                showIcon = value.isNotEmpty;
                widget.componentData.errorMsgWidget = null;
              }),
              maxLength: widget.componentData.length,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                // contentPadding: const EdgeInsets.symmetric(vertical: 5),
                labelText: widget.componentData.placeHolder,
                labelStyle: ADTextStyle400.size16.copyWith(
                  color: _isActive && widget.componentData.errorMessage != null
                      ? ADColors.red
                      : _isActive
                          ? widget.componentData.focusedBorderColor
                          : widget.componentData.errorMsgWidget == null
                              ? context.adColors.textFieldBorderGrey
                              : ADColors.red,
                ),
                suffixIcon: Visibility(
                  visible: showIcon,
                  child: widget.componentData.isImageRequired ?? false
                      ? InkWell(
                          onTap: widget.componentData.text?.length == textLength
                              ? () => setState(() {
                                    widget.componentData.imageTapped?.call();
                                  })
                              : null, // handle your image tap here
                          child: _ReturnInkWell(
                            componentData: widget.componentData,
                          ),
                        ).paddingBySide(right: context.k_12)
                      : _ReturnIconButton(
                          componentData: widget.componentData,
                        ),
                ),
              ),
              cursorColor: widget.componentData.cursorColor,
              style: widget.componentData.style,
              inputFormatters: widget.componentData.inputFormatters,
              onSubmitted: widget.componentData.onSubmitted ??
                  (value) => widget.componentData.textInputAction ==
                          TextInputAction.next
                      ? FocusScope.of(context).nextFocus()
                      : FocusScope.of(context).unfocus(),
            ),
          ),
        ),
        SizedBox(
          height: context.k_4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: widget.componentData.errorMsgWidget ?? const SizedBox.shrink(),
        ),
      ],
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

class _ReturnIconButton extends StatelessWidget {
  const _ReturnIconButton({Key? key, required this.componentData})
      : super(key: key);
  final ADEditableTextModel componentData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        componentData.controller.clear(),
        componentData.isHideCrossIcon = false,
        componentData.onClearTextAction,
        componentData.errorMsgWidget = null,
        componentData.onChange(),
      },
      icon: componentData.isHideCrossIcon
          ? const SizedBox.shrink()
          : componentData.controller.text != ''
              ? const Icon(Icons.close)
              : const SizedBox.shrink(),
      color: context.adColors.greyTextColor,
    ); //.paddingBySide(right: context.k_8);
  }
}

class _ReturnInkWell extends StatelessWidget {
  const _ReturnInkWell({Key? key, required this.componentData})
      : super(key: key);
  final ADEditableTextModel componentData;
  static const int textLength = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: componentData.text?.length == textLength
            ? componentData.focusedBorderColor
            : context.adColors.greyTextColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      width: context.k_24,
      height: context.k_24,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: const Align(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
