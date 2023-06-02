/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';

///Class is used to manage tab state for duty free tabs widget.
class TabsState {
  final DutyFreeRepository _dutyFreeRepository = DutyFreeRepository();
  // final DutyFreeState dutyFreeState = DutyFreeState();
  Future<ADResponseState> loadProducts(
    DutyFreeItem dutyFreeItem,
    String storeType,
      DutyFreeState dutyFreeState,
  ) async {
    adLog(
      'AgeLog ${dutyFreeState.ageAbove25}',
    );
    final response = await _dutyFreeRepository.tabsApiCall(
      path: dutyFreeItem.apiUrl,
      catalogRequest: DutyFreeProductListRequest(
        language: 'en',
        materialGroup: dutyFreeItem.materialGroup,
        channel: 'app',
        airportCode: selectedAirportsData?.airportCode ?? '',
        category: dutyFreeItem.category.isNotEmpty
            ? dutyFreeItem.category.split(',')
            : [],
        subCategory: dutyFreeItem.subCategory.isNotEmpty
            ? dutyFreeItem.subCategory.split(',')
            : [],
        restricted: !dutyFreeState.ageAbove25,
        brand:
            dutyFreeItem.brand.isNotEmpty ? dutyFreeItem.brand.split(',') : [],
        storeType: storeType,
        showOnHomepage: dutyFreeItem.showOnHomepage,
        skuCode: dutyFreeItem.skuCode.isNotEmpty
            ? dutyFreeItem.skuCode.split(',')
            : [],
        exclusive: dutyFreeItem.exclusive,
      ),
    );
    if (response.viewStatus == Status.complete) {
      final data = await compute(_parseProductResponse, response.data);
      if (data.result.isNotEmpty) {
        for (int index = 0; index < data.result.length; index++) {
          data.result[index] =
              data.result[index].copyWith(storeType: storeType);
        }
      }
      response.data = data;
    }
    return response;
  }

  static CatalogListResponseModel _parseProductResponse(dynamic json) {
    return CatalogListResponseModel.fromJson(json);
  }
}
