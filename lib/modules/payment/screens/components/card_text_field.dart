/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// Textfield box for credit/debit card details input.
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class CardTextField extends StatefulWidget {
  // Hint text for the textfield.
  final String hintText;

  // (optional) Icon to be shown at the right end of the textfield.
  final Widget suffixIcon;

  // type of text for the textfield, i.e, number-only, alpha-numeric, etc.
  final TextInputType textInputType;

  // controller for the textfield.
  final TextEditingController controller;

  // formatting for textfield validations
  final List<TextInputFormatter> inputFormatter;

  final Function(String value) onChangeImpl;

  final bool mask;

  final String? errorText;

  final String? regex;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  final Function(String)? onSubmitted;

  final String? Function(String? value)? validation;

  final bool? enableInteractiveSelection;

  const CardTextField({
    Key? key,
    required this.hintText,
    required this.mask,
    this.suffixIcon = const SizedBox(),
    required this.controller,
    this.textInputType = TextInputType.number,
    this.inputFormatter = const <TextInputFormatter>[],
    required this.onChangeImpl,
    this.errorText,
    this.regex,
    this.textInputAction,
    this.focusNode,
    this.onSubmitted,
    this.validation,
    this.enableInteractiveSelection,
  }) : super(key: key);

  @override
  State<CardTextField> createState() => _CardTextFieldState();
}

class _CardTextFieldState extends State<CardTextField> {
  static const Color errorColor = Color(0xffef645a);

  String? errorMessage;

  void _onChangeImp(String value) {
    context.read<PaymentMethodState>().setExpandableValue(value: false);
    // setState(() {
    //   final _regex = widget.regex ?? '';
    //   if (_regex.isNotEmpty) {
    //     widget.errorText = RegExp(_regex).hasMatch(
    //       value.replaceAll(RegExp(r'\s+\b|\b\s'), ''),
    //     )
    //         ? null
    //         : widget.errorText;
    //   }
    //   final val = widget.onChangeImpl(value);
    //   adLog(val);
    //   print('controller value-->> ${widget.controller.text}');
    // });
    final errorString = widget.validation?.call(value);
    if (errorString != null) {
      setState(() {
        errorMessage = errorString;
      });
    } else {
      setState(() {
        errorMessage = null;
      });
    }
    // final val = widget.onChangeImpl(value);
    // adLog(val);
  }

  String? validateTextField(String value) {
    context.read<PaymentMethodState>().setExpandableValue(value: false);
    final errorString = widget.validation?.call(value);
    if (errorString != null) {
      setState(() {
        errorMessage = errorString;
      });
      return '';
    } else {
      // widget.errorText = null;
      return null;
    }
  }

//  final FocusNode _focusNode = FocusNode();

  bool _isActive = false;

  void _onFocusChange() {
    setState(() {
      _isActive = widget.focusNode?.hasFocus ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode
      ?..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    valueUpdateAccordingToExpand();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
            border: Border.all(
              color: _isActive && errorMessage == null
                  ? context.adColors.blackColor
                  : errorMessage == null
                      ? context.adColors.greyReviewShade
                      : errorColor,
            ),
          ),
          height: context.k_60,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: context.k_60,
                  child: Center(
                    child: TextFormField(
                      enableInteractiveSelection:
                          widget.enableInteractiveSelection ?? false,
                      cursorColor: context.adColors.blackTextColor,
                      controller: widget.controller,
                      obscureText: widget.mask,
                      keyboardType: widget.textInputType,
                      inputFormatters: widget.inputFormatter,
                      textInputAction: widget.textInputAction,
                      focusNode: widget.focusNode,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        // hintText: hintText,
                        labelText: widget.hintText,
                        labelStyle: ADTextStyle400.size16.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                        errorStyle: const TextStyle(
                          height: 0,
                        ),
                        errorText: '',
                      ),
                      onChanged: (value) => _onChangeImp(value),
                      validator: (value) => validateTextField(value.toString()),
                      onFieldSubmitted: widget.onSubmitted,
                      style: ADTextStyle500.size16,
                    ).paddingBySide(
                      left: context.k_16,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.suffixIcon,
                ],
              ).paddingBySide(right: context.k_16),
            ],
          ),
        ),
        SizedBox(
          height: context.k_2,
        ),
        // if (widget.regex != null &&
        //     widget.controller.text.isNotEmpty &&
        //     widget.errorText != null)
        Text(
          errorMessage ?? '',
          style: ADTextStyle400.size12.setTextColor(
            errorColor,
          ),
        ).paddingBySide(top: context.k_4, left: context.k_6),
      ],
    );
  }

  Future<void> valueUpdateAccordingToExpand() async {
    if (context.read<PaymentMethodState>().isExpandable ?? false) {
      setState(() {
        errorMessage = null;
      });
      // context.read<PaymentMethodState>().setExpandableValue(value: false);
    }
  }
}
