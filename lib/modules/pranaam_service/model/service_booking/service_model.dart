/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

///model class for service.
class ServiceModel {
  final int serviceId;
  final String serviceTitle;
  final int tripId;

  ServiceModel({
    this.serviceId = 0,
    this.serviceTitle = 'NA',
    this.tripId = 1,
  });

  @override
  String toString() {
    return 'ServiceModel{serviceId: $serviceId, serviceTitle: $serviceTitle}';
  }
}
