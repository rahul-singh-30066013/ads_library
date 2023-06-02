/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double greyOpacity = 0.2;
const double trailingPaddingTop = 6.5;
const int airportCodeLength = 3;
TextEditingController textController = TextEditingController();

///
///This class is used to construct view for search and listing of airports.
///[ScrollController] is of type [ScrollController] and since the screen is a part of
///DraggableScrollableSheet, [ScrollController] is passed to construction via builder of DraggableScrollableSheet.
///[arrivalOrDepartureString] is of type [String], It is the title of this screen.
///

class AirportSearchList extends StatefulWidget {
  ///usage
  ///const AirportSearchList(
  ///     Key? key,
  ///     required this.scrollController,
  ///     required this.arrivalOrDepartureString,
  ///   );
  ///
  const AirportSearchList({
    Key? key,
    required this.arrivalOrDepartureString,
    required this.isFrom,
    required this.callback,
    this.selectedAirport = '',
    this.pranaamAirPortList,
    this.isFromPranaam = false,
    this.isDomestic = true,
    this.fromWhere = true,
    this.isInternationalPranaam = false,
    this.scrollController,
  }) : super(key: key);

  final String arrivalOrDepartureString;
  final String? pranaamAirPortList;
  final bool isFrom;
  final ADGenericCallback callback;
  final bool isFromPranaam;
  final bool isDomestic;
  final bool fromWhere;
  final bool isInternationalPranaam;
  final String selectedAirport;
  final ScrollController? scrollController;

  @override
  State<AirportSearchList> createState() => _AirportSearchListState();
}

class _AirportSearchListState extends State<AirportSearchList> {
  FlightBookingState flightViewModel = FlightBookingState();

  @override
  void initState() {
    super.initState();
    adLog(
      'widget.pranaamAirPortLis ${flightViewModel.mainPranaamAirportCityList}',
    );
    textController.clear();
  }

  @override
  void didChangeDependencies() {
    adLog('didChangeDependencies');
    if (widget.isDomestic) {
      if (widget.isFromPranaam) {
        flightViewModel.readPranaamAirport(
          context.read<SiteCoreStateManagement>(),
          context,
        );
      } else {
        flightViewModel.readData(
          context.read<SiteCoreStateManagement>(),
          context,
        );
      }
    } else {
      if (widget.isFromPranaam) {
        flightViewModel.readPranaamAirport(
          context.read<SiteCoreStateManagement>(),
          context,
        );
      } else {
        flightViewModel.readInternationAirport(
          context.read<SiteCoreStateManagement>(),
          context,
          isPranaam: widget.isInternationalPranaam,
        );
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    adLog(
      'build',
      className: this,
    );
    if (textController.text.isEmpty) {
      flightViewModel.buildSearchList(
        context,
        '',
        widget.isFrom,
        fromWhere: widget.fromWhere,
      );
    }
    return ADSelectorStateLessWidget(
      viewModel: flightViewModel,
      child: Consumer<FlightBookingState>(
        builder: (
          context,
          value,
          child,
        ) {
          adLog(
            'FlightBookingState',
            className: this,
          );
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_4,
                    bottom: context.k_16,
                  ),
                  child: SizedBox(
                    height: context.k_40,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: context.adColors.blackTextColor,
                      controller: textController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[a-z A-Z]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: context.adColors.paleGrey,
                        hintText: 'search_for_airport_hint'.localize(context),
                        hintStyle: ADTextStyle400.size16
                            .setTextColor(context.adColors.greyTextColor),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: context.k_4),
                        border: getBorder(context),
                        focusedBorder: getBorder(context),
                        enabledBorder: getBorder(context),
                        prefixIcon: Icon(
                          Icons.search,
                          color: context.adColors.inactiveGreyColor,
                        ),
                        suffixIcon: IconButton(
                          iconSize: context.k_20,
                          onPressed: () => clearFocusController(context),
                          icon: textController.text.isNotEmpty
                              ? Icon(
                                  Icons.clear,
                                  color: context.adColors.greyTextColor,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      onChanged: (value) => flightViewModel.buildSearchList(
                        context,
                        value,
                        widget.isFrom,
                        fromWhere: widget.fromWhere,
                      ),
                      onFieldSubmitted: (value) => flightViewModel
                          .buildSearchList(context, value, widget.isFrom),
                    ),
                  ),
                ),
                if (flightViewModel.searchResultList.isEmpty &&
                    textController.text.length > 1)
                  CreateListTileForHeader(
                    title: widget.isFromPranaam
                        ? 'no_airport_found_pranaam'.localize(context)
                        : 'no_airport_found_msg'.localize(context),
                    leadingWidget: SvgPicture.asset(
                      SvgAssets.informationIcon,
                      width: context.k_16,
                      height: context.k_16,
                    ).paddingBySide(bottom: context.k_14),
                    titleTextStyle: ADTextStyle400.size14.setTextColor(
                      // TODO: Sync up the colour with Style Sheet Dependency
                      const Color(0xffFB3737),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                  ),
                Expanded(
                  child: ListView.builder(
                    controller: widget.scrollController,
                    physics: const ClampingScrollPhysics(),
                    itemCount: flightViewModel.detailedCityList.length,
                    itemBuilder: (context, index) {
                      adLog(
                        'remove dublicate List...${flightViewModel.detailedCityList.length}',
                      );
                      return InkWell(
                        /// added check so that recent searches, popular cities, other cities text is not tappable
                        onTap: !(flightViewModel
                                        .detailedCityList[index].cityCode ==
                                    '-1' ||
                                flightViewModel
                                        .detailedCityList[index].cityCode ==
                                    '-2' ||
                                flightViewModel
                                        .detailedCityList[index].cityCode ==
                                    '-3' ||
                                flightViewModel
                                        .detailedCityList[index].cityCode ==
                                    '-4')
                            ? () {
                                filterairpotsClicked(index, context);
                              }
                            : null,
                        child: (flightViewModel.detailedCityList.first ==
                                    const CityDetailModel() &&
                                index == 0)
                            ? CreateListTileForHeader(
                                title: widget.isFromPranaam
                                    ? 'no_airport_found_pranaam'
                                        .localize(context)
                                    : 'no_airport_found_msg'.localize(context),
                                leadingWidget: SvgPicture.asset(
                                  SvgAssets.informationIcon,
                                  width: context.k_16,
                                  height: context.k_16,
                                ).paddingBySide(bottom: context.k_14),
                                titleTextStyle:
                                    ADTextStyle400.size14.setTextColor(
                                  // TODO: Sync up the colour with Style Sheet Dependency
                                  const Color(0xffFB3737),
                                ),
                                minLeadingWidth: 1,
                                minVerticalPadding: 1,
                              )
                            : ShowFilteredAirports(
                                isFromPranaam: widget.isFromPranaam,
                                index: index,
                                listOfCities: flightViewModel.detailedCityList,
                                fromWhere: widget.fromWhere,
                                selectedAirport: widget.selectedAirport,
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void dragSheetTap(BuildContext context) {
    textController.clear();
    navigatorPopScreen(context);
  }

  void filterairpotsClicked(int index, BuildContext context) {
    textController.clear();

    final CityDetailModel cityDetailsModel =
        flightViewModel.detailedCityList[index];
    // fromRecentListCreate(cityDetailsModel);

    if (cityDetailsModel.cityCode?.length == airportCodeLength &&
        double.tryParse(
              cityDetailsModel.cityCode ?? '',
            ) ==
            null) {
      if (widget.fromWhere) {
        recentListCreate(cityDetailsModel);
      }
      widget.callback(cityDetailsModel);
      navigatorPopScreen(context);
      /*  log(cityDetailModel.cityName ?? '');
      navigatorPopScreenWithData(
        context,
        cityDetailsModel,
      );*/
    }
  }

  void clearFocusController(BuildContext context) {
    textController.clear();
    FocusScope.of(context).unfocus();
    flightViewModel.buildSearchList(
      context,
      '',
      widget.isFrom,
      fromWhere: widget.fromWhere,
    );
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }

  void recentListCreate(CityDetailModel cityDetailsModel) {
    const int maxIndex = 2;
    if (widget.isFrom) {
      if (flightViewModel.fromRecentSearchList[1].airportName == null) {
        flightViewModel.fromRecentSearchList[1] = cityDetailsModel;
        saveToPreference(keyFromRecent, flightViewModel.fromRecentSearchList);
      } else if (flightViewModel.fromRecentSearchList[1].airportName !=
          cityDetailsModel.airportName) {
        if (flightViewModel.fromRecentSearchList[1].airportName != null &&
            flightViewModel.fromRecentSearchList[maxIndex].airportName !=
                null) {
          flightViewModel.fromRecentSearchList[maxIndex] =
              flightViewModel.fromRecentSearchList[1];
          flightViewModel.fromRecentSearchList[1] = cityDetailsModel;
        } else {
          flightViewModel.fromRecentSearchList[maxIndex] =
              flightViewModel.fromRecentSearchList[1];
          flightViewModel.fromRecentSearchList[1] = cityDetailsModel;
        }
        saveToPreference(keyFromRecent, flightViewModel.fromRecentSearchList);
      }
    } else {
      if (flightViewModel.toRecentSearchList[1].airportName == null) {
        flightViewModel.toRecentSearchList[1] = cityDetailsModel;
        saveToPreference(keyToRecent, flightViewModel.toRecentSearchList);
      } else if (flightViewModel.toRecentSearchList[1].airportName !=
          cityDetailsModel.airportName) {
        if (flightViewModel.toRecentSearchList[1].airportName != null &&
            flightViewModel.toRecentSearchList[maxIndex].airportName != null) {
          flightViewModel.toRecentSearchList[maxIndex] =
              flightViewModel.toRecentSearchList[1];
          flightViewModel.toRecentSearchList[1] = cityDetailsModel;
        } else {
          flightViewModel.toRecentSearchList[maxIndex] =
              flightViewModel.toRecentSearchList[1];
          flightViewModel.toRecentSearchList[1] = cityDetailsModel;
        }
        saveToPreference(keyToRecent, flightViewModel.toRecentSearchList);
      }
    }
  }

  /// Save Data to Preference
  void saveToPreference(String key, List<CityDetailModel> recentSearchList) {
    SharedPrefsUtils().putVarValueInPrefs(
      key,
      recentSearchList,
    );
  }
}

///
///This class is used to construct view for rows of airport list.
///[index] is of type [int] and it is the index at which row has to build.
///[listOfCities] is of type List<CityDetailModel>.
///
class ShowFilteredAirports extends StatelessWidget {
  ///
  /// usage
  /// ShowFilteredAirports(
  ///     index = 1,
  ///     listOfCities=[],
  ///   );
  ///
  const ShowFilteredAirports({
    Key? key,
    required this.index,
    required this.listOfCities,
    required this.selectedAirport,
    this.isFromPranaam = true,
    this.fromWhere = false,
  }) : super(key: key);

  final int index;
  final List<CityDetailModel> listOfCities;
  final String selectedAirport;
  final bool isFromPranaam;
  final bool fromWhere;

  @override
  Widget build(BuildContext context) {
    final CityDetailModel currentAirportItem = listOfCities[index];

    final cityName = (currentAirportItem.countryName?.isNotEmpty ?? false)
        ? '${currentAirportItem.cityName}, ${currentAirportItem.countryName}'
        : '${currentAirportItem.cityName}';

    if (currentAirportItem.cityCode == '-1') {
      return fromWhere
          ? CreateListTileForHeader(
              title: currentAirportItem.airportName ?? '',
              leadingWidget: SvgPicture.asset(
                SvgAssets.reccentSearchesIcon,
                width: context.k_14,
                height: context.k_14,
              ),
              titleTextStyle: ADTextStyle500.size12
                  .setTextColor(context.adColors.geryBorderColor),
              minLeadingWidth: 1,
              minVerticalPadding: 1,
            ).paddingBySide(top: context.k_6)
          : const ADSizedBox.shrink();
    } else if (currentAirportItem.cityCode == '-2') {
      return CreateListTileForHeader(
        title: isFromPranaam
            ? 'Our Airports'.toUpperCase()
            : currentAirportItem.airportName ?? '',
        leadingWidget: SvgPicture.asset(
          SvgAssets.popularIcon,
          width: context.k_14,
          height: context.k_14,
        ),
        titleTextStyle: ADTextStyle500.size12
            .setTextColor(context.adColors.geryBorderColor),
        minLeadingWidth: 1,
        minVerticalPadding: 1,
      );
    } else if (currentAirportItem.cityCode == '-3') {
      return CreateListTileForHeader(
        title: currentAirportItem.airportName?.toUpperCase() ?? '',
        leadingWidget: SvgPicture.asset(
          SvgAssets.icLocationCitiesList,
          width: context.k_14,
          height: context.k_14,
        ),
        titleTextStyle: ADTextStyle500.size12
            .setTextColor(context.adColors.geryBorderColor),
        minLeadingWidth: 1,
        minVerticalPadding: 1,
      ).paddingBySide(top: context.k_20);
    } else if (currentAirportItem.cityCode == '-4') {
      return CreateListTileForHeader(
        title: 'International',
        leadingWidget: SvgPicture.asset(
          SvgAssets.icLocationCitiesList,
          width: context.k_14,
          height: context.k_14,
        ),
        titleTextStyle: ADTextStyle500.size12
            .setTextColor(context.adColors.geryBorderColor),
        minLeadingWidth: 1,
        minVerticalPadding: 1,
      ).paddingBySide(top: context.k_20);
    } else {
      return CreateListTileForAirport(
        title: cityName,
        subTitle: currentAirportItem.airportName?.split(',').first ?? '',
        trailingString: currentAirportItem.cityCode ?? '',
        titleTextStyle:
            ADTextStyle600.size16.setTextColor(context.adColors.blackTextColor),
        subTitleTextStyle: ADTextStyle400.size14.setTextColor(
          context.adColors.greyTextColor,
        ),
        selectedAirport: selectedAirport,
      );
    }
  }
}

///
///This class is used to construct view for showing airport details namely airport name, airport city, airport code.
///[title] is of type [String] and it is the used to show name of airport ex Indra Gandhi International Airport, Delhi.
///[subTitle] is of type [String], it is used to show name of city ex Delhi, India.
///[trailingString] is of type [String], it is used to show name of airport code ex DEL.
///[titleTextStyle] is of type [TextStyle].
///[subTitleTextStyle] is of type [TextStyle].
///
class CreateListTileForAirport extends StatelessWidget {
  ///
  /// usage
  /// CreateListTileForAirport(
  ///         title: currentAirportItem.airportCity,
  ///         subTitle: currentAirportItem.airportName,
  ///         trailingString: currentAirportItem.airportCode,
  ///         titleTextStyle:ADTextStyle600.size16.setTextColor(context.adColors.blackTextColor),
  ///         subTitleTextStyle:ADTextStyle400.size14.setTextColor(context.adColors.greyTextColor),
  ///         );
  ///
  const CreateListTileForAirport({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.trailingString,
    required this.titleTextStyle,
    required this.subTitleTextStyle,
    required this.selectedAirport,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String trailingString;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;
  final String selectedAirport;

  @override
  Widget build(BuildContext context) {
    Color getContainerColor() {
      if (selectedAirport == title) {
        return context.adColors.lightBlue;
      }
      return context.adColors.transparentColor;
    }

    return Container(
      color: getContainerColor(),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: context.k_2,
        ),
        key: const Key('create_tile_for_airport'),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: titleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
            Text(
                trailingString,
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),

            ADSizedBox(
              width: context.k_4,
            ),
          ],
        ),
        subtitle: Text(
          subTitle,
          style: subTitleTextStyle,
          textAlign: TextAlign.left,
        ).paddingBySide(top: context.k_4),
      ),
    );
  }
}

///
///This class is used to construct view for showing header ex Popular Airports.
///[title] is of type [String] and it is the used to show name of airport ex Indra Gandhi International Airport, Delhi.
///[leadingWidget] is of type [Widget], it is used to show icon for header
///[titleTextStyle] is of type [TextStyle].
///[minLeadingWidth] is of type [int].
///[minVerticalPadding] is of type [int].
///
class CreateListTileForHeader extends StatelessWidget {
  ///
  /// usage
  /// CreateListTileForHeader(
  ///         title: currentAirportItem.airportName,
  ///         leadingWidget: const Icon(
  ///           Icons.access_time,
  ///         ),
  ///         titleTextStyle: ADTextStyle500.size12
  ///             .setTextColor(context.adColors.geryBorderColor),
  ///         minLeadingWidth: 1,
  ///         minVerticalPadding: 1,
  ///       );
  const CreateListTileForHeader({
    Key? key,
    required this.title,
    required this.leadingWidget,
    required this.titleTextStyle,
    required this.minLeadingWidth,
    required this.minVerticalPadding,
  }) : super(key: key);

  final String title;
  final Widget leadingWidget;
  final TextStyle titleTextStyle;
  final double minVerticalPadding;
  final double minLeadingWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_12,
        top: context.k_12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        key: const Key('create_tile_for_header'),
        children: [
          leadingWidget,
          SizedBox(
            width: context.k_10,
          ),
          Expanded(
            child: Text(
              title,
              style: titleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
