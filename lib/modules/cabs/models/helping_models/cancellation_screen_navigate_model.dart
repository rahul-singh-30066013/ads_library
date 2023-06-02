/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class CancellationScreenNavigateModel {
  final ADTapCallback successCallBack;
  final InfoDetails? infoDetails;
  final String orderReferenceId;
  final CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  final String? currencyCode;

  const CancellationScreenNavigateModel({
    required this.successCallBack,
    required this.infoDetails,
    required this.orderReferenceId,
    required this.cabOrderDetailResponseModel,
    required this.currencyCode,
  });
}
