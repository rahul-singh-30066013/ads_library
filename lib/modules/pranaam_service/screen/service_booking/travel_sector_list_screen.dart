/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/site_core_master_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/travel_sector_selector.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as sit_core_masters;
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///This class is for creating list of travel sectors in bottom sheet.
class TravelSectorListScreen extends StatefulWidget {
  const TravelSectorListScreen({
    Key? key,
    this.selectedItem,
    required this.callback,
    required this.bookingScreenController,
  }) : super(key: key);

  final String? selectedItem;
  final ADGenericCallback callback;
  final BookingScreenController bookingScreenController;

  @override
  _TravelSectorListScreenState createState() => _TravelSectorListScreenState();
}

class _TravelSectorListScreenState extends State<TravelSectorListScreen> {
  PranaamAppDataStateManagement bookingServiceState =
      PranaamAppDataStateManagement();
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  List<sit_core_masters.TravelSector> travelSectorList = [];

  @override
  void initState() {
    super.initState();
    bookingServiceState = context.read<PranaamAppDataStateManagement>();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    travelSectorList = getTravelSectorsByServiceType(
      siteCoreStateManagement: _siteCoreStateManagement,
      serviceType: bookingServiceState.selectedServiceModel?.serviceTitle ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: travelSectorList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onItemClick(travelSectorList, context, index),
          child: TravelSectorSelector(
            travelSectorList: travelSectorList,
            travelSectorListIndex: index,
            selectedItemData: widget.selectedItem,
          ),
        );
      },
    );
  }

  void onItemClick(
    List<sit_core_masters.TravelSector> travelModel,
    BuildContext context,
    int travelIndex,
  ) {
    widget.callback(
      TravelSectorModel(
        travelSectorId: int.parse(travelModel[travelIndex].id),
        travelSectorTitle: travelModel[travelIndex].label,
        isTransit: travelModel[travelIndex].isTransit == '1',
      ),
    );
    navigatorPopScreen(context);
  }
}
