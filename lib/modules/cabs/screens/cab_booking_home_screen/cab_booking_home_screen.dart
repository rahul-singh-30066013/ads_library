/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/select_destination_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/srp_loading_navigation_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/cab_booking_builder/cab_booking_home_screen_builder.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/cab_booking_home_shimmer_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/cabs_not_found_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/cached_image/constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabBookingHomeScreen extends StatefulWidget {
  const CabBookingHomeScreen({Key? key}) : super(key: key);

  @override
  State<CabBookingHomeScreen> createState() => _CabBookingHomeScreenState();
}

class _CabBookingHomeScreenState extends State<CabBookingHomeScreen> {
  final CabBookingState _cabBookingState = CabBookingState();
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> _dynamicTitle = ValueNotifier<String>('');
  final _percentageOfScrollScreen = 65.sp;
  final double _leadingWidth_42 = 42.sp;
  final double _expandedHeight = 20.sp;
  static const _elevationHeight = 0.5;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _cabBookingState.getAirportListForCabs(context);
    super.initState();
  }

  @override
  void dispose() {
    _dynamicTitle.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;
    _dynamicTitle.value =
        percentageOfScroll <= _percentageOfScrollScreen ? '' : '';
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    scrollTabScreensToTop(scrollController: _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CabBookingState>(
      key: const Key('DashBoard'),
      viewModel: _cabBookingState,
      child: ScrollsToTop(
        onScrollsToTop: _onScrollsToTop,
        child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                  pinned: true,
                  title: AnimatedBuilder(
                    animation: Listenable.merge([_dynamicTitle]),
                    builder: (BuildContext context, _) => Text(
                      _dynamicTitle.value,
                      style: ADTextStyle700.size22,
                      maxLines: 1,
                    ),
                  ),
                  titleSpacing: context.k_10,
                  leadingWidth:
                      Platform.isIOS ? _leadingWidth_42 : context.k_38,
                  leading: const BackButton().paddingBySide(left: context.k_8),
                  expandedHeight: _expandedHeight,
                  elevation: _elevationHeight,
                ),
              ],
              body: Selector<CabBookingState, ADResponseState>(
                selector: (context, cabBookingState) =>
                    cabBookingState.cabHomeScreenResponseState,
                builder: (context, cabLandingState, Widget? child) {
                  switch (cabLandingState.viewStatus) {
                    case Status.loading:
                      return const CabBookingHomeShimmerView();
                    case Status.error:
                      return Center(
                        child: NoDataFoundErrorScreen(
                          errorTitle: cabLandingState.message ??
                              'ADLMS02'.localize(context),
                          onRetryTap: () =>
                              _cabBookingState.getAirportListForCabs(context),
                        ),
                      );
                    case Status.complete:
                      return ListView.builder(
                        controller: PrimaryScrollController.of(context),
                        physics: const BouncingScrollPhysics(),
                        itemCount: (cabLandingState.data
                                as List<DutyFreeDashboardItem>)
                            .length,
                        padding: EdgeInsets.only(bottom: context.k_60),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            CabBookingHomeScreenBuilder(
                          cabBookingState: _cabBookingState,
                          dashBoardItem: (cabLandingState.data
                              as List<DutyFreeDashboardItem>)[index],
                          searchTap: searchTap,
                          navigatorTap: (value) => navigateRoute(
                            isFromAirport: value.isFromAirport ?? true,
                            isAirportLocationTap:
                                value.isAirportLocationTap ?? true,
                          ),
                        ),
                      );
                    default:
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCabNotFoundBottomSheet({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subTitle,
    required String buttonTittle,
    required CabBookingState cabBookingState,
  }) {
    adShowBottomSheet(
      context: context,
      childWidget: CabsNotFoundView(
        imagePath: imagePath,
        title: title,
        subTitle: subTitle,
        buttonTittle: buttonTittle,
        buttonAction: () => {
          CabGoogleAnalytics().sendGAParametersChangeLocation(
            cabBookingState,
            title,
            subTitle,
          ),
        },
      ),
      headerTitle: '',
      isPaddingRequired: false,
    );
  }

  void searchTap() {
    if (_cabBookingState.selectedAirportTerminalDetailModel?.airportName !=
            null &&
        _cabBookingState.selectedAddressDetailModel?.description != null) {
      CabGoogleAnalytics().sendGACabBookingSearchCabs(_cabBookingState);
      const duration = 3000;
      if (_cabBookingState.selectedDate
              ?.difference(DateTime.now())
              .isNegative ??
          false) {
        SnackBarUtil.showSnackBar(
          context,
          'please_select_a_valid_date_and_time'.localize(context),
          duration,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_64 + context.k_30,
          ),
        );
      } else {
        navigateToScreenWithRootNavigatorResult(
          context,
          cabSrpLoadingScreen,
          argumentObject: SrpLoadingNavigationModel(
            airportTerminalDetailModel:
                _cabBookingState.selectedAirportTerminalDetailModel,
            isFromAirport: _cabBookingState.isFromAirport,
            selectedDate: _cabBookingState.selectedDate,
            updateSelectedDate: (date) => {
              _cabBookingState.updateScheduleTime(date),
            },
            cabSrpError: () => {
              SnackBarUtil.showSnackBar(
                context,
                'something_went_wrong'.localize(context),
                duration,
                EdgeInsets.symmetric(
                  horizontal: context.k_16,
                  vertical: context.k_64 + context.k_30,
                ),
              ),
            },
            cabSrpCallBackWithResponse: (searchResponse) => {
              if (searchResponse?.successCode ==
                  CabBookingErrorCode.cabB12.name)
                {
                  _showCabNotFoundBottomSheet(
                    context: context,
                    imagePath:
                        'lib/assets/images/cab_booking/cab_outside_city_limits.png',
                    title: (_cabBookingState.isFromAirport
                            ? 'drop_location_not_serviceable'
                            : 'pickup_location_not_serviceable')
                        .localize(context),
                    subTitle: (_cabBookingState.isFromAirport
                            ? 'our_partners_are_not_providing_service_for_selected_drop_location'
                            : 'our_partners_are_not_providing_service_for_selected_pickup_location')
                        .localize(context),
                    buttonTittle: (_cabBookingState.isFromAirport
                            ? 'change_drop_location'
                            : 'change_pickup_location')
                        .localize(context),
                    cabBookingState: _cabBookingState,
                  ),
                }
              else
                {
                  SnackBarUtil.showSnackBar(
                    context,
                    searchResponse?.message ?? 'ADLMS02'.localize(context),
                    duration,
                    EdgeInsets.symmetric(
                      horizontal: context.k_16,
                      vertical: context.k_64 + context.k_30,
                    ),
                  ),
                },
            },
            selectedLocationDetailModel:
                _cabBookingState.selectedAddressDetailModel,
          ),
        ).then((value) => adLog(value));
      }
    } else {
      if (_cabBookingState.selectedAirportTerminalDetailModel
                  ?.airportAddressDescription ==
              null &&
          _cabBookingState.selectedAddressDetailModel?.description == null) {
        navigateRoute(
          isFromAirport: _cabBookingState.isFromAirport,
          isAirportLocationTap: _cabBookingState.isFromAirport,
        );
      } else if (_cabBookingState
              .selectedAirportTerminalDetailModel?.airportName ==
          null) {
        navigateRoute(
          isFromAirport: _cabBookingState.isFromAirport,
          isAirportLocationTap: true,
        );
      } else if (_cabBookingState.selectedAddressDetailModel?.description ==
          null) {
        navigateRoute(
          isFromAirport: _cabBookingState.isFromAirport,
          isAirportLocationTap: false,
        );
      }
    }
  }

  void navigateRoute({
    required bool isFromAirport,
    required bool isAirportLocationTap,
  }) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      selectDestinationScreen,
      argumentObject: SelectDestinationNavigateModel(
        airportUpdatedDetailedListForCab:
            _cabBookingState.airportUpdatedDetailedListForCab,
        airportTerminalDetailModel:
            _cabBookingState.selectedAirportTerminalDetailModel,
        isFromAirport: isFromAirport,
        airportLocationChange: (airportTerminalDetailModel) =>
            updateSelectedAirport(
          airportTerminalDetailModel,
        ),
        selectedDate: _cabBookingState.selectedDate,
        isAirportLocationTap: isAirportLocationTap,
        selectedLocationChange: (searchAddressModel) =>
            _cabBookingState.updateLocation(searchAddressModel),
        selectedLocationDetailModel:
            _cabBookingState.selectedAddressDetailModel,
      ),
    );
  }

  void updateSelectedAirport(
    AirportTerminalDetailModel? airportTerminalDetailModel,
  ) {
    _cabBookingState
        .updateSelectedAirportTerminalDetailModel(airportTerminalDetailModel);
  }
}
