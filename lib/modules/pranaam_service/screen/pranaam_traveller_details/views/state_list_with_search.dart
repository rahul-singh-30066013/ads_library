/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/salutation_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core_masters;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///
///This class is used to construct view for search and listing of states.
///

class StateListWithSearch extends StatefulWidget {
  ///usage
  ///const StateListWithSearch(
  ///     Key? key,
  ///     ADGenericCallback callback,
  ///     String selectedState,
  ///   );
  ///
  const StateListWithSearch({
    Key? key,
    required this.callback,
    required this.selectedState,
  }) : super(key: key);
  final ADGenericCallback callback;
  final String selectedState;

  @override
  State<StateListWithSearch> createState() => _StateListWithSearchState();
}

class _StateListWithSearchState extends State<StateListWithSearch> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  @override
  void initState() {
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _siteCoreStateManagement.buildSearchStatesList(
        '',
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchView(
          hintText: 'search_state'.localize(context),
          onChanged: (value) => _siteCoreStateManagement.buildSearchStatesList(
            value,
          ),
          onFieldSubmitted: (value) =>
              _siteCoreStateManagement.buildSearchStatesList(
            value,
          ),
          onIconButtonPressed: () => clearFocusController(context),
        ).paddingBySide(
          top: context.k_4,
          bottom: context.k_20,
          left: context.k_16,
          right: context.k_16,
        ),
        Selector<SiteCoreStateManagement, List<site_core_masters.State>>(
          selector: (context, model) => model.filteredStatesList,
          builder: (
            context,
            stateList,
            child,
          ) {
            return stateList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: stateList.length,
                      itemBuilder: (context, index) {
                        return SalutationView(
                          selectedItem: widget.selectedState,
                          text: stateList[index].name,
                          onBottomSheetItemSelect: (value) =>
                              widget.callback(stateList[index]),
                        );
                      },
                    ),
                  )
                : NoDataFoundErrorScreen(
                    paddingBetweenImageAndErrorTitle: context.k_20,
                    paddingBetweenErrorMessageAndRetry: context.k_30,
                    errorTitle: 'state_not_found'.localize(context),
                  );
          },
        ),
      ],
    );
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    _siteCoreStateManagement.buildSearchStatesList(
      '',
    );
  }
}
