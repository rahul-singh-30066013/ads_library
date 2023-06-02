/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/salutation_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///
///This class is used to construct view for search and listing of states.
///

class CityListWithSearch extends StatefulWidget {
  ///usage
  ///const StateListWithSearch(
  ///     Key? key,
  ///     ADGenericCallback callback,
  ///     String selectedState,
  ///   );
  ///
  const CityListWithSearch({
    Key? key,
    required this.callback,
    required this.selectedCity,
  }) : super(key: key);
  final ADGenericCallback callback;
  final String selectedCity;

  @override
  State<CityListWithSearch> createState() => _CityListWithSearchState();
}

class _CityListWithSearchState extends State<CityListWithSearch> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  @override
  void initState() {
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _siteCoreStateManagement.buildSearchCitiesList(
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
          hintText: 'search_city'.localize(context),
          onChanged: (value) => _siteCoreStateManagement.buildSearchCitiesList(
            value,
          ),
          onFieldSubmitted: (value) =>
              _siteCoreStateManagement.buildSearchCitiesList(
            value,
          ),
          onIconButtonPressed: () => clearFocusController(context),
        ).paddingBySide(
          top: context.k_4,
          bottom: context.k_20,
          left: context.k_16,
          right: context.k_16,
        ),
        Selector<SiteCoreStateManagement, List<city_list.Result>>(
          selector: (context, model) => model.filteredCitiesList,
          builder: (
            context,
            citiesList,
            child,
          ) {
            return citiesList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: citiesList.length,
                      itemBuilder: (context, index) {
                        return SalutationView(
                          selectedItem: widget.selectedCity,
                          text: citiesList[index].name,
                          onBottomSheetItemSelect: (value) =>
                              widget.callback(citiesList[index]),
                        );
                      },
                    ),
                  )
                : NoDataFoundErrorScreen(
                    paddingBetweenImageAndErrorTitle: context.k_20,
                    paddingBetweenErrorMessageAndRetry: context.k_30,
                    errorTitle: 'city_not_found'.localize(context),
                  );
          },
        ),
      ],
    );
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    _siteCoreStateManagement.buildSearchCitiesList(
      '',
    );
  }
}
