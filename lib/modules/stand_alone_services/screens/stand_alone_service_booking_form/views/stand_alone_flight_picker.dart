import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_flight_list.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class StandAloneFlightPicker extends StatelessWidget {
  const StandAloneFlightPicker({Key? key, required this.selectedFlight, required this.response, required this.onFlightSelect, required this.isValid, this.errorMsg}) : super(key: key);
  final String selectedFlight;
  final ValueNotifier<ADResponseState<dynamic>> response;
  final ADGenericCallback<PranaamFlights> onFlightSelect;
  final bool isValid;
  final ValueNotifier<String>? errorMsg;

  void onTap (context,TextEditingController _internalController) {
    if(!isValid){
      return;
    }
    final temp = ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
        maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
        minChildSize: ADDraggableScrollableSheetBody.minChildSize,
        expand: false,
        builder: (
            BuildContext context,
            ScrollController scrollController,
            ) {
          return ADDraggableScrollableSheetBody(
            headerTitle: 'flights',
            childWidget: StandAloneFlightList(//todo use pranaam flight list when reschedule is merged
              selectedFlight: _internalController.text,
              /// Add selected flight code
              response: response,
              callback: (pranaamFlight)=>{onFlightSelect.call(pranaamFlight),_internalController.text = pranaamFlight.flightFinalNumber},
            ),
          );
        },
      ),
    );
    adLog('$temp');
  }
  @override
  Widget build(BuildContext context) {
    final _internalController =  TextEditingController(text: selectedFlight);
    return DropDownGeneric(
      errorMsg: errorMsg,
      needRightPadding: false,
      type: 'flights'.localize(context),
      onTap: ()=>onTap(context,_internalController),
      controller: _internalController,
    );
  }
}
