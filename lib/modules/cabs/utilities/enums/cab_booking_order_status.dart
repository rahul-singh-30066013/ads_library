/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

enum CabBookingOrderStatus {
  confirmed,
  scheduled,
  ontheway,
  cancelled,
  pending,
  failed,
  completed,
}

extension CabBookingOrderStatusExtension on CabBookingOrderStatus {
  String get name {
    switch (this) {
      case CabBookingOrderStatus.confirmed:
        return 'CONFIRMED';
      case CabBookingOrderStatus.cancelled:
        return 'CANCELLED';
      case CabBookingOrderStatus.ontheway:
        return 'ON THE WAY';
      case CabBookingOrderStatus.scheduled:
        return 'SCHEDULED';
      case CabBookingOrderStatus.completed:
        return 'COMPLETED';
      case CabBookingOrderStatus.pending:
        return 'PENDING';
      case CabBookingOrderStatus.failed:
        return 'FAILED';
    }
  }
}
