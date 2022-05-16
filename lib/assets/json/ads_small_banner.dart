/// smallBanner : {"uid":"1107ba94-7f38-4c0e-8a51-f1bebe2748c8","widgetType":"Small Banner","fields":[{"widgetId":1,"title":"Rahul","offer":10,"subTitle":"Singh","imageLink":"wdfwffegdeg","actionTitle":{"deeplink":"v cv cv b b "}},{"widgetId":2,"title":"Rahul","offer":10,"subTitle":"Singh","imageLink":"wdfwffegdeg","actionTitle":{"deeplink":"v cv cv b b "}}]}

class AdsSmallBanner {
  AdsSmallBanner({
      SmallBanner? smallBanner,}){
    _smallBanner = smallBanner;
}

  AdsSmallBanner.fromJson(dynamic json) {
    _smallBanner = json['smallBanner'] != null ? SmallBanner.fromJson(json['smallBanner']) : null;
  }
  SmallBanner? _smallBanner;
AdsSmallBanner copyWith({  SmallBanner? smallBanner,
}) => AdsSmallBanner(  smallBanner: smallBanner ?? _smallBanner,
);
  SmallBanner? get smallBanner => _smallBanner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_smallBanner != null) {
      map['smallBanner'] = _smallBanner?.toJson();
    }
    return map;
  }

}

/// uid : "1107ba94-7f38-4c0e-8a51-f1bebe2748c8"
/// widgetType : "Small Banner"
/// fields : [{"widgetId":1,"title":"Rahul","offer":10,"subTitle":"Singh","imageLink":"wdfwffegdeg","actionTitle":{"deeplink":"v cv cv b b "}},{"widgetId":2,"title":"Rahul","offer":10,"subTitle":"Singh","imageLink":"wdfwffegdeg","actionTitle":{"deeplink":"v cv cv b b "}}]

class SmallBanner {
  SmallBanner({
      String? uid, 
      String? widgetType, 
      List<Fields>? fields,}){
    _uid = uid;
    _widgetType = widgetType;
    _fields = fields;
}

  SmallBanner.fromJson(dynamic json) {
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
SmallBanner copyWith({  String? uid,
  String? widgetType,
  List<Fields>? fields,
}) => SmallBanner(  uid: uid ?? _uid,
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
/// title : "Rahul"
/// offer : 10
/// subTitle : "Singh"
/// imageLink : "wdfwffegdeg"
/// actionTitle : {"deeplink":"v cv cv b b "}

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

/// deeplink : "v cv cv b b "

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