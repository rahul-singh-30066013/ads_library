/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/ga_analytics_event/home_and_airport_selection_click_event.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';
import 'package:superapp_mobile_style_guide/shimmer/shimmer.dart';

const double size_150 = 150;
const double size_100 = 100;
const double size_104 = 104;
const double size_80 = 80;
const double size_48 = 48;

const int itemCountLimit = 6;
const int maxLineLimit_2 = 2;

const int four = 4;
const int two = 2;
const int three = 3;

const blurOpacity = 0.8;
List<AirportItemModel> adaniAirportsList = [];

///This class is used to represent airportList screen which open in BottomSheet in DashBoard
class AirportsListScreen extends StatefulWidget {
  const AirportsListScreen({
    Key? key,
    required this.airportsData,
    this.isAirportsLanding = false,
    this.availableAirportsBasedOnLob,
  }) : super(key: key);

  final AirportItemModel? airportsData;
  final bool isAirportsLanding;
  final String? availableAirportsBasedOnLob;

  @override
  State<StatefulWidget> createState() {
    return _AirportListState();
  }
}

class _AirportListState extends State<AirportsListScreen> {
  final AirportListStateManagement _airportListViewModel =
      AirportListStateManagement(
    isLoggedIn: ProfileSingleton.profileSingleton.isLoggedIn,
  );

  @override
  void initState() {
    _airportListViewModel
        .getAirportList(context.read<SiteCoreStateManagement>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<AirportListStateManagement>(
      key: const Key(FlightAutomationKeys.airportListParent),
      viewModel: _airportListViewModel,
      child: Consumer<AirportListStateManagement>(
        builder: (context, value, child) {
          final ADResponseState<dynamic> adResponseState =
              value.airportListState;
          switch (adResponseState.viewStatus) {
            case Status.loading:
              return const GridShimmerWidget();
            case Status.error:
              return ADErrorPage(
                message: _airportListViewModel.error,
                onPress: () => {
                  _airportListViewModel
                      .getAirportList(context.read<SiteCoreStateManagement>()),
                },
              );
            case Status.complete:
              return FutureBuilder<List<AirportItemModel>>(
                future: value.getAvailableAirportsBasedOnLob(
                  adResponseState.data,
                  widget.availableAirportsBasedOnLob,
                ),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<AirportItemModel>> snapshot,
                ) {
                  adaniAirportsList = snapshot.data ?? [];
                  return adaniAirportsList.isNotEmpty
                      ? BuildAirportListScreen(
                          airportsDataList: snapshot.data ?? [],
                          selectedAirport: widget.airportsData,
                          openBottomSheet: !widget.isAirportsLanding,
                          isAirportsLanding: widget.isAirportsLanding,
                        )
                      : const GridShimmerWidget();
                },
              );

            default:
          }
          return const ADSizedBox.shrink();
        },
      ),
    );
  }
}

/// This method generates the whole airport list screen which includes header and list
/// ///for calling this method two parameters are required context and list containing data of type AirportsData
class BuildAirportListScreen extends StatelessWidget {
  final bool openBottomSheet;

  const BuildAirportListScreen({
    Key? key,
    required this.openBottomSheet,
    required this.airportsDataList,
    required this.selectedAirport,
    required this.isAirportsLanding,
  }) : super(key: key);

  final bool isAirportsLanding;
  final List<AirportItemModel> airportsDataList;
  final AirportItemModel? selectedAirport;

  void popScreen(BuildContext context) {
    if (openBottomSheet) {
      HomeAndAirportSelectionClickEvent().airportSelectionAnalyticsData(
        selectedAirportsData?.city ?? '',
        'Cross',
      );
      navigatorPopScreen(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        if (airportsDataList
            .where((element) => !(element.isNonAdaniAirport ?? false))
            .isNotEmpty)
          BuildAirportGrid(
            airportsDataList: airportsDataList
                .where((element) => !(element.isNonAdaniAirport ?? false))
                .toList(),
            selectedAirport: selectedAirport,
            isAirportsLanding: isAirportsLanding,
          ),
        if (airportsDataList
            .where((element) => element.isNonAdaniAirport ?? false)
            .isNotEmpty)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ADSizedBox(
                height: context.k_28,
              ),
              Text(
                'other_cities'.localize(context),
                style: ADTextStyle700.size22.setTextColor(
                  context.adColors.black,
                ),
              ).paddingBySide(left: context.k_16, right: context.k_16),
              BuildAirportGrid(
                airportsDataList: airportsDataList
                    .where((element) => element.isNonAdaniAirport ?? false)
                    .toList(),
                selectedAirport: selectedAirport,
                isAirportsLanding: isAirportsLanding,
              ),
            ],
          ),
      ],
    );
  }
}

///This parameterized method is used to generate list part.
///for calling this method two parameters are required context and list containing data of type AirportsData
class BuildAirportGrid extends StatelessWidget {
  const BuildAirportGrid({
    Key? key,
    required this.airportsDataList,
    required this.selectedAirport,
    required this.isAirportsLanding,
  }) : super(key: key);

  final bool isAirportsLanding;
  final List<AirportItemModel> airportsDataList;
  final AirportItemModel? selectedAirport;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: context.k_20,
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_24,
      ),
      itemCount: airportsDataList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.762,
      ),
      itemBuilder: (context, index) {
        return GetAirportGridItemView(
          imageHeight: (context.widthOfScreen - size_48) / two,
          color: Color(
            int.parse(
              airportsDataList[index].colorCode ?? getAirportColor(index),
            ),
          ),
          airportsData: airportsDataList[index],
          selectedAirport: selectedAirport,
          onTapHandler: (value) => navigatePopToBack(index, context),
        );
      },
    );
  }

  void navigatePopToBack(int index, BuildContext context) {
    final AirportItemModel airportData = airportsDataList[index];
    saveToPreference(keySelectedAirport, airportData);
    selectedAirportsData = airportData;
    selectedAirportNotifier.value = airportData.city ?? '';
    context.read<DutyFreeState>().ageAbove25 = false;
    if (selectedAirportsData?.airportCode?.isNotEmpty ?? false) {
      context.read<DutyFreeState>().getDutyFreeTerminalList();
    }
    HomeAndAirportSelectionClickEvent().airportSelectionAnalyticsData(
      selectedAirportsData?.city ?? '',
      selectedAirportsData?.city ?? '',
    );
    if (isAirportsLanding) {
      navigateUsingPushReplacementNamed(
        context,
        selectedAirportsData != null ? tabRoute : airportsLandingScreen,
      );
    } else {
      navigatorPopScreenWithData(context, airportData);
    }
  }

  /// Save Data to Preference
  void saveToPreference(String key, AirportItemModel airportsData) {
    SharedPrefsUtils().putVarValueInPrefs(key, airportsData);
  }
}

class GetAirportGridItemView extends StatelessWidget {
  const GetAirportGridItemView({
    Key? key,
    required this.imageHeight,
    required this.color,
    required this.airportsData,
    required this.selectedAirport,
    required this.onTapHandler,
  }) : super(key: key);

  final double imageHeight;
  final Color color;
  final ADTapCallbackWithValue onTapHandler;
  final AirportItemModel airportsData;
  final AirportItemModel? selectedAirport;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTapHandler.call(airportsData),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: context.adColors.shimmerColor,
          borderRadius: BorderRadius.circular(
            context.k_8,
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Container(
                  color: selectedAirport?.city == airportsData.city
                      ? context.adColors.containerGreyBg
                      : Colors.white.withOpacity(blurOpacity),
                  child: ADCachedImage(
                    imageUrl:
                        airportsData.airportImage.validateWithDefaultValue(),
                    boxFit: BoxFit.fill,
                    height: imageHeight,
                    width: imageHeight,
                  ),
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          context.k_8,
                        ),
                        bottomRight: Radius.circular(
                          context.k_8,
                        ),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      airportsData.city.validateWithDefaultValue(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ADTextStyle600.size16.copyWith(
                        color: context.adColors.whiteTextColor,
                      ),
                    ).paddingBySide(
                      left: context.k_10,
                      right: context.k_10,
                    ),
                  ),
                ),
              ],
            ),
            if (selectedAirport?.city == airportsData.city)
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: context.adColors.blackTextColor,
                  shape: BoxShape.circle,
                ),
                width: context.k_30,
                height: context.k_30,
                padding: EdgeInsets.all(
                  context.k_8,
                ),
                child: SvgPicture.asset(
                  'lib/assets/images/svg/icons/more/check.svg',
                  color: context.adColors.whiteTextColor,
                ),
              ).paddingBySide(
                right: context.k_12,
                top: context.k_12,
              ),
          ],
        ),
      ),
    );
  }
}

///This parameterized method is used to generate list part.
///for calling this method two parameters are required context and list containing data of type AirportsData
class BuildAirportList extends StatelessWidget {
  const BuildAirportList({
    Key? key,
    required this.airportsDataList,
    required this.selectedAirport,
    required this.isAirportsLanding,
  }) : super(key: key);

  final bool isAirportsLanding;
  final List<AirportItemModel> airportsDataList;
  final AirportItemModel? selectedAirport;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        top: context.k_20,
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_24,
      ),
      shrinkWrap: true,
      itemCount: airportsDataList.length,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: context.k_20,
        );
      },
      itemBuilder: (context, index) {
        return GetAirportListItemView(
          color: Color(
            int.parse(
              airportsDataList[index].colorCode ?? getAirportColor(index),
            ),
          ),
          airportsData: airportsDataList[index],
          selectedAirport: selectedAirport,
          onTapHandler: (value) => navigatePopToBack(index, context),
        );
      },
    );
  }

  void navigatePopToBack(int index, BuildContext context) {
    final AirportItemModel airportData = airportsDataList[index];
    saveToPreference(keySelectedAirport, airportData);
    selectedAirportsData = airportData;
    selectedAirportNotifier.value = airportData.city ?? '';
    if (isAirportsLanding) {
      navigateUsingPushReplacementNamed(
        context,
        selectedAirportsData != null ? tabRoute : airportsLandingScreen,
      );
    } else {
      navigatorPopScreenWithData(context, airportData);
    }
  }

  /// Save Data to Preference
  void saveToPreference(String key, AirportItemModel airportsData) {
    // final dataObj = <String, Object>{
    //   'key': key,
    //   'dataType': 'string',
    //   'value': jsonEncode(airportsData),
    // };
    // AdaniMobilePlugin.writeSharedPref(dataObj);
    SharedPrefsUtils().putVarValueInPrefs(key, airportsData);
  }
}

class GetAirportListItemView extends StatelessWidget {
  const GetAirportListItemView({
    Key? key,
    required this.color,
    required this.airportsData,
    required this.selectedAirport,
    required this.onTapHandler,
  }) : super(key: key);

  final Color color;
  final ADTapCallbackWithValue onTapHandler;
  final AirportItemModel airportsData;
  final AirportItemModel? selectedAirport;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTapHandler.call(airportsData),
      child: Container(
        height: size_104.sp,
        width: context.widthOfScreen,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.k_8,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.k_8,
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ADSizedBox(
                height: size_104.sp,
                width: size_104.sp,
                child: ADCachedImage(
                  imageUrl:
                      airportsData.airportImage.validateWithDefaultValue(),
                  boxFit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          airportsData.city.validateWithDefaultValue(),
                          maxLines: 1,
                          style: ADTextStyle700.size16.copyWith(
                            color: context.adColors.whiteTextColor,
                          ),
                        ),
                        if (selectedAirport?.city == airportsData.city)
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: context.adColors.whiteTextColor,
                              shape: BoxShape.circle,
                            ),
                            width: context.k_24,
                            height: context.k_24,
                            padding: EdgeInsets.all(
                              context.k_6,
                            ),
                            child: SvgPicture.asset(
                              'lib/assets/images/svg/icons/more/check.svg',
                            ),
                          ),
                      ],
                    ),
                    ADSizedBox(height: context.k_8),
                    Wrap(
                      children: [
                        Text(
                          airportsData.airportName.validateWithDefaultValue(),
                          maxLines: maxLineLimit_2,
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size14
                              .copyWith(color: context.adColors.whiteTextColor),
                        ),
                      ],
                    ),
                  ],
                ).paddingBySide(left: context.k_14, right: context.k_14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ADShimmerBuilder(
      shimmerBuilderType: ShimmerBuilderType.listVertical,
      shimmerWidget: ADShimmerWidget.shimmerShape(
        type: ShimmerType.rectangleBox,
        height: size_100.sp,
        width: size_150.sp,
        detailTextWidth: size_80.sp,
        detailTextHeight: context.k_20,
      ),
      itemCount: itemCountLimit,
    );
  }
}

String getAirportColor(int index) {
  switch (index % four) {
    case 0:
      return '0xff1A7270';
    case 1:
      return '0xff643A8C';
    case two:
      return '0xffBC1A6E';
    case three:
      return '0xffC82D4A';
    default:
      return '0xff1A7270';
  }
}

class GridShimmerWidget extends StatelessWidget {
  const GridShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _eight = 8;
    return GridView.builder(
      padding: EdgeInsets.only(
        top: context.k_20,
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_24,
      ),
      itemCount: _eight,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.764,
      ),
      itemBuilder: (context, index) {
        return ADShimmer.fromColors(
          baseColor: context.adColors.baseShimmerColor,
          highlightColor: context.adColors.highlightShimmerColor,
          period: const Duration(seconds: 1),
          child: Container(
            width: (context.widthOfScreen - size_48) / two,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
              color: context.adColors.shimmerColor,
            ),
          ),
        );
      },
    );
  }
}
