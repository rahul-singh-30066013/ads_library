class InitialPayload{
  String? action;
  String? merchantId;
  String? clientId;
  String? customerId;
  String? environment;


  InitialPayload(
      {this.action,
        this.merchantId,
        this.clientId,
        this.customerId,
        this.environment,});

  InitialPayload.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    environment = json['environment'];
    customerId = json['customerId'];
    clientId = json['clientId'];
    merchantId = json['merchantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['environment'] = environment;
    data['customerId'] = customerId;
    data['clientId'] = clientId;
    data['merchantId'] = merchantId;
    return data;
  }
}