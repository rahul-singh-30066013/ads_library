import 'package:adani_airport_mobile/modules/common_order_detail/invoice_info.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/status_history.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';

class FlightbookingDetail {
  FlightViewTripResponseModel? tripInfo;
  List<dynamic>? refundHistory;
  List<StatusHistory>? statusHistory;
  InvoiceInfo? invoiceInfo;
  String? orderReferenceId;


  FlightbookingDetail({
    this.tripInfo,
    this.refundHistory,
    this.statusHistory,
    this.invoiceInfo,
    this.orderReferenceId,
  });

  FlightbookingDetail.fromJson(Map<String, dynamic> json) {
    if (json['tripInfo'] is Map) {
      tripInfo = json['tripInfo'] == null
          ? null
          : FlightViewTripResponseModel.fromJson(FlightListIsolateModel(
              jsonData: json['tripInfo'],
              airlineInfo: FlightUtils.airlineInfo,
              departureFlightCountMap: FlightUtils.departureFlightCountMap,
              arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
              internationalAirportMap: FlightUtils.internationalAirportMap,
            ),null,null,);
    }
    if (json['refundHistory'] is List) {
      refundHistory = json['refundHistory'] ?? [];
    }
    if (json['statusHistory'] is List) {
      statusHistory = json['statusHistory'] == null
          ? null
          : (json['statusHistory'] as List)
              .map((e) => StatusHistory.fromJson(e))
              .toList();
    }
    if (json['invoiceInfo'] is Map) {
      invoiceInfo = json['invoiceInfo'] == null
          ? null
          : InvoiceInfo.fromJson(json['invoiceInfo']);
    }
  }
}
