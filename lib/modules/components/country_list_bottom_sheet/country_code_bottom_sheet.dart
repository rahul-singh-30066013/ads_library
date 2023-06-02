/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_list_state.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this will be return widget of country list and country code list
const double greyOpacity = 0.2;
const double trailingPaddingTop = 6.5;

class CountryCodeBottomSheet {
  CountryCodeBottomSheet({
    required this.type,
    required this.context,
    this.selectedItem,
  });

  final BottomSheetType type;
  final BuildContext context;
  ScrollController _scrollController = ScrollController();

  /// this value is use for selected item on country list
  final String? selectedItem;

  void openCountryCodeBottomSheet(ADGenericCallback onCountrySelected) {
    final CountryListState countryCodeViewModel = CountryListState()
      ..initViewModel(
        type,
        context.read<SiteCoreStateManagement>().countryCodeFinalData,
      );

    BottomSheetUtils.showBottomSheetDialog(
      context,
      ADDraggableScrollableBottomSheet(
        initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
        childWidget: SliverAppBarBottomSheet(
          scrollListener: (controller) => _scrollController = controller,
          stickyWidget: SearchView(
            hintText: 'country_name_or_code'.localize(context),
            onChanged: (value) => searchOperation(countryCodeViewModel, value),
            onFieldSubmitted: (value) =>
                searchOperation(countryCodeViewModel, value),
            onIconButtonPressed: () => {
              searchTextController.clear(),
              FocusScope.of(context).unfocus(),
              searchOperation(countryCodeViewModel, ''),
            },
          ),
          searchBarPadding: EdgeInsets.fromLTRB(
            context.k_16,
            context.k_12,
            context.k_16,
            context.k_12,
          ),
          body: OpenCountryCodeBottomSheet(
            type: type,
            countryCodeViewModel: countryCodeViewModel,
            scrollController: _scrollController,
            selectedItem: selectedItem,
          ),
          title: type == BottomSheetType.fromCountryName
              ? 'nationality'.localize(context)
              : 'countryCode'.localize(context),
          flexibleTitleBottomPadding: context.k_2,
          flexibleTitleTopPadding: context.k_4,
        ),
      ),
    ).then((value) {
      if (value != null) {
        final CountryCodeData countryCodeData = value;
        onCountrySelected(countryCodeData);
      }
    });
  }

  void searchOperation(CountryListState countryCodeViewModel, String value) {
    if (_scrollController.positions.isNotEmpty) {
      _scrollController.jumpTo(0);
    }
    countryCodeViewModel.buildSearch(
      value.toString().trim(),
    );
  }
}

class OpenCountryCodeBottomSheet extends StatefulWidget {
  final BottomSheetType type;
  final CountryListState countryCodeViewModel;
  final ScrollController scrollController;
  final String? selectedItem;

  const OpenCountryCodeBottomSheet({
    Key? key,
    required this.type,
    required this.countryCodeViewModel,
    required this.scrollController,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<OpenCountryCodeBottomSheet> createState() =>
      _OpenCountryCodeBottomSheetState();
}

class _OpenCountryCodeBottomSheetState
    extends State<OpenCountryCodeBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils.scrollTabScreensToTop(
      scrollController: widget.scrollController,
    );
    return ADSelectorStateLessWidget(
      viewModel: widget.countryCodeViewModel,
      child: Consumer<CountryListState>(
        builder: (
          context,
          value,
          child,
        ) {
          return Column(
            children: [
              Expanded(
                child: widget.countryCodeViewModel.countryCodes.isNotEmpty
                    ? ListView.builder(
                        controller: widget.scrollController,
                        padding: EdgeInsets.symmetric(
                          vertical: context.k_12,
                        ),
                        itemCount: _getItemsCount(),
                        itemBuilder: (context, index) => index ==
                                widget.countryCodeViewModel.totalCountryCodes
                            ? const ComingSoonRow()
                            : InkWell(
                                child: ShowFilteredCountryCodes(
                                  index: index,
                                  type: widget.type,
                                  listOfCountryCodes:
                                      widget.countryCodeViewModel.countryCodes,
                                  header: widget.countryCodeViewModel
                                      .userSearchTerm.isEmpty,
                                  onCountrySelected: (value) =>
                                      onCountryItemClick(value, context),
                                  selectedItem: widget.selectedItem,
                                ).paddingBySide(
                                  top: context.k_8,
                                ),
                                onTap: () => onCountryItemClick(
                                  widget
                                      .countryCodeViewModel.countryCodes[index],
                                  context,
                                ),
                              ),
                      )
                    : NoDataFoundErrorScreenWithSVG(
                        paddingBetweenImageAndErrorTitle: context.k_20,
                        errorTitle: 'more_countries_soon'.localize(context),
                        hyperlinkTitle: 'reset_filter'.localize(context),
                        svgImage: SvgAssets.countryGlobe,
                        isCenter: false,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  int _getItemsCount() {
    final totalCountryCodes = widget.countryCodeViewModel.totalCountryCodes;
    final searchedCountryCodeResultLength =
        widget.countryCodeViewModel.countryCodes.length;
    return searchedCountryCodeResultLength == totalCountryCodes
        ? searchedCountryCodeResultLength + 1
        : searchedCountryCodeResultLength;
  }

  void onCountryItemClick(CountryCodeData listData, BuildContext context) {
    searchTextController.clear();
    navigatorPopScreenWithData(context, listData);
  }
}

class ComingSoonRow extends StatelessWidget {
  const ComingSoonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxLine = 2;
    const bgColor = Color(0xfffef6ea);
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_4),
        ),
      ),
      height: context.k_20 + context.k_40,
      width: context.widthOfScreen,
      child: Row(
        children: [
          SizedBox(
            width: context.k_14,
          ),
          SvgPicture.asset(
            SvgAssets.countryGlobe,
            width: context.k_40,
            height: context.k_40,
          ),
          SizedBox(
            width: context.k_12,
          ),
          Expanded(
            child: Text(
              'more_countries_soon'.localize(context),
              style: ADTextStyle500.size14,
              maxLines: maxLine,
            ),
          ),
          SizedBox(
            width: context.k_12,
          ),
        ],
      ),
    ).paddingBySide(left: context.k_16, right: context.k_16);
  }
}

class ShowFilteredCountryCodes extends StatelessWidget {
  const ShowFilteredCountryCodes({
    Key? key,
    required this.index,
    required this.type,
    required this.listOfCountryCodes,
    required this.header,
    required this.onCountrySelected,
    required this.selectedItem,
  }) : super(key: key);

  final int index;
  final BottomSheetType type;
  final List<CountryCodeData> listOfCountryCodes;
  final bool header;
  final String? selectedItem;

  /// this is click event on list item
  final ADGenericCallback onCountrySelected;

  @override
  Widget build(BuildContext context) {
    final CountryCodeData currentCountryCodeItem = listOfCountryCodes[index];
    return Column(
      children: [
        /* if (header && index == 0)
          Column(
            children: [
              HeaderRow(
                title: 'based_on_location'.localize(context),
                icon: SvgAssets.locationIcon,
              ).paddingBySide(bottom: context.k_20),
              CountryCodeRow(
                */ /*{
                    "name": "India",
                    "flag": "https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg",
                    "calling_code": "+91",
                    "country_code": "IND"
                 }*/ /*
                onCountrySelected: (value) => onCountrySelected(value),
                country: 'India',
                type: type,
                countryCode: 'IN',
                callingCode: '+91',
                flag:
                    'https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg',
              ).paddingBySide(top: context.k_10, bottom: context.k_10),
              HeaderRow(
                title: 'other_countries'.localize(context),
                icon: SvgAssets.popularIcon,
              ).paddingBySide(top: context.k_20, bottom: context.k_20),
            ],
          ),*/
        CountryCodeRow(
          onCountrySelected: (value) => onCountrySelected(value),
          country: currentCountryCodeItem.name ?? '',
          type: type,
          countryCode: currentCountryCodeItem.countryCode ?? '',
          callingCode: currentCountryCodeItem.callingCode ?? '',
          flag: currentCountryCodeItem.flag ?? '',
          selectedItem: selectedItem,
        ).paddingBySide(top: context.k_4, bottom: context.k_4),
      ],
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.k_16,
          height: context.k_16,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
        ADSizedBox(
          width: context.k_8,
        ),
        Text(
          title,
          style: ADTextStyle500.size12
              .setTextColor(context.adColors.greyTextColor),
        ),
      ],
    );
  }
}

class CountryCodeRow extends StatelessWidget {
  const CountryCodeRow({
    required this.type,
    required this.flag,
    required this.country,
    required this.callingCode,
    required this.countryCode,
    required this.onCountrySelected,
    required this.selectedItem,
    Key? key,
  }) : super(key: key);

  final BottomSheetType type;
  final String flag;
  final String country;
  final String callingCode;
  final String countryCode;
  final ADGenericCallback onCountrySelected;
  final String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final double _borderWidth = 0.5.sp;

    return GestureDetector(
      onTap: () => onCountrySelected(
        CountryCodeData(
          callingCode: callingCode,
          flag: flag,
          name: country,
          countryCode: countryCode,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(
          context.k_10,
        ),
        color: callingCode == selectedItem
            ? context.adColors.lightBlue
            : context.adColors.whiteTextColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: context.k_30,
                    height: context.k_20,
                    decoration: BoxDecoration(
                      color: context.adColors.containerGreyBg,
                      border: Border.all(
                        width: _borderWidth,
                        color: context.adColors.lightGreyTextColor,
                      ),
                    ),
                    child: Image.network(
                      flag,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_12,
                  ),
                  Expanded(
                    child: Text(
                      country,
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              type == BottomSheetType.fromCountryCode ? callingCode : '',
              style: ADTextStyle600.size16
                  .setTextColor(context.adColors.blackTextColor),
            ),
            Visibility(
              visible: callingCode == selectedItem,
              child: SvgPicture.asset(SvgAssets.refundableCheck),
            ).paddingBySide(
              left: context.k_6,
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: callingCode == selectedItem ? context.k_28 : context.k_40,
        ),
      ),
    );
  }
}
