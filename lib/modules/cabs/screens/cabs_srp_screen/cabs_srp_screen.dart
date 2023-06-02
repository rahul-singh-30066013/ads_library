/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_srp_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_listing_bottom_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cabs_lists_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_util.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabsSrpScreen extends StatefulWidget {
  final CabSrpNavigateModel cabSrpNavigateModel;

  const CabsSrpScreen({Key? key, required this.cabSrpNavigateModel})
      : super(key: key);

  @override
  State<CabsSrpScreen> createState() => _CabsSrpScreenState();
}

class _CabsSrpScreenState extends State<CabsSrpScreen> {
  final double _leadingWidth_42 = 42.sp;
  final double _toolbarHeight = 48.sp;
  final CabsSrpState _cabSrpState = CabsSrpState();
  final GlobalKey contentWidgetKey = GlobalKey();
  double titleWidth = 0;
  String sourceText = '';
  String destinationText = '';

  @override
  void initState() {
    isCabScheduleDateTimeNeedsToUpdate = false;
    _cabSrpState
      ..cabSrpNavigateModel = widget.cabSrpNavigateModel
      ..selectedDate = widget.cabSrpNavigateModel.selectedDate
      ..userSelectedDate = widget.cabSrpNavigateModel.selectedDate
      ..updateCabItinerariesState(widget.cabSrpNavigateModel.cabResponse);

    sourceText =
        'From: ${_cabSrpState.cabSrpNavigateModel?.isFromAirport ?? false ? _cabSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportAddressDescription ?? '' : _cabSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress ?? ''}';
    destinationText =
        'To: ${_cabSrpState.cabSrpNavigateModel?.isFromAirport ?? false ? _cabSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress ?? '' : _cabSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportAddressDescription ?? ''}';

    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => {
        setState(() {
          {
            titleWidth = (contentWidgetKey.currentContext?.size?.width ?? 0.0) +
                (Platform.isAndroid ? context.k_64 + context.k_30 : 0);

            sourceText = CabUtil.buildStringWithThreeDot(
              context,
              titleWidth,
              'From: ${_cabSrpState.cabSrpNavigateModel?.isFromAirport ?? false ? _cabSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportAddressDescription ?? '' : _cabSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress ?? ''}',
              ADTextStyle400.size14,
            );

            destinationText = CabUtil.buildStringWithThreeDot(
              context,
              titleWidth,
              'To: ${_cabSrpState.cabSrpNavigateModel?.isFromAirport ?? false ? _cabSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress ?? '' : _cabSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportAddressDescription ?? ''}',
              ADTextStyle600.size16,
            );
          }
        }),
      },
    );
    super.initState();
  }

  Future<bool> _onWillPopBack() async {
    CabGoogleAnalytics().sendGAParametersCabBookingEditLocation(
      _cabSrpState,
    );

    Navigator.pop(
      context,
      _cabSrpState.cabSrpNavigateModel?.updateSelectedDate
          .call(_cabSrpState.userSelectedDate),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CabsSrpState>(
      viewModel: _cabSrpState,
      child: WillPopScope(
        onWillPop: _onWillPopBack,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 1,
            leadingWidth: Platform.isIOS ? _leadingWidth_42 : context.k_38,
            leading: Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                onPressed: () => _onWillPopBack(),
              ).paddingBySide(
                left: context.k_8,
                top: context.k_4,
              ),
            ),
            toolbarHeight: _toolbarHeight,
            titleSpacing: 0,
            title: Column(
              key: contentWidgetKey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sourceText,
                  maxLines: 1,
                  style: ADTextStyle400.size14
                      .copyWith(color: context.adColors.blackTextColor),
                ),
                ADSizedBox(
                  height: context.k_4,
                ),
                Text(
                  destinationText,
                  maxLines: 1,
                  style: ADTextStyle600.size16
                      .copyWith(color: context.adColors.blackTextColor),
                ),
              ],
            ).paddingBySide(
              top: context.k_4,
              left: Platform.isIOS ? context.k_8 : context.k_16,
              right: context.k_16,
            ),
            actions: [
              Center(
                child: InkWell(
                  onTap: () => _onWillPopBack(),
                  child: Text(
                    'edit_new'.localize(context),
                    maxLines: 1,
                    style: ADTextStyle500.size16.copyWith(
                      decoration: TextDecoration.underline,
                      color: context.adColors.blackTextColor,
                    ),
                  ),
                ).paddingBySide(
                  right: context.k_16,
                  top: context.k_4,
                ),
              ),
            ],
          ),
          body: Selector<CabsSrpState, ADResponseState>(
            selector: (context, cabSrpState) => cabSrpState.cabListingState,
            builder: (context, state, Widget? child) {
              return Selector<CabsSrpState, bool>(
                selector: (context, cabSrpState) => cabSrpState.createBooking,
                builder: (context, createBooking, Widget? child) {
                  return AbsorbPointer(
                    absorbing:
                        state.viewStatus == Status.loading || createBooking,
                    child: Column(
                      children: [
                        Expanded(
                          child: CabsListsView(cabSrpState: _cabSrpState),
                        ),
                        SafeArea(
                          child: CabListingBottomWidget(
                            cabSrpState: _cabSrpState,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
