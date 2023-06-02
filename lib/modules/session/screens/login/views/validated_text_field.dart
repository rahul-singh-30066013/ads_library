/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: must_be_immutable

import 'package:adani_airport_mobile/modules/session/screens/login/views/custom_scrollbar.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Dynamic Text field Widget for Mobile Number and Pasword
class ValidatedTextField extends StatefulWidget {
  ValidatedTextField({
    Key? key,
    this.validation,
    required this.notifyParent,
    required this.type,
    this.obsecureText = false,
    this.fieldKey,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.textLength,
    this.textInputAction,
    this.textFieldHeight,
    this.prefixWidget,
    this.formatters,
    this.textStyle,
    this.onSubmitted,
    this.hintText,
    this.readOnly,
    this.autoFocusOnly,
    this.maxLine,
    this.isDisabled = false,
    this.onEditingComplete,
    this.isFromLogin = false,
    this.asyncValidation,
    this.isoCode,
    this.showScrollBar = false,
    this.minLines,
    this.focus,
    this.error = '',
    this.nextFocus,
  }) : super(key: key);

  /// Final variables getting form previous widget
  final Key? fieldKey;
  final TextEditingController controller;
  final bool obsecureText;
  final TextInputType keyboardType;
  final void Function(bool)? notifyParent;
  final void Function()? onEditingComplete;
  final String? type;
  final int? textLength;
  final Widget? prefixWidget;
  final double? textFieldHeight;
  final TextInputAction? textInputAction;
  final String? Function(String? value, BuildContext context)? validation;
  final List<TextInputFormatter>? formatters;
  final TextStyle? textStyle;
  final Function(String)? onSubmitted;
  final String? hintText;
  final bool? readOnly;
  final bool? autoFocusOnly;
  final int? maxLine;
  final bool isDisabled;
  final bool showScrollBar;
  final int? minLines;
  final FocusNode? focus;
  String? error;
  final FocusNode? nextFocus;

  /// checks if widget is on login screen
  final bool isFromLogin;

  final Future<String?>? Function(
    String? value,
    String isoCode,
    BuildContext context,
  )? asyncValidation;

  final String? isoCode;

  // final GlobalKey<FormState> _formKey;
  @override
  State<ValidatedTextField> createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  bool _obsecure = false;
  final int defaultTextLength = 40;

  /// checking current text field validation
  static const Color errorColor = Color(0xffef645a);

  /// For show or hide password

  /// max line of text Field
  final int defaultMaxLine = 1;
  final int defaultMinLine = 1;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.focus?.removeListener(_onFocusChange);
    widget.focus?.addListener(_onFocusChange);
    _obsecure = widget.obsecureText;
  }

  @override
  void dispose() {
    super.dispose();
    widget.focus?.removeListener(_onFocusChange);
    isCloseVisible.dispose();
  }

  void _onFocusChange() {
    // setState(() => null);
    setState(() {
      adLog('Focus: ${widget.focus?.hasFocus.toString()}');
    });
  }

  ValueNotifier<bool> isCloseVisible = ValueNotifier(false);

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (widget.focus != null) {
      focusNode = widget.focus ?? FocusNode();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (widget.textFieldHeight == null)
              ? (widget.showScrollBar)
                  ? null
                  : context.k_60
              : widget.textFieldHeight,
          padding: widget.isDisabled
              ? EdgeInsets.only(left: context.k_16)
              : EdgeInsets.symmetric(horizontal: context.k_16),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isDisabled
                  ? context.adColors.tileBorderColor
                  : ((widget.focus?.hasFocus ?? false) || isCloseVisible.value)
                      ? context.adColors.blackColor
                      : widget.error.validateWithDefaultValue().isEmpty
                          ? context.adColors.greyReviewShade
                          : errorColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(context.k_8),
            ),
          ),
          child: Row(
            children: [
              widget.prefixWidget ?? const ADSizedBox(),
              Flexible(
                child: CustomScrollBar(
                  controller: _scrollController,
                  showScrollBar: widget.showScrollBar,
                  child: Focus(
                    onFocusChange: (value) => {
                      setState(() {
                        isCloseVisible.value = value;
                      }),
                    },
                    child: TextFormField(
                      readOnly: widget.readOnly ?? false,
                      keyboardType: widget.keyboardType,
                      textAlignVertical: TextAlignVertical.top,
                      cursorColor: context.adColors.blackTextColor,
                      controller: widget.controller,
                      scrollController: _scrollController,
                      autofocus: widget.autoFocusOnly ?? false,

                      //      validator: (value) => validator(value, context),
                      // onEditingComplete: () =>
                      //     widget.onEditingComplete ??
                      //     FocusScope.of(context).nextFocus(),
                      // onSubmitted: widget.onSubmitted ??
                      //     (_) => FocusScope.of(context).nextFocus(),
                      key: widget.fieldKey,
                      onFieldSubmitted: (_) => {
                        fieldFocusChange(
                          context,
                          widget.focus,
                          widget.nextFocus,
                        ),
                      },
                      textCapitalization: TextCapitalization.words,
                      textInputAction: (widget.textInputAction != null)
                          ? widget.textInputAction
                          : TextInputAction.next,
                      // onFieldSubmitted: (_) =>
                      //     FocusScope.of(context).nextFocus(),
                      maxLines: widget.maxLine ?? defaultMaxLine,
                      minLines: widget.minLines ?? defaultMinLine,
                      maxLength: widget.textLength ?? defaultTextLength,
                      validator: (value) =>
                          validateTextFieldD(value.toString(), context),
                      onChanged: (value) => validateTextField(
                        value,
                        context,
                        isoCode: widget.isoCode,
                      ),

                      inputFormatters: widget.formatters,
                      focusNode: widget.focus,
                      obscureText: _obsecure,
                      style: widget.textStyle ??
                          ADTextStyle500.size16
                              .setTextColor(context.adColors.blackTextColor),
                      decoration: InputDecoration(
                        /// TODO : add color in color constant for error text
                        counterText: '',
                        errorMaxLines: 1,
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                          height: 0,
                        ),
                        hintText: widget.hintText ?? '',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        // floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: widget.isFromLogin ? null : widget.type,

                        labelStyle: widget.isDisabled
                            ? ADTextStyle400.size16
                                .setTextColor(context.adColors.greyReviewShade)
                            : ADTextStyle400.size16
                                .setTextColor(context.adColors.greyTextColor),
                        hintStyle: ADTextStyle400.size16
                            .setTextColor(context.adColors.greyTextColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              if (isCloseVisible.value && widget.controller.text.isNotEmpty)
                ValueListenableBuilder(
                  valueListenable: isCloseVisible,
                  builder: (context, bool value, child) =>
                      value && widget.controller.text.isNotEmpty
                          ? IconButton(
                              splashRadius: context.k_22,
                              color: context.adColors.darkGreyTextColor,
                              padding: EdgeInsets.zero,
                              //only(left: context.k_10), // all(context.k_2),
                              constraints: const BoxConstraints(),
                              onPressed: () => setState(() {
                                widget.controller.clear();
                                widget.error = '';
                                // if (widget.notifyParent != null) {
                                widget.notifyParent?.call(false);
                                // }
                              }),
                              icon: Icon(
                                Icons.close,
                                color: context.adColors.darkGreyTextColor,
                                size: context.k_20,
                              ),
                            )
                          : const ADSizedBox.shrink(),
                ),
              if (widget.obsecureText)
                IconButton(
                  color: context.adColors.darkGreyTextColor,
                  padding: EdgeInsets.all(context.k_2),
                  splashRadius: context.k_22,
                  constraints: const BoxConstraints(),
                  onPressed: () => setState(() {
                    _obsecure = !_obsecure;
                  }),
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: context.adColors.darkGreyTextColor,
                  ),
                ),
            ],
          ),
        ),
        if (widget.error.validateWithDefaultValue().isNotEmpty &&
            !widget.isFromLogin)
          Text(
            widget.error ?? '',
            style: ADTextStyle400.size12.setTextColor(
              errorColor,
            ),
          ).paddingBySide(top: context.k_4),
      ],
    );
  }

  void fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus,) {
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  String? validateTextFieldD(String value, BuildContext context) {
    widget.error =
        widget.validation?.call(value, context); //returnError(value);

    setState(() {
      widget.notifyParent?.call(widget.error == null);
    });
    widget.focus?.requestFocus();

    return (widget.error?.isNotEmpty ?? false) ? '' : null;
  }

  Future<String?> validateTextField(
    String value,
    BuildContext context, {
    String? isoCode,
  }) async {
    isCloseVisible.value = true;
    // if (widget.validation != null) {
    widget.error = widget.asyncValidation != null
        ? await widget.asyncValidation?.call(value, isoCode ?? 'IN', context)
        : widget.validation?.call(value, context);

    setState(() {
      /// checking current textfeild validation through error response
      // widget.notifyParent(_error == null);
      // if (widget.notifyParent != null) {
      widget.notifyParent?.call(widget.error == null);
      // }
    });
    return widget.error;
  }
}
