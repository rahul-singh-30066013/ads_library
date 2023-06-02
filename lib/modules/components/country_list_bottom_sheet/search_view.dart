/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const double greyOpacity = 0.2;
final TextEditingController searchTextController = TextEditingController();

class SearchView extends StatefulWidget {
  const SearchView({
    Key? key,
    required this.onChanged,
    required this.onFieldSubmitted,
    required this.onIconButtonPressed,
    required this.hintText,
    this.textInputType,
    this.inputFormatter,
    this.focusNode,
  }) : super(key: key);
  final ADGenericCallback onChanged;
  final ADGenericCallback onFieldSubmitted;
  final ADTapCallback onIconButtonPressed;
  final String hintText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.k_40,
      child: TextFormField(
        controller: searchTextController,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatter,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.adColors.paleGrey,
          hintText: widget.hintText,
          hintStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.greyTextColor,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: context.k_4),
          border: getBorder(context),
          focusedBorder: getBorder(context),
          enabledBorder: getBorder(context),
          prefixIcon: Icon(
            Icons.search,
            color: context.adColors.inactiveGreyColor,
          ),
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              widget.onIconButtonPressed();
              searchTextController.clear();
            }),
            icon: searchTextController.text.isNotEmpty
                ? Icon(
                    Icons.clear,
                    color: context.adColors.inactiveGreyColor,
                  )
                : const SizedBox.shrink(),
          ),
        ),
        onChanged: (value) => setState(() {
          widget.onChanged(value);
        }),
        onFieldSubmitted: (value) => widget.onFieldSubmitted(value),
      ),
    );
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }
}
