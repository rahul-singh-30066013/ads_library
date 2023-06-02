/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_retrieve_member_model.freezed.dart';
part 'loyalty_retrieve_member_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyRetrieveMemberModel with _$LoyaltyRetrieveMemberModel {
  const factory LoyaltyRetrieveMemberModel({
    @Default('') String mobileNumber,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String referralCode,
    @Default('') String referralLink,
  }) = _LoyaltyRetrieveMemberModel;

  factory LoyaltyRetrieveMemberModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRetrieveMemberModelFromJson(json);
}
