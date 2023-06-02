/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class BankListViewModel extends BaseViewModel {
  List<Option>? _banksList;
  List<Option>? filteredBanksList;

  List<Option> get bankList => _banksList ?? [];

  set bankList(List<Option>? listOfBanks) {
    _banksList = listOfBanks;
  }

  Option? _selectedBank;

  Option? get selectedBank => _selectedBank;

  // ignore: use_setters_to_change_properties
  void setSelectedBankTo(Option? option) {
    _selectedBank = option;
  }

  Future<void> bankSearchList(
    String bankSearchString,
  ) async {
    List<Option>? modifyList = [];
    if (bankSearchString.isNotEmpty) {
      modifyList = getFilteredBankList(bankSearchString);
      bankList = modifyList;
    } else {
      bankList = filteredBanksList;
    }
    notifyListeners();
  }

  List<Option>? getFilteredBankList(String userSearchTerm) {
    return filteredBanksList?.where(
      (bankListModel) {
        return bankListModel.name
            .validateWithDefaultValue()
            .toLowerCase()
            .contains(userSearchTerm.toLowerCase());
      },
    ).toList();
  }
}
