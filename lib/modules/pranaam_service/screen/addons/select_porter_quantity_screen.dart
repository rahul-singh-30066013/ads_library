import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_porter_quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class SelectPorterQuantityScreen extends StatefulWidget {
  static const _itemCount = 15;

  const SelectPorterQuantityScreen({
    Key? key,
    required this.adGenericCallback,
    this.itemCounts = _itemCount,
    required this.selectedIndexNotifier,
    this.subtitleText,
    this.startFromZero = false,
  }) : super(key: key);
  final ADGenericCallback adGenericCallback;
  final int itemCounts;
  final ValueNotifier<int> selectedIndexNotifier;
  final String? subtitleText;
  final bool startFromZero;

  @override
  SelectPorterQuantityController createState() =>
      SelectPorterQuantityController();
}
