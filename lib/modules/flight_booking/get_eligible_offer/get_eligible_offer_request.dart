class GetEligibleOfferRequest{
  String? itineraryId;

  GetEligibleOfferRequest({this.itineraryId});

  GetEligibleOfferRequest.fromJson(Map<String, dynamic> json) {
    if(json['itineraryId'] is String) {
      itineraryId = json['itineraryId'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['itineraryId'] = itineraryId;
    return _data;
  }
}