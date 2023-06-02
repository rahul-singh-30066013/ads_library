/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class NetBankingResponse {
  const NetBankingResponse({this.content});

  final String? content;

  @override
  String toString() => 'NetBankingResponse(content: $content)';

  factory NetBankingResponse.fromJson(Map<String, dynamic> json) =>
      NetBankingResponse(
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
      };
}
