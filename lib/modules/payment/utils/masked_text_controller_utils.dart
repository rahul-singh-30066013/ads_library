/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

class MaskedTextControllerUtils extends TextEditingController {
  MaskedTextControllerUtils({
    String text = '',
    required this.mask,
  }) : super(text: text) {
    addListener(() {
      updateText(this.text);
    });
  }

  String mask;

  Map<String, RegExp> translator = {
    'A': RegExp('[A-Za-z]'),
    '0': RegExp('[0-9]'),
    '@': RegExp('[A-Za-z0-9]'),
    '*': RegExp('.*'),
  };

  String _lastUpdatedText = '';

  void updateText(String text) {
    this.text = _applyMask(mask, text);

    _lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    updateText(text);

    if (moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    final String text = _lastUpdatedText;
    selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  @override
  set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      moveCursorToEnd();
    }
  }

  String _applyMask(String mask, String value) {
    String result = '';

    int maskCharIndex = 0;
    int valueCharIndex = 0;

    while (true) {
      // if mask is ended, break.
      if (maskCharIndex == mask.length) {
        break;
      }

      // if value is ended, break.
      if (valueCharIndex == value.length) {
        break;
      }

      final String maskChar = mask[maskCharIndex];
      final String valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
        continue;
      }

      // apply translator if match
      if (translator.containsKey(maskChar)) {
        if (translator[maskChar]!.hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
        continue;
      }

      // not masked value, fixed char on mask
      final String buffer = result + maskChar;
      result = buffer;
      maskCharIndex += 1;
      continue;
    }

    return result;
  }
}
