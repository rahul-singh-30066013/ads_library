/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class FilterPrice {
  int minPrice;
  int maxPrice;
  int selectedPrice;
  String changeCode;
  int filterCount;

  FilterPrice({
    required this.minPrice,
    required this.maxPrice,
    required this.selectedPrice,
    required this.changeCode,
    required this.filterCount,
  });

  factory FilterPrice.defaultValues([FilterPrice? filterPrice]) => FilterPrice(
        filterCount: 0,
        minPrice: filterPrice?.minPrice ?? 0,
        maxPrice: filterPrice?.maxPrice ?? 0,
        selectedPrice: filterPrice?.selectedPrice ?? 0,
        changeCode: '',
      );

  FilterPrice copy() {
    return FilterPrice(
      minPrice: minPrice,
      maxPrice: maxPrice,
      selectedPrice: selectedPrice,
      changeCode: changeCode,
      filterCount: filterCount,
    );
  }
}
