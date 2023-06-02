/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';

class SelectPackageData {
  ServiceBookingModel serviceBookingModel = ServiceBookingModel();
  List<List<bool>> servicesAvailability = [];
  int packageMatches = 0;
  List<PackageDetail> packagesList = [];
  List<String> packageServicesList = [];

  SelectPackageData(
    this.serviceBookingModel,
    this.servicesAvailability,
    this.packageMatches,
    this.packagesList,
    this.packageServicesList,
  );

  SelectPackageData.name();
}
