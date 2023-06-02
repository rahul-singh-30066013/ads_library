/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int listSize = 1;
String searchStringValue = '';

class CountryCodeView extends StatelessWidget {
  const CountryCodeView({
    Key? key,
    required this.countryCodesList,
    required this.onCountrySelected,
    required this.visibleCountryCode,
    required this.visibleCountryDialCode,
    required this.selectedCountry,
  }) : super(key: key);
  final List<Country> countryCodesList;
  final String selectedCountry;
  final ADGenericCallback onCountrySelected;
  final bool visibleCountryCode;
  final bool visibleCountryDialCode;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    searchTextController.clear();
    searchStringValue = '';
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: context.k_20, right: context.k_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchView(
                hintText: 'country_name_or_code'.localize(context),
                onChanged: (value) => searchCountry(context, value),
                onFieldSubmitted: (value) => context
                    .read<PranaamAppDataStateManagement>()
                    .buildSearchCountryList(
                      value,
                      countryCodesList,
                    ),
                onIconButtonPressed: () =>
                    clearFocusController(context, countryCodesList),
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              // const HeaderRow(
              //   title: 'BASED ON LOCATION',
              //   icon: Icons.location_on_outlined,
              // ).paddingBySide(top: context.k_20, bottom: context.k_20),
              // CountryCodeRow(
              //   onCountrySelected: (value) => onCountrySelected(value),
              //   country:
              //       countryCodesList.first.countryName.validateWithDefaultValue(),
              //   countryCode: visibleCountryCode == 'No'
              //       ? ''
              //       : countryCodesList.first.isO2.validateWithDefaultValue(),
              //   flag: countryCodesList.first.countryFlagImage
              //       .validateWithDefaultValue(),
              // ).paddingBySide(top: context.k_10, bottom: context.k_10),
              // const HeaderRow(
              //   title: 'OTHER COUNTRIES ',
              //   icon: Icons.star,
              // ).paddingBySide(top: context.k_20, bottom: context.k_10),
            ],
          ),
        ),
        Selector<PranaamAppDataStateManagement, List<Country>>(
          selector: (context, model) => context
              .read<PranaamAppDataStateManagement>()
              .countryCodeDetailModelList,
          builder: (
            context,
            countryFilterList,
            child,
          ) {
            return countryFilterList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: countryFilterList.length,
                      shrinkWrap: true,
                      itemBuilder: (builder, index) {
                        return CountryCodeRow(
                          countryObj: countryFilterList[index],
                          isCountryCodeVisible: visibleCountryCode,
                          onCountrySelected: (value) =>
                              onCountrySelected(value),
                          country: countryFilterList[index]
                              .countryName
                              .validateWithDefaultValue(),
                          countryCode: visibleCountryDialCode
                              ? '+${countryFilterList[index].dialCode.validateWithDefaultValue()}'
                              : countryFilterList[index]
                                  .isO2
                                  .validateWithDefaultValue(),
                          flag: countryFilterList[index].countryFlagImage,
                          selectedCountry: selectedCountry,
                        );
                      },
                    ),
                  )
                : countryFilterList.isEmpty && searchStringValue.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: countryCodesList.length,
                          shrinkWrap: true,
                          itemBuilder: (builder, index) {
                            return CountryCodeRow(
                              countryObj: countryCodesList[index],
                              isCountryCodeVisible: visibleCountryCode,
                              onCountrySelected: (value) =>
                                  onCountrySelected(value),
                              country: countryCodesList[index]
                                  .countryName
                                  .validateWithDefaultValue(),
                              countryCode: visibleCountryDialCode
                                  ? '+${countryCodesList[index].dialCode.validateWithDefaultValue()}'
                                  : countryCodesList[index]
                                      .isO2
                                      .validateWithDefaultValue(),
                              flag: countryCodesList[index].countryFlagImage,
                              selectedCountry: selectedCountry,
                            );
                          },
                        ),
                      )
                    : NoDataFoundErrorScreen(
                        paddingBetweenImageAndErrorTitle: context.k_20,
                        paddingBetweenErrorMessageAndRetry: context.k_30,
                        errorTitle: 'country_not_found_msg'.localize(context),
                      );
          },
        ),
      ],
    );
  }

  void searchCountry(BuildContext context, String searchItem) {
    searchStringValue = searchItem;
    context.read<PranaamAppDataStateManagement>().buildSearchCountryList(
          searchItem,
          countryCodesList,
        );
  }

  void clearFocusController(
    BuildContext context,
    List<Country> countryCodesList,
  ) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    context.read<PranaamAppDataStateManagement>().buildSearchCountryList(
          '',
          countryCodesList,
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
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
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
    this.flag,
    required this.country,
    required this.countryCode,
    required this.onCountrySelected,
    required this.countryObj,
    this.isCountryCodeVisible = false,
    required this.selectedCountry,
    Key? key,
  }) : super(key: key);

  final String? flag;
  final String country;
  final String countryCode;
  final Country countryObj;
  final ADGenericCallback onCountrySelected;
  final bool isCountryCodeVisible;
  final String selectedCountry;

  @override
  Widget build(BuildContext context) {
    adLog('onCountrySelected $countryCode');
    final double _borderWidth = 0.5.sp;

    Color getContainerColor() {
      if (selectedCountry == country || selectedCountry == countryCode) {
        return context.adColors.lightBlue;
      }
      return context.adColors.transparentColor;
    }

    return InkWell(
      onTap: () => onCountrySelected(
        countryObj.copyWith(
          isO2: countryCode,
          countryFlagImage: flag ??
              'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
          countryName: country,
          isO3: '',
        ),
      ),
      child: Container(
        color: getContainerColor(),
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
                      flag ??
                          'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
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
            Visibility(
              visible: isCountryCodeVisible,
              child: Text(
                countryCode,
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          top: context.k_14,
          bottom: context.k_14,
        ),
      ),
    );
  }
}
