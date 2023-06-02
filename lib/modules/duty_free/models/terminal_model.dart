/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'terminal_model.freezed.dart';
part 'terminal_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TerminalModel with _$TerminalModel {
  const factory TerminalModel({
    @Default('') String title,
    @Default('') String code,
  }) = _TerminalModel;

  factory TerminalModel.fromJson(Map<String, dynamic> json) =>
      _$TerminalModelFromJson(json);
}
