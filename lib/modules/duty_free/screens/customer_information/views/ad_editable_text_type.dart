/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/ad_duty_free_editable_default_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_text_with_text_button_editable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';

/// [ADEditableTextType] enum for choosing which type of editable text component use.
enum ADEditableTextType {
  defaultTextField,
  dutyFreeDefaultTextField,
  textButtonTextField,
  passwordTextField,
}

/// [ADEditableTextModel] is use for communicating between component class and component using class.
/// That is its use for data share between them.
///
///
/// [placeHolder], variable is taking textField placeholder text.
///
/// [errorMsgWidget], provides TextField validation message.
///
/// [controller], represents TextField controller.
///
/// [type], which type of TextField is use, All TextField List enum is [ADEditableTextType].
///
/// [regex], if TextField validate with some regular expression. Then, pass regex value.
///
/// [text], TextField value.
///
/// [isImageRequired] iif you want to show thw suffix image in the end.
///
/// [keyBoardType] if TextField use different keyboard style. Then, pass Keyboard Type.
///
/// [autoFocus] for focus on TextField.
///
/// [textButtonAction], [onClearTextAction] action for text button to customize onPressed Action.
///
/// [textInputAction], for customize TextField return key.
///
/// Maintain TextField border color using listed variables [defaultBorderColor], [focusedBorderColor] and [errorMessageColor].
///
/// [style], for setting TextField style.
///
/// [cursorColor], for setting cursor color.
///
/// [textButtonLabel], for change text in text button label. This is key from localized File.
///
/// [length], textField length.
///
/// [ADEditableText] is a class for painting editable text on required screen.
/// example:
///         var objADEditableText = ADEditableText()
///         objADEditableText(ADEditableTextModel(
///         keyBoardType: TextInputType.number,
///         placeHolder: 'Customer ID',
///         controller: _txtCustomerId,
///         type: ADEditableTextType.isClearIconwithClearText,
///         onChange: () => setState(() {
///               if (objADEditableText.text != null) {
///                 objADEditableText.errorMsg = null;
///               }}),
///         clearText: () => setState(() {
///               objADEditableText.controller.clear();
///               objADEditableText.text = null;
///             }));

class ADEditableTextModel {
  static const maxTextLength = 255;

  ///Add: one liner documentation
  String placeHolder;
  Widget? errorMsgWidget;
  TextEditingController controller;
  ADEditableTextType type;
  String? regex;
  String? text;
  String? textButtonLabel;
  TextInputType? keyBoardType;
  bool? isImageRequired;
  int? index;
  bool? autoFocus;
  List<TextInputFormatter>? inputFormatters;
  VoidCallback onChange;
  VoidCallback? textButtonAction;
  VoidCallback onClearTextAction;
  VoidCallback? imageTapped;
  TextInputAction? textInputAction;
  Color focusedBorderColor;
  Color defaultBorderColor;
  Color errorMessageColor;
  TextStyle? style;
  Color? cursorColor;
  int length;
  bool isHideCrossIcon;
  bool enable;
  Function(String)? onSubmitted;
  VoidCallback? onTap;
  bool readonly;
  bool? isActive;
  int? maxLines;
  int? minLines;
  IconData? icon;
  Key? key;
  TextCapitalization? textCapitalization;
  final Widget? prefixWidget;
  bool? postIcon;
  String? errorMessage;
  String? Function(String? value)? validation;
  String? svgAssets;
  String? verifyText;
  Widget? svgIcon;
  String? selectedCountryCode;
  GlobalKey? globalKey = GlobalKey();
  final Future<String?>? Function(
    String? value,
    String? isoCode,
  )? asyncValidation;

  FocusNode? focusNode;

  ADEditableTextModel({
    this.errorMsgWidget,
    this.regex,
    this.text,
    this.keyBoardType,
    required this.placeHolder,
    required this.controller,
    required this.type,
    required this.onChange,
    this.imageTapped,
    this.textButtonAction,
    required this.onClearTextAction,
    this.isImageRequired = false,
    this.autoFocus,
    this.textInputAction,
    this.focusedBorderColor = ADColors.black,
    this.defaultBorderColor = ADColors.grey,
    this.errorMessageColor = ADColors.red,
    this.style,
    this.cursorColor = const Color(0xff222222),
    this.inputFormatters,
    this.textButtonLabel,
    this.length = maxTextLength,
    this.isHideCrossIcon = false,
    this.enable = true,
    this.onSubmitted,
    this.onTap,
    required this.readonly,
    this.isActive,
    this.maxLines = 1,
    this.minLines = 1,
    this.icon,
    this.key,
    this.textCapitalization,
    this.prefixWidget,
    this.postIcon,
    this.errorMessage,
    this.validation,
    this.svgAssets,
    this.verifyText,
    this.svgIcon,
    this.asyncValidation,
    this.selectedCountryCode,
    this.focusNode,
    this.globalKey,
  });

  factory ADEditableTextModel.defaultValue() {
    return ADEditableTextModel(
      placeHolder: '',
      controller: TextEditingController(),
      type: ADEditableTextType.defaultTextField,
      onChange: () => {},
      onClearTextAction: () => {},
      readonly: false,
    );
  }
}

class ADEditableText extends StatelessWidget {
  final ADEditableTextModel componentData;

  const ADEditableText({Key? key, required this.componentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (componentData.type) {
      case ADEditableTextType.passwordTextField:
        return ADPasswordEditableText(componentData: componentData);
      case ADEditableTextType.textButtonTextField:
        return ADTextWithTextButtonEditableText(componentData: componentData);
      case ADEditableTextType.defaultTextField:
        return ADDefaultEditableText(componentData: componentData);
      case ADEditableTextType.dutyFreeDefaultTextField:
        return ADDutyFreeEditableDefaultText(componentData: componentData);
    }
  }
}
