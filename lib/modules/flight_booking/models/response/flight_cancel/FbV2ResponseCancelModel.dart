class FbV2ResponseCancelModel{
  String? status;

  FbV2ResponseCancelModel({this.status});

  FbV2ResponseCancelModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    return _data;
  }
}