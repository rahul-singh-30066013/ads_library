class GetAvailableAppPayload {
  String? action;
  String? orderId;
  bool? getAvailableApps;
  bool? showLoader;

  GetAvailableAppPayload({
    this.action,
    this.orderId,
    this.getAvailableApps,
    this.showLoader,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['orderId'] = orderId;
    data['getAvailableApps'] = getAvailableApps;
    data['showLoader'] = showLoader;
    return data;
  }
}
