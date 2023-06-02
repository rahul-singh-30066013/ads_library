/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class CabBookingConfirmationNavigateModel {
  String orderReferenceId;
  bool isFromHomeView;

  CabBookingConfirmationNavigateModel({
    this.isFromHomeView = false,
    required this.orderReferenceId,
  });
}
