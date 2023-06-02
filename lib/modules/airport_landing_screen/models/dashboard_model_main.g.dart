// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModelMain _$DashboardModelMainFromJson(Map<String, dynamic> json) =>
    DashboardModelMain(
      storyViewWidget: json['storyViewWidget'] == null
          ? null
          : DutyFreeDashboardItem.fromJson(
              json['storyViewWidget'] as Map<String, dynamic>),
      airportDashboardItems: (json['airportDashboardItems'] as List<dynamic>?)
          ?.map(
              (e) => DutyFreeDashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelMainToJson(DashboardModelMain instance) =>
    <String, dynamic>{
      'storyViewWidget': instance.storyViewWidget,
      'airportDashboardItems': instance.airportDashboardItems,
    };
