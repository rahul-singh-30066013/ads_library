import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_dashboard_animation.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/stand_alone_service_booking_form.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StandAloneServiceBookingFormScreen extends StatelessWidget {
  const StandAloneServiceBookingFormScreen({Key? key, required this.item})
      : super(key: key);
  final DashboardItem item;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Selector<StandAloneServiceBookingStateManagement, bool>(
        builder: (_, showLoader, __) => Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: StandAloneServiceBookingForm(
                  item: item,
                  showBack: true,
                ),
              ),
            ),
            if (showLoader) const StandAloneDashboardAnimation(),
          ],
        ),
        selector: (_, model) => model.showBuggyLoader,
      ),
    );
  }
}
