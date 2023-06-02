// ignore_for_file: constant_identifier_names

enum PranaamOrderStatus {
  INITIATED('INITIATED'),
  PENDING('PENDING'),
  FAILED('FAILED'),  
  PART_FULFILLED('PART_FULFILLED'),
  CANCELLED('CANCELLED'),
  CANCELLATION_INITIATED('CANCELLATION_INITIATED'),
  CONFIRMED('CONFIRMED'),
  RESCHEDULED('RESCHEDULED'),
  UPGRADED('UPGRADED'),
  SCHEDULED('SCHEDULED'),  
  RESCHEDULE_FAILED('RESCHEDULE_FAILED'),
  UPGRADE_FAILED('UPGRADE_FAILED'),
  UPGRADE_PENDING('UPGRADE_INITIATED'),
  RESCHEDULE_PENDING('RESCHEDULE_INITIATED'),
  PARTIALLY_CANCELLED('Partially Cancelled'),
  COMPLETE('COMPLETE'),
  COMPLETED('FULFILLED');

  const PranaamOrderStatus(this.status);
  final String status;

  static PranaamOrderStatus? getStatus(String? status) =>
      PranaamOrderStatus.asStatusMap()[status];

  static Map<String, PranaamOrderStatus> asStatusMap() => {
        for (final item in PranaamOrderStatus.values) item.status: item,
      };

  static bool isPending(String? statusString) {
    final status = PranaamOrderStatus.getStatus(statusString);
    return status == UPGRADE_PENDING ||
        status == RESCHEDULE_PENDING ||
        status == PENDING;
  }

  bool get isPendingGetter =>
      this == UPGRADE_PENDING || this == RESCHEDULE_PENDING || this == PENDING;
}

// {

//   INITIATED: 'INITIATED',

//   PENDING: 'PENDING',

//   FAILED: 'FAILED',

//   FULFILLED: 'FULFILLED',

//   PART_FULFILLED: 'PART_FULFILLED',

//   CANCELLED: 'CANCELLED',

//   CANCELLATION_INITIATED: 'CANCELLATION_INITIATED',

//   CONFIRMED: 'CONFIRMED',

//   RESCHEDULED: 'RESCHEDULED',

//   UPGRADED: 'UPGRADED',

//   SCHEDULED: 'SCHEDULED',

//   RESCHEDULE_INITIATED: 'RESCHEDULE_INITIATED',

//   UPGRADE_INITIATED: 'UPGRADE_INITIATED',

//   RESCHEDULE_FAILED: 'RESCHEDULE_FAILED',

//   UPGRADE_FAILED: 'UPGRADE_FAILED'

// }
