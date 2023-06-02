
class InvoiceInfo {
    String? invoiceNumber;
    int? igst;
    double? sgst;
    double? cgst;
    double? ccfFee;
    dynamic itineraryId;
    dynamic tripId;

    InvoiceInfo({this.invoiceNumber, this.igst, this.sgst, this.cgst, this.ccfFee, this.itineraryId, this.tripId});

    InvoiceInfo.fromJson(Map<String, dynamic> json) {
        if(json['invoiceNumber'] is String) {
            invoiceNumber = json['invoiceNumber'];
        }
        if(json['igst'] is num) {
            igst = (json['igst'] as num).toInt();
        }
        if(json['sgst'] is num) {
            sgst = (json['sgst'] as num).toDouble();
        }
        if(json['cgst'] is num) {
            cgst = (json['cgst'] as num).toDouble();
        }
        if(json['ccfFee'] is num) {
            ccfFee = (json['ccfFee'] as num).toDouble();
        }
        itineraryId = json['itineraryId'];
        tripId = json['tripId'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['invoiceNumber'] = invoiceNumber;
        _data['igst'] = igst;
        _data['sgst'] = sgst;
        _data['cgst'] = cgst;
        _data['ccfFee'] = ccfFee;
        _data['itineraryId'] = itineraryId;
        _data['tripId'] = tripId;
        return _data;
    }
}