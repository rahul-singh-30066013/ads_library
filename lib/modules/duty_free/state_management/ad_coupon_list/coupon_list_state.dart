/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;
import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/coupon_list_model.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// This view model class will used to return data from json(local/api) to coupon list screen as per required,
class CouponListState extends BaseViewModel {
  CouponListModel? _couponListModel;

  Future<void> getCouponList(String jsonPath) async {
    updateState(ViewState.loading);
    await getCouponListFromJson(jsonPath).then((value) {
      _couponListModel = value;
      updateState(ViewState.success);
    });
  }

  List<CouponListData> get couponListModel =>
      _couponListModel?.couponListData ?? [];

  static CouponListModel parseCouponData(String jsonBody) {
    final parsed = json.decode(jsonBody);
    return CouponListModel.fromJson(parsed);
  }

  Future<CouponListModel?> getCouponListFromJson(String jsonPath) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    return compute(parseCouponData, jsonString);
  }
}
