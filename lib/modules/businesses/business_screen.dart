/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/businesses/service_type_widget.dart';
import 'package:adani_airport_mobile/modules/components/ad_profile_with_action.dart';
import 'package:adani_airport_mobile/modules/components/home_sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation_text/marquee.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/speech_text/text_to_speech.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// Business Bottom Tab Screen to build various businesses like ticket booking and other airport services.
const double size_300 = 300;

class BusinessScreen extends StatefulWidget {
  final bool? openBottomSheet;

  const BusinessScreen({
    Key? key,
    this.openBottomSheet = false,
  }) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

List<DutyFreeItem> services = List.empty(growable: true);

class _BusinessScreenState extends State<BusinessScreen> {
  final List<DutyFreeItem> servicesResult = [];

  ScrollController _scrollController = ScrollController();

  TextEditingController searchController = TextEditingController();

  ValueNotifier<bool> iconChangeNotifier = ValueNotifier(false);

  final DashBoardViewModel _dashBoardViewModel = DashBoardViewModel();

  final double fontSize15 = 15;

  ///Used for start and stop vertically search text
  final ValueNotifier<bool> repeatForever = ValueNotifier(true);
  final ValueNotifier<bool> changeSearchBar = ValueNotifier(true);

  bool isPinned = true;

  Future<void> updateServices() async {
    _dashBoardViewModel.notifyListeners();
    await _dashBoardViewModel.getServicesData(selectedAirportNotifier.value);
    //await _dashBoardViewModel.getDashBoardDataFromLocalJson(JsonAssets.servicesJson);
  }

  bool isOtherAirport() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false;
  }

  @override
  void initState() {
    super.initState();
    updateServices();
  }

  @override
  void dispose() {
    if (widget.openBottomSheet == false) {
      selectedAirportNotifier.dispose();
    }
    super.dispose();
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    Utils.scrollTabScreensToTop(scrollController: _scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: ValueListenableBuilder(
        valueListenable: selectedAirportNotifier,
        builder: (context, String airport, child) {
          if (lastSelectedAirport != airport) {
            updateServices();
          }
          return Scaffold(
            backgroundColor: context.adColors.whiteTextColor,
            appBar: Utils.getGenericAppBar(context),
            body: SafeArea(
              bottom: false,
              child: Selector<AppSessionState, bool>(
                selector: (context, viewModel) => viewModel.isLoggedIn,
                builder: (context, isLoggedIn, child) {
                  return GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: widget.openBottomSheet != null &&
                            widget.openBottomSheet == true
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: context.k_14,
                                  right: context.k_14,
                                ),
                                child: SizedBox(
                                  height: context.k_40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: context.adColors.paleGrey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          context.k_26,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: context
                                              .adColors.inactiveGreyColor,
                                        ).paddingBySide(
                                          left: context.k_14,
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable: changeSearchBar,
                                          builder: (
                                            context,
                                            bool changeBar,
                                            child,
                                          ) =>
                                              changeBar
                                                  ? InkWell(
                                                      onTap: () =>
                                                          changeSearchBar
                                                              .value = false,
                                                      child:
                                                          ValueListenableBuilder<
                                                              bool>(
                                                        valueListenable:
                                                            repeatForever,
                                                        builder: (
                                                          context,
                                                          bool value,
                                                          child,
                                                        ) =>
                                                            Container(
                                                          height: context.k_40,
                                                          width: size_250,
                                                          child: Marquee(
                                                            textList:
                                                                _dashBoardViewModel
                                                                    .tipMarqueeList,
                                                            textColor: context
                                                                .adColors
                                                                .greyTextColor,
                                                            // your text list
                                                            scrollDuration:
                                                                const Duration(
                                                              milliseconds: 800,
                                                            ),
                                                            // every scroll duration
                                                            stopDuration:
                                                                const Duration(
                                                              seconds: 2,
                                                            ),
                                                            //every stop duration
                                                            controller:
                                                                MarqueeController(),
                                                          ),
                                                        ).paddingBySide(
                                                          left: context.k_2,
                                                        ),
                                                      ),
                                                    )
                                                  : Expanded(
                                                      child: TextFormField(
                                                        autofocus: true,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        cursorColor: context
                                                            .adColors
                                                            .blackTextColor,
                                                        controller:
                                                            searchController,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(
                                                            RegExp('[ a-zA-Z]'),
                                                          ),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor: context
                                                              .adColors
                                                              .paleGrey,
                                                          hintText:
                                                              'airport_services'
                                                                  .localize(
                                                            context,
                                                          ),
                                                          hintStyle:
                                                              ADTextStyle400
                                                                  .size16
                                                                  .setTextColor(
                                                            context.adColors
                                                                .greyTextColor,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                            vertical:
                                                                context.k_4,
                                                          ),
                                                          border: getBorder(
                                                            context,
                                                          ),
                                                          focusedBorder:
                                                              getBorder(
                                                            context,
                                                          ),
                                                          enabledBorder:
                                                              getBorder(
                                                            context,
                                                          ),
                                                          suffixIcon:
                                                              ValueListenableBuilder(
                                                            valueListenable:
                                                                iconChangeNotifier,
                                                            builder: (
                                                              BuildContext
                                                                  context,
                                                              bool value,
                                                              Widget? child,
                                                            ) {
                                                              return IconButton(
                                                                onPressed: () =>
                                                                    clearFocusController(
                                                                  context,
                                                                ),
                                                                icon: value
                                                                    ? Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: context
                                                                            .adColors
                                                                            .greyTextColor,
                                                                      )
                                                                    : const SizedBox
                                                                        .shrink(),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        onChanged: (value) =>
                                                            searchOperation(
                                                          value,
                                                        ),
                                                        onFieldSubmitted:
                                                            (value) =>
                                                                searchOperation(
                                                          value,
                                                        ),
                                                      ).paddingBySide(
                                                        left: context.k_4,
                                                      ),
                                                    ),
                                        ),
                                        if (!isOtherAirport() &&
                                            (AppConstantRemote()
                                                    .appConstantRemoteModel
                                                    ?.isSpeechEnable ??
                                                false))
                                          InkWell(
                                            onTap: () => {
                                              clearFocusController(
                                                context,
                                              ),
                                              showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return TextToSpeech(
                                                    openBottomSheet: widget
                                                            .openBottomSheet ??
                                                        false,
                                                    servicesResult: services,
                                                    onTapHandler: (value) =>
                                                        _onTapHandler(
                                                      value,
                                                      context,
                                                    ),
                                                  );
                                                },
                                              ),
                                            },
                                            child: SizedBox(
                                              width: context.k_28,
                                              height: context.k_28,
                                              child: Icon(
                                                Icons.mic,
                                                color: context
                                                    .adColors.inactiveGreyColor,
                                              ),
                                            ).paddingBySide(
                                              right: context.k_14,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListWidget(
                                  searchController: searchController,
                                  servicesResult: servicesResult,
                                  dashBoardViewModel: _dashBoardViewModel,
                                  adTapCallback: () =>
                                      clearFocusController(context),
                                  pullRefresh: updateServices,
                                  openBottomSheet:
                                      widget.openBottomSheet ?? false,
                                ),
                              ),
                            ],
                          )
                        : HomeSliverAppBarBaseComponent(
                            scrollListener: (controller) => {
                              ///Know the appbar expanded or collapse
                              _scrollController = controller,
                              _scrollController.addListener(() {
                                if (!isPinned &&
                                    _scrollController.hasClients &&
                                    _scrollController.offset > kToolbarHeight) {
                                  repeatForever.value = isPinned;
                                  isPinned = true;
                                } else if (isPinned &&
                                    _scrollController.hasClients &&
                                    _scrollController.offset < kToolbarHeight) {
                                  repeatForever.value = isPinned;
                                  isPinned = false;
                                }
                              }),
                            },
                            actions: const [
                              AdProfileWithAction(),
                            ],
                            body: ValueListenableBuilder(
                              valueListenable: servicesScreenScrollToTop,
                              builder: (context, bool scrollToTop, child) {
                                if (scrollToTop) {
                                  Utils.scrollTabScreensToTop(
                                    scrollController: _scrollController,
                                  );
                                }
                                servicesScreenScrollToTop.value = false;

                                return ListWidget(
                                  searchController: searchController,
                                  servicesResult: servicesResult,
                                  dashBoardViewModel: _dashBoardViewModel,
                                  adTapCallback: () =>
                                      clearFocusController(context),
                                  pullRefresh: updateServices,
                                  openBottomSheet:
                                      widget.openBottomSheet ?? false,
                                );
                              },
                            ),
                            title: 'services'.localize(context),
                            titleTextStyle: ADTextStyle700.size32.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                            searchBarPadding: EdgeInsets.only(
                              top: context.k_8,
                              bottom: context.k_8,
                              left: context.k_16,
                              right: context.k_16,
                            ),
                            stickyWidget: SizedBox(
                              height: context.k_40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.adColors.paleGrey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      context.k_26,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: context.adColors.inactiveGreyColor,
                                    ).paddingBySide(
                                      left: context.k_14,
                                    ),
                                    ValueListenableBuilder<bool>(
                                      valueListenable: changeSearchBar,
                                      builder: (
                                        context,
                                        bool changeBar,
                                        child,
                                      ) =>
                                          changeBar
                                              ? InkWell(
                                                  onTap: () => changeSearchBar
                                                      .value = false,
                                                  child: ValueListenableBuilder<
                                                      bool>(
                                                    valueListenable:
                                                        repeatForever,
                                                    builder: (
                                                      context,
                                                      bool value,
                                                      child,
                                                    ) =>
                                                        Container(
                                                      height: context.k_40,
                                                      width: size_250,
                                                      child: Marquee(
                                                        textList: context
                                                            .read<
                                                                DashBoardViewModel>()
                                                            .tipMarqueeList,
                                                        textColor: context
                                                            .adColors
                                                            .greyTextColor,
                                                        // your text list
                                                        scrollDuration:
                                                            const Duration(
                                                          milliseconds: 800,
                                                        ),
                                                        // every scroll duration
                                                        stopDuration:
                                                            const Duration(
                                                          seconds: 2,
                                                        ),
                                                        //every stop duration
                                                        controller:
                                                            MarqueeController(),
                                                        repeatForever: value,
                                                      ),
                                                    ).paddingBySide(
                                                      left: context.k_2,
                                                    ),
                                                  ),
                                                )
                                              : Expanded(
                                                  child: TextFormField(
                                                    autofocus: true,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    cursorColor: context
                                                        .adColors
                                                        .blackTextColor,
                                                    controller:
                                                        searchController,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                        RegExp('[ a-zA-Z]'),
                                                      ),
                                                    ],
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: context
                                                          .adColors.paleGrey,
                                                      hintText:
                                                          'search_services'
                                                              .localize(
                                                        context,
                                                      ),
                                                      hintStyle: ADTextStyle400
                                                          .size16
                                                          .setTextColor(
                                                        context.adColors
                                                            .greyTextColor,
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                        vertical: context.k_4,
                                                      ),
                                                      border:
                                                          getBorder(context),
                                                      focusedBorder:
                                                          getBorder(context),
                                                      enabledBorder:
                                                          getBorder(context),
                                                      suffixIcon:
                                                          ValueListenableBuilder(
                                                        valueListenable:
                                                            iconChangeNotifier,
                                                        builder: (
                                                          BuildContext context,
                                                          bool value,
                                                          Widget? child,
                                                        ) {
                                                          return IconButton(
                                                            onPressed: () =>
                                                                clearFocusController(
                                                              context,
                                                            ),
                                                            icon: value
                                                                ? Icon(
                                                                    Icons.clear,
                                                                    color: context
                                                                        .adColors
                                                                        .greyTextColor,
                                                                  )
                                                                : const SizedBox
                                                                    .shrink(),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    onChanged: (value) =>
                                                        searchOperation(value),
                                                    onFieldSubmitted: (value) =>
                                                        searchOperation(value),
                                                  ).paddingBySide(
                                                    left: context.k_4,
                                                  ),
                                                ),
                                    ),
                                    if (!isOtherAirport() &&
                                        (AppConstantRemote()
                                                .appConstantRemoteModel
                                                ?.isSpeechEnable ??
                                            false))
                                      InkWell(
                                        onTap: () => {
                                          clearFocusController(
                                            context,
                                          ),
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return TextToSpeech(
                                                servicesResult: services,
                                                onTapHandler: (value) =>
                                                    _onTapHandler(
                                                  value,
                                                  context,
                                                ),
                                              );
                                            },
                                          ),
                                        },
                                        child: SizedBox(
                                          width: context.k_28,
                                          height: context.k_28,
                                          child: Icon(
                                            Icons.mic,
                                            color: context
                                                .adColors.inactiveGreyColor,
                                          ),
                                        ).paddingBySide(
                                          right: context.k_14,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTapHandler(
    DutyFreeItem item,
    BuildContext context,
  ) {
    if (item.uniqueId.isEmpty &&
        item.ctaUrl.isNotEmpty &&
        item.ctaUrl.contains('http')) {
      final WebViewModel model = WebViewModel(
        title: 'services'.localize(context),
        url:
            '${item.ctaUrl}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
      );

      if (model.url.isNotEmpty) {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          webViewContainer,
          argumentObject: model,
        );
      }
    } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty) &&
        item.uniqueId == RedirectionUniqueIds.openOutsideApp) {
      Utils.launchAppUrl(
        Uri.parse(item.ctaUrl),
      );
    } else if ((selectedAirportsData?.city?.contains('Other') ?? false) &&
        (item.isAirportSelectNeeded)) {
      if (widget.openBottomSheet ?? false) {
        Navigator.pop(context);
      }
      homeScreenKey.currentState?.handlePressed(
        (value) {
          adLog('message$value');
        },
        item: item,
      );
    } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isEmpty) ||
        (item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty)) {
      handleVerticalTap(item.uniqueId, context);
    }
  }

  /// this method is used to open service when text to speech
  void handleVerticalTap(
    String objectID,
    BuildContext context,
  ) {
    const String flightBookingFlag = '0';
    const String pranaamServiceId = '1';
    const String dutyFree = '2';
    const String flightStatusFlag = '6';
    const String loyaltyDashboardFlag = '7';
    const String cabBookingFlag = '8';
    const String porterServiceFlag = '9';
    const String trainBookingFlag = '12';

    switch (objectID) {
      case flightBookingFlag:
        if (widget.openBottomSheet ?? false) {
          Navigator.pop(context);
        }
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case pranaamServiceId:
        navigateToPranaamScreen(
          context,
          isFromBottomSheet: widget.openBottomSheet ?? false,
        );
        break;
      case porterServiceFlag:
        navigateToStandAloneScreen(
          context,
          StandAloneServiceType.porter,
          isFromBottomSheet: widget.openBottomSheet ?? false,
        );
        break;
      case dutyFree:
        ageConfirmation(
          context,
          openFromBottomSheet: widget.openBottomSheet ?? false,
        );
        break;
      case flightStatusFlag:
        if (widget.openBottomSheet ?? false) {
          Navigator.pop(context);
        }
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          flightStatusScreen,
          argumentObject: FidsModel(airportItemModel: selectedAirportsData),
        );
        break;
      case cabBookingFlag:
        if (widget.openBottomSheet ?? false) {
          Navigator.pop(context);
        }
        final GlobalKey<NavigatorState> navigatorState =
            HomeBottomAssets.homeBottomPages.keys.toList()[1];
        BottomBarState.currentIndex = 1;
        final CustomTabScaffold customTabScaffold =
            BottomBarState.key.currentWidget as CustomTabScaffold;
        customTabScaffold.controller?.index = 1;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          navigatorState.currentState
              ?.pushNamedAndRemoveUntil(
                cabBookingHomeScreen,
                (route) => route.isFirst,
              )
              .then((value) => debugPrint(value?.toString()));
        });
        break;
      case loyaltyDashboardFlag:
        if (widget.openBottomSheet ?? false) {
          Navigator.pop(context);
        }
        navigateToScreenUsingNamedRoute(
          context,
          loyaltyDashboard,
          rootNavigator: false,
        );
        break;
      case trainBookingFlag:
        if (widget.openBottomSheet ?? false) {
          Navigator.pop(context);
        }
        navigateToScreenUsingNamedRoute(
          context,
          trainBooking,
        );
        break;
      default:
        adLog('Item Not Found');
    }
  }

  /// this method is use for search operation on service
  void searchOperation(String searchText) {
    if (_scrollController.positions.isNotEmpty) {
      _scrollController.jumpTo(0);
    }
    final result = searchText.isNotEmpty;
    iconChangeNotifier.value = result;
    setState(() {
      servicesResult
        ..clear()
        ..addAll(
          services.where(
            (service) {
              return service.title
                      .validateWithDefaultValue()
                      .toLowerCase()
                      .replaceAll(' ', '')
                      .startsWith(
                        searchText.replaceAll(' ', '').toLowerCase(),
                      ) ||
                  service.title
                      .validateWithDefaultValue()
                      .toLowerCase()
                      .replaceAll(' ', '')
                      .contains(
                        searchText.replaceAll(' ', '').toLowerCase(),
                      );
            },
          ).toList(),
        );
      if (searchController.text.isEmpty) {
        servicesResult.clear();
      }
    });
  }

  /// this method is use for set border on search bar
  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }

  /// this method is use for focus controller
  void clearFocusController(BuildContext context) {
    setState(() {
      searchController.clear();
      servicesResult.clear();
      iconChangeNotifier.value = false;
    });
    FocusScope.of(context).unfocus();
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({
    Key? key,
    required this.servicesResult,
    required this.searchController,
    required this.dashBoardViewModel,
    required this.adTapCallback,
    required this.pullRefresh,
    required this.openBottomSheet,
  }) : super(key: key);
  final List<DutyFreeItem> servicesResult;

  final TextEditingController searchController;
  final DashBoardViewModel dashBoardViewModel;
  final ADTapCallback adTapCallback;
  final Future<void> Function() pullRefresh;
  final bool openBottomSheet;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  ///initially toggle button is selected to grid
  bool isGrid = false;
  double percentageOfScrollLimit = 45;

  final double toolBarHeight = 44.sp;
  final double profileIconTopPadding = 5.sp;

  double expandedHeightValue = 150.h;

  double heightOfHeader = 80.h;

  double topPaddingADSearch = 110.h;

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<DashBoardViewModel>(
      viewModel: widget.dashBoardViewModel,
      child: Selector<DashBoardViewModel, ADResponseState>(
        selector: (context, viewModel) => viewModel.homeDashBoardState,
        builder: (context, viewModel, child) {
          // if (selectedAirportsData?.city != 'Other') {
          switch (viewModel.viewStatus) {
            case Status.loading:
              return ShimmerWidget();
            case Status.error:
              return Center(child: Text(viewModel.message.toString()));
            case Status.complete:
              services.clear();
              for (final DutyFreeDashboardItem item
                  in viewModel.data as List<DutyFreeDashboardItem>) {
                services.addAll(
                  item.widgetItems ?? [],
                );
              }
              services = services.toSet().toList();
              return widget.servicesResult.isNotEmpty ||
                          widget.searchController.text.isNotEmpty
                      ? widget.searchController.text.isNotEmpty &&
                              widget.servicesResult.isEmpty
                          ? Center(
                              child: Text(
                                'no_data_available'.localize(context),
                                style: ADTextStyle700.size18.copyWith(
                                  color: context.adColors.blackShade700,
                                ),
                              ),
                            )
                          : ListView(
                              children: [
                                GridWidget(
                                  onTapHandler: (value) =>
                                      _onTapHandler(value, context),
                                  items: widget.servicesResult,
                                ).paddingBySide(
                                  top: context.k_24,
                                  left: context.k_10,
                                  right: context.k_10,
                                ),
                              ],
                            )
                      : /*RefreshIndicator(
                      onRefresh: widget.pullRefresh,
                      color: context.adColors.neutralInfoMsg,
                      child: */
                      ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              (viewModel.data as List<DutyFreeDashboardItem>)
                                  .length,
                          itemBuilder: (context_, index) => ServiceWidget(
                            onTapHandler: (value) =>
                                _onTapHandler(value, context),
                            index: index,
                            item: (viewModel.data
                                as List<DutyFreeDashboardItem>)[index],
                          ),
                        ) /*,
                    )*/
                  ;

            default:
          }
          // }
          return Container();
        },
      ),
    );
  }

  void _onTapHandler(
    DutyFreeItem item,
    BuildContext context,
  ) {
    if (item.uniqueId.isEmpty &&
        item.ctaUrl.isNotEmpty &&
        item.ctaUrl.contains('http')) {
      final WebViewModel model = WebViewModel(
        title: 'services'.localize(context),
        url:
            '${item.ctaUrl}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
      );

      if (model.url.isNotEmpty) {
        widget.adTapCallback.call();
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          webViewContainer,
          argumentObject: model,
        );
      }
    } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty) &&
        item.uniqueId == RedirectionUniqueIds.openOutsideApp) {
      Utils.launchAppUrl(
        Uri.parse(item.ctaUrl),
      );
    } else if (item.isAirportSelectNeeded) {
      homeScreenKey.currentState?.handlePressed(
        (value) {
          adLog('message$value');
        },
        item: item,
      );
    } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isEmpty) ||
        (item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty)) {
      widget.adTapCallback.call();
      handleVerticalTap(item.uniqueId, context);
    }
  }

  /// this method is used to perform click listener on circle grid view
  void handleVerticalTap(
    String objectID,
    BuildContext context,
  ) {
    const String flightBookingFlag = '0';
    const String pranaamServiceId = '1';
    const String dutyFree = '2';
    const String flightStatusFlag = '6';
    const String loyaltyDashboardFlag = '7';
    const String cabBookingFlag = '8';
    const String porterServiceFlag = '9';
    const String trainBookingFlag = '12';

    switch (objectID) {
      case flightBookingFlag:
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case pranaamServiceId:
        navigateToPranaamScreen(
          context,
          isFromBottomSheet: widget.openBottomSheet,
        );
        break;
      case porterServiceFlag:
        navigateToStandAloneScreen(
          context,
          StandAloneServiceType.porter,
          isFromBottomSheet: widget.openBottomSheet,
        );
        break;
      case dutyFree:
        ageConfirmation(
          context,
          openFromBottomSheet: widget.openBottomSheet,
        );
        break;
      case flightStatusFlag:
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          flightStatusScreen,
          argumentObject: FidsModel(airportItemModel: selectedAirportsData),
        );
        break;
      case cabBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          cabBookingHomeScreen,
          rootNavigator: false,
        );
        break;
      case loyaltyDashboardFlag:
        navigateToScreenUsingNamedRoute(
          context,
          loyaltyDashboard,
          rootNavigator: false,
        );
        break;
      case trainBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          trainBooking,
        );
        break;
      default:
        adLog('Item Not Found');
    }
  }
}

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({
    Key? key,
    required this.item,
    required this.index,
    required this.onTapHandler,
  }) : super(key: key);
  final DutyFreeDashboardItem item;
  final int index;
  final ADTapCallbackWithValue? onTapHandler;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  ///initial alignment of toggle button
  ///-1 is left, 1 is right
  double xAlign = 1;

  ///color of list icon
  Color? listColor;

  ///color of grid icon
  Color? gridColor;

  ///position where menu list button is aligned
  double menuAlign = -1;

  ///position where grid button is aligned
  double gridAlign = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.item.title?.isNotEmpty ?? false)
          Text(
            widget.item.title.toString(),
            style: ADTextStyle700.size22,
          ).paddingBySide(
            top: context.k_20,
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_20,
          ),
        /* ListTile(
            title: Text(
              widget.item.subTitle.toString(),
              style: ADTextStyle700.size22,
            ),
             trailing: ToggleButton(
              onListTap: () => setState(() {
                if (xAlign == menuAlign) {
                  xAlign = gridAlign;
                  gridColor = context.adColors.whiteTextColor;
                  listColor = context.adColors.blackShade500;
                } else {
                  xAlign = menuAlign;
                  listColor = context.adColors.whiteTextColor;
                  gridColor = context.adColors.blackShade500;
                }
              }),
              xAlign: xAlign,
              listColor: listColor ?? context.adColors.blackShade500,
              gridColor: gridColor ?? context.adColors.whiteTextColor,
            ),
          ),*/
        if (widget.item.subTitle?.isNotEmpty ?? false)
          Text(
            widget.item.subTitle.toString(),
            style: ADTextStyle700.size16,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_20,
          ),
        GridWidget(
          onTapHandler: (value) => {
            widget.onTapHandler?.call(value),
          },
          items: widget.item.widgetItems ?? [],
          isGrid: listColor != context.adColors.whiteTextColor,
        ).paddingBySide(
          left: context.k_10,
          right: context.k_10,
          bottom: context.k_20,
        ),
      ],
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double shimmerHeight_20 = 20.h;
  final double shimmerWidth_150 = 150.h;
  final double shimmerWidth_100 = 100.sp;
  final double shimmerHeight_100 = 100.sp;
  final int gridRowCount_3 = 3;
  final int shimmerItemCount = 12;

  ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: shimmerWidth_150,
              height: shimmerHeight_20,
            ).paddingBySide(left: context.k_16),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ADShimmerBuilder(
          shimmerBuilderType: ShimmerBuilderType.grid,
          shimmerWidget: ADShimmerWidget.shimmerShape(
            type: ShimmerType.circleWithText,
            height: shimmerHeight_100,
            width: shimmerWidth_100,
          ),
          gridRowCount: gridRowCount_3,
          itemCount: shimmerItemCount,
        ),
        ADSizedBox(
          height: context.k_10,
        ),
      ],
    );
  }
}
