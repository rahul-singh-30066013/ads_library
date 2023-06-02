import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_exclusive_product_filter_model.freezed.dart';
part 'duty_free_exclusive_product_filter_model.g.dart';

DutyFreeExclusiveProductFilterModel dutyFreeExclusiveProductFilterModelFromJson(
  String str,
) =>
    DutyFreeExclusiveProductFilterModel.fromJson(json.decode(str));

String dutyFreeExclusiveProductFilterModelToJson(
  DutyFreeExclusiveProductFilterModel data,
) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeExclusiveProductFilterModel
    with _$DutyFreeExclusiveProductFilterModel {
  const factory DutyFreeExclusiveProductFilterModel({
    String? filterTitle,
    String? filterCode,
    String? filterValue,
    bool? multiselect,
    bool? showInPrimery,
    List<String>? skuCode,
    List<dynamic>? filterData,
  }) = _DutyFreeExclusiveProductFilterModel;

  factory DutyFreeExclusiveProductFilterModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeExclusiveProductFilterModelFromJson(json);
}
