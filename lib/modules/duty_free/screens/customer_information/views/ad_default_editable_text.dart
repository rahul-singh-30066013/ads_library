/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class is created as component for Text Field. Here we provides
/// lot of customized options cross icon for to clear text field.
///
/// And, we also handle error messages those use this class return error message
/// widget for showing message for user.
class ADDefaultEditableText extends StatefulWidget {
  const ADDefaultEditableText({
    Key? key,
    required this.componentData,
    this.prefixWidget,
    this.onTap,
    this.nextFocus,
    this.iconWidth,
    this.iconHeight,
    this.selectedCountryCode,
    this.iconColour,
    this.styleChange,
    this.selectedTitle,
    this.onTapHandler,
    this.classFrom = 'other',
    this.needLocalize,
    this.placeHolderValue,
    this.isLoadedEnable,
  }) : super(key: key);

  /// this is an use for action perform on edittext
  final ADEditableTextModel componentData;
  final Widget? prefixWidget;
  final Function(String)? nextFocus;
  final void Function()? onTap;
  final double? iconHeight;
  final double? iconWidth;
  final String? selectedCountryCode;
  final Color? iconColour;
  final bool? styleChange;
  final String? selectedTitle;
  final String? classFrom;
  final ADTapCallback? onTapHandler;
  final bool? needLocalize;
  final String? placeHolderValue;
  final bool? isLoadedEnable;

  @override
  State<ADDefaultEditableText> createState() => _ADDefaultEditableTextState();
}

class _ADDefaultEditableTextState extends State<ADDefaultEditableText> {
  bool _isActive = false;
  bool showIcon = false;

  // final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  String? _error;

  static const Color errorColor = Color(0xffef645a);

  @override
  void initState() {
    super.initState();
    widget.componentData.focusNode?.addListener(_onFocusChange);
  }

//enable it when require validation for first name with"please_select_salutation"
  Future<void> updateErrorMsgWhenTitleSelected() async {
    if (widget.selectedTitle != null &&
        (widget.componentData.placeHolder == 'first_name' ||
            widget.componentData.placeHolder == 'first_name_middle_name') &&
        widget.componentData.controller.value.text.trim().length > 1) {
      final dataUpdated = validateTextFieldOnChange(widget.selectedTitle ?? '');
      adLog(dataUpdated.toString());
    }
  }

  Future<void> updateErrorMsgWhenTitleSelectedDate() async {
    if (widget.componentData.placeHolder == 'date_of_birth' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'nationality' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'issued_country_name' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'issue_date' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'city' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'state' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'expiry_date' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'country' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'country' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'state' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == 'city' &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == widget.placeHolderValue &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    } else if (widget.componentData.placeHolder == widget.placeHolderValue &&
        widget.componentData.controller.value.text.length > 1) {
      final dataUpdated =
          validateTextFieldOnChange(widget.componentData.controller.value.text);
      adLog(dataUpdated.toString());
    }
  }

  void _onFocusChange() {
    setState(() {
      showIcon = widget.componentData.focusNode?.hasFocus ?? false;
      _isActive = widget.componentData.focusNode?.hasFocus ?? false;
    });
  }

  @override
  void dispose() {
    widget.componentData.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //enable it when require validation for first name with"please_select_salutation"
    /*WidgetsBinding.instance
        ?.addPostFrameCallback((_) => updateErrorMsgWhenTitleSelected());*/
    // WidgetsBinding.instance
    //     ?.addPostFrameCallback((_) => updateErrorMsgWhenTitleSelectedDate());
    updateErrorMsgWhenTitleSelected();
    updateErrorMsgWhenTitleSelectedDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          key: widget.componentData.globalKey,
          height: context.k_60,
          padding: EdgeInsets.only(left: context.k_16, right: context.k_4),
          decoration: BoxDecoration(
            border: Border.all(
              color: (widget.componentData.focusNode?.hasFocus ?? false) &&
                      _error == null
                  ? context.adColors.blackColor
                  : _error == null
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
              Expanded(
                child: Focus(
                  onFocusChange: (focusValue) =>
                      textFieldOnScroll(focusValue: focusValue),
                  child: TextFormField(
                    key: widget.componentData.key,
                    enabled: widget.componentData.enable,
                    scrollController: _scrollController,
                    controller: widget.componentData.controller,
                    keyboardType: widget.componentData.keyBoardType,
                    textInputAction: widget.componentData.textInputAction,
                    minLines: widget.componentData.minLines,
                    maxLines: widget.componentData.maxLines,
                    readOnly: widget.componentData.readonly,
                    autofocus: widget.componentData.autoFocus ?? false,
                    focusNode: widget.componentData.focusNode,
                    smartQuotesType: SmartQuotesType.disabled,
                    validator: (value) => validateTextField(
                      value.toString(),
                    ),
                    textCapitalization:
                        widget.componentData.textCapitalization ??
                            TextCapitalization.none,
                    onTap: () => validateForOnTap(),
                    //     setState(() {
                    //   // _isActive = true;
                    //    widget.componentData.onTap?.call();
                    // }),
                    onChanged: (value) =>
                        validateTextFieldOnChange(value.toString()),
                    //     setState(() {
                    //   widget.componentData.text = value;
                    //   widget.componentData.onChange();
                    //   showIcon = value.isNotEmpty;
                    //   widget.componentData.errorMsgWidget = null;
                    // }),

                    maxLength: widget.componentData.length,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      // contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      labelText: (widget.needLocalize ?? true)
                          ? widget.componentData.placeHolder.localize(context)
                          : widget.componentData.placeHolder,
                      labelStyle: widget.styleChange ?? false
                          ? ADTextStyle500.size16.setTextColor(
                              context.adColors.greyReviewShade,
                            )
                          : ADTextStyle400.size16.copyWith(
                              color: _isActive
                                  ? widget.componentData.focusedBorderColor
                                  : widget.componentData.errorMsgWidget == null
                                      ? context.adColors.darkGreyTextColor
                                      : ADColors.red,
                            ),
                      suffixIcon: !(widget.isLoadedEnable ?? false)
                          ? widget.componentData.verifyText == null
                              ? widget.componentData.svgAssets?.isNotEmpty ??
                                      false
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: context.k_14,
                                        bottom: context.k_14,
                                        left: context.k_20,
                                      ),
                                      child: SvgPicture.asset(
                                        widget.componentData.svgAssets ?? '',
                                        height: widget.iconHeight,
                                        width: widget.iconWidth,
                                        color: widget.iconColour ??
                                            context.adColors.darkGreyTextColor,
                                      ),
                                    )
                                  : _isActive &&
                                          widget.componentData.controller.text
                                              .isNotEmpty
                                      ? IconButton(
                                          splashRadius: context.k_22,
                                          color: context
                                              .adColors.greyChartTextColor,
                                          padding: EdgeInsets.all(context.k_2),
                                          constraints: const BoxConstraints(),
                                          onPressed: () => setState(() {
                                            widget.componentData.controller
                                                .clear();
                                            widget.componentData.onChange
                                                .call();
                                          }),
                                          icon: const Icon(Icons.close),
                                        )
                                      : const SizedBox()
                              : Visibility(
                                  visible: _error == null &&
                                      widget.componentData.controller.text
                                          .isNotEmpty,
                                  child: InkWell(
                                    onTap: () => widget.onTapHandler?.call(),
                                    child: Text(
                                      (widget.componentData.verifyText ?? '')
                                          .localize(context),
                                      style: ADTextStyle400.size14
                                          .setTextColor(context.adColors.black)
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ).paddingBySide(right: context.k_10),
                                  ).paddingBySide(
                                    top: context.k_14,
                                  ),
                                )
                          : ADDotProgressView(
                              color: context.adColors.black,
                              size: context.k_6,
                            ),
                      errorStyle: const TextStyle(
                        height: 0,
                      ),
                      errorText: '',
                    ),

                    cursorColor: widget.componentData.cursorColor,
                    style: widget.styleChange ?? false
                        ? ADTextStyle500.size16.setTextColor(
                            context.adColors.greyReviewShade,
                          )
                        : widget.componentData.style,
                    inputFormatters: widget.componentData.inputFormatters,
                    onFieldSubmitted: widget.nextFocus,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.k_4,
        ),
        if (_error.validateWithDefaultValue().isNotEmpty)
          Text(
            (widget.needLocalize ?? true)
                ? _error?.localize(context) ?? ''
                : _error ?? '',
            style: ADTextStyle400.size12.setTextColor(
              errorColor,
            ),
          ).paddingBySide(top: context.k_4),
      ],
    );
  }

  void textFieldOnScroll({required bool focusValue}) {
    {
      if (widget.componentData.placeHolder == 'first_name' ||
          widget.componentData.placeHolder == 'first_name_middle_name') {
        if (focusValue) {
          widget.componentData.controller.selection =
              TextSelection.fromPosition(
            TextPosition(
              offset: widget.componentData.controller.text.length,
            ),
          );
        } else {
          _scrollController.jumpTo(
            0,
            // duration: const Duration(seconds: 1),
            // curve: Curves.bounceIn,
          );
        }
      }
    }
  }

  void validateForOnTap() {
    widget.onTap?.call();
    // updateErrorMsgWhenTitleSelectedDate();
    //  final errorString = widget.componentData.validation
    //      ?.call(widget.componentData.controller.text);
    //  if (errorString != null) {
    //    setState(() {
    //      _error = errorString;
    //    });
    //  } else {
    //    _error = null;
    //  }
  }

  // String? validateTextFieldD(String value) {
  //   setState(() {
  //     _error =
  //         widget.componentData.validation?.call(value); //returnError(value);
  //   });
  //   return _error;
  // }

  String? validateTextField(String value) {
    //   updateErrorMsgWhenTitleSelectedDate();
    final errorString = widget.componentData.validation?.call(value);
    updateErrorMsgWhenTitleSelected();
    if (errorString != null) {
      // Scrollable.ensureVisible(globalKey?.currentContext ?? context);
      setState(() {
        _error = errorString;
      });
      return '';
    } else {
      return null;
    }
  }

  Future<String?> validateTextFieldOnChange(String value) async {
    widget.componentData.onChange.call();
    String? contactError;
    if (widget.componentData.asyncValidation != null) {
      contactError = await widget.componentData.asyncValidation?.call(
        value,
        widget.selectedCountryCode ?? 'IN',
      );
    }
    setState(() {
      _error = null;
      _error = value.trim().length > 1 &&
              (widget.componentData.placeHolder == 'first_name' ||
                  widget.componentData.placeHolder ==
                      'first_name_middle_name') &&
              widget.selectedTitle == null
          ? 'please_select_title'
          : widget.componentData.validation?.call(value);
    });
    adLog(value);
    //_error = widget.componentData.validation?.call(value);
    if (contactError != null) {
      _error = contactError;
    }
    return _error;
  }
}
