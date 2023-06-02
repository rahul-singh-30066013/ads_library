/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/placard_name_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';

const int closedQuarterTurns = 1;
const int openQuarterTurns = 3;

class PlacardView extends StatefulWidget {
  const PlacardView({
    Key? key,
    this.controllerIndex,
    required this.titleHeading,
    required this.state,
    this.isPrimary = false,
  }) : super(key: key);
  final int? controllerIndex;
  final String titleHeading;
  final PranaamTravellerScreenState state;
  final bool isPrimary;

  @override
  State<PlacardView> createState() => _PlacardViewState();
}

class _PlacardViewState extends State<PlacardView> {
  ValueNotifier<bool> isPlaCardOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isPlaCardOpen,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlacardNameView(
              state: widget.state,
              titleHeading: widget.titleHeading,
              controllerIndex: widget.controllerIndex,
              isPrimary:widget.isPrimary,
            ),
            // ),
          ],
        );
      },
    );
  }

  void onTap() {
    isPlaCardOpen.value = !isPlaCardOpen.value;
    FocusScope.of(context).unfocus();
    adLog('tapped${isPlaCardOpen.value}');
  }
}
