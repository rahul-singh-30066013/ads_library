/// dialogBanner : {"uid":"1107ba94-7f31-4c0e-8a51-f1bebe2748c8","widgetType":"Dialog","fields":[{"widgetId":1,"title":"Pratap","offer":"15","subTitle":"Singh","imageLink":"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg","actionTitle":{"deeplink":"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg"}}]}

class AdsDialogBanner {
  AdsDialogBanner({
      DialogBanner? dialogBanner,}){
    _dialogBanner = dialogBanner;
}

  AdsDialogBanner.fromJson(dynamic json) {
    print('Rahul ${json['dialogBanner']}');
    _dialogBanner = json['dialogBanner'] != null ? DialogBanner.fromJson(json['dialogBanner']) : null;
  }
  DialogBanner? _dialogBanner;
AdsDialogBanner copyWith({  DialogBanner? dialogBanner,
}) => AdsDialogBanner(  dialogBanner: dialogBanner ?? _dialogBanner,
);
  DialogBanner? get dialogBanner => _dialogBanner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dialogBanner != null) {
      map['dialogBanner'] = _dialogBanner?.toJson();
    }
    return map;
  }

}

/// uid : "1107ba94-7f31-4c0e-8a51-f1bebe2748c8"
/// widgetType : "Dialog"
/// fields : [{"widgetId":1,"title":"Pratap","offer":"15","subTitle":"Singh","imageLink":"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg","actionTitle":{"deeplink":"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg"}}]

class DialogBanner {
  DialogBanner({
      String? uid, 
      String? widgetType, 
      List<Fields>? fields,}){
    _uid = uid;
    _widgetType = widgetType;
    _fields = fields;
}

  DialogBanner.fromJson(dynamic json) {
    _uid = json['uid'];
    _widgetType = json['widgetType'];
    if (json['fields'] != null) {
      _fields = [];
      json['fields'].forEach((v) {
        _fields?.add(Fields.fromJson(v));
      });
    }
  }
  String? _uid;
  String? _widgetType;
  List<Fields>? _fields;
DialogBanner copyWith({  String? uid,
  String? widgetType,
  List<Fields>? fields,
}) => DialogBanner(  uid: uid ?? _uid,
  widgetType: widgetType ?? _widgetType,
  fields: fields ?? _fields,
);
  String? get uid => _uid;
  String? get widgetType => _widgetType;
  List<Fields>? get fields => _fields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['widgetType'] = _widgetType;
    if (_fields != null) {
      map['fields'] = _fields?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// widgetId : 1
/// title : "Pratap"
/// offer : "15"
/// subTitle : "Singh"
/// imageLink : "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg"
/// actionTitle : {"deeplink":"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg"}

class Fields {
  Fields({
      int? widgetId, 
      String? title, 
      int? offer,
      String? subTitle, 
      String? imageLink, 
      ActionTitle? actionTitle,}){
    _widgetId = widgetId;
    _title = title;
    _offer = offer;
    _subTitle = subTitle;
    _imageLink = imageLink;
    _actionTitle = actionTitle;
}

  Fields.fromJson(dynamic json) {
    _widgetId = json['widgetId'];
    _title = json['title'];
    _offer = json['offer'];
    _subTitle = json['subTitle'];
    _imageLink = json['imageLink'];
    _actionTitle = json['actionTitle'] != null ? ActionTitle.fromJson(json['actionTitle']) : null;
  }
  int? _widgetId;
  String? _title;
  int? _offer;
  String? _subTitle;
  String? _imageLink;
  ActionTitle? _actionTitle;
Fields copyWith({  int? widgetId,
  String? title,
  int? offer,
  String? subTitle,
  String? imageLink,
  ActionTitle? actionTitle,
}) => Fields(  widgetId: widgetId ?? _widgetId,
  title: title ?? _title,
  offer: offer ?? _offer,
  subTitle: subTitle ?? _subTitle,
  imageLink: imageLink ?? _imageLink,
  actionTitle: actionTitle ?? _actionTitle,
);
  int? get widgetId => _widgetId;
  String? get title => _title;
  int? get offer => _offer;
  String? get subTitle => _subTitle;
  String? get imageLink => _imageLink;
  ActionTitle? get actionTitle => _actionTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['widgetId'] = _widgetId;
    map['title'] = _title;
    map['offer'] = _offer;
    map['subTitle'] = _subTitle;
    map['imageLink'] = _imageLink;
    if (_actionTitle != null) {
      map['actionTitle'] = _actionTitle?.toJson();
    }
    return map;
  }

}

/// deeplink : "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg"

class ActionTitle {
  ActionTitle({
      String? deeplink,}){
    _deeplink = deeplink;
}

  ActionTitle.fromJson(dynamic json) {
    _deeplink = json['deeplink'];
  }
  String? _deeplink;
ActionTitle copyWith({  String? deeplink,
}) => ActionTitle(  deeplink: deeplink ?? _deeplink,
);
  String? get deeplink => _deeplink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deeplink'] = _deeplink;
    return map;
  }

}