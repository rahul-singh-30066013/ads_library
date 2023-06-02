/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class CardResponse {
  const CardResponse({this.content});

  final String? content;

  @override
  String toString() => 'CardResponse(content: $content)';

  factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
      };
}
