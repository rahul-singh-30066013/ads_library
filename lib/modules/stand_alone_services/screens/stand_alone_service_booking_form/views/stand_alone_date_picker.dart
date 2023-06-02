import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';

class StandAloneDatePicker extends StatelessWidget {
  const StandAloneDatePicker({Key? key,this.onDateSelected, this.selectedDate,this.calendarStartDate}) : super(key: key);
  final void Function(DateTime)? onDateSelected;
  final DateTime? selectedDate;
  final DateTime? calendarStartDate;

  @override
  Widget build(BuildContext context) {
    final _internalController = TextEditingController();
    if(selectedDate != null){
      _internalController.text = formatDateTime(
        dateTimeType: selectedDate,
        dateTimeFormat: dataTimeFormatDayMonth,
      );
    }
    return DropDownGeneric(
      needRightPadding: false,
      svgIcon: SvgAssets.calenderIcon,
      type: 'date'.localize(context),
      onTap: () => BottomSheetUtils.showBottomSheetDialog(
        context,
        ADDraggableScrollableBottomSheet(
          initialChildSize:
          BottomSheetUtils.getBottomSheetHeightRatio(
            context,
          ),
          childWidget: DateRangeView(
            showAmount: false,
            isPranaam: true,
            // calendarEndDate: (state.isRoundOrTransitDateSelected &&
            //         ((state.selectedServiceModel?.serviceId ==
            //                 id_2) ||
            //             state.selectedServiceModel?.serviceId ==
            //                 id_3))
            //     ? (state.transitDateModel?.dateOfJourney.day ==
            //             DateTime.now().day
            //         ? DateTime.now().add(const Duration(minutes: 10))
            //         : state.transitDateModel?.dateOfJourney)
            //     : null,
            calendarStartDate: calendarStartDate,
            departureDate:  selectedDate??DateTime.now(),
          ),
        ),
      ).then((value) {
        if (value != null) {
          _internalController.text = formatDateTime(
            dateTimeType: (value as CalendarModel).departureDate,
            dateTimeFormat: dataTimeFormatDayMonth,
          );
          onDateSelected?.call(value.departureDate);
        }
      }),
      controller: _internalController,
    );
  }
}
