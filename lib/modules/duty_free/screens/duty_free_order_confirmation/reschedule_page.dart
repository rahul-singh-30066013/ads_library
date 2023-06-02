/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/flight_search_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_time_slot/duty_free_time_slot_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Reschedule Pickup page
class ReschedulePage extends StatefulWidget {
  const ReschedulePage({Key? key}) : super(key: key);

  @override
  _ReschedulePageState createState() => _ReschedulePageState();
}

class _ReschedulePageState extends State<ReschedulePage> {
  /// status in container height
  final double midContainerHeight = 88.sp;

  /// height of continue button
  final double _heightOfContinueButton = 54.sp;

  /// padding above continue button
  final double _paddingAboveBottomContinueButton = 50.sp;

  // String errorMessageForPickUpDateAndTime = '';

  TextEditingController pickupDateController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();
  TextEditingController selectedFlightController = TextEditingController();
  final ValueNotifier<bool> _isContinueButtonActive = ValueNotifier(false);
  final ValueNotifier<String> _timeControllerError = ValueNotifier('');
  final ValueNotifier<String> _pickupDateError = ValueNotifier('');

  // String selectedPickupTime = '';
  DateTime? selectedDateFromWidget;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isContinueButtonActive.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // selectedFlightController.text = context
    //         .read<DutyFreeOrderState>()
    //         .dutyFreeCancelOrderDetailsResponseModel
    //         ?.orderDetail
    //         .passengerDetail
    //         .first
    //         .flightNo ??
    //     '';
  }

  // Future<TimeOfDay?> _selectedTime(BuildContext context) {
  //   final now = DateTime.now();
  //   return showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  //   );
  // }

  Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime? initialDate,
    DateTime firstDate,
    DateTime lastDate,
  ) =>
      showDatePicker(
        context: context,
        builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              surface: Colors.black,
              secondary: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const ADSizedBox.shrink(),
        ),
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
      );

  // Future<TimeOfDay?> _selectedTime(BuildContext context) {
  //   final now = DateTime.now();
  //   return showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  //     builder: (context, child) => MediaQuery(
  //       data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
  //       child: Theme(
  //         data: ThemeData.light().copyWith(
  //           colorScheme: const ColorScheme.light(
  //             primary: Colors.black,
  //             secondary: Colors.black,
  //           ),
  //           dialogBackgroundColor: Colors.white,
  //         ),
  //         child: child ?? const ADSizedBox.shrink(),
  //       ),
  //     ),
  //   );
  // }

  Future<void> _pickUpTime(BuildContext context) async {
    _pickupDateError.value = '';
    const int num23 = 23;
    const int num22 = 22;
    const int num30 = 30;
    final DutyFreeOrderState dutyFreeState = context.read<DutyFreeOrderState>();
    if (pickupDateController.text.isNotEmpty) {
      final DateTime now = DateTime.now();
      final DateTime todayDate = DateTime(
        now.year,
        now.month,
        now.day,
        now.minute > 0 ? now.hour : now.hour + 1,
        now.minute > 0 ? now.minute + 30 : 0,
      );
      final pickUpDate = dutyFreeState.pickUpDate ?? now;

      if (pickUpDate.isAfter(todayDate)) {
        timeBottomSheet(context, pickUpDate);
      } else {
        if (pickUpDate.day > now.day) {
          timeBottomSheet(context, pickUpDate);
        } else if (todayDate.day == now.day &&
            todayDate.day == pickUpDate.day &&
            (todayDate.hour <= num22 ||
                todayDate.hour == num23 && todayDate.minute <= num30)) {
          timeBottomSheet(context, todayDate);
        } else {
          _pickupDateError.value =
              'error_select_valid_pick_up_date'.localize(context);
        }
      }
      // timeBottomSheet(context, todayDate);

      // DateTime todayDate = DateTime(
      //   dutyFreeState.pickUpDate?.year ?? 0,
      //   dutyFreeState.pickUpDate?.month ?? 0,
      //   dutyFreeState.pickUpDate?.day ?? 0,
      //   dutyFreeState.pickUpDate?.hour ?? 0,
      //   dutyFreeState.pickUpDate?.minute ?? 0,
      //   dutyFreeState.pickUpDate?.second ?? 0,
      // );

      //
      //   final selectedTime = await _selectedTime(context);
      //   adLog(
      //     '${dutyFreeState.pickUpDate?.toString()} ${DateTime(
      //       dutyFreeState.pickUpDate?.year ?? 0,
      //       dutyFreeState.pickUpDate?.month ?? 0,
      //       dutyFreeState.pickUpDate?.day ?? 0,
      //       selectedTime?.hour ?? 0,
      //       selectedTime?.minute ?? 0,
      //       dutyFreeState.pickUpDate?.second ?? 0,
      //       dutyFreeState.pickUpDate?.millisecond ?? 0,
      //       dutyFreeState.pickUpDate?.microsecond ?? 0,
      //     ).toString()}',
      //   );
      //   final selectedDateTime = DateTime(
      //     dutyFreeState.pickUpDate?.year ?? 0,
      //     dutyFreeState.pickUpDate?.month ?? 0,
      //     dutyFreeState.pickUpDate?.day ?? 0,
      //     selectedTime?.hour ?? 0,
      //     selectedTime?.minute ?? 0,
      //     dutyFreeState.pickUpDate?.second ?? 0,
      //     dutyFreeState.pickUpDate?.millisecond ?? 0,
      //     dutyFreeState.pickUpDate?.microsecond ?? 0,
      //   );
      //
      //   if (selectedTime != null &&
      //       (selectedDateTime.isAfter(
      //         DateTime.now(),
      //       ))) {
      //     final time = DateFormat('HH:mm').format(selectedDateTime);
      //     // dutyFreeState.pickUpDate = selectedDateTime;
      //     setState(() {
      //       _timeControllerError.value = '';
      //       _isContinueButtonActive.value = false;
      //       pickupTimeController.text = time;
      //      selectedPickupTime =  pickupTimeController.text;
      //     });
      //   } else {
      //     setState(() {
      //       pickupTimeController.text = '';
      //       _timeControllerError.value =
      //           'error_select_pick_up_date'.localize(context);
      //     });
      //   }
      // } else {
      //   setState(() {
      //     _pickupDateError.value = 'error_select_pick_up_date'.localize(context);
      //   });
    }
    refreshAndValidate();
  }

  void refreshAndValidate() {
    _isContinueButtonActive.value = pickupDateController.text.isNotEmpty &&
        pickupTimeController.text.isNotEmpty &&
        selectedFlightController.text.isNotEmpty;
  }

  void continueButtonAction() {
    context.read<DutyFreeOrderState>().pickupDate = pickupDateController.text;

    context.read<DutyFreeOrderState>().flightNumber =
        selectedFlightController.text;
    if (pickupDateController.text.isNotEmpty &&
        pickupTimeController.text.isNotEmpty &&
        selectedFlightController.text.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        dutyFreeRescheduleDetails,
        argumentObject: SelectedFlightToPass(
          context: context,
          flightNo: selectedFlightController.text,
        ),
      );
    }
  }

  DateTime getPickUDate(BuildContext context) {
    final datse = context
            .read<DutyFreeOrderState>()
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail?.dutyfreeDetail?.passengerDetail
            .first
            .pickupDate ??
        '';
    final time = context
            .read<DutyFreeOrderState>()
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail?.dutyfreeDetail?.passengerDetail
            .first
            .pickupTime ??
        '';

    return DateFormat('dd/MM/yyyy HH:mm').parse('$datse $time');
  }

  DateTime getPassportExpiryDate(BuildContext context) {
    final date = context
            .read<DutyFreeOrderState>()
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail?.dutyfreeDetail?.passengerDetail
            .first
            .customerPassportExpiry ??
        '';
    return DateFormat('dd/MM/yyyy HH:mm').parse('$date 23:59');
  }

  DateTime returnPickupDatePlud30Days(
    BuildContext context,
  ) {
    const add30Days = 30;
    final tempDate = getPickUDate(context).add(const Duration(days: add30Days));
    return tempDate.isBefore(getPassportExpiryDate(context))
        ? tempDate
        : getPassportExpiryDate(context);
  }

  bool isPassportExpired(BuildContext context) {
    return getPassportExpiryDate(context).isBefore(DateTime.now());
  }

  DateTime returnInitialDateAccordingToPickupDate(
    BuildContext context,
  ) {
    final DateTime now = DateTime.now();
    final DateTime todayDate = DateTime(
      now.year,
      now.month,
      now.day,
      now.minute > 0 ? now.hour : now.hour + 1,
      now.minute > 0 ? now.minute + 30 : 0,
    );

    const addDays = 2;
    final DateTime pickUpDate =
        getPickUDate(context).subtract(const Duration(days: addDays));
    return pickUpDate.isAfter(todayDate) ? pickUpDate : todayDate;
  }

  bool isPickupDateLessThanPreponedDateAndGreaterThanCurrentDate(
    BuildContext context,
    DateTime selectedDate,
  ) {
    const less2Days = 3;
    final DateTime pickUpDate = getPickUDate(context);
    final DateTime tempDate =
        pickUpDate.subtract(const Duration(days: less2Days));

    return tempDate.isBefore(selectedDate);
  }

  Future<void> _pickDateAndTime(BuildContext context) async {
    // if (isPassportExpired(context)) {
    //   _pickupDateError.value =
    //       'You can not reschedule this order as your passport has been expired';
    //   return;
    // } else
    if (returnPickupDatePlud30Days(context).isBefore(DateTime.now())) {
      _pickupDateError.value =
          'cannot_reschedule_duty_free_passport_expiry'.localize(context);
      return;
    }
    final selectedDate = await _selectDate(
      context,
      returnInitialDateAccordingToPickupDate(context),
      returnInitialDateAccordingToPickupDate(context),
      returnPickupDatePlud30Days(context),
    );
    final DutyFreeOrderState dutyFreeOrderState =
        context.read<DutyFreeOrderState>();
    if (selectedDate != null) {
      dutyFreeOrderState.pickUpDate = selectedDate;
    }
    if (selectedDate != null) {
      validateSelectedDate(selectedDate);

      /*setState(() {
        final date =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        pickupDateController.text = date;
        pickupTimeController.text = '';
        _pickupDateError.value = '';
        //adding to refresh
        selectedFlightController.text = '';
        _timeControllerError.value='';
        refreshAndValidate();
      });*/
    }
  }

  // Future<DateTime?> _selectDate(BuildContext context, bool value) =>
  //     showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now().add(const Duration(seconds: 1)),
  //       firstDate: value ? DateTime.now() : DateTime(1900),
  //       lastDate: value ? DateTime(DateTime.now().year + 10) : DateTime.now(),
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reschedule',
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.neutralInfoMsg),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'your_current_details'.localize(context),
                style: ADTextStyle500.size18
                    .setTextColor(context.adColors.blackTextColor),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: context.k_20),
                height: midContainerHeight,
                decoration: BoxDecoration(
                  color: const Color(0xfff4f9ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'pick_up_date'.localize(context),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_8,
                            ),
                            Text(
                              context
                                      .read<DutyFreeOrderState>()
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderDetail?.dutyfreeDetail?.passengerDetail
                                      .first
                                      .pickupDate ??
                                  '',
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'pickup_time'.localize(context),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_8,
                            ),
                            Text(
                              Utils.convertSingleTimeToAmPm(
                                context
                                        .read<DutyFreeOrderState>()
                                        .dutyFreeCancelOrderDetailsResponseModel
                                        ?.orderDetail?.dutyfreeDetail?.passengerDetail
                                        .first
                                        .pickupTime ??
                                    '',
                              ),
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'selected_flight'.localize(context),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_8,
                            ),
                            Text(
                              context
                                      .read<DutyFreeOrderState>()
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderDetail?.dutyfreeDetail?.passengerDetail
                                      .first
                                      .flightNo ??
                                  '',
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                height: context.k_32,
              ),
              Text(
                'update_details'.localize(context),
                style: ADTextStyle500.size18
                    .setTextColor(context.adColors.blackTextColor),
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              DropDownGeneric(
                type: 'pick_up_date'.localize(context),
                controller: pickupDateController,
                onTap: () => _pickDateAndTime(context),
                svgIcon: SvgAssets.calenderIcon,
                iconColor: context.adColors.darkGreyTextColor,
                errorMsg: _pickupDateError,
                needRightPadding: false,
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              DropDownGeneric(
                type: 'pickup_time'.localize(context),
                controller: pickupTimeController,
                onTap: () => _pickUpTime(context),
                //_pickTime(context),
                icon: Icons.schedule_rounded,
                iconColor: context.adColors.darkGreyTextColor,
                errorMsg: _timeControllerError,
                needRightPadding: false,
                // notifyParent: () => refreshAndValidate,
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              DropDownGeneric(
                type: 'select_flight'.localize(context),
                controller: selectedFlightController,
                iconColor: context.adColors.darkGreyTextColor,
                onTap: () => openFlightSelectionBottomSheet(),
                needRightPadding: false,
                // notifyParent: () => refreshAndValidate,
              ),
              ADSizedBox(
                height: _paddingAboveBottomContinueButton,
              ),
              ValueListenableBuilder(
                valueListenable: _isContinueButtonActive,
                child: Container(),
                builder: (context, bool value, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: context.adColors.blueColor,
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.k_28),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      _heightOfContinueButton,
                    ), //////// HERE
                  ),
                  onPressed: value ? () => continueButtonAction() : null,
                  child:
                      // Selector<SignInState, bool>(
                      //   selector: (context, model) => model.absorbing,
                      //   builder: (context, value, child) => value
                      //       ? ADDotProgressView(
                      //     color: context.adColors.whiteTextColor,
                      //   )
                      //       :
                      Text(
                    'continue'.localize(context),
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                  ),
                ),
              ),
              ADSizedBox(
                height: _paddingAboveBottomContinueButton,
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
            bottom: context.k_16,
          ),
        ),
      ),
    );
  }

  void openFlightSelectionBottomSheet() {
    if (pickupDateController.text.isNotEmpty &&
        pickupTimeController.text.isNotEmpty) {
      final showBottomSheetDialog = BottomSheetUtils.showBottomSheetDialog(
        context,
        ADDraggableScrollableBottomSheet(
          initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
          childWidget: FlightSearchList(
            date: selectedDateFromWidget,
            time: context.read<DutyFreeOrderState>().pickupTime,
            storeType: context
                .read<DutyFreeOrderState>()
                .dutyFreeCancelOrderDetailsResponseModel
                ?.orderDetail?.dutyfreeDetail?.itemDetails
                .first
                .storeType,
            airportCode: context.read<DutyFreeOrderState>().dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.airportCode,
            callback: (value) => setState(() {
              context.read<DutyFreeOrderState>().flightStatusSegment = value;
              selectedFlightController.text = context
                      .read<DutyFreeOrderState>()
                      .flightStatusSegment
                      ?.flightnumber ??
                  '';
              refreshAndValidate();
            }),
          ),
        ),
      );

      /// To avoid commit error
      adLog(showBottomSheetDialog.toString());
    } else {
      setState(() {
        _pickupDateError.value = 'error_select_pick_up_date'.localize(context);
        _timeControllerError.value =
            'error_select_pick_up_date'.localize(context);
      });
    }
  }

  String getFormattedDate(_date) {
    final DateTime dateTime = DateTime.parse(_date);
    // return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dateTime);
    return DateFormat(' d-MMM-yyyy HH:mm').format(dateTime).trim();
  }

//to validate selected as per before and after date require
  void validateSelectedDate(DateTime selectedDate) {
    selectedDateFromWidget = selectedDate;
    // const int prevAllowedDate = -2;
    // const int postAllowedDate = -30;
    final DutyFreeOrderState dutyFreeState = context.read<DutyFreeOrderState>();
    final String actualDate = dutyFreeState
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail?.dutyfreeDetail?.passengerDetail
            .first
            .pickupDate ??
        '';
    // String bookedTime = dutyFreeState.dutyFreeCancelOrderDetailsResponseModel
    //         ?.orderDetail.passengerDetail.first.flightTime ??
    //     '';
    // bookedTime = bookedTime.replaceAll('PM', '').replaceAll('AM', '');
    // final bookedTimeArray = bookedTime.split(':');
    // final selectedDateTime = DateTime(
    //   dutyFreeState.pickUpDate?.year ?? 0,
    //   dutyFreeState.pickUpDate?.month ?? 0,
    //   dutyFreeState.pickUpDate?.day ?? 0,
    //   int.parse(bookedTimeArray.first),
    //   int.parse(bookedTimeArray.last),
    //   dutyFreeState.pickUpDate?.second ?? 0,
    //   dutyFreeState.pickUpDate?.millisecond ?? 0,
    //   dutyFreeState.pickUpDate?.microsecond ?? 0,
    // );
    final parseDepartureDate = DateTime.parse(changeDateFormat(actualDate));
    final int difference = DateTime(
      parseDepartureDate.year,
      parseDepartureDate.month,
      parseDepartureDate.day,
    )
        .difference(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
          ),
        )
        .inDays;
    // if (difference >= 0 && difference >= prevAllowedDate) {
    //   adLog('Allowed reschedule-1');
    //   if (selectedDateTime.isAfter(DateTime.now())) {
    //     adLog('Time left');
    //     setState(() {
    //       final date =
    //           '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    //       pickupDateController.text = date;
    //       pickupTimeController.text = '';
    //       _pickupDateError.value = '';
    //       //adding to refresh
    //       selectedFlightController.text = '';
    //       _timeControllerError.value = '';
    //       refreshAndValidate();
    //     });
    //   } else {
    //     adLog('48 hr crossed');
    //     setState(() {
    //       pickupDateController.text = '';
    //       pickupTimeController.text = '';
    //       _pickupDateError.value = 'Reschedule not allowed for selected date';
    //       //adding to refresh
    //       selectedFlightController.text = '';
    //       _timeControllerError.value = '';
    //       refreshAndValidate();
    //     });
    //   }
    // } else if (difference <= 0 && difference >= postAllowedDate) {
    //   adLog('Allowed reschedule-2');
    //   setState(() {
    //     final date =
    //         '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    //     pickupDateController.text = date;
    //     pickupTimeController.text = '';
    //     _pickupDateError.value = '';
    //     //adding to refresh
    //     selectedFlightController.text = '';
    //     _timeControllerError.value = '';
    //     refreshAndValidate();
    //   });
    // } else {
    //   adLog('Not Allowed reschedule');
    //   setState(() {
    //     pickupDateController.text = '';
    //     pickupTimeController.text = '';
    //     _pickupDateError.value = 'Reschedule not allowed for selected date';
    //     //adding to refresh
    //     selectedFlightController.text = '';
    //     _timeControllerError.value = '';
    //     refreshAndValidate();
    //   });
    // }

    // if (isPickupDateLessThanPreponedDateAndGreaterThanCurrentDate(
    //   context,
    //   selectedDate,
    // )) {
    // final date = selectedDate.toString('dd-mm-yyyy');
    final inputFormat = DateFormat(Constant.dateFormat11);
    final inputDate = inputFormat.format(selectedDate);
    // '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    pickupDateController.text = inputDate;
    pickupTimeController.text = '';
    _pickupDateError.value = '';
    //adding to refresh
    selectedFlightController.text = '';
    _timeControllerError.value = '';
    refreshAndValidate();
    // } else {
    //   pickupDateController.text = '';
    //   pickupTimeController.text = '';
    //   _pickupDateError.value = 'Reschedule not allowed for selected date';
    //   //adding to refresh
    //   selectedFlightController.text = '';
    //   _timeControllerError.value = '';
    //   refreshAndValidate();
    // }

    adLog('selected date difference$difference');
  }

  //to change date format
  String changeDateFormat(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat11);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat12)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  void timeBottomSheet(
    BuildContext context,
    DateTime startTime,
  ) {
    final bottomShet = BottomSheetUtils.showDraggableBottomSheetDialog(
      context,
      // ReschedulePage(),
      DutyFreeTimeSlotBottomSheet(
        startTime: startTime,
        selectedTime: pickupTimeController.text,
        gap: 30,
        onTap: (String displayTime) => onTapAction(displayTime),
      ).paddingAllSide(context.k_8),
      'Select Pickup Time',
    );

    // final bottomSheet = showModalBottomSheet(
    //   useRootNavigator: true,
    //   backgroundColor: context.adColors.whiteTextColor,
    //   elevation: context.k_8,
    //   isScrollControlled: true,
    //   enableDrag: false,
    //   isDismissible: true,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(context.k_22),
    //     ),
    //   ),
    //   context: context,
    //   builder: (dialogContext) {
    //     return DutyFreeTimeSlotBottomSheet(
    //       startTime: startTime,
    //     );
    //   },
    // );
    adLog('$bottomShet');
  }

  void onTapAction(String displayTime) {
    // adLog(DateFormat.Hm().format(time));
    pickupTimeController.text = Utils.convertTimeToAmPm(displayTime);
    final List<String> initialTime = displayTime.split(' - ');
    selectedFlightController.clear();
    context.read<DutyFreeOrderState>().pickupTimeSlot =
        Utils.convertTimeToAmPm(displayTime);
    context.read<DutyFreeOrderState>().pickupTime = initialTime.first;
  }
}

class SelectedFlightToPass {
  BuildContext context;
  String flightNo;

  SelectedFlightToPass({
    required this.context,
    required this.flightNo,
  });
}
