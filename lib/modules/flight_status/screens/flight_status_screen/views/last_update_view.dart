/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/bordered_text_with_icon_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns Last Update View for Flight status Screen View
class LastUpdateView extends StatefulWidget {
  final ADTapCallback refreshTap;
  final ADTapCallback showDateListBottomSheet;
  final ADTapCallback showTerminalBottomSheet;
  final ADTapCallback showArrivalDepartureBottomSheet;

  const LastUpdateView({
    Key? key,
    required this.refreshTap,
    required this.showDateListBottomSheet,
    required this.showTerminalBottomSheet,
    required this.showArrivalDepartureBottomSheet,
  }) : super(key: key);

  @override
  State<LastUpdateView> createState() => _LastUpdateViewState();
}

class _LastUpdateViewState extends State<LastUpdateView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double transformBeginValue = 0;
  double transformEndValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Selector<FlightStatusState, FlightType>(
                selector: (context, viewModel) => viewModel.flightType,
                builder: (context, flightType, Widget? child) {
                  return BorderedTextWithIconView(
                    onTap: widget.showArrivalDepartureBottomSheet,
                    text: flightType == FlightType.arrival
                        ? 'arrivals_flight_status'.localize(context)
                        : 'departure_flight_status'.localize(context),
                    svgAssets: SvgAssets.trailingArrow,
                  );
                },
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Selector<FlightStatusState, String>(
                selector: (context, viewModel) => viewModel.selectedTerminal,
                builder: (context, selectedTerminal, Widget? child) {
                  return BorderedTextWithIconView(
                    onTap: widget.showTerminalBottomSheet,
                    text: selectedTerminal,
                    svgAssets: SvgAssets.trailingArrow,
                  );
                },
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Selector<FlightStatusState, DateTime>(
                selector: (context, viewModel) => viewModel.date,
                builder: (context, date, Widget? child) {
                  return BorderedTextWithIconView(
                    onTap: widget.showDateListBottomSheet,
                    text: DateFormat(Constant.dateFormat10).format(
                      date,
                    ),
                    svgAssets: SvgAssets.calendar,
                    iconData: Icons.calendar_today_outlined,
                  );
                },
              ),
            ],
          ),
        ),
        ADSizedBox(
          height: context.k_16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<FlightStatusState, DateTime>(
              selector: (context, viewModel) => viewModel.lastUpdatedTime,
              builder: (context, lastUpdatedTime, Widget? child) {
                return Text(
                  '${'last_updated'.localize(context)} ${DateFormat(Constant.dateFormat7).format(
                    lastUpdatedTime,
                  )}',
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                );
              },
            ),
            ADSizedBox(
              width: context.k_6,
            ),
            ADSizedBox(
              width: context.k_14,
              height: context.k_14,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: widget.refreshTap,
                splashRadius: context.k_20,
                icon: Selector<FlightStatusState, bool>(
                  selector: (context, viewModel) => viewModel.isAbsorbing,
                  builder: (context, isAbsorbing, Widget? child) {
                    // isAbsorbing ? _controller?.repeat() : _controller?.stop();
                    return RotationTransition(
                      turns: Tween(
                        begin: transformBeginValue,
                        end: transformEndValue,
                      ).animate(
                        _controller ?? AnimationController(vsync: this),
                      ),
                      child: SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/refresh.svg',
                        color: context.adColors.darkGreyTextColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
      bottom: context.k_16,
      top: context.k_20,
    );
  }
}
