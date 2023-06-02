
import 'package:adani_airport_mobile/modules/common_order_detail/pricing_breakup.dart';

class BookingPaymentBreakup {
    int? total;
    dynamic partnerPaymentId;
    List<PricingBreakup>? pricingBreakup;

    BookingPaymentBreakup({this.total, this.partnerPaymentId, this.pricingBreakup});

    BookingPaymentBreakup.fromJson(Map<String, dynamic> json) {
        if(json['total'] is num) {
            total = (json['total'] as num).toInt();
        }
        partnerPaymentId = json['partnerPaymentId'];
        if(json['pricingBreakup'] is List) {
            pricingBreakup = json['pricingBreakup'] == null ? null : (json['pricingBreakup'] as List).map((e) => PricingBreakup.fromJson(e)).toList();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['total'] = total;
        _data['partnerPaymentId'] = partnerPaymentId;
        if(pricingBreakup != null) {
            _data['pricingBreakup'] = pricingBreakup?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}