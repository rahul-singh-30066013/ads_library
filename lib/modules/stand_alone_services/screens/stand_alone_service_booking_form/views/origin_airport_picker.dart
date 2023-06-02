
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/airport_search_list.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class OriginAirportPicker extends StatelessWidget {
  const OriginAirportPicker({
    Key? key,
    required this.selectedServiceTypeId,
    required this.selectedTravelSectorId,
    required this.callback,
    this.errorMsg,
    required this.selectedAirport,
  }) : super(key: key);

  final int selectedServiceTypeId;
  final int selectedTravelSectorId;
  final ADGenericCallback callback;
  final ValueNotifier<String>? errorMsg;
  final String selectedAirport;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _internalController =
        TextEditingController(text: selectedAirport);
    return DropDownGeneric(
      errorMsg: errorMsg,
      needRightPadding: false,
      type: 'depart_from'.localize(context),
      onTap: () => showDraggableListBottomSheetForOrigin(
        context: context,
        headerTitle: 'origin_label',
        selectedTravelSectorId: selectedTravelSectorId,
        selectedServiceTypeId: selectedServiceTypeId,
        callback: (data) => {
          _internalController.text = (data as CityDetailModel).cityName ?? '',
          callback(data),
        },
        selectedAirport: _internalController.text,
      ),
      controller: _internalController,
    );
  }

  Future<void> showDraggableListBottomSheetForOrigin({
    required BuildContext context,
    required String headerTitle,
    required int selectedServiceTypeId,
    required int selectedTravelSectorId,
    required ADGenericCallback callback,
    required String selectedAirport,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: AirportSearchList(
                scrollController: scrollController,
                isFromPranaam: isOriginControllerPranaamAirport(
                  selectedServiceTypeId: selectedServiceTypeId,
                ),
                isDomestic: isOriginDomesticAirport(
                    selectedTravelSectorId: selectedTravelSectorId,),
                isInternationalPranaam: true,
                isFrom: false,
                fromWhere: false,
                arrivalOrDepartureString:
                    'select_depart_from_city'.localize(context),
                callback: callback,
                pranaamAirPortList: pranaamAirPortList,
                selectedAirport: selectedAirport,
              ),
            );
          },
        ),
      );
}
