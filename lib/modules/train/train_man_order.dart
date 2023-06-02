
import 'package:json_annotation/json_annotation.dart';

part 'train_man_order.g.dart';

@JsonSerializable()
class TrainManOrder {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'tmBookingId')
  String? tmBookingId;
  @JsonKey(name: 'originName')
  String? originName;
  @JsonKey(name: 'destinationName')
  String? destinationName;
  @JsonKey(name: 'boardingName')
  String? boardingName;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'trainNumber')
  String? trainNumber;
  @JsonKey(name: 'trainName')
  String? trainName;
  @JsonKey(name: 'origin')
  String? origin;
  @JsonKey(name: 'destination')
  String? destination;
  @JsonKey(name: 'boardingDate')
  String? boardingDate;
  @JsonKey(name: 'createdOn')
  String? createdAt;

  TrainManOrder();

  factory TrainManOrder.fromJson(Map<String, dynamic> json) =>
      _$TrainManOrderFromJson(json);

  Map<String, dynamic> toJson() => _$TrainManOrderToJson(this);
}