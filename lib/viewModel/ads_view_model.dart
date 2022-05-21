
import 'package:ads_library/assets/json/ads_big_banner.dart';
import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/assets/json/ads_single_banner.dart';
import 'package:ads_library/assets/json/ads_small_banner.dart';
import 'package:ads_library/response/response_state.dart';
import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:ads_library/viewModel/base_view_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AdsViewModel extends ADBaseViewModel {
  ADResponseState adResponseState = ADResponseState.loading();

  ///It will used to fetch
  Future<void> fetchData(AdsType type) async {

      final jsonString = await rootBundle.loadString('lib/assets/json/popup.json');
      final parsed = json.decode(jsonString);


    // final databaseReference = FirebaseDatabase.instance.ref();
    // final snapshot = await databaseReference.child(type.name).once();
    // final Map<String, dynamic> response = Map<String, dynamic>.from(snapshot.snapshot.value as Map<dynamic, dynamic>);
    print(parsed[type.name]);

    switch(type){
      case AdsType.bigBanner : adResponseState = ADResponseState.completed(BigBanner.fromJson(parsed[type.name])); break;
      case AdsType.smallBanner : adResponseState = ADResponseState.completed(SmallBanner.fromJson(parsed[type.name])); break;
      case AdsType.dialog : adResponseState = ADResponseState.completed(DialogBanner.fromJson(parsed[type.name])); break;
      case AdsType.singleBanner : adResponseState = ADResponseState.completed(SingleBanner.fromJson(parsed[type.name])); break;
      default: adResponseState = ADResponseState.error('DialogBanner.fromJson(response)');
    }
    notifyListeners();
  }
}
