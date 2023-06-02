/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class WalletResponse {
  const WalletResponse({this.content});

  final String? content;

  @override
  String toString() => 'WalletResponse(content: $content)';

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
      };
}
