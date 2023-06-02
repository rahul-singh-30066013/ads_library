/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'dart:io';

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/select_destination_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/airport_selection_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/destination_address_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/list_header_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/select_destination_header_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class SelectDestinationScreen extends StatefulWidget {
  final SelectDestinationNavigateModel selectDestinationNavigateModel;

  const SelectDestinationScreen({
    Key? key,
    required this.selectDestinationNavigateModel,
  }) : super(key: key);

  @override
  State<SelectDestinationScreen> createState() =>
      _SelectDestinationScreenState();
}

class _SelectDestinationScreenState extends State<SelectDestinationScreen> {
  final double _leadingWidth_42 = 42.sp;
  final double _toolbarHeight = 116.sp;
  final SelectDestinationState selectDestinationState =
      SelectDestinationState();

  @override
  void initState() {
    selectDestinationState
      ..getRecentSearches()
      ..getAirportsRecentSearches()
      ..updateSelectedAirportTerminalDetailModel(
        widget.selectDestinationNavigateModel.airportTerminalDetailModel,
      )
      ..selectDestinationNavigateModel = widget.selectDestinationNavigateModel
      ..airportController.text = selectDestinationState
              .selectedAirportTerminalDetailModel?.airportAddressDescription ??
          ''
      ..destinationController.text = selectDestinationState
              .selectDestinationNavigateModel
              ?.selectedLocationDetailModel
              ?.description ??
          '';
    if (selectDestinationState
            .selectDestinationNavigateModel?.isAirportLocationTap ??
        false) {
      selectDestinationState.sourceFocusNode.requestFocus();
      selectDestinationState.airportController.selection =
          TextSelection.collapsed(
        offset: selectDestinationState.airportController.text.length,
      );
    } else {
      selectDestinationState.focusNodeDestination.requestFocus();
      selectDestinationState.destinationController.selection =
          TextSelection.collapsed(
        offset: selectDestinationState.destinationController.text.length,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    selectDestinationState.airportController.dispose();
    selectDestinationState.destinationController.dispose();
    selectDestinationState.sourceFocusNode.dispose();
    selectDestinationState.focusNodeDestination.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<SelectDestinationState>(
      viewModel: selectDestinationState,
      child: Consumer<SelectDestinationState>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: Platform.isIOS ? _leadingWidth_42 : context.k_38,
              leading: Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  onPressed: () => backButtonClick(selectDestinationState),
                ).paddingBySide(
                  left: context.k_8,
                  top: context.k_4,
                ),
              ),
              toolbarHeight: _toolbarHeight,
              titleSpacing: context.k_16,
              title: SelectDestinationHeaderWidget(
                viewModel: viewModel,
                sourceTap: () => {
                  selectDestinationState.sourceFocusNode.requestFocus(),
                  selectDestinationState.airportController.selection =
                      TextSelection.collapsed(
                    offset:
                        selectDestinationState.airportController.text.length,
                  ),
                  selectDestinationState.otherLocationsTextFieldScrollController
                      .jumpTo(0),
                  selectDestinationState.updateListOnFocusChange(),
                },
                destinationTap: () => {
                  selectDestinationState.focusNodeDestination.requestFocus(),
                  selectDestinationState.destinationController.selection =
                      TextSelection.collapsed(
                    offset: selectDestinationState
                        .destinationController.text.length,
                  ),
                  selectDestinationState.airportTextFieldScrollController
                      .jumpTo(0),
                  selectDestinationState.updateListOnFocusChange(),
                },
              ).paddingBySide(top: context.k_8),
            ),
            body: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectDestinationState.focusNodeDestination.hasFocus)
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          ListHeaderWidget(
                            headerWidget: viewModel.headerWidget,
                            searchQuery: viewModel.searchQuery ?? '',
                            viewModel: viewModel,
                            minimumCharacterCount:
                                viewModel.minimumCharacterCountForSearchQuery,
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return DestinationAddressWidget(
                                location:
                                    viewModel.filteredDestinationsList[index],
                                headerWidget: viewModel.headerWidget,
                                onTap: () => {
                                  CabGoogleAnalytics()
                                      .sendGACabBookingDestinationSelect(
                                    viewModel,
                                  ),
                                  selectDestinationState
                                      .selectDestinationNavigateModel
                                      ?.selectedLocationChange(
                                    viewModel.filteredDestinationsList[index],
                                  ),
                                  viewModel.destinationController.text =
                                      viewModel
                                              .filteredDestinationsList[index]
                                              .structuredFormatting
                                              ?.secondaryText
                                              .toString() ??
                                          '',
                                  selectDestinationState.setRecentSearches(
                                    viewModel.filteredDestinationsList[index],
                                  ),
                                  selectDestinationState
                                          .selectDestinationNavigateModel
                                          ?.selectedLocationDetailModel =
                                      viewModel.filteredDestinationsList[index],
                                  selectDestinationState.sourceFocusNode
                                      .requestFocus(),
                                  selectDestinationState
                                      .updateListOnFocusChange(),
                                  if (viewModel
                                          .airportController.text.isNotEmpty &&
                                      viewModel
                                              .selectDestinationNavigateModel
                                              ?.airportTerminalDetailModel
                                              ?.airportAddressDescription !=
                                          null &&
                                      viewModel.destinationController.text
                                          .isNotEmpty &&
                                      viewModel
                                              .selectDestinationNavigateModel
                                              ?.selectedLocationDetailModel
                                              ?.description !=
                                          null)
                                    {
                                      Navigator.pop(context),
                                    },
                                },
                              );
                            },
                            itemCount:
                                viewModel.filteredDestinationsList.length,
                          ),
                        ],
                      ),
                    ),
                  if (selectDestinationState.sourceFocusNode.hasFocus)
                    Expanded(
                      child: AirportSelectionView(
                        // scrollController: ,
                        airportTerminalDetailModel: selectDestinationState
                                .selectDestinationNavigateModel
                                ?.airportUpdatedDetailedListForCab ??
                            [],
                        terminalSelect: (airportTerminalDetailModel) =>
                            _airportSelect(
                          airportTerminalDetailModel,
                          context,
                          viewModel,
                        ),
                        selectDestinationState: selectDestinationState,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _airportSelect(
    AirportTerminalDetailModel airportTerminalDetailModel,
    BuildContext context,
    SelectDestinationState viewModel,
  ) {
    context
        .read<SelectDestinationState>()
        .updateSelectedAirportTerminalDetailModel(
          airportTerminalDetailModel,
        );
    viewModel.selectDestinationNavigateModel
        ?.airportLocationChange(viewModel.selectedAirportTerminalDetailModel);
    selectDestinationState.selectDestinationNavigateModel
        ?.airportTerminalDetailModel = airportTerminalDetailModel;
    selectDestinationState.focusNodeDestination.requestFocus();
    selectDestinationState.updateListOnFocusChange();
    if (viewModel.airportController.text.isNotEmpty &&
        viewModel.selectDestinationNavigateModel?.airportTerminalDetailModel !=
            null &&
        viewModel.destinationController.text.isNotEmpty &&
        viewModel.selectDestinationNavigateModel?.selectedLocationDetailModel !=
            null) {
      Navigator.pop(context);
    }
  }

  /// when user click on back Button on  AppBar its call CallbackFunctions
  void backButtonClick(SelectDestinationState selectDestinationState) {
    selectDestinationState.selectDestinationNavigateModel
        ?.airportLocationChange(
      selectDestinationState
          .selectDestinationNavigateModel?.airportTerminalDetailModel,
    );
    selectDestinationState.selectDestinationNavigateModel
        ?.selectedLocationChange(
      selectDestinationState
          .selectDestinationNavigateModel?.selectedLocationDetailModel,
    );
    Navigator.pop(context);
  }
}
