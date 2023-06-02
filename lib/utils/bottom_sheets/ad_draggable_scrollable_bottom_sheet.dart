/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

const double initialChildSizeDefault = 0.5;

///This class is used to construct Draggable bottom sheet with Drag bar.
///[initialChildSize] is of type [double] and is in the range of 0.1 to 1.0
///The initial fractional value of the parent container's height to use when displaying the widget.
///[childWidget] is of type [Widget], it is used for displaying body of the Draggable bottom sheet.
///

class ADDraggableScrollableBottomSheet extends StatelessWidget {
  ///
  /// usage
  /// ADDraggableScrollableBottomSheet(
  ///                               initialChildSize: airportListBottomSheetHeight,
  ///                               child: AirportSearchList(
  ///                                 arrivalOrDepartureString:
  ///                                     'selectDepartureCity'.localize(context),
  ///                               ),
  ///                             );
  const ADDraggableScrollableBottomSheet({
    Key? key,
    required this.childWidget,
    this.initialChildSize,
  }) : super(key: key);

  final Widget childWidget;
  final double? initialChildSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: const Key('draggable_scrollable_sheet'),
      initialChildSize: initialChildSize ?? initialChildSizeDefault,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.k_10,
                bottom: context.k_2,
              ),
              child: ADBottomSheetDragBar(
                height: context.k_4,
                width: context.k_40,
              ),
            ),
            Expanded(
              child: childWidget,
            ),
          ],
        );
      },
    );
  }
}
