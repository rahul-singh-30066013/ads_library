import 'package:adani_airport_mobile/modules/common_order_detail/bank.dart';

class PaidBy {
  Bank? bank;
  dynamic loyalty;
  dynamic promo;

  PaidBy({this.bank, this.loyalty, this.promo});

  PaidBy.fromJson(Map<String, dynamic> json) {
    if(json['bank'] is Map) {
      bank = json['bank'] == null ? null : Bank.fromJson(json['bank']);
    }
    loyalty = json['loyalty'];
    promo = json['promo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(bank != null) {
      _data['bank'] = bank?.toJson();
    }
    _data['loyalty'] = loyalty;
    _data['promo'] = promo;
    return _data;
  }
}