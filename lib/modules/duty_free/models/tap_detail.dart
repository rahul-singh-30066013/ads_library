/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this class used to handle onTap Detail data
class TapDetail {
  /// this is used to get itemId
  int objectID;

  /// this is used to item name
  String name;

  /// this is use to handle dynamic item
  dynamic item;

  /// this is use to handle subItem
  dynamic subItem;

  /// this is use to handle code based action
  dynamic code;

  TapDetail({
    required this.objectID,
    required this.name,
    this.item,
    this.subItem,
    this.code,
  });
}
