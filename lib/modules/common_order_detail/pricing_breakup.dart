
class PricingBreakup {
    String? pricingId;
    int? baseFare;
    int? couponCashback;
    int? totalTaxes;
    int? convenienceFees;
    String? paxStatus;
    int? ccfFee;
    int? discountedCcfFee;

    PricingBreakup({this.pricingId, this.baseFare, this.couponCashback, this.totalTaxes, this.convenienceFees, this.paxStatus, this.ccfFee, this.discountedCcfFee});

    PricingBreakup.fromJson(Map<String, dynamic> json) {
        if(json['pricingId'] is String) {
            pricingId = json['pricingId'];
        }
        if(json['baseFare'] is num) {
            baseFare = (json['baseFare'] as num).toInt();
        }
        if(json['couponCashback'] is num) {
            couponCashback = (json['couponCashback'] as num).toInt();
        }
        if(json['totalTaxes'] is num) {
            totalTaxes = (json['totalTaxes'] as num).toInt();
        }
        if(json['convenienceFees'] is num) {
            convenienceFees = (json['convenienceFees'] as num).toInt();
        }
        if(json['paxStatus'] is String) {
            paxStatus = json['paxStatus'];
        }
        if(json['ccfFee'] is num) {
            ccfFee = (json['ccfFee'] as num).toInt();
        }
        if(json['discountedCCFFee'] is num) {
            discountedCcfFee = (json['discountedCCFFee'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['pricingId'] = pricingId;
        _data['baseFare'] = baseFare;
        _data['couponCashback'] = couponCashback;
        _data['totalTaxes'] = totalTaxes;
        _data['convenienceFees'] = convenienceFees;
        _data['paxStatus'] = paxStatus;
        _data['ccfFee'] = ccfFee;
        _data['discountedCCFFee'] = discountedCcfFee;
        return _data;
    }
}