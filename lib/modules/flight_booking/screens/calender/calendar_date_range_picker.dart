/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/build_month_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/day_headers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

export 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/highlight_painter_style.dart';
export 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/month_view.dart';

//TODO move color variable into style guide
double vPadding10 = 10.h;
double vPadding20 = 20.h;
double hPadding10 = 10.h;
const int tabBarLength = 2;
final double stickyWidgetHeightWithTab = 107.sp;
final double stickyWidgetHeightWithoutTab = 58.sp;
const Color _closeIconColor = Color(0xff333333);

class CalendarDateRangePicker extends StatefulWidget {
  /// Creates a scrollable calendar grid for picking date ranges.
  CalendarDateRangePicker({
    Key? key,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.roundSelected,
    required this.tripType,
    this.showAmount = true,
    this.isArrivalSelected = false,
    this.selectCalender,
    // required this.calendarFareState,
  })  : initialStartDate = initialStartDate != null
            ? DateUtils.dateOnly(initialStartDate)
            : null,
        initialEndDate =
            initialEndDate != null ? DateUtils.dateOnly(initialEndDate) : null,
        firstDate = DateUtils.dateOnly(firstDate),
        lastDate = DateUtils.dateOnly(lastDate),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()),
        super(key: key) {
    assert(
      !this.lastDate.isBefore(this.firstDate),
      'firstDate must be on or before lastDate.',
    );
  }

  /// The [DateTime] that represents the start of the initial date range selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range selection.
  final DateTime? initialEndDate;
  final bool roundSelected;

  final TripType tripType;
  final String? selectCalender;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// Called when the user changes the start date of the selected range.
  final ValueChanged<DateTime>? onStartDateChanged;

  /// Called when the user changes the end date of the selected range.
  final ValueChanged<DateTime?>? onEndDateChanged;

  final bool showAmount;
  bool isArrivalSelected;

  // final CalendarFareState calendarFareState;

  @override
  CalendarDateRangePickerState createState() => CalendarDateRangePickerState();
}

class CalendarDateRangePickerState extends State<CalendarDateRangePicker>
    with TickerProviderStateMixin {
  final GlobalKey _scrollViewKey = GlobalKey();
  final ValueNotifier<DateTime> _startDate =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<DateTime?> _endDate = ValueNotifier<DateTime?>(null);
  int _initialMonthIndex = 0;
  final ValueNotifier<bool> _showWeekBottomDivider = ValueNotifier(false);
  final ValueNotifier<String> _titleText = ValueNotifier(
    arrivalIsSelected ? 'Select Arrival Date' : 'Select Departure Date',
  );
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabBarLength,
      vsync: this,
      initialIndex: arrivalIsSelected ? 1 : 0,
    );
    widget.isArrivalSelected = arrivalIsSelected ? true : false;
    _startDate.value = widget.initialStartDate ?? DateTime.now();
    _endDate.value = widget.initialEndDate;

    // Calculate the index for the initially displayed month. This is needed to
    // divide the list of months into two `SliverList`s.
    final DateTime initialDate = widget.initialStartDate ?? widget.currentDate;
    if (!initialDate.isBefore(widget.firstDate) &&
        !initialDate.isAfter(widget.lastDate)) {
      _initialMonthIndex = DateUtils.monthDelta(widget.firstDate, initialDate);
    }
    _showWeekBottomDivider.value = _initialMonthIndex != 0;
    if (widget.showAmount) {
      _titleText.value = 'Select Departure Date';
    } else {
      _titleText.value = 'Select Date';
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _titleText.dispose();
    _startDate.dispose();
    _endDate.dispose();
    super.dispose();
  }

  void _scrollListener(ScrollController scrollController) {
    if (scrollController.offset <= scrollController.position.minScrollExtent) {
      _showWeekBottomDivider.value = false;
    } else if (!_showWeekBottomDivider.value) {
      _showWeekBottomDivider.value = true;
    }
  }

  int get _numberOfMonths =>
      DateUtils.monthDelta(widget.firstDate, widget.lastDate) + 1;

  void _updateSelection(DateTime date) {
    if (widget.tripType == TripType.roundTrip || widget.roundSelected) {
      if (arrivalIsSelected) {
        ///In case of Arrival Tab selected
        if (!date.isBefore(_startDate.value)) {
          _endDate.value = date;
          widget.onEndDateChanged?.call(_endDate.value);
          _updateTitle(false);
          _tabController?.animateTo(0);
        } else {
          ///Need to show the dialog here
          ///if user try to select arrival date before departure date
          // _startDate = date;
          // _endDate = date.add(const Duration(days: 1));
          // widget.onStartDateChanged?.call(_startDate);
          // widget.onEndDateChanged?.call(_endDate);
          // setState(() {
          //   arrivalIsSelected = true;
          //   tapActive();
          // });

          SnackBarUtil.showSnackBar(
            context,
            'Return date cannot be less than Departure date. Please change departure date.',
          );
        }
      } else {
        ///In case of departure Tab selected
        if (!date.isAfter(_endDate.value ?? DateTime.now())) {
          _startDate.value = date;
          widget.onStartDateChanged?.call(_startDate.value);
          _updateTitle(true);
          _tabController?.animateTo(1);
        } else {
          _startDate.value = date;
          _endDate.value = FlightUtils.nextValidDate(sameDate: date);
          widget.onStartDateChanged?.call(_startDate.value);
          widget.onEndDateChanged?.call(_endDate.value);
          _updateTitle(true);
          _tabController?.animateTo(1);
        }
      }
    } else {
      ///This is the Case of oneWay Trip
      _startDate.value = date;
      widget.onStartDateChanged?.call(_startDate.value);
      if (_endDate.value != null) {
        _endDate.value = null;
        widget.onEndDateChanged?.call(_endDate.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Key sliverAfterKey = Key('sliverAfterKey');
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _titleText,
        builder: (BuildContext context, String value, Widget? child) {
          return SliverAppBarBaseComponent(
            title: value,
            flexibleTitleTopPadding: context.k_16,
            searchBarPadding: EdgeInsets.zero,
            appBarLeftPadding: 0,
            flexibleTitleBottomPadding: context.k_10,
            scrollListener: _scrollListener,
            searchBarMinHeight: tapVisibility
                ? stickyWidgetHeightWithTab
                : stickyWidgetHeightWithoutTab,
            searchBarMaxHeight: tapVisibility
                ? stickyWidgetHeightWithTab
                : stickyWidgetHeightWithoutTab,
            closeScreenWidget: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                key: const Key(FlightAutomationKeys.headerIconKey),
                iconSize: context.k_48,
                visualDensity: VisualDensity.compact,
                splashRadius: context.k_20,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  SvgAssets.closeIcon,
                  height: context.k_14,
                  width: context.k_14,
                  color: closeIconColor,
                ),
              ),
            ),
            stickyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tapVisibility)
                  ADSizedBox(
                    height: context.k_48,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: context.adColors.black,
                      unselectedLabelColor: context.adColors.greyTextColor,
                      labelStyle: ADTextStyle500.size16,
                      indicatorColor: context.adColors.black,
                      unselectedLabelStyle: ADTextStyle400.size14
                          .setTextColor(context.adColors.greyTextColor),
                      onTap: (index) => _updateTitle(index > 0),
                      tabs: [
                        Tab(
                          text: 'departure'.localize(context),
                        ),
                        Tab(
                          text: 'arrival'.localize(context),
                        ),
                      ],
                    ),
                  ),
                if (tapVisibility)
                  const Divider(
                    height: 1,
                  ),
                DayHeaders(),
                const Divider(
                  height: 1,
                ),
              ],
            ),
            body: child ?? const ADSizedBox(),
            titleTextStyle: ADTextStyle700.size22.setTextColor(
              context.adColors.neutralInfoMsg,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                key: _scrollViewKey,
                center: sliverAfterKey,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => BuildMonthItem(
                        index: index,
                        beforeInitialMonth: true,
                        currentDate: widget.currentDate,
                        firstDate: widget.firstDate,
                        initialMonthIndex: _initialMonthIndex,
                        endDate: _endDate,
                        lastDate: widget.lastDate,
                        showAmount: widget.showAmount,
                        startDate: _startDate,
                        updateSelection: _updateSelection,
                        isArrivalSelected: widget.isArrivalSelected,
                      ),
                      // _buildMonthItem(index, true),
                      childCount: _initialMonthIndex,
                    ),
                  ),
                  SliverList(
                    key: sliverAfterKey,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => BuildMonthItem(
                        index: index,
                        beforeInitialMonth: false,
                        currentDate: widget.currentDate,
                        firstDate: widget.firstDate,
                        initialMonthIndex: _initialMonthIndex,
                        endDate: _endDate,
                        lastDate: widget.lastDate,
                        showAmount: widget.showAmount,
                        startDate: _startDate,
                        updateSelection: _updateSelection,
                        isArrivalSelected: arrivalIsSelected,
                      ),
                      // _buildMonthItem(index, false),
                      childCount: _numberOfMonths - _initialMonthIndex,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///this is used to set calender Title
  void _updateTitle(bool isArrival) {
    setState(() {
      _titleText.value = isArrival
          ? 'select_arrival_date'.localize(context)
          : 'select_departure_date'.localize(context);
      arrivalIsSelected = isArrival;
      widget.isArrivalSelected = arrivalIsSelected;
    });
  }
}

// this class is used to highlight the selected tab(Departure or Arrival)
class FocusedDate extends InheritedWidget {
  const FocusedDate({
    Key? key,
    required Widget child,
    this.date,
    this.scrollDirection,
  }) : super(key: key, child: child);

  final DateTime? date;
  final TraversalDirection? scrollDirection;

  @override
  bool updateShouldNotify(FocusedDate oldWidget) {
    return !DateUtils.isSameDay(date, oldWidget.date) ||
        scrollDirection != oldWidget.scrollDirection;
  }

  static FocusedDate? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FocusedDate>();
  }
}
