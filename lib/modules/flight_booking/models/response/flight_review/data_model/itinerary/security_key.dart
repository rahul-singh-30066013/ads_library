/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight segment-security key

class SecurityKey {
  SecurityKey({
    required this.securityGUID,
  });

  final String? securityGUID;

  SecurityKey copyWith({
    required String? securityGUID,
  }) =>
      SecurityKey(
        securityGUID: securityGUID ?? this.securityGUID,
      );

  factory SecurityKey.fromJson(Map<String, dynamic> json) => SecurityKey(
        securityGUID: json['securityGUID'],
      );
}
