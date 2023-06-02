class CouponDetail {
  String? code;
  int? couponDiscount;
  String? type;
  bool? isMerchantFunded;

  CouponDetail(
      {this.code, this.couponDiscount, this.type,  this.isMerchantFunded,});

  CouponDetail.fromJson(Map<String, dynamic> json) {
    if (json['code'] is String) {
      code = json['code'];
    }
    if (json['couponDiscount'] is num) {
      couponDiscount = (json['couponDiscount'] as num).toInt();
    }
    if (json['type'] is String) {
      type = json['type'];
    }

    if (json['isMerchantFunded'] is bool) {
      isMerchantFunded = json['isMerchantFunded'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['code'] = code;
    _data['couponDiscount'] = couponDiscount;
    _data['type'] = type;
    _data['isMerchantFunded'] = isMerchantFunded;
    return _data;
  }
}
