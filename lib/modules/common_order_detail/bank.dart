class Bank {
  int? amount;

  Bank({this.amount});

  Bank.fromJson(Map<String, dynamic> json) {
    if(json['amount'] is num) {
      amount = (json['amount'] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['amount'] = amount;
    return _data;
  }
}