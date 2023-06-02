/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';

class CabLiveTrackingNavigateModel {
  String? orderReferenceId;
  CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  FilteredVendorDataResponseModel? filteredVendorDataResponseModel;

  CabLiveTrackingNavigateModel({
    this.orderReferenceId,
    this.cabOrderDetailResponseModel,
    this.filteredVendorDataResponseModel,
  });
}
