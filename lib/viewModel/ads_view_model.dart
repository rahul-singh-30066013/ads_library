import 'dart:developer';

import 'package:ads_library/assets/json/ads_big_banner.dart';
import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/assets/json/ads_single_banner.dart';
import 'package:ads_library/assets/json/ads_small_banner.dart';
import 'package:ads_library/assets/json/main_content.dart';
import 'package:ads_library/response/response_state.dart';
import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:ads_library/viewModel/base_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AdsViewModel extends ADBaseViewModel {
  ADResponseState adResponseState = ADResponseState.loading();

  Future<http.Response> fetchJson() {
    return http.get(
        Uri.parse('https://rahul-singh-30066013.github.io/main_content.json'));
  }

  ///It will used to fetch
  Future<void> fetchData(AdsType type, BuildContext context) async {
    Map<String, dynamic> parsed = {};
    await fetchJson().then((value) {
      parsed = json.decode(value.body);
    });

    // final databaseReference = FirebaseDatabase.instance.ref();
    // final snapshot = await databaseReference.child(type.name).once();
    // final Map<String, dynamic> response = Map<String, dynamic>.from(snapshot.snapshot.value as Map<dynamic, dynamic>);

    log(parsed[type.name].toString());

    switch (type) {
      case AdsType.bigBanner:
        adResponseState =
            ADResponseState.completed(BigBanner.fromJson(parsed[type.name]));
        break;
      case AdsType.smallBanner:
        adResponseState =
            ADResponseState.completed(SmallBanner.fromJson(parsed[type.name]));
        break;
      case AdsType.dialog:
        adResponseState =
            ADResponseState.completed(DialogBanner.fromJson(parsed[type.name]));
        break;
      case AdsType.singleBanner:
        adResponseState =
            ADResponseState.completed(SingleBanner.fromJson(parsed[type.name]));
        break;
      default:
        adResponseState =
            ADResponseState.error('DialogBanner.fromJson(response)');
    }
    notifyListeners();
  }
}
