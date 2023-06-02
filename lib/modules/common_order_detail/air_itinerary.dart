
import 'package:adani_airport_mobile/modules/common_order_detail/origin_destination_option.dart';

class AirItinerary {
    List<OriginDestinationOption>? originDestinationOption;
    dynamic journeyKey;

    AirItinerary({this.originDestinationOption, this.journeyKey});

    AirItinerary.fromJson(Map<String, dynamic> json) {
        if(json['originDestinationOption'] is List) {
            originDestinationOption = json['originDestinationOption'] == null ? null : (json['originDestinationOption'] as List).map((e) => OriginDestinationOption.fromJson(e)).toList();
        }
        journeyKey = json['journeyKey'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(originDestinationOption != null) {
            _data['originDestinationOption'] = originDestinationOption?.map((e) => e.toJson()).toList();
        }
        _data['journeyKey'] = journeyKey;
        return _data;
    }
}