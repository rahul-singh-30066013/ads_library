/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/flexible_space_app_bar.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_dashboard_grid_shimmer_widget.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_dashboard_shimmer_widget.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_grid_view.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_slider_view.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to show loyalty dashboard
class OfferDashboardMainScreen extends StatefulWidget {
  final String selectedOffersTabTitle;
  final String? airportName;

  const OfferDashboardMainScreen({
    Key? key,
    this.selectedOffersTabTitle = '',
    this.airportName,
  }) : super(key: key);

  @override
  State<OfferDashboardMainScreen> createState() =>
      _OfferDashboardMainScreenState();
}

class _OfferDashboardMainScreenState extends State<OfferDashboardMainScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final OffersStateManagement _offersStateManagement = OffersStateManagement();
  FocusNode focusNode = FocusNode();
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();

  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 90.sp;
  final percentageOfScrollScreen = 65.sp;
  final double k_25 = 0.2.sp;

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    focusNode.dispose();
    _scrollController.dispose();
    dynamicTitle.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    _offersStateManagement
      ..fetchDashBoardHome(airport: widget.airportName)
      ..getAllOffers(airportName: widget.airportName)
      ..selectedTab = widget.selectedOffersTabTitle;

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        globalKey.currentState?.innerController
            .jumpTo(MediaQuery.of(context).size.height * k_25);
      }
    });
    super.initState();
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;

    dynamicTitle.value = percentageOfScroll <= percentageOfScrollScreen
        ? 'offers_and_discount'.localize(context)
        : '';
  }

  Timer? _debounce;

  Future<void> searchOffers({String searchTerm = ''}) async {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 100),
      () => {
        _offersStateManagement.searchedOffersList(searchTerm: searchTerm),
      },
    );
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    _offersStateManagement.searchedOffersList();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: expandedHeight.toInt()),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: NestedScrollView(
          key: globalKey,
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              pinned: true,
              title: AnimatedBuilder(
                animation: Listenable.merge([dynamicTitle]),
                builder: (BuildContext context, _) => Text(
                  dynamicTitle.value,
                  style: ADTextStyle700.size22,
                  maxLines: 1,
                ).paddingBySide(left: context.k_10),
              ),
              leadingWidth: Platform.isIOS ? leadingWidth_42 : context.k_38,
              leading: const BackButton().paddingBySide(left: context.k_10),
              expandedHeight: expandedHeight,
              flexibleSpace: FlexibleSpaceAppBar(
                context,
                title: 'offers_and_discount'.localize(context),
                flexibleSpaceBar: expandedHeight,
                paddingLeft: context.k_20,
              ),
            ),
          ],
          body: ADSelectorStateLessWidget<OffersStateManagement>(
            key: const Key('DashBoard'),
            viewModel: _offersStateManagement,
            child: Selector<OffersStateManagement, ADResponseState>(
              selector: (context, viewModel) => viewModel.offerSiteCoreState,
              builder: (context, value, Widget? child) {
                if (_offersStateManagement.isInStoreAirportClicked) {
                  scrollToTop();
                  _offersStateManagement.isInStoreAirportClicked = false;
                }
                switch (value.viewStatus) {
                  case Status.loading:
                    return Center(
                      child: OfferDashboardShimmerWidget(),
                    );
                  case Status.error:
                    return Center(child: Text(value.message.toString()));
                  case Status.complete:
                    // final response = (value.data as OfferDashboardResponse).elements;
                    final List<Elements> response =
                        value.data as List<Elements>;
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (response.isNotEmpty)
                          OfferSliderView(
                            dashBoardItem: response.first.fields.widget,
                          ),
                        Selector<OffersStateManagement, ADResponseState>(
                          selector: (context, viewModel) =>
                              viewModel.offersState,
                          builder: (context, value, Widget? child) {
                            switch (value.viewStatus) {
                              case Status.loading:
                                return Center(
                                  child: OfferDashboardGridShimmerWidget()
                                      .paddingBySide(
                                    left: context.k_16,
                                    right: context.k_16,
                                    top: context.k_48,
                                  ),
                                );
                              case Status.error:
                                return Center(
                                  child: Text(value.message.toString()),
                                );
                              case Status.complete:
                                final List<WidgetItem> response =
                                    (value.data as OfferItems).result;
                                return response.isNotEmpty
                                    ? Column(
                                        children: [
                                          TabSliderView(
                                            selectedTabTitle:
                                                _offersStateManagement
                                                    .selectedTab,
                                            response: response,
                                            offersStateManagement:
                                                _offersStateManagement,
                                            buildContext: context,
                                            searchTextController:
                                                searchTextController,
                                          ),
                                          SearchView(
                                            hintText: 'Search offers',
                                            onChanged: (value) => {
                                              searchOffers(searchTerm: value),
                                            },
                                            onFieldSubmitted: (value) => {},
                                            onIconButtonPressed: () =>
                                                clearFocusController(context),
                                            focusNode: focusNode,
                                          ).paddingBySide(
                                            top: context.k_20,
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          Selector<OffersStateManagement,
                                              List<WidgetItem>>(
                                            selector: (context, viewModel) =>
                                                viewModel.filteredOfferList,
                                            builder: (
                                              context,
                                              value,
                                              Widget? child,
                                            ) {
                                              return value.isNotEmpty
                                                  ? OfferGridView(
                                                      offersStateManagement:
                                                          _offersStateManagement,
                                                      offerItems: value,
                                                    ).paddingBySide(
                                                      top: context.k_20,
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                    )
                                                  : NoOfferView().paddingBySide(
                                                      top: context.k_60,
                                                    );
                                            },
                                          ),
                                        ],
                                      )
                                    : NoOfferView();
                              default:
                                return Container();
                            }
                          },
                        ),
                      ],
                    );
                  default:
                    return Container();
                }
                // return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TabSliderView extends StatefulWidget {
  final List<WidgetItem> response;
  final OffersStateManagement offersStateManagement;
  final BuildContext buildContext;
  final TextEditingController searchTextController;
  final String selectedTabTitle;

  const TabSliderView({
    Key? key,
    required this.response,
    required this.offersStateManagement,
    required this.buildContext,
    required this.searchTextController,
    required this.selectedTabTitle,
  }) : super(key: key);

  @override
  State<TabSliderView> createState() => _TabSliderViewState();
}

class _TabSliderViewState extends State<TabSliderView>
    with TickerProviderStateMixin {
  TabController? _controller;
  int selectedIndex = 0;
  List<WidgetItem> distinct = List.empty();

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  void initState() {
    super.initState();
    distinct = widget.response.distinct((d) => d.tabTitle).toList()
      ..insert(0, WidgetItem(tabTitle: widget.offersStateManagement.allOffers));
    _controller = TabController(length: distinct.length, vsync: this);
    // For Pre Selected Tab Logic (Only runs once)
    for (final WidgetItem element in distinct) {
      if (element.tabTitle
              .replaceAll(' ', '')
              .replaceAll('-', '')
              .toLowerCase() ==
          widget.selectedTabTitle
              .replaceAll(' ', '')
              .replaceAll('-', '')
              .toLowerCase()) {
        _controller?.animateTo(
          distinct.indexOf(element),
          duration: const Duration(
            seconds: 1,
          ),
        );
      }
    }
    _controller?.addListener(() {
      if (selectedIndex != _controller?.index) {
        widget.searchTextController.clear();
        FocusScope.of(widget.buildContext).unfocus();
        selectedIndex = _controller?.index ?? 0;
        widget.offersStateManagement.tabsOfferList(
          tab: distinct[selectedIndex].tabTitle,
        );

        ///GA event for selecting tab
        GaEvent.getInstance().offersAndDiscountEvent();
        final map = GaEvent.getInstance().parameterMap;
        map[Parameters.type.name] = distinct[selectedIndex].tabTitle;
        ClickEvents.select_offers_discount_tab.logEvent(parameters: map);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: distinct.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _controller,
            padding: EdgeInsets.only(
              top: context.scaled(context.k_12),
            ),
            isScrollable: true,
            tabs: distinct
                .map(
                  (e) => Tab(
                    text: e.tabTitle,
                  ),
                )
                .toList(),
            unselectedLabelStyle: ADTextStyle400.size16.copyWith(
              color: context.adColors.greyTextColor,
            ),
            labelStyle: ADTextStyle500.size16.copyWith(
              color: context.adColors.neutralInfoMsg,
            ),
            indicatorColor: context.adColors.neutralInfoMsg,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE2E2E2),
          ),
        ],
      ).paddingBySide(
        top: context.k_20,
      ),
    );
  }
}

class NoOfferView extends StatelessWidget {
  final double errorImageHeight_120 = 120.sp;
  final double errorImageWidth_120 = 120.sp;
  final double k_50 = 0.5;

  NoOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            SvgAssets.couponNotAvailable,
            height: errorImageHeight_120,
            width: errorImageWidth_120,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            'no_offers_found'.localize(context),
            style: ADTextStyle700.size16.copyWith(
              color: context.adColors.black,
            ),
          ),
        ],
      ).paddingBySide(bottom: MediaQuery.of(context).size.height * k_50),
    );
  }
}
