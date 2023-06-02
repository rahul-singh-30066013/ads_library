/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class CancelReasonResponseModel {
  String? headerTitle;
  String? headerDescription;
  String? buttonText;
  String? title;
  List<Reason>? reasons;

  CancelReasonResponseModel({
    this.headerTitle,
    this.headerDescription,
    this.buttonText,
    this.title,
    this.reasons,
  });

  CancelReasonResponseModel.fromJson(Map<String, dynamic> json) {
    headerTitle = json['headerTitle'];
    headerDescription = json['headerDescription'];
    buttonText = json['buttonText'];
    title = json['title'];
    if (json['reasons'] != null) {
      reasons = <Reason>[];
      for (final Map<String, dynamic> result in json['reasons']) {
        reasons?.add(Reason.fromJson(result));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headerTitle'] = headerTitle;
    data['headerDescription'] = headerDescription;
    data['buttonText'] = buttonText;
    data['title'] = title;
    if (reasons != null) {
      data['reasons'] = reasons?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reason {
  String? reason;
  String? descriptionHint;
  String? descriptionLength;

  Reason({
    this.reason,
    this.descriptionHint,
    this.descriptionLength,
  });

  Reason.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    descriptionHint = json['descriptionHint'];
    descriptionLength = json['descriptionLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['reason'] = reason;
    data['descriptionHint'] = descriptionHint;
    data['descriptionLength'] = descriptionLength;

    return data;
  }
}
