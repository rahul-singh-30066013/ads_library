/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'coupon_list_model.g.dart';

@JsonSerializable()
class CouponListModel {
  List<CouponListData> couponListData = [];

  CouponListModel({required this.couponListData});

  factory CouponListModel.fromJson(Map<String, dynamic> json) =>
      _$CouponListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponListModelToJson(this);
}

@JsonSerializable()
class CouponListData {
  String? name;
  String? icon;
  String? couponCode;
  String? couponDescription;
  String? couponName;
  String? couponTitle;

  CouponListData({
    this.name,
    this.icon,
    this.couponCode,
    this.couponDescription,
    this.couponName,
    this.couponTitle,
  });

  factory CouponListData.fromJson(Map<String, dynamic> json) =>
      _$CouponListDataFromJson(json);

  Map<String, dynamic> toJson() => _$CouponListDataToJson(this);
}
