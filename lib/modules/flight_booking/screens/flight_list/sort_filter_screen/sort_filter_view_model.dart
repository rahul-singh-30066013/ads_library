/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_selected_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/sort_filter_left_menu_enum.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';

///SortFilterViewModel is used for update left View UI update
///[SortFilterViewModel] is use for create Sort & Filter View= 0;
class SortFilterViewModel extends BaseViewModel {
  int selectedIndex = 0;
  SortFilterLeftMenuEnum leftSelectedMenu = SortFilterLeftMenuEnum.stop;
  FilterSortModel? filterSortModel;
  FilterSelectedModel? filterModel;

  void updateSortStatus() {
    notifyListeners();
  }

  SortFilterViewModel(this.leftSelectedMenu, this.filterModel);

  void updateSwitchStatus(
    int index,
    FilterSelectedModel filterSelectedModel,
  ) {
    filterModel = filterSelectedModel;
    selectedIndex = index;
    leftSelectedMenu = filterSelectedModel.sortFilterType;
    updateState(ViewState.success);
  }
}
