/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

///model class for travel sector.
class TravelSectorModel {
  final int travelSectorId;
  final String travelSectorTitle;
  final bool isTransit;

  TravelSectorModel({
    this.travelSectorId = 0,
    this.travelSectorTitle = 'NA',
    this.isTransit = false,
  });

  @override
  String toString() {
    return 'TravelSectorModel{travelSectorId: $travelSectorId, travelSectorTitle: $travelSectorTitle isTransit: $isTransit}';
  }
}
