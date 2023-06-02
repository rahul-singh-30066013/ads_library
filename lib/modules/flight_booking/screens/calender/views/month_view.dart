/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math' as math;

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/display_model/fare_calendar_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/calendar_date_range_picker.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

final selectionRangeHeight = (ADTextStyle400.size14.fontSize ?? 0) + 22;

class MonthItemGridDelegate extends SliverGridDelegate {
  const MonthItemGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth =
        (constraints.crossAxisExtent - 2 * horizontalPadding) /
            DateTime.daysPerWeek;
    return MonthSliverGridLayout(
      crossAxisCount: DateTime.daysPerWeek + 2,
      dayChildWidth: tileWidth,
      edgeChildWidth: horizontalPadding,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(MonthItemGridDelegate oldDelegate) => false;
}

const MonthItemGridDelegate monthItemGridDelegate = MonthItemGridDelegate();

class MonthSliverGridLayout extends SliverGridLayout {
  const MonthSliverGridLayout({
    required this.crossAxisCount,
    required this.dayChildWidth,
    required this.edgeChildWidth,
    required this.reverseCrossAxis,
  })  : assert(crossAxisCount > 0),
        assert(dayChildWidth >= 0),
        assert(edgeChildWidth >= 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The width in logical pixels of the day child widgets.
  final double dayChildWidth;

  /// The width in logical pixels of the edge child widgets.
  final double edgeChildWidth;

  final bool reverseCrossAxis;

  /// The number of logical pixels from the leading edge of one row to the
  /// leading edge of the next row.
  double get _rowHeight {
    return monthItemRowHeight + monthItemSpaceBetweenRows;
  }

  /// The height in logical pixels of the children widgets.
  double get _childHeight {
    return monthItemRowHeight;
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return crossAxisCount * (scrollOffset ~/ _rowHeight);
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    final int mainAxisCount = (scrollOffset / _rowHeight).ceil();
    return math.max(0, crossAxisCount * mainAxisCount - 1);
  }

  double _getCrossAxisOffset(double crossAxisStart, bool isPadding) {
    if (reverseCrossAxis) {
      return ((crossAxisCount - 2) * dayChildWidth + 2 * edgeChildWidth) -
          crossAxisStart -
          (isPadding ? edgeChildWidth : dayChildWidth);
    }
    return crossAxisStart;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final int adjustedIndex = index % crossAxisCount;
    final bool isEdge =
        adjustedIndex == 0 || adjustedIndex == crossAxisCount - 1;
    final double crossAxisStart =
        math.max(0, (adjustedIndex - 1) * dayChildWidth + edgeChildWidth);

    return SliverGridGeometry(
      scrollOffset: (index ~/ crossAxisCount) * _rowHeight,
      crossAxisOffset: _getCrossAxisOffset(crossAxisStart, isEdge),
      mainAxisExtent: _childHeight,
      crossAxisExtent: isEdge ? edgeChildWidth : dayChildWidth,
    );
  }

  @override
  double computeMaxScrollOffset(int childCount) {
    assert(childCount >= 0);
    final int mainAxisCount = ((childCount - 1) ~/ crossAxisCount) + 1;
    final double mainAxisSpacing = _rowHeight - _childHeight;
    return _rowHeight * mainAxisCount - mainAxisSpacing;
  }
}

class MonthItem extends StatefulWidget {
  /// Creates a month item.
  MonthItem({
    Key? key,
    required this.selectedDateStart,
    required this.selectedDateEnd,
    required this.currentDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
    required this.displayedMonth,
    this.dragStartBehavior = DragStartBehavior.start,
    this.showAmount = true,
    required this.isArrivalSelected,
  })  : assert(!firstDate.isAfter(lastDate)),
        assert(
          selectedDateStart == null ||
              !selectedDateStart.isBefore(
                firstDate,
              ),
        ),
        assert(selectedDateEnd == null || !selectedDateEnd.isBefore(firstDate)),
        assert(
          selectedDateStart == null || !selectedDateStart.isAfter(lastDate),
        ),
        assert(selectedDateEnd == null || !selectedDateEnd.isAfter(lastDate)),
        assert(
          selectedDateStart == null ||
              selectedDateEnd == null ||
              !selectedDateStart.isAfter(selectedDateEnd),
        ),
        super(key: key);

  /// The currently selected start date.
  ///
  /// This date is highlighted in the picker.
  final DateTime? selectedDateStart;

  /// The currently selected end date.
  ///
  /// This date is highlighted in the picker.
  final DateTime? selectedDateEnd;

  /// The current date at the time the picker is displayed.
  final DateTime currentDate;

  /// Called when the user picks a day.
  final ValueChanged<DateTime> onChanged;

  /// The earliest date the user is permitted to pick.
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  final DateTime lastDate;

  /// The month whose days are displayed by this picker.
  final DateTime displayedMonth;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], the drag gesture used to scroll a
  /// date picker wheel will begin at the position where the drag gesture won
  /// the arena. If set to [DragStartBehavior.down] it will begin at the position
  /// where a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for
  ///    the different behaviors.
  final DragStartBehavior dragStartBehavior;

  final bool showAmount;

  final bool isArrivalSelected;

  @override
  MonthItemState createState() => MonthItemState();
}

class MonthItemState extends State<MonthItem> {
  /// List of [FocusNode]s, one for each day of the month.
  late List<FocusNode> _dayFocusNodes;

  @override
  void initState() {
    super.initState();

    final int daysInMonth = DateUtils.getDaysInMonth(
      widget.displayedMonth.year,
      widget.displayedMonth.month,
    );
    _dayFocusNodes = List<FocusNode>.generate(
      daysInMonth,
      (int index) => FocusNode(
        skipTraversal: true,
        debugLabel: 'Day ${index + 1}',
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check to see if the focused date is in this month, if so focus it.
    final DateTime? focusedDate = FocusedDate.of(context)?.date;
    if (focusedDate != null &&
        DateUtils.isSameMonth(widget.displayedMonth, focusedDate)) {
      _dayFocusNodes[focusedDate.day - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in _dayFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Color _highlightColor(BuildContext context) {
    ///TODO: Need to add in styleguide
    return const Color(0xfff2f2f2);
  }

  void _dayFocusChanged(bool focused) {
    if (focused) {
      final TraversalDirection? focusDirection =
          FocusedDate.of(context)?.scrollDirection;
      if (focusDirection != null) {
        ScrollPositionAlignmentPolicy policy =
            ScrollPositionAlignmentPolicy.explicit;
        switch (focusDirection) {
          case TraversalDirection.up:
          case TraversalDirection.left:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtStart;
            break;
          case TraversalDirection.right:
          case TraversalDirection.down:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtEnd;
            break;
        }
        Scrollable.ensureVisible(
          primaryFocus?.context ?? context,
          duration: monthScrollDuration,
          alignmentPolicy: policy,
        );
      }
    }
  }

  Widget _buildDayItem(
    BuildContext context,
    DateTime dayToBuild,
    String i,
    int firstDayOffset,
    int daysInMonth,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final TextDirection textDirection = Directionality.of(context);
    final Color highlightColor = _highlightColor(context);
    final int day = dayToBuild.day;
//    amount = dayToBuild.day * dayToBuild.month;
    final bool isDisabled = dayToBuild.isAfter(widget.lastDate) ||
        dayToBuild.isBefore(widget.firstDate);

    BoxDecoration? decoration;
    TextStyle? itemStyle = ADTextStyle400.size14.setTextColor(
      context.adColors.blackColor,
    );

    final bool isRangeSelected =
        widget.selectedDateStart != null && widget.selectedDateEnd != null;
    final bool isSelectedDayStart = widget.selectedDateStart != null &&
        dayToBuild.isAtSameMomentAs(widget.selectedDateStart!);
    final bool isSelectedDayEnd = widget.selectedDateEnd != null &&
        dayToBuild.isAtSameMomentAs(widget.selectedDateEnd!);
    final bool isInRange = isRangeSelected &&
        dayToBuild.isAfter(widget.selectedDateStart!) &&
        dayToBuild.isBefore(widget.selectedDateEnd!);

    HighlightPainter? highlightPainter;

    if (isSelectedDayStart || isSelectedDayEnd) {
      // The selected start and end dates gets a circle background
      // highlight, and a contrasting text color.
      itemStyle = ADTextStyle400.size14.setTextColor(
        context.adColors.whiteTextColor,
      );
      decoration = const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      );

      if (isRangeSelected &&
          widget.selectedDateStart != widget.selectedDateEnd) {
        final HighlightPainterStyle style = isSelectedDayStart
            ? HighlightPainterStyle.highlightTrailing
            : HighlightPainterStyle.highlightLeading;
        highlightPainter = HighlightPainter(
          color: highlightColor,
          style: style,
          textDirection: textDirection,
        );
      }
    } else if (isInRange) {
      // The days within the range get a light background highlight.
      highlightPainter = HighlightPainter(
        color: highlightColor,
        style: HighlightPainterStyle.highlightAll,
        textDirection: textDirection,
      );
    } else if (isDisabled) {
      itemStyle = ADTextStyle400.size14.setTextColor(
        context.adColors.lightGreyTextColor,
      );
    } else if (DateUtils.isSameDay(widget.currentDate, dayToBuild)) {
      ///TODO
      /// The current day gets a different text color and a circle stroke
      // border.
      //   itemStyle = textTheme.bodyText2?.apply(color: colorScheme.primary);
      // );
    }

    String semanticLabel =
        '${localizations.formatDecimal(day)}, ${localizations.formatFullDate(dayToBuild)}';
    if (isSelectedDayStart) {
      semanticLabel =
          localizations.dateRangeStartDateSemanticLabel(semanticLabel);
    } else if (isSelectedDayEnd) {
      semanticLabel =
          localizations.dateRangeEndDateSemanticLabel(semanticLabel);
    }

    ///fetching all the fareCalendarObjects from common state
    final fareCalendarAllObjects =
        context.watch<FlightCommonState>().fareCalendarAllObjects;

    ///checking departure farecalendar state
    final departureLoadingStatus =
        context.watch<FlightCommonState>().fareCalenderState.viewStatus;

    ///checking arrival farecalendar state
    final arrivalLoadingStatus =
        context.watch<FlightCommonState>().fareCalenderArrivalState.viewStatus;

    ///fetching selected trip detail for fromCity and toCity
    final tripDetails = context.watch<FlightCommonState>().tripDetailModel;

    /// getting calendar date to fetch the calendar fare
    final calendarDate = FormattedDate.getFormattedStringFromDate(
      dayToBuild,
      Constant.dateFormat5,
    );

    final FareCalendarPrice fareCalendarPrice = FareCalendarPrice();

    /// fetching fareCalendar price object
    final priceObject = fareCalendarPrice.getFareCalendarPrice(
      calendarDate,
      tripDetailModel: tripDetails,
      isArrivalSelected: widget.isArrivalSelected ? true : false,
      fareCalendarAllObjects: fareCalendarAllObjects,
    );
    final priceToShow = priceObject?.price;
    final priceColor = priceObject?.color;
    const double maxRangeForKFormat = 100000;
    Widget dayWidget = Column(
      children: [
        Container(
          decoration: decoration,
          child: Center(
            child: Semantics(
              label: semanticLabel,
              selected: isSelectedDayStart || isSelectedDayEnd,
              child: ExcludeSemantics(
                child: Container(
                  margin: EdgeInsets.all(
                    context.k_10,
                  ),
                  child: Center(
                    child: Text(
                      localizations.formatDecimal(day),
                      style: itemStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: context.k_2),
        if (widget.isArrivalSelected &&
            arrivalLoadingStatus == Status.loading &&
            widget.showAmount)
          const ShimmerWidget()
        else if (!widget.isArrivalSelected &&
            departureLoadingStatus == Status.loading &&
            widget.showAmount)
          const ShimmerWidget()
        else
          (widget.showAmount && priceToShow != null)
              ? priceToShow < maxRangeForKFormat
                  ? Text(
                      FlightUtils.getPriceFormatWithSymbol(price: priceToShow),
                      style: TextStyle(
                        fontSize: context.k_10,
                        color: priceColor,
                      ),
                    )
                  : Text(
                      FlightUtils.getPriceFormatWithKFormat(
                        price: priceToShow,
                        maxRange: maxRangeForKFormat,
                      ),
                      style: TextStyle(
                        fontSize: context.k_10,
                        color: priceColor,
                      ),
                    )
              : const SizedBox.shrink(),
      ],
    );

    if (highlightPainter != null) {
      dayWidget = CustomPaint(
        painter: highlightPainter,
        child: dayWidget,
      );
    }

    if (!isDisabled) {
      dayWidget = InkResponse(
        highlightColor: context.adColors.greyReviewShade,
        focusNode: _dayFocusNodes[day - 1],
        onTap: () => widget.onChanged(dayToBuild),
        radius: monthItemRowHeight / 2 + 4,
        splashColor: context.adColors.greyReviewShade.withOpacity(0.38),
        onFocusChange: _dayFocusChanged,
        child: dayWidget,
      );
    }

    return dayWidget;
  }

  Widget _buildEdgeContainer(BuildContext context, bool isHighlighted) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            color: isHighlighted ? _highlightColor(context) : null,
            height: selectionRangeHeight,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final int year = widget.displayedMonth.year;
    final int month = widget.displayedMonth.month;
    final int daysInMonth = DateUtils.getDaysInMonth(year, month);
    final int dayOffset = DateUtils.firstDayOffset(year, month, localizations);
    final int weeks = ((daysInMonth + dayOffset) / DateTime.daysPerWeek).ceil();
    final double gridHeight =
        weeks * monthItemRowHeight + (weeks - 1) * monthItemSpaceBetweenRows;
    final List<Widget> dayItems = <Widget>[];

    //  amount = amount + 1;
    for (int i = 0; true; i += 1) {
      // 1-based day of month, e.g. 1-31 for January, and 1-29 for February on
      // a leap year.
      final int day = i - dayOffset + 1;
      if (day > daysInMonth) break;
      if (day < 1) {
        dayItems.add(Container());
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        final Widget dayItem = _buildDayItem(
          context,
          dayToBuild,
          amount,
          dayOffset,
          daysInMonth,
        );
        dayItems.add(dayItem);
      }
    }

    /// Add the leading/trailing edge containers to each week in order to
    ///correctly extend the range highlight.
    final List<Widget> paddedDayItems = <Widget>[];
    for (int i = 0; i < weeks; i++) {
      final int start = i * DateTime.daysPerWeek;

      final int end = math.min(
        start + DateTime.daysPerWeek,
        dayItems.length,
      );
      final List<Widget> weekList = dayItems.sublist(start, end);

      final DateTime dateAfterLeadingPadding =
          DateTime(year, month, start - dayOffset + 1);

      /// Only color the edge container if it is after the start date and
      /// on/before the end date.
      final bool isLeadingInRange = !(dayOffset > 0 && i == 0) &&
          widget.selectedDateStart != null &&
          widget.selectedDateEnd != null &&
          dateAfterLeadingPadding.isAfter(widget.selectedDateStart!) &&
          !dateAfterLeadingPadding.isAfter(widget.selectedDateEnd!);
      weekList.insert(0, _buildEdgeContainer(context, isLeadingInRange));

      /// Only add a trailing edge container if it is for a full week and not a
      /// partial week.
      if (end < dayItems.length ||
          (end == dayItems.length &&
              dayItems.length % DateTime.daysPerWeek == 0)) {
        final DateTime dateBeforeTrailingPadding =
            DateTime(year, month, end - dayOffset);

        /// Only color the edge container if it is on/after the start date and
        /// before the end date.
        final bool isTrailingInRange = widget.selectedDateStart != null &&
            widget.selectedDateEnd != null &&
            !dateBeforeTrailingPadding.isBefore(widget.selectedDateStart!) &&
            dateBeforeTrailingPadding.isBefore(widget.selectedDateEnd!);
        weekList.add(_buildEdgeContainer(context, isTrailingInRange));
      }

      paddedDayItems.addAll(weekList);
    }

    final double maxWidth = maxCalendarWidthPortrait;
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          height: monthItemHeaderHeight,
          padding: EdgeInsets.symmetric(horizontal: context.k_16),
          alignment: AlignmentDirectional.centerStart,
          child: ExcludeSemantics(
            child: Text(
              localizations.formatMonthYear(widget.displayedMonth),
              style: ADTextStyle700.size16
                  .setTextColor(context.adColors.blackColor),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: gridHeight,
          ),
          child: GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: monthItemGridDelegate,
            childrenDelegate: SliverChildListDelegate(
              paddedDayItems,
              addRepaintBoundaries: false,
            ),
          ),
        ),
        const ADSizedBox(height: monthItemFooterHeight),
      ],
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ADShimmerBuilder(
        shimmerBuilderType: ShimmerBuilderType.listVertical,
        shimmerWidget: ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          height: context.k_4,
          width: context.k_8,
          detailTextWidth: context.k_4,
          detailTextHeight: context.k_8,
        ),
      ),
    );
  }
}
