import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/models/stand_alone_api_urls_model.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/repository/dashboard/stand_alone_dashboard_repository.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';

class StandAloneDashboardStateManagement extends BaseViewModel {
  StandAloneDashboardStateManagement(this.standAloneStateManagement);

  StandAloneStateManagement standAloneStateManagement;

  void update(StandAloneStateManagement _standAloneStateManagement) {
    standAloneStateManagement = _standAloneStateManagement;
    adLog('new Instance of $standAloneStateManagement');
  }

  List<DashboardItem> dashBoardItems = [];
  final StandAloneDashboardRepository _porterDashboardRepository =
      StandAloneDashboardRepository();

  DashboardItem bookingFormServiceItem = const DashboardItem();

  Future<void> getDashboard() async {
    updateState(ViewState.loading);
    final ApiPathQueryModel dashApiPathQueryModel =
        standAloneStateManagement.getApiModel().dashboardApi;
    final ADResponseState responseState =
        await _porterDashboardRepository.getPorterDashBoardItems(
      path: dashApiPathQueryModel.path,
      queryParams: dashApiPathQueryModel.queryParams ?? {},
    );
    if (responseState.viewStatus == Status.complete) {
      dashBoardItems = responseState.data as List<DashboardItem>;
      updateState(ViewState.success);
    } else {
      error = responseState.message ?? '';
      // await _getDashBoardDataFromJson();
    }
  }

  // Future<void> _getDashBoardDataFromJson() async {
  //   await _porterDashboardRepository
  //       .getDashBoardItemsListFromJson(JsonAssets.siteCorePorterHome)
  //       .then((value) {
  //     dashBoardItems = value.data as List<DashboardItem>;
  //     updateState(ViewState.success);
  //   });
  // }

  void setBookingWidgetItem(DashboardItem item) {
    bookingFormServiceItem = item;
    adLog('set $item');
  }

  void homeTileOnTapHandler(widgetItem, BuildContext context) {
    const String helpAndSupport = '1001';
    const String feedback = '1002';
    const String rateUs = '1003';

    if (widgetItem != null) {
      final data = widgetItem as WidgetItem;
      switch (data.uniqueId) {
        case helpAndSupport:
          Utils.helpBottomSheet(context, data.contactDetail);
          break;
        case feedback:
          navigateToScreenUsingNamedRoute(
            context,
            customerFeedback,
          );
          break;
        case rateUs:
          Utils.openStore();
          break;
        default:
          adLog('Undefined Home Tile');
      }
    }
  }

  void carouselOnTapHandler(
    DashboardItem item,
    BuildContext context,
    int index,
  ) {
    if (item.widgetItems[index].ctaLink != '') {
      openWebView(
        url: item.widgetItems[index].ctaLink,
        title: item.widgetItems[index].ctaText,
        context: context,
      );
      return;
    }
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      standAloneBookingFormScreen,
      argumentObject: bookingFormServiceItem,
    );
    StandAloneGaAnalytics().bannerClickEvent(
      context,
      ClickEvents.view_banner,
    );
  }
}
