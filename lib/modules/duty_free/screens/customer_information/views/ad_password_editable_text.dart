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

/// This class is created as component for Password Text Field. Here we provides
/// lot of customized options like eye button to visible and invisible password
/// and cross icon for to clear text field.
///
/// And, we also handle error messages those use this class return error message
/// widget for showing message for user.
class ADPasswordEditableText extends StatefulWidget {
  const ADPasswordEditableText({Key? key, required this.componentData})
      : super(key: key);

  final ADEditableTextModel componentData;

  @override
  State<ADPasswordEditableText> createState() => _ADPasswordEditableTextState();
}

class _ADPasswordEditableTextState extends State<ADPasswordEditableText> {
  bool _isPasswordHidden = true;
  bool _isActive = false;
  bool showIcon = false;
  final FocusNode _focusNode = FocusNode();

  final double defaultEditableTextHeight = 60;
  final double defaultEditableTextHeightForMaxLine = 100.sp;
  int colorValue = 100;
  double activeNumber = 1;

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
    return Column(
      children: [
        Container(
          height: context.scaled(defaultEditableTextHeight),
          decoration: BoxDecoration(
            color: widget.componentData.errorMsgWidget == null
                ? ADColors.white
                : ADColors.red[colorValue],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: _borderColor(),
              width: _isActive ? activeNumber : 1,
            ),
          ),
          child: Align(
            child: TextField(
              enabled: widget.componentData.enable,
              controller: widget.componentData.controller,
              keyboardType: widget.componentData.keyBoardType,
              textInputAction: widget.componentData.textInputAction,
              obscuringCharacter: '*',
              focusNode: _focusNode,
              onChanged: (value) => {
                widget.componentData.text = value,
                if (widget.componentData.text != null)
                  {widget.componentData.errorMsgWidget = null},
                widget.componentData.onChange(),
              },
              obscureText: _isPasswordHidden,
              maxLength: widget.componentData.length,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                labelText: widget.componentData.placeHolder,
                labelStyle: ADTextStyle400.size16.copyWith(
                  color: _isActive
                      ? widget.componentData.focusedBorderColor
                      : widget.componentData.errorMsgWidget == null
                          ? context.adColors.greyTextColor
                          : ADColors.red,
                ),
                suffixIcon: showIcon
                    ? Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // added line
                          mainAxisSize: MainAxisSize.min,
                          children: _getIconButton(context),
                        ).paddingBySide(right: context.k_8),
                      )
                    : null,
              ),
              cursorColor: widget.componentData.cursorColor,
              style: widget.componentData.style ?? ADTextStyle500.size16,
              onSubmitted: widget.componentData.onSubmitted,
            ).paddingBySide(left: context.k_16),
          ),
        ),
        SizedBox(
          height: context.k_4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: widget.componentData.errorMsgWidget != null
              ? widget.componentData.errorMsgWidget ?? const SizedBox.shrink()
              : const SizedBox.shrink(),
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
      return widget.componentData.defaultBorderColor;
    }
  }

  List<Widget> _getIconButton(BuildContext context) {
    final List<Widget> arrWidgets = <Widget>[];
    const int lengthOfLoop = 2;
    for (int initial = 0; initial < lengthOfLoop; initial++) {
      arrWidgets.add(
        IconButton(
          onPressed: () => _onPressActionHandling(initial),
          icon: _setIcon(initial),
          color: context.adColors.greyTextColor,
        ),
      );
    }
    return arrWidgets;
  }

  void _onPressActionHandling(int index) {
    if (index == 0) {
      widget.componentData.controller.clear();
      widget.componentData.isHideCrossIcon = false;
      widget.componentData.onClearTextAction();
    } else {
      setState(() {
        _isPasswordHidden = !_isPasswordHidden;
      });
    }
  }

  Widget _setIcon(int index) {
    return index == 0
        ? _isTextNotNull(widget.componentData.controller.text)
            ? const Icon(Icons.close)
            : const SizedBox.shrink()
        : _isTextNotNull(widget.componentData.controller.text)
            ? IconFromAsset(
                iconPath: _isPasswordHidden
                    ? 'lib/assets/images/svg/icons/more/closeeye.svg'
                    : 'lib/assets/images/svg/icons/more/openeye.svg',
                height: context.k_20,
                width: context.k_20,
              )
            : const SizedBox.shrink();
  }

  bool _isTextNotNull(String? text) {
    return text != '';
  }
}

class IconFromAsset extends StatelessWidget {
  ///Using this constructor we can get the icon from assets.
  ///*[iconPath] complete path from assets
  ///*[selectedColor] color code to update color of icon if needed
  const IconFromAsset({
    Key? key,
    this.iconPath,
    this.selectedColor,
    this.width,
    this.height,
  }) : super(key: key);
  final String? iconPath;
  final Color? selectedColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.scaled(width ?? context.k_30),
      height: context.scaled(height ?? context.k_30),
      child: SvgPicture.asset(
        iconPath ?? '',
        color: selectedColor,
      ),
    );
  }
}
