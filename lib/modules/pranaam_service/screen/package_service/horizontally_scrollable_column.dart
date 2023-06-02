/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:collection';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart'; // import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/tab_data.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_item/add_cart_item_request_model/add_cart_item_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/pranaam_remove_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/models/active_cart/response/get_active_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/custom_progress/ad_linear_progress_bar.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is the list of the packages we are offering to customers.
List<PackageDetail> listOfPackages = [];

int fromAirportId = 17;
int toAirportId = 31;
int businessUnitId = 2;

const int controllerIndex = 3;
const int id_6 = 6;
const double dotSize = 8;

///This is horizontally scrollable column which shows different packages available
class HorizontallyScrollableColumn extends StatefulWidget {
  const HorizontallyScrollableColumn({
    Key? key,
    required this.servicesTicksList,
    required this.isFromUpgrade,
  }) : super(key: key);

  final List<List<bool>> servicesTicksList;
  final bool isFromUpgrade;
  @override
  State<HorizontallyScrollableColumn> createState() =>
      _HorizontallyScrollableColumnState();
}

class _HorizontallyScrollableColumnState
    extends State<HorizontallyScrollableColumn> {
  Color dividerColor = const Color(0xffeeeeee);
  Color cardColor = const Color(0xfff3f7fc);
  Color yellowColor = const Color(0xffea9b31);
  Color redColor = const Color(0xff980000);

  final double height = 205.sp;
  final double k_0_3 = 0.303;
  final double k_0_2 = 0.25;
  double recommendedHeight = 10.sp;
  final buttonWidth = 42.sp;
  final buttonHeight = 84.sp;
  double sizedBoxHeight = 112.sp;
  int packagesLength = 3;
  int selectedPackageIndex = 0;
  PackageDetail packageDetail = const PackageDetail(
    name: 'name',
    shortDesc: 'shortDesc',
    packageNumber: '1',
    packageId: 1,
    pricingInfo: PricingInfo(),
  );

  PranaamAppDataStateManagement? _pranaamAppDataStateManagement;
  final List<DataColumn> lables = [];
  List<DataRow> packagesCheckboxes = [];

  HashMap<String, Object> bookPranaamSelectPackage = HashMap();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    if (_pranaamAppDataStateManagement?.packagesResponse.data != null) {
      final Data data = _pranaamAppDataStateManagement?.packagesResponse.data;
      listOfPackages = data.packageDetails;
      packageDetail = _pranaamAppDataStateManagement?.selectedPackageDetail ??
          const PackageDetail();
    }

    adLog('Widget build', className: this);
    lables.clear();
    prepareData(context, listOfPackages.length);
    /* adLog('Widget lables ${lables.length}', className: this);
    adLog(
      'Widget lables packagesCheckboxes ${packagesCheckboxes.length}',
      className: this,
    );
    for (int iii = 0; iii < lables.length; iii++) {
      adLog('Widget lables ${lables[iii].label}', className: this);
    }
    for (int jjj = 0; jjj < packagesCheckboxes.length; jjj++) {
      adLog(
        'Widget lables packagesCheckboxes ${packagesCheckboxes[jjj].cells.length}',
        className: this,
      );
    }*/

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 0,
          headingRowHeight: height,
          horizontalMargin: 0,
          checkboxHorizontalMargin: context.k_8,
          dataRowHeight: sizedBoxHeight,
          columns: lables,
          rows: isDataRowColumnIsEqual(packagesCheckboxes, lables)
              ? packagesCheckboxes
              : [],
          border: TableBorder.all(
            color: dividerColor,
          ),
        ),
      ),
    );
  }

  void fireBookPranaamSelectPackageEvent() {
    GaEvent.getInstance().selectPackageEvent(
      context.read<PranaamAppDataStateManagement>(),
      isForUpgrade: widget.isFromUpgrade,
    );
    ClickEvents.book_pranaam_select_package
        .logEvent(parameters: GaEvent.getInstance().parameterMap);
  }

  void addToCartEvent() {
    // GaEvent.getInstance()
    //     .addToCartEcommerceEvent(context.read<PranaamAppDataStateManagement>());
    // adLog(
    //   'setDataMap>>>>>>>>>>${GaEvent.getInstance().parameterMap.toString()}',
    // );
    // PranaamClickEvents.Add_to_cart.logAnalyticsEventItem(
    //   parameters: GaEvent.getInstance().parameterMap,
    //   items: GaEvent.getInstance().parameterMap['items']
    //       as List<AnalyticsEventItem>,
    // );
    PranaamBookingGaAnalytics().ecommerceEventAddCart(
      ClickEvents.add_to_cart,
      _pranaamAppDataStateManagement,
      isForUpgrade: widget.isFromUpgrade,
    );
  }

  void prepareRowsData() {
    packagesCheckboxes = [];
    List<DataCell> dataCells = [];
    int length = 0;

    for (int index = 0;
        index < listOfPackages[length].availableService.length;
        index++) {
      dataCells = [];
      for (int innerIndex = 0;
          innerIndex < listOfPackages.length;
          innerIndex++) {
        dataCells.add(
          DataCell(
            Container(
              alignment: AlignmentDirectional.center,
              child: listOfPackages[innerIndex]
                      .availableService[index]
                      .isAvailiable
                  ? Icon(
                      Icons.check,
                      color: context.adColors.greenColor,
                    )
                  : Icon(
                      Icons.close,
                      color: redColor,
                    ),
            ),
          ),
        );
      }
      packagesCheckboxes.add(DataRow(cells: dataCells));
      length = listOfPackages.length - 1;
    }
    adLog(' packagesCheckboxes length ${packagesCheckboxes.length}');
    /* for (final List<bool> serviceList in widget.servicesTicksList) {
      if (listOfPackages.length < serviceList.length) {
        serviceList.length = listOfPackages.length;
      }

      dataCells = [];
      for (final bool serviceAvailability in serviceList) {
        dataCells.add(
          DataCell(
            Container(
              alignment: AlignmentDirectional.center,
              child: serviceAvailability
                  ? Icon(
                      Icons.check,
                      color: context.adColors.greenColor,
                    )
                  : Icon(
                      Icons.close,
                      color: redColor,
                    ),
            ),
          ),
        );
      }
      adLog(' packagesCheckboxes length ${dataCells.length}');
      packagesCheckboxes.add(DataRow(cells: dataCells));
    }
    adLog(
        ' packagesCheckboxes length ${packagesCheckboxes.first.cells.length}');*/
  }

  void prepareData(BuildContext context, int length) {
    for (int labels = 0; labels < length; labels++) {
      lables.add(
        prepareDataColumn(context, labels),
      );
    }
    prepareRowsData();
  }

  final maxLines = 2;

  DataColumn prepareDataColumn(BuildContext context, int labels) {
    final int totalTravellers = _pranaamAppDataStateManagement
            ?.serviceBookingData.travellers?.totalTravellers ??
        0;
    return DataColumn(
      label: GestureDetector(
        onTap: () => {
          if (!listOfPackages[labels].isCurrent)
            {
              HapticFeedback.heavyImpact(),
              packageDetail = listOfPackages[labels],
              _pranaamAppDataStateManagement?.selectedPackageDetail =
                  packageDetail,
              context
                  .read<AppSessionState>()
                  .getActiveGeneralCartWithFuture()
                  .then(
                    (value) => {
                      addPackageToCart(
                        context,
                      ),
                      fireBookPranaamSelectPackageEvent(),
                    },
                  ),
              // addToCartEvent(),
            },
        },
        child: Container(
          width: getWidth(context),
          padding: EdgeInsets.symmetric(horizontal: context.k_6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.k_22,
              ),
              Text(
                listOfPackages[labels].name,
                style: ADTextStyle700.size16,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.k_8,
              ),
              Text(
                labels == 0
                    ? !widget.isFromUpgrade
                        ? 'recommended'.localize(context).toUpperCase()
                        : 'upgrade'.localize(context).toUpperCase()
                    : '',
                style: ADTextStyle700.size10.setTextColor(
                  yellowColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              if (!listOfPackages[labels].isCurrent)
                Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: listOfPackages[labels].pricingInfo.totalFare.amount,
                  ),
                  style: ADTextStyle700.size16,
                )
              else
                const CurrentPackage(),
              ADSizedBox(
                height: context.k_14,
              ),
              if ((totalTravellers > 1 && !listOfPackages[labels].isCurrent) ||
                  (widget.isFromUpgrade && !listOfPackages[labels].isCurrent))
                SizedBox(
                  width: context.k_16,
                  height: context.k_16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(
                      'lib/assets/images/pranaam/information.png',
                    ),
                    onPressed: () => !widget.isFromUpgrade
                        ? showPriceBreakup(
                            context,
                            labels,
                            isGroupPackage:
                                listOfPackages[labels].isGroupPackage,
                          )
                        : showUpgradePriceBreakup(context, labels),
                  ),
                )
              else
                const SizedBox.shrink(),
              ADSizedBox(
                height: totalTravellers > 1 ? context.k_10 : context.k_16,
              ),
              if (!listOfPackages[labels].isCurrent)
                SizedBox(
                  height: buttonWidth,
                  width: buttonHeight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: context.adColors.blueColor,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () => {
                      if (!DeBounce.isRedundantClick())
                        {
                          selectedPackageIndex = labels,
                          HapticFeedback.heavyImpact(),
                          packageDetail = listOfPackages[labels],
                          _pranaamAppDataStateManagement
                              ?.selectedPackageDetail = packageDetail,

                          context
                              .read<AppSessionState>()
                              .getActiveGeneralCartWithFuture()
                              .then(
                                (value) => {
                                  addPackageToCart(
                                    context,
                                  ),
                                  fireBookPranaamSelectPackageEvent(),
                                },
                              ),

                          // addToCartEvent(),
                        },
                    },
                    child: Selector<PranaamAppDataStateManagement, bool>(
                      selector: (context, model) => context
                          .read<PranaamAppDataStateManagement>()
                          .isBookPackageClicked,
                      builder: (context, value, child) =>
                          value && selectedPackageIndex == labels
                              ? ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                  size: dotSize,
                                )
                              : Text(
                                  'book'.localize(context),
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.whiteTextColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                    ),
                  ),
                ).paddingBySide(bottom: context.k_18)
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  double getWidth(BuildContext context) {
    return listOfPackages.length < packagesLength
        ? context.widthOfScreen * k_0_3
        : context.widthOfScreen * k_0_2;
  }

  Future<void> showPriceBreakup(
    BuildContext context,
    int labels, {
    required bool isGroupPackage,
  }) {
    return adShowBottomSheet(
      context: context,
      childWidget: PriceBreakupByTravellerTypeView(
        pricingInfo: listOfPackages[labels].pricingInfo,
        isGroupPackage: isGroupPackage,
      ),
      headerTitle: 'price_breakup'.localize(context),
    );
  }

  Future<void> showUpgradePriceBreakup(BuildContext context, int label) {
    return adShowBottomSheet(
      context: context,
      childWidget: UpgradePriceBreakupTypeView(
        newPackageDetails: listOfPackages[label],
      ),
      headerTitle: 'Upgraded Price',
    );
  }

  Future<void> addSelectedPackageToCart(
    BuildContext context, {
    BuildContext? dialogContext,
  }) async {
    await context
        .read<PranaamAppDataStateManagement>()
        .addPackageToCart(
          getAddCartItemRequest().toJson(),
          context.read<AppSessionState>(),
        )
        .then(
      (value) {
        closeProgressAndValidate(
          value,
          dialogContext ?? context,
        );
        if (value.viewStatus == Status.complete) {
          addToCartEvent();
        }
      },
    );
  }

  void closeProgressAndValidate(
    ADResponseState state,
    BuildContext dialogContext,
  ) {
    ProcessDialog.closeLoadingDialog(dialogContext);
    //navigatorPopScreen(dialogContext);
    switch (state.viewStatus) {
      case Status.complete:
        context.read<AppSessionState>().saveCart(CartType.pranaam.name);
        // final CupertinoTabScaffold scaffold =
        //     BottomBarState.key.currentWidget as CupertinoTabScaffold;
        // scaffold.controller?.index = controllerIndex;
        // HomeBottomAssets.homeBottomPages[BottomTabNavKeys.cartTabItemKey] =
        //     const CartScreen();
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          genericCartScreen,
          argumentObject: widget.isFromUpgrade,
        );
        break;
      case Status.error:
        SnackBarUtil.showSnackBar(
          context,
          state.message ?? '',
        );
        break;
      case Status.loading:
        const ADLinearProgressBar();
        break;
      default:
        break;
    }
  }

  void navigateToScreen(BuildContext context) {
    const int pageIndex = 3;
    context.read<TabData>().changeTab(Pages.values.elementAt(pageIndex));
    navigateToScreenUsingNamedRoute(
      context,
      cart,
      rootNavigator: false,
    );
  }

  Future<void> addPackageToCart(
    BuildContext context,
  ) async {
    /// check user logged in por not
    await callCartPackageOnBasisOfCartExists(
      context,
    );
  }

  Future<void> callCartPackageOnBasisOfCartExists(
    BuildContext context,
  ) async {
    // check if local cart is not empty....
    final int cartCount = getAddonAddedByUserCount(
      _pranaamAppDataStateManagement?.cartDataResponse,
    );
    adLog('get Cart Count $cartCount');
    final activeCartResponseModel = context
        .read<AppSessionState>()
        .activeCartResponseState
        .data as GetActiveCartResponseModel?;
    final bool isCartExists =
        activeCartResponseModel?.businessSubType == 'dutyFree' ||
            activeCartResponseModel?.businessSubType == 'Dutyfree';
    final bool isPranaamCartExists =
        activeCartResponseModel?.businessSubType == 'Pranaam' ||
            activeCartResponseModel?.businessSubType == 'pranaam';
    if (isCartExists) {
      _pranaamAppDataStateManagement?.updateBookPackageClick(value: false);
      // show dialog
      unawaited(
        showModalBottomSheet(
          useRootNavigator: true,
          backgroundColor: context.adColors.whiteTextColor,
          elevation: context.k_8,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(context.k_22),
            ),
          ),
          context: context,
          builder: (dialogContext) {
            return DutyFreeRemoveItem(
              detailString: 'remove_items'.localize(context),
              titleString: 'already_items'.localize(context),
              cancelText: 'start_afresh'.localize(context),
              yesCallBack: () async =>
                  clearDutyFreeCartAndAddPackage(context, dialogContext),
              noCallBack: () => navigatorPopScreen(dialogContext),
            );
          },
        ),
      );
      // adLog('$await bottomSheet.this');
    } else {
      if (isPranaamCartExists) {
        _pranaamAppDataStateManagement?.updateBookPackageClick(value: false);

        unawaited(
          showModalBottomSheet(
            useRootNavigator: true,
            backgroundColor: context.adColors.whiteTextColor,
            elevation: context.k_8,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.k_22),
              ),
            ),
            context: context,
            builder: (dialogContext) {
              return PranaamRemoveItem(
                confirmText: 'no'.localize(context),
                cancelText: 'yes'.localize(context),
                detailString: 'replace_items'.localize(context),
                titleString: 'already_cart'.localize(context),
                yesCallBack: () => {
                  clearPranaamCartAndAddPackage(context, dialogContext),
                },
                noCallBack: () => navigatorPopScreen(dialogContext),
              );
            },
          ),
        );
      } else {
        // means cart not exists call add select package
        adLog('else show dialog');
        //ProcessDialog.showLoadingDialog(context);
        _pranaamAppDataStateManagement?.selectedPackageValue(value: true);
        await addSelectedPackageToCart(
          context,
        );
      }
    }
  }

  Future<void> clearPranaamCartAndAddPackage(
    BuildContext context,
    BuildContext dialogContext,
  ) async {
    navigatorPopScreen(dialogContext);
    // ProcessDialog.showLoadingDialog(context);
    // PranaamClickEvents.popup_display
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
    context
        .read<PranaamAppDataStateManagement>()
        .updateBookPackageClick(value: true);
    final ADResponseState adResponseState = await CartRepository().deleteCart();
    if (adResponseState.viewStatus == Status.complete) {
      PranaamBookingGaAnalytics().popupDisplayGaAnalytics(
        context.read<PranaamAppDataStateManagement>(),
      );
      context.read<AppSessionState>().clearPranaamCartLocally();
      await addSelectedPackageToCart(context, dialogContext: dialogContext);
    } else {
      /// Error Case
      context
          .read<PranaamAppDataStateManagement>()
          .updateBookPackageClick(value: false);
      ProcessDialog.closeLoadingDialog(context);
      SnackBarUtil.showSnackBar(
        context,
        adResponseState.message ?? 'Something went wrong',
      );
    }
  }

  Future<void> clearDutyFreeCartAndAddPackage(
    BuildContext context,
    BuildContext dialogContext,
  ) async {
    navigatorPopScreen(dialogContext);
    // ProcessDialog.showLoadingDialog(dialogContext);
    final ADResponseState responseState =
        await context.read<AppSessionState>().clearDutyFreeCartApi(
              context: context,
            );
    if (responseState.viewStatus == Status.complete) {
      context.read<AppSessionState>().clearPranaamCartLocally();
      await addSelectedPackageToCart(context);
    } else {
      /// Error Case
      // ProcessDialog.closeLoadingDialog(dialogContext);
      SnackBarUtil.showSnackBar(
        context,
        responseState.message ?? 'Something went wrong',
      );
    }
  }

  void dismissDialogAndPush(
    BuildContext context,
    BuildContext dialogContext,
  ) {
    navigatorPopScreen(dialogContext);
    navigateToScreenUsingNamedRoute(
      context,
      cart,
      rootNavigator: false,
    );
  }

  /* void deleteItemCardData(
    BuildContext dialogContext,
  ) {
    adLog('$dialogContext');
    if (context.read<AppSessionState>().addedItemList.isNotEmpty) {
      context.read<AppSessionState>().clearProductList();
    }
  }*/

  AddCartItemRequestModel getAddCartItemRequest() {
    final pranaam_detail.PranaamDetail? pranaamDetail = context
        .read<BookingAndCancellationState>()
        .bookingDetailsResponse
        ?.orderDetail
        ?.pranaamDetail;
    return AddCartItemRequestModel(
      oldBookingId: widget.isFromUpgrade
          ? _pranaamAppDataStateManagement?.oldBookingId ?? 0
          : 0,
      oldBookingReferenceId: widget.isFromUpgrade
          ? _pranaamAppDataStateManagement?.oldBookingReferenceId ?? ''
          : '',
      pranaamBookingType: widget.isFromUpgrade ? 'UpgradeBooking' : '',
      serviceTypeId: _pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceId as int,
      serviceType: _pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle as String,
      travelSectorId: _pranaamAppDataStateManagement
          ?.serviceBookingData.selectedTravelSector?.travelSectorId as int,
      travelSector: _pranaamAppDataStateManagement?.serviceBookingData
          .selectedTravelSector?.travelSectorTitle as String,
      cartNumber: '0',
      childCount: _pranaamAppDataStateManagement
              ?.serviceBookingData.travellers?.children ??
          0,
      adultCount: _pranaamAppDataStateManagement
              ?.serviceBookingData.travellers?.adults ??
          1,
      infantCount: _pranaamAppDataStateManagement
              ?.serviceBookingData.travellers?.infants ??
          0,
      createdBy: '',
      packageDetail: (widget.isFromUpgrade)
          ? (_pranaamAppDataStateManagement?.selectedPackageDetail ??
                  const PackageDetail())
              .copyWith(
              oldPricingInfo: listOfPackages
                  .where((element) => element.isCurrent)
                  .first
                  .pricingInfo,
            )
          : _pranaamAppDataStateManagement?.selectedPackageDetail ??
              const PackageDetail(),
      tripDetail: widget.isFromUpgrade
          ? TripDetail(
              tripId: 0,
              tripBookingNumber: 'string',
              originAirportId: pranaamDetail?.tripDetails?.originAirportId ?? 0,
              originAirport: pranaamDetail?.tripDetails?.originAirport ?? '',
              destinationAirportId:
                  pranaamDetail?.tripDetails?.destinationAirportId ?? 0,
              destinationAirport:
                  pranaamDetail?.tripDetails?.destinationAirport ?? '',
              serviceAirportId:
                  pranaamDetail?.tripDetails?.serviceAirportId ?? 0,
              businessUnitId: businessUnitId,
              serviceDateTime:
                  pranaamDetail?.tripDetails?.serviceDateTime.toString() ?? '',
              flightName: pranaamDetail?.tripDetails?.flightName ?? '',
              flightNumber: pranaamDetail?.tripDetails?.flightNumber ?? '',
              flightTerminal: pranaamDetail?.tripDetails?.flightTerminal ?? '',
              flightDate:
                  pranaamDetail?.tripDetails?.flightDate.toString() ?? '',
              flightTime: pranaamDetail?.tripDetails?.flightTime ?? '',
              transitDestRoundTripSecOrigin: pranaamDetail
                      ?.roundTripDetail?.transitDestRoundTripSecOrigin ??
                  0,
              transitRoundTripSecFlightName:
                  pranaamDetail?.roundTripDetail?.flightName ?? '',
              transitRoundTripSecFlightNumber: int.parse(
                pranaamDetail?.roundTripDetail?.flightNumber ?? '0',
              ),
              transitRoundTripSecFlightTerminal: pranaamDetail
                      ?.roundTripDetail?.transitRoundTripSecFlightTerminal ??
                  '',
              transitRoundTripSecFlightDate:
                  pranaamDetail?.roundTripDetail?.flightDate.toString() ?? '',
              transitRoundTripSecFlightTime:
                  pranaamDetail?.roundTripDetail?.flightTime ?? '',
              roundTripSecServiceDateTime:
                  pranaamDetail?.roundTripDetail?.serviceDateTime.toString() ??
                      '',
              serviceAirport: pranaamDetail?.tripDetails?.serviceAirport ?? '',
              travelSector: pranaamDetail?.tripDetails?.travelSector ?? '',
              serviceAirportName:
                  pranaamDetail?.tripDetails?.serviceAirportName ?? '',
            )
          : TripDetail(
              tripId: 0,
              tripBookingNumber: 'string',
              originAirportId: int.tryParse(
                    _pranaamAppDataStateManagement?.serviceBookingData
                            .selectedCityDetailFrom?.airportID ??
                        '',
                  ) ??
                  0,
              originAirport: _pranaamAppDataStateManagement
                      ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                  '',
              destinationAirportId: int.tryParse(
                    _pranaamAppDataStateManagement?.serviceBookingData
                            .selectedCityDetailTo?.airportID ??
                        '',
                  ) ??
                  0,
              destinationAirport: _pranaamAppDataStateManagement
                      ?.serviceBookingData.selectedCityDetailTo?.cityCode ??
                  '',
              serviceAirportId: int.tryParse(
                    _pranaamAppDataStateManagement?.serviceAirportId ?? '',
                  ) ??
                  0,
              businessUnitId: businessUnitId,
              serviceDateTime: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .selectedFlightDetailModel
                      ?.serviceDateTime ??
                  '',
              flightName: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedFlightDetailModel?.flightFinalNumber ??
                  '',
              flightNumber: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedFlightDetailModel?.flightNo ??
                  '',
              flightTerminal: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedFlightDetailModel?.flightTerminal ??
                  '',
              flightDate: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedFlightDetailModel?.flightDate ??
                  '',
              flightTime: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedFlightDetailModel?.flightTime ??
                  '',
              transitDestRoundTripSecOrigin: int.tryParse(
                    _pranaamAppDataStateManagement
                            ?.serviceBookingData.arriveFrom?.airportID ??
                        '',
                  ) ??
                  0,
              transitRoundTripSecFlightName: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .roundTripTransitFlights
                      ?.flightFinalNumber ??
                  '',
              transitRoundTripSecFlightNumber: int.tryParse(
                    _pranaamAppDataStateManagement?.serviceBookingData
                            .roundTripTransitFlights?.flightNo ??
                        '',
                  ) ??
                  0,
              transitRoundTripSecFlightTerminal: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .roundTripTransitFlights
                      ?.flightTerminal ??
                  '',
              transitRoundTripSecFlightDate: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .roundTripTransitFlights
                      ?.flightDate ??
                  '',
              transitRoundTripSecFlightTime: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .roundTripTransitFlights
                      ?.flightTime ??
                  '',
              roundTripSecServiceDateTime: _pranaamAppDataStateManagement
                      ?.serviceBookingData
                      .roundTripTransitFlights
                      ?.serviceDateTime ??
                  '',
              serviceAirport:
                  _pranaamAppDataStateManagement?.serviceAirportCode ?? 'AMD',
              travelSector: _pranaamAppDataStateManagement?.serviceBookingData
                      .selectedTravelSector?.travelSectorTitle ??
                  '',
              serviceAirportName:
                  _pranaamAppDataStateManagement?.serviceAirport ?? '',
            ),
    );
  }
}

class PriceBreakupByTravellerTypeView extends StatelessWidget {
  const PriceBreakupByTravellerTypeView({
    required this.pricingInfo,
    required this.isGroupPackage,
    Key? key,
  }) : super(key: key);

  final PricingInfo pricingInfo;
  final bool isGroupPackage;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final List<PassengerTypeQuantity> passengerTypeQuantity =
        pricingInfo.passengerTypeQuantity;
    return passengerTypeQuantity.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isGroupPackage)
                ADRow(
                  leftText: 'Base Fare',
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                    pricingInfo.totalBaseFare.amount,
                  ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                ).paddingBySide(bottom: context.k_10)
              else
                ListView.builder(
                  itemCount: passengerTypeQuantity.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return RowView(
                      leftText: passengerTypeQuantity[index].code == 'ADT'
                          ? '${'adult'.localize(context)} * '
                              '${passengerTypeQuantity[index].quantity}'
                          : passengerTypeQuantity[index].code == 'CHD'
                              ? '${'child'.localize(context)} * '
                                  '${passengerTypeQuantity[index].quantity}'
                              : '${'infant'.localize(context)} * '
                                  '${passengerTypeQuantity[index].quantity}',
                      amount: passengerTypeQuantity[index].baseFare.amount,
                      dividerHeight: context.k_10,
                      showDivider: false,
                    );
                  },
                ),
              if ((pricingInfo.totalExpressFare?.amount ?? 0) > 0)
                ADRow(
                  leftText: 'Express Charges',
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                    pricingInfo.totalExpressFare?.baseFare ?? 0,
                  ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                )
              else
                const SizedBox.shrink(),
              if ((pricingInfo.totalExpressFare?.baseFare ?? 0) > 0)
                ADSizedBox(
                  height: context.k_10,
                ),
              ADRow(
                leftText: '${'cgst'.localize(context)} (9%)',
                rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                  pricingInfo.totalTax.cgst.amount,
                ),
                leftTextStyle: ADTextStyle400.size16,
                rightTextStyle: ADTextStyle400.size16,
              ),
              ADSizedBox(
                height: context.k_10,
              ),
              ADRow(
                leftText: '${'sgst'.localize(context)} (9%)',
                rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                  pricingInfo.totalTax.sgst.amount,
                ),
                leftTextStyle: ADTextStyle400.size16,
                rightTextStyle: ADTextStyle400.size16,
              ),
              Divider(
                thickness: 1,
                height: context.k_40,
              ),
              RowView(
                leftText: 'totalAmount'.localize(context),
                amount: pricingInfo.totalFare.amount,
                showDivider: true,
                dividerHeight: context.k_40,
                leftTextStyle: ADTextStyle500.size20,
                rightTextStyle: ADTextStyle700.size20,
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          )
        : const ADSizedBox.shrink();
  }
}

class UpgradePriceBreakupTypeView extends StatelessWidget {
  const UpgradePriceBreakupTypeView({
    Key? key,
    required this.newPackageDetails,
  }) : super(key: key);

  final PackageDetail newPackageDetails;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final PackageDetail currentPackageDetails =
        listOfPackages.firstWhere((element) => element.isCurrent);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RowView(
          leftText: 'New Pack price',
          amount: newPackageDetails.originalPricingInfo?.totalFare.amount ?? 0,
          dividerHeight: context.k_20,
          showDivider: false,
        ),
        RowView(
          leftText: 'Old Pack price',
          amount: currentPackageDetails.pricingInfo.totalFare.amount,
          showDivider: true,
          dividerHeight: context.k_40,
          isOldPrice: true,
        ),
        RowView(
          leftText: 'Total Amount',
          amount: newPackageDetails.pricingInfo.totalFare.amount,
          showDivider: true,
          dividerHeight: context.k_40,
          leftTextStyle: ADTextStyle500.size20,
          rightTextStyle: ADTextStyle700.size20,
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}

class RowView extends StatelessWidget {
  const RowView({
    Key? key,
    required this.leftText,
    required this.amount,
    required this.dividerHeight,
    required this.showDivider,
    this.isOldPrice = false,
    this.leftTextStyle,
    this.rightTextStyle,
  }) : super(key: key);

  final String leftText;
  final double amount;
  final double dividerHeight;
  final bool showDivider;
  final bool isOldPrice;
  final TextStyle? leftTextStyle;
  final TextStyle? rightTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADRow(
          leftText: leftText,
          rightText: isOldPrice
              ? '-${FlightUtils.getPriceFormatWithSymbol(
                  price: amount,
                )}'
              : FlightUtils.getPriceFormatWithSymbol(
                  price: amount,
                ),
          leftTextStyle: leftTextStyle ?? ADTextStyle400.size16,
          rightTextStyle: rightTextStyle ?? ADTextStyle400.size16,
        ),
        if (showDivider)
          Divider(
            thickness: 1,
            height: dividerHeight,
          )
        else
          ADSizedBox(
            height: dividerHeight,
          ),
      ],
    );
  }
}

class CurrentPackage extends StatelessWidget {
  const CurrentPackage({Key? key}) : super(key: key);
  static const containerHeight = 0.09;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightOfScreen * containerHeight,
      child: Text(
        'Current\nPackage',
        style:
            ADTextStyle500.size18.copyWith(color: context.adColors.greenColor),
      ),
    );
  }
}
