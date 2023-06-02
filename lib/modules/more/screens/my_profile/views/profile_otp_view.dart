/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/more/state_management/profile_otp_state.dart';
import 'package:adani_airport_mobile/modules/session/screens/otp/otp_text_form_field.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_plugin/adani_mobile_plugin.dart';
import 'package:flutter/material.dart';

class ProfileOtpView extends StatefulWidget {
  ///*[otpState] used to manage the state.
  final ProfileOtpState otpState;

  ///*[otpTextFieldCount] used to show the number of Otp box.
  final int otpTextFieldCount;

  final List<TextEditingController> listTextEdit;
  final List<FocusNode> listFocusNode;

  const ProfileOtpView({
    Key? key,
    required this.otpState,
    required this.otpTextFieldCount,
    required this.listTextEdit,
    required this.listFocusNode,
  }) : super(key: key);

  @override
  State<ProfileOtpView> createState() => _ProfileOtpViewState();
}

class _ProfileOtpViewState extends State<ProfileOtpView> {
  @override
  void initState() {
    for (var index = 0; index < widget.otpTextFieldCount; index++) {
      widget.listTextEdit.add(TextEditingController());
      widget.listFocusNode.add(FocusNode());
    }
    for (final textController in widget.listTextEdit) {
      textController.text = '';
    }
    widget.listFocusNode.first.requestFocus();
    getAppSignature();
    super.initState();
  }

  @override
  void dispose() {
    stopService();
    super.dispose();
  }

  /// Stop Otp receiver service.
  Future<void> stopService() async {
    if (Platform.isAndroid) {
      adLog('Otp Service Stopped');
      final data = await AdaniMobilePlugin.stopListeningForOtp();
      adLog(data.toString());
    }
  }

  /// Function to get App Signature
  /// DO NOT use in Release Build
  Future<void> getAppSignature() async {
    if (Platform.isAndroid) {
      final signature = await AdaniMobilePlugin.getAppSignature();
      adLog('App Signature ---> $signature');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < widget.otpTextFieldCount; index++)
          OtpTextFormField(
            controller: widget.listTextEdit[index],
            onChanged: (value) => onChange(
              index: index,
              textValue: value,
            ),
            focusNode: widget.listFocusNode[index],
            onTapClick: () => onTapHandler(selectedIndex: index),
            index: index,
          ),
      ],
    );
  }

  void onTapHandler({required int selectedIndex}) {
    for (int index = 1; index < widget.listTextEdit.length; index++) {
      if (widget.listTextEdit[index].text.isEmpty) {
        widget.listTextEdit[index].text =
        ' '; // in this case space is need to achieve back press functionality
      }
    }
    if (selectedIndex == 0) {
      // OTP will nor be auto read in ios if we add space in first textfield.
      // widget.listTextEdit[selectedIndex].text = '';
      widget.listTextEdit[selectedIndex].value = TextEditingValue(
        selection: TextSelection.fromPosition(
          const TextPosition(offset: ''.length),
        ),
      );
    } else {
      widget.listTextEdit[selectedIndex].value = TextEditingValue(
        text: ' ',
        selection: TextSelection.fromPosition(
          const TextPosition(offset: ' '.length),
        ),
      );
    }

    otpCheck();
  }

  void onChange({
    required int index,
    required String textValue,
  }) {
    if (textValue.length >= widget.otpTextFieldCount) {
      for (int counter = 0; counter < widget.otpTextFieldCount; counter++) {
        widget.listTextEdit[counter].text = ' ${textValue[counter]}';
      }
      otpCheck();
    } else {
      if (textValue.isNotEmpty) {
        widget.listTextEdit[index].text = textValue.trim().characters.last;
        if (index < widget.otpTextFieldCount - 1) {
          if (widget.listTextEdit[index + 1].text.trim().isEmpty) {
            widget.listTextEdit[index + 1].text = ' ';
          }
          widget.listFocusNode[index + 1].requestFocus();
        } else {
          widget.listFocusNode[index].unfocus();
        }
      } else if (textValue.trim().isEmpty) {
        if (index > 0) {
          widget.listFocusNode[index - 1].requestFocus();
        }
      }
      otpCheck();
    }
  }

  void otpCheck() {
    final buffer = StringBuffer();
    for (final textController in widget.listTextEdit) {
      buffer.write(textController.text.trim());
    }
    adLog('${buffer.toString().trim().length}');
    adLog(buffer.toString());
    widget.otpState.otpStr = buffer.toString();
    widget.otpState.updateView(
      isOtpCompleted:
      buffer.toString().trim().length == widget.otpTextFieldCount,
    );
  }
}