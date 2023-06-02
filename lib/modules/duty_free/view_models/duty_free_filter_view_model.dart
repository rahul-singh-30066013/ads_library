/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DutyFreeFilterViewModel {
  String? title;
  bool? showInPrimary;
  String? code;
  bool? selected;
  bool isCategory;
  bool isBrand;
  bool isOffer;
  bool isExclusive;
  bool isIncludeOOS;
  List<DutyFreeFilterViewModel>? subCategories;
  List<DutyFreeFilterViewModel>? filteredSubCategories;
  List<String>? skuCode;
  String? exclusive;

  DutyFreeFilterViewModel({
    this.title,
    this.showInPrimary,
    this.code,
    this.selected,
    this.subCategories,
    this.isCategory = false,
    this.isBrand = false,
    this.isOffer = false,
    this.isExclusive = false,
    this.isIncludeOOS = false,
    this.filteredSubCategories,
    this.skuCode,
    this.exclusive,
  });
}
