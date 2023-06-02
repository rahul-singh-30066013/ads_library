import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';

class OfferBannerRemoteModel {
  bool? isPopUpEnabled;
  WidgetItem? widgetItem;
  DutyFreeItem? actionItem;

  OfferBannerRemoteModel({
    this.isPopUpEnabled,
    this.widgetItem,
    this.actionItem,
  });

  OfferBannerRemoteModel.fromJson(Map<String, dynamic> json) {
    isPopUpEnabled = json['isPopUpEnabled'];
    widgetItem = json['widgetItem'] != null
        ? WidgetItem.fromJson(json['widgetItem'])
        : null;
    actionItem = (json['actionItem'] != null)
        ? DutyFreeItem.fromJson(json['actionItem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isPopUpEnabled'] = isPopUpEnabled;
    data['widgetItem'] = widgetItem?.toJson();
    data['actionItem'] = actionItem?.toJson();
    return data;
  }
}

class WidgetItem {
  String? imageSrc;
  double? heightMultiplier;
  String? btnText;
  int? widgetType;
  int? showAfterNoOfDays;
  WidgetItem({
    this.imageSrc,
    this.heightMultiplier,
    this.btnText,
    this.widgetType,
    this.showAfterNoOfDays,
  });

  WidgetItem.fromJson(Map<String, dynamic> json) {
    imageSrc = json['imageSrc'];
    heightMultiplier = json['heightMultiplier'];
    btnText = json['btnText'];
    widgetType = json['widgetType'];
    showAfterNoOfDays = json['showAfterNoOfDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageSrc'] = imageSrc;
    data['heightMultiplier'] = heightMultiplier;
    data['btnText'] = btnText;
    data['widgetType'] = widgetType;
    data['showAfterNoOfDays'] = showAfterNoOfDays;
    return data;
  }
}
