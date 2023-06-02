/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_srp_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/srp_loading_navigation_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/cab_booking_loading_video_player.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_srp_loading_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabSrpLoadingScreen extends StatefulWidget {
  final SrpLoadingNavigationModel srpLoadingNavigationModel;

  const CabSrpLoadingScreen({
    Key? key,
    required this.srpLoadingNavigationModel,
  }) : super(key: key);

  @override
  State<CabSrpLoadingScreen> createState() => _CabSrpLoadingScreenState();
}

class _CabSrpLoadingScreenState extends State<CabSrpLoadingScreen> {
  final CabSrpLoadingState _cabSrpLoadingState = CabSrpLoadingState();

  @override
  void initState() {
    _cabSrpLoadingState
      ..srpLoadingNavigationModel = widget.srpLoadingNavigationModel
      ..fetchCabData(
        cabSrpCallBackWithResponse: (searchResponseState) => {
          if (mounted)
            {
              Navigator.pop(context),
              widget.srpLoadingNavigationModel.cabSrpCallBackWithResponse
                  .call(searchResponseState),
            },
        },
        cabSrpError: () => {
          if (mounted)
            {
              Navigator.pop(context),
              widget.srpLoadingNavigationModel.cabSrpError.call(),
            },
        },
        moveToSrp: (searchResponseState) => {
          if (mounted)
            {
              moveToSrp(searchResponseState: searchResponseState),
            },
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = context.heightOfScreen * 0.12;
    return Scaffold(
      body: Stack(
        children: [
          const CabBookingLoadingVideoPlayer(
            videoUrl: 'lib/assets/videos/cab_srp_loading.mp4',
          ),
          Positioned(
            bottom: bottomPadding,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  'searching_cabs_near_you'.localize(context),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                ADSizedBox(height: context.k_16),
                Container(
                  height: context.k_2,
                  width: context.k_30,
                  decoration: BoxDecoration(
                    gradient: adGradientColorType3,
                  ),
                ),
                ADSizedBox(height: context.k_20),
                IntrinsicWidth(
                  child: PickupAndDestinationAddressView(
                    pickUpLocationText: _cabSrpLoadingState
                                .srpLoadingNavigationModel?.isFromAirport ??
                            false
                        ? _cabSrpLoadingState
                                .srpLoadingNavigationModel
                                ?.airportTerminalDetailModel
                                ?.airportAddressDescription
                                .toString() ??
                            ''
                        : _cabSrpLoadingState.srpLoadingNavigationModel
                                ?.selectedLocationDetailModel?.description ??
                            '',
                    destinationLocationText: !(_cabSrpLoadingState
                                .srpLoadingNavigationModel?.isFromAirport ??
                            false)
                        ? _cabSrpLoadingState
                                .srpLoadingNavigationModel
                                ?.airportTerminalDetailModel
                                ?.airportAddressDescription
                                .toString() ??
                            ''
                        : _cabSrpLoadingState.srpLoadingNavigationModel
                                ?.selectedLocationDetailModel?.description ??
                            '',
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> moveToSrp({required ADResponseState searchResponseState}) async {
    final CabSrpNavigateModel cabSrpNavigateModel = CabSrpNavigateModel(
      airportTerminalDetailModel: _cabSrpLoadingState
          .srpLoadingNavigationModel?.airportTerminalDetailModel,
      locationAddressDetailModel:
          _cabSrpLoadingState.updatedSelectedAddressModel,
      cabResponse: searchResponseState,
      selectedDate: _cabSrpLoadingState.srpLoadingNavigationModel?.selectedDate,
      isFromAirport:
          _cabSrpLoadingState.srpLoadingNavigationModel?.isFromAirport ?? true,
      updateSelectedDate: widget.srpLoadingNavigationModel.updateSelectedDate,
    );
    adLog(
      Navigator.of(context)
          .pushReplacementNamed(
            cabSrpScreen,
            arguments: cabSrpNavigateModel,
          )
          .toString(),
    );
  }
}
