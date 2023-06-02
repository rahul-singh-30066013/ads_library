/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/saved_flight_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/saved_flights/views/no_flights_saved_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/saved_flights/views/saved_flight_tile.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/saved_flight_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class SavedFlights extends StatefulWidget {
  const SavedFlights({Key? key}) : super(key: key);

  @override
  State<SavedFlights> createState() => _SavedFlightsState();
}

class _SavedFlightsState extends State<SavedFlights> {
  SavedFlightState savedFlightState = SavedFlightState();

  // List<ScrollController> listingControllers = [];

  final double height = 200.sp;

  int pageSize = 10;
  int pageIndex = 1;

  // int? swipedItemIndex;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getSavedFlight(pageIndex: 1);
    scrollController.addListener(pagination);
    callGaEventForSaveFlight();
  }

  void callGaEventForSaveFlight() {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'saved_flight',
      Parameters.source.name: 'profile_menu',
    };
    ClickEvents.saved_flight.logEvent(parameters: obj);
  }

  void callGaEventForSaveFlightOptionSelect({
    required String label,
  }) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'saved_flight',
      Parameters.label.name: label,
    };
    ClickEvents.saved_flight_option_select.logEvent(parameters: obj);
  }

  /// this method is use for scroll dispose
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  /// function handling pagination
  Future<void> pagination() async {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        pageIndex < (savedFlightState.savedFlightResponse.totalPages)) {
      pageIndex = pageIndex + 1;
      await getSavedFlight(pageIndex: pageIndex);
    }
  }

  /// this method is use for saveflight api
  Future<void> getSavedFlight({
    required int pageIndex,
  }) async {
    await savedFlightState.getSavedFlightApi(
      pageSize: pageSize,
      pageIndex: pageIndex,
      language: 'en',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget(
      viewModel: savedFlightState,
      child: Scaffold(
        body: SliverAppBarBaseComponent(
          appBarLeftPadding: 0,
          flexibleTitleTopPadding: context.k_6,
          title: 'saved_flights'.localize(context),
          titleTextStyle: ADTextStyle700.size32,
          actions: [
            Selector<SavedFlightState, int?>(
              selector: (context, stateClass) =>
                  stateClass.savedFlightResponse.flights.length,
              builder: (context, value, Widget? child) {
                final List<SavedFlightListData> savedFlightData =
                    savedFlightState.savedFlightResponse.flights;
                return savedFlightData.isNotEmpty
                    ? TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            context.adColors.greyReviewShade,
                          ),
                        ),
                        onPressed: () => {
                          addFlight(context),
                          callGaEventForSaveFlightOptionSelect(
                            label: 'add_flight'.localize(context),
                          ),
                        },
                        child: Text(
                          'add_flight'.localize(context),
                          style: ADTextStyle400.size14
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ).paddingBySide(right: context.k_8)
                    : const ADSizedBox.shrink();
              },
            ),
          ],
          body: Selector<SavedFlightState, Status?>(
            selector: (context, stateClass) =>
                stateClass.flightListState.viewStatus,
            builder: (context, value, Widget? child) {
              switch (value) {
                case Status.complete:
                  return Column(
                    children: [
                      Expanded(
                        child: Selector<SavedFlightState, int?>(
                          selector: (context, stateClass) =>
                              stateClass.savedFlightResponse.flights.length,
                          builder: (context, value, Widget? child) {
                            final List<SavedFlightListData> savedFlightData =
                                savedFlightState.savedFlightResponse.flights;
                            return savedFlightData.isNotEmpty
                                ? RefreshIndicator(
                                    color: context.adColors.neutralInfoMsg,
                                    onRefresh: () => getPullSavedFlight.call(
                                      index: 0,
                                      isDeleteRequired: false,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: context.k_8,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => savedFlightState
                                                .listingControllers[
                                                    savedFlightState
                                                            .swipedItemIndex ??
                                                        0]
                                                .position
                                                .animateTo(
                                              0,
                                              duration: const Duration(
                                                milliseconds: 50,
                                              ),
                                              curve: Curves.easeOut,
                                            ),
                                            child: ListView.separated(
                                              controller: scrollController,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              padding: EdgeInsets.symmetric(
                                                vertical: context.k_16,
                                              ),
                                              itemCount: savedFlightData.length,
                                              itemBuilder: (context, index) {
                                                return SavedFlightTile(
                                                  scrollController:
                                                      savedFlightState
                                                              .listingControllers[
                                                          index],
                                                  confirmDismiss:
                                                      confirmDismiss,
                                                  index: index,
                                                  flights: savedFlightState
                                                      .savedFlightResponse
                                                      .flights,
                                                  isSwiped: (val) => val
                                                      ? savedFlightState
                                                          .updateSwipedIndex(
                                                          index,
                                                        )
                                                      : savedFlightState
                                                          .updateSwipedIndex(
                                                          null,
                                                        ),
                                                  savedFlightState:
                                                      savedFlightState,
                                                  updateTap:
                                                      (isDeleteRequired) =>
                                                          getPullSavedFlight(
                                                    index: index,
                                                    isDeleteRequired:
                                                        isDeleteRequired,
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (
                                                BuildContext context,
                                                int index,
                                              ) =>
                                                  SizedBox(
                                                height: context.k_20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : NoFlightsSavedScreen();
                          },
                        ),
                      ),
                      Selector<SavedFlightState, Status?>(
                        selector: (context, stateClass) =>
                            stateClass.paginationState.viewStatus,
                        builder: (context, value, Widget? child) {
                          return value == Status.loading
                              ? ADDotProgressView(
                                  color: context.adColors.blackColor,
                                ).paddingAllSide(context.k_40)
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  );
                case Status.loading:
                  return const ShowShimmerForSavedFlight();
                // return Center(
                //   child: ADDotProgressView(
                //     color: context.adColors.blackColor,
                //   ),
                // ).paddingBySide(top: context.k_56);
                case Status.error:
                  return savedFlightState.flightListState.errorCode == 'ADLMS03'
                      ? NoFlightsSavedScreen()
                      : Center(
                          child: Text(
                            savedFlightState.flightListState.message ?? 'NA',
                          ),
                        );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  void addFlight(BuildContext context) {
    /// this is use for shimmer effect back on saved flight

    Future.delayed(
      const Duration(milliseconds: 500),
      () => {
        savedFlightState.savedFlightResponse.flights.clear(),
        savedFlightState.setValueForPullToRefresh(value: false),
      },
    );

    navigateToScreenWithRootNavigatorResult(
      context,
      addFlightInformation,
    ).then(
      (value) => context.read<SavedFlightState>().getSavedFlightApi(
            pageIndex: 1,
            pageSize: pageSize,
            language: 'en',
          ),
    );
  }

  Future<void> getPullSavedFlight({
    required int index,
    required bool isDeleteRequired,
  }) async {
    /// this is use for manually delete item from list
    if (isDeleteRequired) {
      setState(() {
        final isRemovedLocal =
            savedFlightState.savedFlightResponse.flights.removeAt(index);
        adLog(isRemovedLocal.toString());
      });
    } else {
      pageIndex = 1;
      savedFlightState.setValueForPullToRefresh(value: true);
      await getSavedFlight(pageIndex: 1);
    }
  }

  Future<bool> confirmDismiss(BuildContext context, int index) async {
    bool isRemoved = false;
    await adShowBottomSheet(
      context: context,
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'are_you_sure_flight'.localize(context),
            style: ADTextStyle400.size16,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.adColors.whiteTextColor,
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: context.adColors.neutralInfoMsg,
                      ),
                    ),
                  ),
                  onPressed: () => isRemoved =
                      onBottomSheetButtonTap(isRemoved: false, index: index),
                  child: Text(
                    'cancel'.localize(context),
                    style: ADTextStyle400.size16,
                  ).paddingBySide(bottom: context.k_14, top: context.k_14),
                ),
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                  onPressed: () => isRemoved =
                      onBottomSheetButtonTap(isRemoved: true, index: index),
                  child: Text(
                    'remove'.localize(context),
                    style: ADTextStyle700.size16
                        .setTextColor(context.adColors.whiteTextColor),
                  ).paddingBySide(bottom: context.k_14, top: context.k_14),
                ),
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ],
      ),
      headerTitle: 'remove_flight'.localize(context),
    );
    return isRemoved;
  }

  /// this method is use for show bottom sheet
  bool onBottomSheetButtonTap({
    required bool isRemoved,
    required int index,
  }) {
    if (isRemoved) {
      savedFlightState
          .deleteSavedFlightApi(
        context: context,
        cartId: savedFlightState.savedFlightResponse.flights[index].cardId,
        index: index,
      )
          .then(
        (value) {
          ///locally deleting the item on index without calling the api again.
          getPullSavedFlight(
            index: index,
            isDeleteRequired: true,
          );
        },
      );
    }
    Navigator.pop(context);
    return isRemoved;
  }

  /// this method is used for dismiss
  void onDismissed(int index) {
    final ScaffoldFeatureController scaffoldFeatureController =
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${savedFlightState.savedFlightResponse.flights[index]} dismissed',
        ),
      ),
    );
    adLog(scaffoldFeatureController.toString());
    setState(() {
      final abc = savedFlightState.savedFlightResponse.flights.removeAt(index);
      adLog(abc.toString());
    });
  }
}

class ShowShimmerForSavedFlight extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForSavedFlight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int shimmerCount = 6;
    final double widthOfShimmer = 100.sp;
    final double widthOfShimmerEnd = 80.sp;

    return ListView.builder(
      itemCount: shimmerCount,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_18,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: context.adColors.dividerColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: widthOfShimmer,
                    height: context.k_14,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: widthOfShimmer,
                    height: context.k_14,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: context.k_64,
                    height: context.k_14,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: context.k_64,
                    height: context.k_14,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: context.k_64,
                    height: context.k_24,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: context.k_64,
                    height: context.k_24,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: widthOfShimmerEnd,
                    height: context.k_10,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    width: widthOfShimmerEnd,
                    height: context.k_10,
                  ),
                ],
              ),
            ],
          ),
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          bottom: context.k_10,
        );
      },
    );
  }
}
