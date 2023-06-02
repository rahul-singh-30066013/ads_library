/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: constant_identifier_names

enum WidgetTypeEnum {
  loyaltyBannerLogIn,
  loyaltyBannerNonLogIn,
  rewardJourneyLogIn,
  rewardJourneyNonLogIn,
  earn2X,
  referFriend,
  loyaltyFaq,
  popularcategories,
  Terminals,
  notAvailable,
  giftVoucher,
  banner,
  tableTitle,
  table,
  howToConvert,
}

enum PromotionTypeEnum {
  flightbooking,
  pranaam,
  dutyfree,
  instoreoffer,
  cabbooking,
}

enum ServicesEnum {
  flights,
  pranaam,
  porter,
  dutyfree,
  cabbooking,
}

enum TransactionTypeEnum {
  CREDIT,
  DEBIT,
  REFUND,
  AWARD,
}

class OfferKeyModel {
  final bool showBookNowButton;
  final bool fetchDataFromPromoCode;
  final String? id;
  final String? title;
  final String? airportPrefixName;
  const OfferKeyModel({
    this.fetchDataFromPromoCode = false,
    this.showBookNowButton = true,
    this.title,
    this.id,
    this.airportPrefixName,
  });
}

class OfferDashKeyModel {
  final String? airportName;
  final String? selectedOffersTabTitle;
  const OfferDashKeyModel({
    this.airportName,
    this.selectedOffersTabTitle,
  });
}
