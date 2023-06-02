import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/show_filtered_flights.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';


class PranaamFlightListView extends StatelessWidget {
  const PranaamFlightListView(
      {Key? key, required this.pranaamFlights, required this.callback, required this.selectedFlight,})
      : super(key: key);
  final List<PranaamFlights> pranaamFlights;
  final ADGenericCallback callback;
  final String selectedFlight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: pranaamFlights.length,
        // controller: scrollController,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => {
              searchTextController.clear(),
              FocusScope.of(context).unfocus(),
              callback(pranaamFlights[index]),
              navigatorPopScreen(context),
            },
            child: Container(
              color: selectedFlight == pranaamFlights[index].flightFinalNumber
                  ? context.adColors.lightBlue
                  : context.adColors.transparentColor,
              child: ShowFilteredFlights(
                index: index,
                flightList: pranaamFlights,
                selectedFlight: selectedFlight,
              ),
            ),
          );
        },
      ),
    );
  }
}
