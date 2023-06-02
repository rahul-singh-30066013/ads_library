/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/story_view_screen.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/confetti/confetti_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/catalog_list_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_add_to_cart_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_coupon/duty_free_apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_coupon/duty_free_get_coupon_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_passenger_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_filter_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_cart_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/category/product_categories.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/coupon/duty_free_coupon_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_category_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_data.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_result_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_selected_filter_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/shopping_cart_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/terminal_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/categories_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/filters_list_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_cart_limit_full_pop_up.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_litres_limit_pop_up.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_left_menu_enum.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_event_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/view_models/duty_free_filter_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const case7 = 0;
const case8 = 8;
const preFixIndex = 1;

const String price = 'price';
const String allBrand = 'allbrands';

class DutyFreeState extends BaseViewModel {
  ///

  CancelToken? cancelToken;

  HashMap<String, String> isProgressMap = HashMap();
  DealProductModel? dealProductModel;

  DutyFreeProductListRequest? dutyFreeProductListRequest =
      const DutyFreeProductListRequest();
  DutyFreeItem? dutyFreeItem = DutyFreeItem();
  bool isFilterApplied = false;

  // CatalogListModel? _catalogListModel;
  CatalogListResponseModel? catalogListResponseModel;
  CatalogListResponseModel? catalogListResponseModelCart;
  List<DutyFreeProductDataModel> dutyFreeProductDataList = [];
  DutyFreeCartResponse? dutyFreeCartResponse;
  bool isCartContainLiquor = false;
  Map<String, Map<String, Map<String, int>>> addedItemMap = {};

  DutyFreeFilterBaseResponse? dutyFreeFilterBaseResponse;

  AirportItemModel? airportData;
  String catalogListTitle = '';
  String materialGroupCode = '';
  String selectedBrand = '';
  bool exclusive = false;
  bool includeOOS = false;
  bool isCheckSelected = false;

  // final List<DutyFreeImportantPoliciesResponse> cancellationPolicyList =
  //     List.empty(growable: true);
  // final List<DutyFreeImportantPoliciesResponse> importantInformationPolicyList =
  //     List.empty(growable: true);

  final DutyFreeRepository _repository = DutyFreeRepository();
  ADResponseState productListState = ADResponseState.loading();
  ADResponseState filterListState = ADResponseState.init();
  ADResponseState cartDetailState = ADResponseState.init();
  ADResponseState categoriesListState = ADResponseState.init();

  List<ShoppingCartContent> shoppingCartContent = List.empty(growable: true);
  List<ProductCategories> productCategoriesList = List.empty(growable: true);
  ADResponseState productPaginationState = ADResponseState.init();
  ADResponseState productFilterState = ADResponseState.init();

  TextEditingController countryNameController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController()
    ..text = '+91';
  TextEditingController nameOnPassportController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportExpiryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController flightNumberController = TextEditingController();
  TextEditingController pickupDateController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController assistanceCodeController = TextEditingController();

  bool isCustomerInfoPageTermsAndConditionRead = false;

  final TextEditingController applyCouponController = TextEditingController();
  bool isCouponAppliedFromInput = false;

  ValueNotifier<bool> isCouponApplying = ValueNotifier(false);
  bool isRemovedCouponClicked = false;

  double couponDiscount = 0;
  String countryCode = 'IND';
  int pageSize = 10;

  int dutyFreeSelectedIndex = -1;
  int dutyFreeAppliedSortIndex = -1;
  String? appliedSort;

  List<String> selectedCategoryDataList = [];
  String? storeType;
  List<String> selectedSubCategoryDataList = [];
  List<String> selectedBrandDataList = [];
  String selectedPrice = '';

  // Map<String, List<String>> addedCategoryMap = {};
  Map<String, Map<String, List<String>>> appliedFilterMap =
      <String, Map<String, List<String>>>{};
  Map<String, Map<String, List<String>>> tempFilterMap =
      <String, Map<String, List<String>>>{};

  List<FlightStatusSegment> filteredFlightList = List.empty();
  List<FlightStatusSegment> flightList = List.empty();
  FlightStatusSegment? flightStatusSegment;
  DateTime? pickUpDate;
  String pickupTime = '';
  DateTime? passportExpiryDate;
  DateTime? dateOfBirth;

  /// Initiate loading state for api hit
  ADResponseState flightStatusState = ADResponseState.init();

  final index = 2;
  num filterMinPrice = 0;
  num filterMaxPrice = 0;
  num filterMaxPriceBackup = 0;
  num priceSelectedValue = 0;
  num priceSelectedValueBackup = 0;

  // ValueNotifier<bool>? dashboardItemNotifier;

  // CatalogListResponseModel? dashboardListResponseModel;

  // List<CatalogListResponseModel?> dashboardCatalogList =
  //     List.empty(growable: true);

  // List<ValueNotifier<bool>> dashboardItemNotifierList =
  //     List.empty(growable: true);

  final index_2 = 1;

  bool ageAbove25 = false;

  AppSessionState? appSessionState;

  DutyFreeCartResponse? dutyFreeCartResponseCopy;

  ValueNotifier<TerminalModel> terminalModel = ValueNotifier(
    const TerminalModel(title: 'Departure Terminal 2', code: 'departure'),
  );

  List<TerminalModel> terminalList = List.empty(growable: true);

  ValueNotifier<String> cartError = ValueNotifier<String>('');

  bool terminalToolTipDisplay = true;

  String? collectionPointName;

  String? storeName;

  List<DutyFreeFilterViewModel> dutyFreeFilterList = List.empty(growable: true);

  bool cartLimitBottomSheetVisible = false;

  // AirportItemModel? _selectedAirportsData;

  void toggleAgeAbove25({
    required bool value,
  }) {
    ageAbove25 = value;
    notifyListeners();
  }

  DutyFreeEventState dutyFreeEventState = DutyFreeEventState();

  DutyFreeState() {
    dutyFreeEventState.dutyFreeState = this;
    // _selectedAirportsData = constant.selectedAirportsData;
  }

  // set selectedAirportsData(AirportItemModel? airportModel) {
  //   _selectedAirportsData = airportModel;
  // }

  // AirportItemModel? get selectedAirportsData => _selectedAirportsData;

  void onCallBackFromCategoryDialogWithoutCategoryCode({
    required SelectedItem data,
  }) {
    appliedFilterMap.clear();
    materialGroupCode = data.materialGroup;
    catalogListTitle = data.materialGroupTitle;
    if (data.categoryCode?.isNotEmpty ?? false) {
      appliedFilterMap[DutyFreeFilterConstants.category] = {
        data.categoryCode ?? '': List.empty(growable: true),
      };
    }
    if (data.brand?.isNotEmpty ?? false) {
      appliedFilterMap[DutyFreeFilterConstants.brands] = {
        DutyFreeFilterConstants.allBrands: List.of(data.brand ?? []),
      };
    }
    // addedCategoryMap.clear();
    dutyFreeProductDataList.clear();
    // dutyFreeFilterBaseResponse = null;
    dataList.removeRange(preFixIndex, dataList.length);
    initCatalogListScreen();
  }

  void onCallBackFromCategoryDialogWithCategoryCode({
    required SelectedItem data,
  }) {
    appliedFilterMap.clear();
    // final bool hasSameMaterialState = data.materialGroup == materialGroupCode;
    materialGroupCode = data.materialGroup;
    if (data.categoryCode?.isNotEmpty ?? false) {
      appliedFilterMap[DutyFreeFilterConstants.category] = {
        data.categoryCode ?? '': List.empty(growable: true),
      };
    }
    if (data.brand?.isNotEmpty ?? false) {
      appliedFilterMap[DutyFreeFilterConstants.brands] = {
        DutyFreeFilterConstants.allBrands: List.of(data.brand ?? []),
      };
    }
    if (dataList.length > preFixIndex) {
      dataList.removeRange(preFixIndex, dataList.length);
      dutyFreeProductDataList.clear();
    }
    catalogListTitle = data.materialGroupTitle;
    initCatalogListScreen();
    // if (!hasSameMaterialState) {
    // addedCategoryMap.clear();
    // }
    // addedCategoryMap[allBrand] = data.brand ?? [];
  }

  Future<void> initCatalogListScreen({String? slug}) async {
    cancelToken = CancelToken();
    // dashboardListResponseModel = null;
    adLog(
      'Avoid cascade consecutive method invocations on the same reference.',
    );
    // adLog('__airportCode__2: ${_selectedAirportsData?.airportCode}');

    currentPage = 1;
    dutyFreeProductListRequest = DutyFreeProductListRequest(
      language: 'en',
      materialGroup: materialGroupCode,
      pageSize: pageSize,
      channel: 'app',
      category: [],
      brand: [],
      subCategory: [],
      page: currentPage,
      slug: slug,
      airportCode: selectedAirportsData?.airportCode ?? '',
      storeType: storeType ?? terminalModel.value.code,
    );

    adLog(
      'Avoid cascade consecutive method invocations on the same reference.',
    );
    await getDutyFreeFilter(
      dutyFreeProductFilterRequest: DutyFreeProductFilterRequest(
        materialGroup: materialGroupCode,
        storeType: terminalModel.value.code,
        language: 'en',
        slug: slug,
        airportCode: selectedAirportsData?.airportCode ?? '',
      ),
    );
  }

  Future<void> getDutyFreeTerminalList({
    String? storeType,
  }) async {
    // final jsonString = await rootBundle.loadString(JsonAssets.terminalJson);
    terminalList = _parseListOfTerminals(selectedAirportsData);
    if (terminalList.isNotEmpty) {
      terminalModel.value = (selectedAirportsData?.airportCode ==
                      dutyFreeCartResponse?.airportCode &&
                  (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)) ||
              (storeType?.isNotEmpty ?? false)
          ? terminalList.firstWhere(
              (element) =>
                  ((storeType?.isNotEmpty ?? false) &&
                      element.code.toLowerCase() == storeType?.toLowerCase()) ||
                  ((storeType?.isEmpty ?? true) &&
                      element.code ==
                          dutyFreeCartResponse?.itemDetails.first.storeType),
              orElse: () => terminalList.first,
            )
          : terminalList.first;
    }
  }

  static List<TerminalModel> _parseListOfTerminals(
    AirportItemModel? selectedAirport,
  ) {
    final List<TerminalModel> terminalList = List.empty(growable: true);
    if (selectedAirport?.terminalsList?.isNotEmpty ?? false) {
      selectedAirport?.terminalsList?.forEach((element) {
        if (element.dutyFreeAvailable ?? false) {
          element.gates?.forEach((gateElement) {
            // if (gateElement.dutyFreeAvailable ?? false) {
            terminalList.add(
              TerminalModel(
                title: '${element.terminalName}, ${gateElement.gate}',
                code: gateElement.gate?.toLowerCase() ?? '',
              ),
            );
            // }
          });
        }
      });
    }
    return terminalList;
  }

  String? preOrderDiscountLabel;
  String? totalPrice;
  String? discountText;
  String? couponDiscountText;
  int percent = 100;

  List<DutyFreeFilter> dataList = List.empty(growable: true);

  void resetParams() {
    // filterBrands.clear();
    storeType = null;
    selectedCategoryDataList.clear();
    selectedSubCategoryDataList.clear();
    selectedBrandDataList.clear();
    appliedFilterMap.clear();
    catalogListTitle = '';
    materialGroupCode = '';
    selectedBrand = '';
    exclusive = false;
    includeOOS = false;
  }

  void resetData() {
    currentPage = 1;
    dutyFreeSelectedIndex = -1;
    dutyFreeAppliedSortIndex = -1;
    appliedSort = null;
    productListState = ADResponseState.loading();
    filterListState = ADResponseState.loading();
    catalogListResponseModel = null;
    dutyFreeProductDataList.clear();
    dutyFreeFilterBaseResponse = null;
    // addedCategoryMap.clear();
    // appliedFilterMap.clear();
    // addedItemMap.clear();
    // isFilterApplied = false;

    if (dataList.length > preFixIndex) {
      dataList.removeRange(preFixIndex, dataList.length);
    }
    priceSelectedValue = 0;
    priceSelectedValueBackup = 0;
    cancelToken?.cancel();
    exclusive = false;
    includeOOS = false;
  }

  void resetCustomerInfo() {
    // final bool passengerDetailAvailable =
    //     dutyFreeCartResponse?.passengerDetail.isNotEmpty ?? false;
    // adLog('passenger available $passengerDetailAvailable');
    pickUpDate = null;
    dateOfBirth = null;
    passportExpiryDate = null;
    countryCode =
        ProfileSingleton.profileSingleton.countryCodeData.countryCode ?? 'IN';
    // if (passengerDetailAvailable &&
    //     (dutyFreeCartResponse?.passengerDetail.first.pickupDate.isNotEmpty ??
    //         false)) {
    //   try {
    //     pickUpDate = DateFormat(Constant.dateFormat11).parse(
    //       dutyFreeCartResponse?.passengerDetail.first.pickupDate ?? '',
    //     );
    //     pickUpDate =
    //         DateTime.now().difference(pickUpDate ?? DateTime.now()).inDays > 0
    //             ? null
    //             : DateTime(
    //                 pickUpDate?.year ?? 0,
    //                 pickUpDate?.month ?? 0,
    //                 pickUpDate?.day ?? 0,
    //                 passengerDetailAvailable
    //                     ? int.parse(
    //                         dutyFreeCartResponse
    //                                 ?.passengerDetail.first.pickupTime
    //                                 .split(':')
    //                                 .first ??
    //                             '0',
    //                       )
    //                     : 0,
    //                 passengerDetailAvailable
    //                     ? int.parse(
    //                         dutyFreeCartResponse
    //                                 ?.passengerDetail.first.pickupTime
    //                                 .split(':')[1] ??
    //                             '0',
    //                       )
    //                     : 0,
    //               );
    //   } catch (e) {
    //     adLog(e.toString());
    //   }
    // }
    // if (passengerDetailAvailable &&
    //     (dutyFreeCartResponse?.passengerDetail.first.customerDOB.isNotEmpty ??
    //         false)) {
    //   try {
    //     dateOfBirth = DateFormat(Constant.dateFormat11).parse(
    //       dutyFreeCartResponse?.passengerDetail.first.customerDOB ?? '',
    //     );
    //   } catch (e) {
    //     adLog(e.toString());
    //   }
    // }
    // if (passengerDetailAvailable &&
    //     (dutyFreeCartResponse
    //             ?.passengerDetail.first.customerPassportExpiry.isNotEmpty ??
    //         false)) {
    //   try {
    //     passportExpiryDate = DateFormat(Constant.dateFormat11).parse(
    //       dutyFreeCartResponse?.passengerDetail.first.customerPassportExpiry ??
    //           '',
    //     );
    //   } catch (e) {
    //     adLog(e.toString());
    //   }
    // }
    String? userName =
        '${appSessionState?.profileModel.personInfo?.firstName ?? ''} ${appSessionState?.profileModel.personInfo?.middleName ?? ''} ${appSessionState?.profileModel.personInfo?.lastName ?? ''}';
    userName = userName.replaceAll('  ', ' ').trim();
    if (userName.isNotEmpty) {
      nameOnPassportController.text = userName;
    }
    passportNumberController.clear();
    phoneNumberController.text =
        '${(appSessionState?.profileModel.personInfo?.phones?.isNotEmpty ?? false) ? appSessionState?.profileModel.personInfo?.phones?.first.number : ''}';
    passportExpiryController.clear();
    // passportExpiryController.text = passengerDetailAvailable &&
    //         passportExpiryDate != null
    //     ? dutyFreeCartResponse?.passengerDetail.first.customerPassportExpiry ??
    //         ''
    //     : '';
    // flightNumberController.text = passengerDetailAvailable && pickUpDate != null
    //     ? dutyFreeCartResponse?.passengerDetail.first.flightNo ?? ''
    //     : '';
    flightNumberController.clear();
    // nameOnPassportController.text = passengerDetailAvailable
    //     ? dutyFreeCartResponse?.passengerDetail.first.customerName ?? ''
    //     : '';
    // pickupDateController.text = passengerDetailAvailable && pickUpDate != null
    //     ? dutyFreeCartResponse?.passengerDetail.first.pickupDate ?? ''
    //     : '';
    nameOnPassportController.clear();
    pickupDateController.clear();
    // pickupTimeController.text = passengerDetailAvailable && pickUpDate != null
    //     ? DateFormat('hh:mm a').format(pickUpDate ?? DateTime.now())
    //     : '';
    pickupTimeController.clear();
    dateOfBirthController.clear();
    // dateOfBirthController.text = passengerDetailAvailable
    //     ? dutyFreeCartResponse?.passengerDetail.first.customerDOB ?? ''
    //     : '';
    // emailIdController.text = passengerDetailAvailable
    //     ? dutyFreeCartResponse?.passengerDetail.first.emailId ?? ''
    //     : '';
    emailIdController.text =
        '${(appSessionState?.profileModel.personInfo?.emails?.isNotEmpty ?? false) ? appSessionState?.profileModel.personInfo?.emails?.first.emailAddress : ''}';
    assistanceCodeController.clear();
    // emailIdController.text = passengerDetailAvailable
    //     ? dutyFreeCartResponse?.passengerDetail.first.emailId ?? ''
    //     : '';
    // final String profileCountryCode = '${(appSessionState?.profileModel.personInfo?.phones?.first.countryCode?.isNotEmpty ?? false) ? appSessionState?.profileModel.personInfo?.phones?.first.countryCode : '+91'}';
    //
    // final CountryCodeData countryCodeData = context.read<SiteCoreStateManagement>().countryCodeFinalData.singleWhere((element) => element.countryCode==profileCountryCode);
    // String countryCodde = '${(appSessionState?.profileModel.personInfo?.phones?.first?.countryCode?.isNotEmpty ?? false) ? appSessionState?.profileModel.personInfo?.phones?.first?.countryCode : '+91'}';

    countryNameController.text =
        '${(appSessionState?.profileModel.personInfo?.nationality?.isNotEmpty ?? false) ? appSessionState?.profileModel.personInfo?.nationality : ''}';

    countryCodeController.text =
        ProfileSingleton.profileSingleton.countryCodeData.callingCode ?? '+91';
    // countryCodeController.text = countryCodeData.countryCode ?? '';
    isCustomerInfoPageTermsAndConditionRead = false;
  }

  static Future<CatalogListModel?> getAirportMallCategoryListFromJson(
    String jsonPath,
  ) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    return compute(_parseCategoryListData, jsonString);
  }

  static CatalogListModel _parseCategoryListData(String jsonBody) {
    final parsed = json.decode(jsonBody);
    return CatalogListModel.fromJson(parsed);
  }

  void updateFavoriteState({required int index}) {
    adLog('$index');
    //TODO implement logic
    notifyListeners();
  }

  Future<void> updateCart({
    required BuildContext context,
    required bool fromCartPage,
    required DutyFreeProductDataModel dutyFreeProductDataModel,
    bool increment = true,
  }) async {
    if (context.read<AppSessionState>().cartType != CartType.noDataInCart &&
        context.read<AppSessionState>().cartType != CartType.dutyFree) {
      context.read<AppSessionState>().clearDutyFreeCartDialog(context);
    } else {
      await checkPranaamCartExists(
        context,
        dutyFreeProductDataModel,
        increment: increment,
        fromCartPage: fromCartPage,
      );
      adLog(
        'checkPranaamCartExists',
        className: this,
      );
    }
  }

  Future<void> addItemToCart(
    DutyFreeProductDataModel dutyFreeProductDataModel,
    BuildContext context, {
    bool increment = false,
    required bool fromCartPage,
  }) async {
    addProgress(dutyFreeProductDataModel.skuCode);
    appSessionState ??= context.read<AppSessionState>();
    notifyListeners();

    final int quantity = getSkuQty(
      dutyFreeProductDataModel.skuCode,
      storeType: dutyFreeProductDataModel.storeType,
      airportCode: dutyFreeProductDataModel.airportCode.isNotEmpty
          ? dutyFreeProductDataModel.airportCode
          : null,
    );
    //TODO Make user id and store type as per user login and choice
    final request = DutyFreeAddToCartRequest.fromDutyFreeProductDataModel(
      dutyFreeProductDataModel,
      terminalModel.value.code,
      increment ? quantity + 1 : quantity - 1,
    );

    dutyFreeCartResponseCopy = dutyFreeCartResponse;
    await _repository.addToCart(addToCartRequest: request).then((value) async {
      if (value.viewStatus == Status.complete) {
        try {
          final CustomTabScaffold customTabScaffold =
              BottomBarState.key.currentWidget as CustomTabScaffold;
          customTabScaffold.heightNotifier.value =
              customTabScaffold.tabBar.height;
        } catch (e) {
          adLog(e.toString());
        }
        if (!fromCartPage && increment) {
          PlaySound.playAudioSound('add_cart.mp3');
        }
        // save duty free cart name in preferences
        cartError.value = '';
        // final variable = model.copyWith(
        //   quantity: increment ? quantity + 1 : quantity - 1,
        // );

        dutyFreeCartResponse = value.data != null
            ? DutyFreeCartResponse.fromJson(value.data)
            : null;
        if (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) {
          if (terminalList.isEmpty) {
            await getDutyFreeTerminalList();
          }
          //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
          if (terminalList.isNotEmpty) {
            terminalModel.value = terminalList.firstWhere(
              (element) =>
                  element.code.toLowerCase() ==
                  (dutyFreeCartResponse?.itemDetails.first.storeType
                          .toLowerCase() ??
                      ''),
              orElse: () => terminalList.first,
            );
          }
        } else {
          dutyFreeEventState.clearCartEvent(
            response: dutyFreeCartResponseCopy,
            type: CartType.dutyFree,
            isExclusive: dutyFreeProductDataModel.isExclusive,
          );
        }
        if (!fromCartPage) {
          updateCartMap();
        }

        if (shoppingCartContent.isNotEmpty) {
          shoppingCartContent.first.price =
              '${dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0}';
        } else {
          shoppingCartContent.add(
            ShoppingCartContent(
              title: totalPrice ?? '',
              price:
                  dutyFreeCartResponse?.unitPriceResponse?.amount.toString() ??
                      '0',
            ),
          );
        }
        if (shoppingCartContent.length > index_2) {
          shoppingCartContent[index_2].price =
              '${dutyFreeCartResponse?.preOrderDiscount?.amount ?? 0}';
        } else {
          addDiscount();
          addPreOrderDiscount();
          addCouponDiscount();
        }
        cartDetailState.viewStatus = Status.complete;
        if (increment) {
          dutyFreeEventState
            ..addToCartEvent(
              skuCode: request.skuCode,
              quantity: 1,
              isExclusive: dutyFreeProductDataModel.isExclusive,
            )
            ..cartUpdated(
              skuCode: request.skuCode,
              quantity: 1,
              type: 'add',
              isExclusive: dutyFreeProductDataModel.isExclusive,
            );
        } else {
          dutyFreeEventState
            ..removeFromCartEvent(
              request: request,
              quantity: 1,
              isExclusive: dutyFreeProductDataModel.isExclusive,
              isPromotion: dutyFreeProductDataModel.promotions.isNotEmpty,
            )
            ..cartUpdated(
              addToCartRequest: request,
              quantity: 1,
              type: 'remove',
              isExclusive: dutyFreeProductDataModel.isExclusive,
            );
        }
        if (fromCartPage) {
          await getCartDetails(context, showProgress: false)
              .then((value) => adLog('value ${value.toString()}'));
        } else {
          notifyListeners();
        }
        Future.delayed(
          const Duration(milliseconds: 100),
          () {
            appSessionState?.saveCart(
              (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
                  ? CartType.dutyFree.name
                  : CartType.noDataInCart.name,
            );
            appSessionState?.cartType =
                (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
                    ? CartType.dutyFree
                    : CartType.noDataInCart;
          },
        );
        // dashboardListResponseModel =
        //     dashboardListResponseModel?.copyWith(result: dutyFreeProductList);
        // try {
        //   dashboardItemNotifier?.value =
        //       !(dashboardItemNotifier?.value ?? false);
        // } catch (e) {
        //   adLog(e.toString());
        // }
      } else {
        notifyListeners();
        if (value.errorCode == 'DFAC10') {
          showClearCartDialog(
            context,
            () => addItemToCart(
              dutyFreeProductDataModel,
              context,
              increment: increment,
              fromCartPage: fromCartPage,
            ),
          );
        } else if (value.errorCode == 'DFGC05') {
          showPranaamExistsBottomSheet(
            context,
            () => addItemToCart(
              dutyFreeProductDataModel,
              context,
              increment: increment,
              fromCartPage: fromCartPage,
            ),
          );
        } else if (value.errorCode == 'DFAC02') {
          showClearCartDialog(
            context,
            () => addItemToCart(
              dutyFreeProductDataModel,
              context,
              increment: increment,
              fromCartPage: fromCartPage,
            ),
          );
        } else {
          cartLiquorLimitError(context, value);
        }
        // cartError.value = value.message ?? '';
      }
      // if (!fromPdpPage) {
      //   dashboardListResponseModel = null;
      // }
      removeProgress(
        dutyFreeProductDataModel.skuCode,
        updateProgress: !fromCartPage,
      );
    });
    // HomeBottomAssets.homeBottomPages[BottomTabNavKeys.cartTabItemKey] =
    //     const GenericCartScreen();
  }

  void cartErrorBottomSheet(
    BuildContext context,
    String detailString,
  ) {
    if (!cartLimitBottomSheetVisible) {
      cartLimitBottomSheetVisible = true;
      adShowBottomSheet(
        isHeaderRequired: false,
        context: context,
        childWidget: DutyFreeCartLimitFullPopUp(
          titleString: 'Error',
          detailString: detailString,
        ),
        headerTitle: '',
        isPaddingRequired: false,
      ).then((value) {
        cartLimitBottomSheetVisible = false;
      });
    }
  }

  void limitErrorBottomSheet(
    BuildContext context,
    String detailString,
  ) {
    if (!cartLimitBottomSheetVisible) {
      cartLimitBottomSheetVisible = true;
      adShowBottomSheet(
        isHeaderRequired: false,
        context: context,
        childWidget: DutyFreeLitresLimitPopUp(
          titleString: 'Error',
          detailString: detailString,
        ),
        headerTitle: '',
        isPaddingRequired: false,
      ).then((value) {
        cartLimitBottomSheetVisible = false;
      });
    }
  }

  void addDiscount() {
    if (shoppingCartContent.length < three) {
      if ((dutyFreeCartResponse?.discountPrice?.amount ?? 0) > 0) {
        shoppingCartContent.add(
          ShoppingCartContent(
            title: '${discountText ?? ''} ',
            priceTypeColor: 'green',
            price: '${dutyFreeCartResponse?.discountPrice?.amount ?? 0}',
          ),
        );
      }
    }
  }

  void cartLiquorLimitError(BuildContext context, ADResponseState value) {
    const int waitTime = 4000;
    switch (value.errorCode) {
      case 'DFAC03':
        cartErrorBottomSheet(
          context,
          value.message ?? '',
        );
        break;
      case 'DFAC04':
        limitErrorBottomSheet(context, value.message ?? '');
        break;
      default:
        cartError.value = value.message ?? '';
        SnackBarUtil.showSnackBar(
          context,
          value.message ?? '',
          waitTime,
        );
        break;
    }
  }

  void addPreOrderDiscount() {
    if (shoppingCartContent.length < three) {
      if ((dutyFreeCartResponse?.preOrderDiscount?.amount ?? 0) > 0) {
        bool isAlreadyExist = false;
        for (int count = 0; count < shoppingCartContent.length; count++) {
          if (shoppingCartContent[count].title ==
              '${preOrderDiscountLabel ?? ''} ${getFormattedPercent()}') {
            isAlreadyExist = true;
          }
        }
        if (!isAlreadyExist) {
          shoppingCartContent.add(
            ShoppingCartContent(
              title: '${preOrderDiscountLabel ?? ''} ${getFormattedPercent()}',
              priceTypeColor: 'green',
              price:
                  '${dutyFreeCartResponse?.preOrderDiscount?.amount.toDouble() ?? 0}',
              showInfoIcon:
                  (dutyFreeCartResponse?.preOrderDiscountBreakup.length ?? 0) >
                      0,
            ),
          );
        }
      }
    }
  }

  void addCouponDiscount() {
    int index = -1;
    for (int count = 0; count < shoppingCartContent.length; count++) {
      if (shoppingCartContent[count].title == couponDiscountText) {
        index = count;
      }
    }

    if (index == -1) {
      if ((dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0) >
          0) {
        shoppingCartContent.add(
          ShoppingCartContent(
            title: couponDiscountText,
            priceTypeColor: 'green',
            price:
                '${dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0}',
          ),
        );
      }
    } else {
      final ShoppingCartContent removed = shoppingCartContent.removeAt(index);
      adLog(removed.toString());
      // shoppingCartContent[index] = ShoppingCartContent(
      //   title: couponDiscountText,
      //   priceTypeColor: 'green',
      //   price:
      //       '${dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0}',
      // );
    }
  }

  Future<void> checkPranaamCartExists(
    BuildContext context,
    DutyFreeProductDataModel dutyFreeProductList, {
    bool increment = false,
    bool fromCartPage = false,
  }) async {
    final bool isCartExists = await context
        .read<AppSessionState>()
        .isCartEmptyOrNot(CartType.pranaam);
    adLog(
      'checkPranaamCartExists isCartExists $isCartExists',
      className: this,
    );
    if (isCartExists) {
      // show dialog
      final bottomSheet = showModalBottomSheet(
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
            yesCallBack: () {
              final CartRepository cartRepository = CartRepository();
              cartRepository.deleteCart().then((value) {
                if (value.viewStatus == Status.complete) {
                  appSessionState?.saveCartCount(0);
                  appSessionState?.updateCartCountFromCache(0);
                  appSessionState?.saveCart(CartType.noDataInCart.name);
                  addItemToCart(
                    dutyFreeProductList,
                    context,
                    increment: increment,
                    fromCartPage: fromCartPage,
                  );
                  appSessionState?.cartType = CartType.noDataInCart;
                }
                navigatorPopScreen(dialogContext);
              });
            },
            noCallBack: () => navigatorPopScreen(dialogContext),
          );
        },
      );
    } else {
      if ((dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) &&
          selectedAirportsData?.airportCode !=
              dutyFreeCartResponse?.airportCode &&
          getSkuQty(
                dutyFreeProductList.skuCode,
                storeType: dutyFreeProductList.storeType,
                airportCode: dutyFreeProductList.airportCode.isNotEmpty
                    ? dutyFreeProductList.airportCode
                    : null,
              ) ==
              0) {
        Utils.clearDutyFreeCartDialog(context, (dialogContext) {
          _repository.removeDutyFreeCart().then((value) {
            if (value.viewStatus == Status.complete) {
              (addedItemMap[terminalModel.value.code] ?? {}).clear();
              notifyListeners();
              clearCart(context.read<AppSessionState>());
              addItemToCart(
                dutyFreeProductList,
                context,
                increment: increment,
                fromCartPage: fromCartPage,
              );
            } else {
              getView(
                context: context,
                dialogEnm: DialogTypeEnm.snackBar,
                message: value.message ?? 'Something went wrong',
              );
            }
            Navigator.of(dialogContext).pop();
          });
        });
      } else {
        await addItemToCart(
          dutyFreeProductList,
          context,
          increment: increment,
          fromCartPage: fromCartPage,
        );
      }
    }
  }

  void showPranaamExistsBottomSheet(
    BuildContext context,
    void Function() yesCallback,
  ) {
    final bottomSheet = showModalBottomSheet(
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
          yesCallBack: () {
            final CartRepository cartRepository = CartRepository();
            cartRepository.deleteCart().then((value) {
              if (value.viewStatus == Status.complete) {
                appSessionState?.saveCartCount(0);
                appSessionState?.updateCartCountFromCache(0);
                appSessionState?.saveCart(CartType.noDataInCart.name);
                yesCallback.call();
                appSessionState?.cartType = CartType.noDataInCart;
              }
              navigatorPopScreen(dialogContext);
            });
          },
          noCallBack: () => navigatorPopScreen(dialogContext),
        );
      },
    );
    adLog('$bottomSheet.this');
  }

  void updateCartCount(BuildContext context) {
    context.read<AppSessionState>().updateCartCountFromCache(
          (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
              ? dutyFreeCartResponse?.itemDetails
                      .map((e) => e.quantity)
                      .reduce((value, element) => value + element) ??
                  0
              : 0,
        );
  }

  void getDutyFreeProductList(
    DutyFreeProductListRequest request,
  ) {
    if (!(cancelToken?.isCancelled ?? true)) {
      cancelToken?.cancel();
      cancelToken = CancelToken();
    }
    if (dutyFreeProductDataList.isEmpty) {
      updateProductListStatus(Status.loading);
    } else {
      updateProductListPaginationStatus(Status.loading);
    }
    _repository
        .getDutyFreeProducts(
      catalogRequest: request,
      cancelToken: cancelToken,
    )
        .then(
      (value) {
        if (value.errorCode != DioErrorType.cancel.name) {
          updateProductListStatus(Status.complete);
        }
        if (value.data != null) {
          if (dutyFreeProductDataList.isEmpty) {
            catalogListResponseModel = value.data != null
                ? CatalogListResponseModel.fromJson(value.data)
                : null;
            setStoreType(request, catalogListResponseModel?.result ?? []);
            dutyFreeProductDataList = catalogListResponseModel?.result ?? [];

            dutyFreeEventState.viewItemListEvent(
              productList: catalogListResponseModel?.result ?? [],
            );
          } else {
            final response = CatalogListResponseModel.fromJson(value.data);
            setStoreType(request, response.result);
            // if (dutyFreeEventState.dutyFreeState?.exclusive ?? false) {
            //   dutyFreeProductDataList.clear();
            // }
            dutyFreeProductDataList.addAll(
              response.result,
            );

            dutyFreeEventState.viewItemListEvent(
              productList: response.result,
            );
            updateProductListPaginationStatus(Status.complete);
            adLog('product count ${dutyFreeProductDataList.length}');
          }
          updateProductListStatus(Status.complete);
          // _updateSate(value);
        }
      },
    );
  }

  void setStoreType(
    DutyFreeProductListRequest request,
    List<DutyFreeProductDataModel> productList,
  ) {
    if (productList.isNotEmpty) {
      for (int index = 0; index < productList.length; index++) {
        productList[index] = productList[index].copyWith(
          storeType: request.storeType,
          airportCode: request.airportCode,
        );
      }
    }
  }

  void updateCartMap() {
    try {
      final List<ItemDetailResponse> itemDetails =
          dutyFreeCartResponse?.itemDetails ?? [];
      try {
        addedItemMap.clear();
        final airportMap = addedItemMap[dutyFreeCartResponse?.airportCode ??
                selectedAirportsData?.airportCode ??
                ''] ??
            <String, Map<String, int>>{};
        final storeMap = airportMap[
                dutyFreeCartResponse?.itemDetails.first.storeType ??
                    terminalModel.value.code] ??
            {};
        for (int index = 0; index < itemDetails.length; index++) {
          ItemDetailResponse itemDetailResponse = itemDetails[index];
          storeMap[itemDetailResponse.skuCode] = itemDetailResponse.quantity;
          itemDetailResponse = itemDetailResponse.copyWith(
            airportCode: dutyFreeCartResponse?.airportCode ??
                selectedAirportsData?.airportCode ??
                '',
          );
          itemDetails[index] = itemDetailResponse;
        }
        dutyFreeCartResponse =
            dutyFreeCartResponse?.copyWith(itemDetails: itemDetails);
        airportMap[dutyFreeCartResponse?.itemDetails.first.storeType ??
            terminalModel.value.code] = storeMap;
        addedItemMap[dutyFreeCartResponse?.airportCode ??
            selectedAirportsData?.airportCode ??
            ''] = airportMap;
      } catch (e) {
        adLog(e.toString());
      }
      adLog('map=> ${addedItemMap.toString()}');
      // for (final ValueNotifier<bool> element in dashboardItemNotifierList) {
      //   try {
      //     element.value = !element.value;
      //   } catch (e) {
      //     adLog(e.toString());
      //   }
      // }
      try {
        appSessionState?.cartType =
            itemDetails.isNotEmpty ? CartType.dutyFree : CartType.noDataInCart;
      } catch (e) {
        adLog('Update Cart Map Error ${e.toString()}');
      }
      appSessionState?.updateCartCountFromCache(
        (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
            ? dutyFreeCartResponse?.itemDetails
                    .map((e) => e.quantity)
                    .reduce((value, element) => value + element) ??
                0
            : 0,
      );
    } catch (e) {
      adLog('Update Cart Map Error ${e.toString()}');
      notifyListeners();
    }
  }

  int getSkuQty(
    String skuCode, {
    String storeType = 'departure',
    String? airportCode,
  }) {
    return ((addedItemMap[airportCode ??
                        selectedAirportsData?.airportCode ??
                        ''] ??
                    {})[
                storeType.isNotEmpty ? storeType.toLowerCase() : 'departure'] ??
            {})[skuCode] ??
        0;
  }

  bool checkSkuAvailable(
    String skuCode, {
    String storeType = 'departure',
    String? airportCode,
  }) {
    return ((addedItemMap[airportCode ??
                        selectedAirportsData?.airportCode ??
                        ''] ??
                    {})[
                storeType.isNotEmpty ? storeType.toLowerCase() : 'departure'] ??
            {})
        .containsKey(skuCode);
  }

  Future<ADResponseState> getCartDetails(
    BuildContext context, {
    String? oldAgentId,
    bool showProgress = true,
    ClickEvents? event,
    bool viewCartEvent = false,
    bool callYouMayAlsoLike = false,
  }) async {
    try {
      appSessionState ??= context.read<AppSessionState>();
      preOrderDiscountLabel ??= 'pre_order_discount'.localize(context);
      totalPrice ??= 'unit_price'.localize(context);
      discountText ??= 'discount_price'.localize(context);
      couponDiscountText ??= 'coupon_discount_'.localize(context);
    } catch (e) {
      adLog(e.toString());
    }

    // shoppingCartContent = [
    //   ShoppingCartContent(
    //     title: totalPrice ?? '',
    //     price:
    //         dutyFreeCartResponse?.unitPriceResponse?.amount.toString() ?? '0',
    //   ),
    // ];
    if (showProgress) {
      cartDetailState.viewStatus = Status.loading;
    }

    final ADResponseState value = await _repository.getCartDetails(
      oldAgentId,
      isGuestLogin: oldAgentId?.isNotEmpty ?? false,
    );
    dutyFreeCartResponse =
        value.data != null ? DutyFreeCartResponse.fromJson(value.data) : null;
    if (dutyFreeCartResponse?.collectionPoint.isNotEmpty ?? false) {
      collectionPointName = dutyFreeCartResponse?.collectionPoint;
    }
    if (dutyFreeCartResponse?.store.isNotEmpty ?? false) {
      storeName = dutyFreeCartResponse?.store;
    }
    // await getDutyFreeTerminalList();
    shoppingCartContent.clear();
    // updatePriceDetails(context);
    if (shoppingCartContent.isNotEmpty) {
      shoppingCartContent.first.price =
          '${dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0}';
    } else {
      shoppingCartContent.add(
        ShoppingCartContent(
          title: totalPrice ?? '',
          price:
              dutyFreeCartResponse?.unitPriceResponse?.amount.toString() ?? '0',
        ),
      );
    }
    addDiscount();
    addPreOrderDiscount();
    addCouponDiscount();
    if (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) {
      //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
      if (terminalList.isNotEmpty &&
          selectedAirportsData?.airportCode ==
              dutyFreeCartResponse?.airportCode) {
        terminalModel.value = terminalList.firstWhere(
          (element) =>
              element.code.toLowerCase() ==
              (dutyFreeCartResponse?.itemDetails.first.storeType
                      .toLowerCase() ??
                  ''),
          orElse: () => terminalList.first,
        );
      }
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          appSessionState?.saveCart(CartType.dutyFree.name);
          appSessionState?.cartType = CartType.dutyFree;
        },
      );
    }
    cartDetailState.viewStatus = Status.complete;
    final List<String> skuList = [];
    for (final ItemDetailResponse item
        in dutyFreeCartResponse?.itemDetails ?? []) {
      skuList.add(item.skuCode); //to print the number
    }

    if (callYouMayAlsoLike &&
        (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)) {
      final request = DutyFreeProductListRequest(
        pageType: 'cart',
        skuCode: skuList,
        airportCode: dutyFreeCartResponse?.airportCode ??
            selectedAirportsData?.airportCode ??
            '',
        storeType: dutyFreeCartResponse?.itemDetails.first.storeType ?? '',
      );
      final youMayAlsoLikeResponse = await _repository.getDutyFreeProducts(
        catalogRequest: request,
        cancelToken: cancelToken,
      );

      if (youMayAlsoLikeResponse.data != null &&
          youMayAlsoLikeResponse.viewStatus == Status.complete) {
        catalogListResponseModelCart = youMayAlsoLikeResponse.data != null
            ? CatalogListResponseModel.fromJson(youMayAlsoLikeResponse.data)
            : null;
        setStoreType(
          request.copyWith(
            storeType: (dutyFreeCartResponse?.itemDetails.isEmpty ?? true)
                ? terminalModel.value.code
                : (dutyFreeCartResponse?.itemDetails.first.storeType ?? ''),
          ),
          catalogListResponseModelCart?.result ?? [],
        );
      } else {
        catalogListResponseModelCart = null;
      }
    }

    updateCartMap();
    notifyListeners();

    if (event != null) {
      dutyFreeEventState.applyAndRemoveCoupon(event);
    }
    if (viewCartEvent) {
      dutyFreeEventState.viewCartEvent(
        productList: dutyFreeCartResponse?.itemDetails ?? [],
      );
    }

    // final String cityName = Utils.getCityName(
    //   context: context,
    //   airportCode:
    //       context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode ?? '',
    // );

    if (dutyFreeCartResponse != null) {
      final String cityName = Utils.getCityName(
        adaniAirportsList:
            context.read<SiteCoreStateManagement>().adaniAirportsList,
        airportCode: dutyFreeCartResponse?.airportCode ?? '',
      );
      context.read<DutyFreeOrderState>().importantInfoApi(
            storeType: dutyFreeCartResponse?.itemDetails.first.storeType,
            airportCode: dutyFreeCartResponse?.airportCode,
            cityName: cityName,
          );
    }

    return value;
  }

  // void updatePriceDetails(BuildContext context) {
  //   shoppingCartContent = [
  //     ShoppingCartContent(
  //       title: 'total_mrp'.localize(context),
  //       price: '${dutyFreeCartResponse?.totalAmount?.amount}',
  //     ),
  //     ShoppingCartContent(
  //       title: 'discount_on_mrp'.localize(context),
  //       price: '0',
  //     ),
  //     ShoppingCartContent(
  //       title: '${'pre_order_discount'.localize(context)} (10%)',
  //       priceTypeColor: 'green',
  //       price: '${dutyFreeCartResponse?.preOrderDiscount?.amount}',
  //       showInfoIcon: true,
  //     ),
  //     ShoppingCartContent(
  //       title: 'coupon_discount'.localize(context),
  //       priceTypeColor: 'blue',
  //       price: '${0}',
  //     ),
  //   ];
  // }

  DutyFreeProductFilterRequest? dutyFreeProductFilterRequest;

  void updateProductFilterState({required ADResponseState state}) {
    productFilterState = state;
    notifyListeners();
  }

  void setFilters({
    DutyFreeItem? data,
    String? offers,
  }) {
    adLog('Setting filters ${data?.toJson()}');
    resetParams();

    if (data?.brand.isNotEmpty ?? false) {
      final brandsMap = appliedFilterMap[DutyFreeFilterConstants.brands] ?? {};
      brandsMap[DutyFreeFilterConstants.allBrands] =
          (brandsMap[DutyFreeFilterConstants.allBrands] ??
              List.empty(growable: true))
            ..add(data?.brand ?? '');
      appliedFilterMap[DutyFreeFilterConstants.brands] = brandsMap;
    }

    if (data?.category.isNotEmpty ?? false) {
      final categoryMap =
          appliedFilterMap[DutyFreeFilterConstants.category] ?? {};
      categoryMap[data?.category ?? ''] =
          (categoryMap[data?.category ?? ''] ?? List.empty(growable: true))
            ..add(data?.subCategory ?? '')
            ..removeWhere((element) => element.isEmpty);
      appliedFilterMap[DutyFreeFilterConstants.category] = categoryMap;
    }

    if (offers?.isNotEmpty ?? false) {
      final offersMap = appliedFilterMap[DutyFreeFilterConstants.offers] ?? {};
      offersMap[DutyFreeFilterConstants.offers] =
          (offersMap[DutyFreeFilterConstants.offers] ??
              List.empty(growable: true))
            ..add(offers ?? '');
      appliedFilterMap[DutyFreeFilterConstants.offers] = offersMap;
    }
    if (data?.exclusive ?? false) {
      exclusive = data?.exclusive ?? false;
      setExclusiveFilterCount();
    }
    storeType = data?.storeType ?? '';
    if (data?.materialGroup.isNotEmpty ?? false) {
      materialGroupCode = data?.materialGroup ?? '';
    }
  }

  /// category List
  Future<void> getDutyFreeFilter({
    required DutyFreeProductFilterRequest dutyFreeProductFilterRequest,
    BuildContext? context,
  }) async {
    dutyFreeFilterList.clear();
    productFilterState = ADResponseState.loading();
    this.dutyFreeProductFilterRequest =
        dutyFreeProductFilterRequest.copyWith(restricted: !ageAbove25);
    await _repository
        .getFilter(
      // cancelToken: cancelToken,
      dutyFreeProductFilterRequest:
          dutyFreeProductFilterRequest.copyWith(restricted: !ageAbove25),
    )
        .then(
      (value) async {
        updateProductFilterState(state: value);
        if (value.viewStatus == Status.complete && value.data != null) {
          dutyFreeFilterBaseResponse =
              DutyFreeFilterBaseResponse.fromJson(productFilterState.data);
          adLog(dutyFreeFilterBaseResponse.toString());
          if (dutyFreeFilterBaseResponse?.result.offers.filterData.isNotEmpty ??
              false) {
            final DutyFreeFilterViewModel offerDutyFreeFilterViewModel =
                DutyFreeFilterViewModel(
              title: dutyFreeFilterBaseResponse?.result.offers.filterTitle,
              code: dutyFreeFilterBaseResponse?.result.offers.filterCode,
              isOffer: true,
            )..subCategories = List.empty(
                    growable: true,
                  );
            for (final DutyFreeFilterData value
                in dutyFreeFilterBaseResponse?.result.offers.filterData ?? []) {
              offerDutyFreeFilterViewModel.subCategories?.add(
                DutyFreeFilterViewModel(title: value.title, code: value.code),
              );
            }
            offerDutyFreeFilterViewModel.filteredSubCategories =
                List.of(offerDutyFreeFilterViewModel.subCategories ?? []);
            dutyFreeFilterList.add(offerDutyFreeFilterViewModel);
          }
          if (dutyFreeFilterBaseResponse
                  ?.result.exclusive?.filterData.isNotEmpty ??
              false) {
            adLog('Hello I am exclusive section');
            final DutyFreeFilterViewModel exclusiveDutyFreeFilterViewModel =
                DutyFreeFilterViewModel(
              title: dutyFreeFilterBaseResponse?.result.exclusive?.filterTitle,
              code: dutyFreeFilterBaseResponse?.result.exclusive?.filterCode,
              exclusive:
                  dutyFreeFilterBaseResponse?.result.exclusive?.filterValue,
              isExclusive: true,
            )..subCategories = List.empty(
                    growable: true,
                  );
            for (final DutyFreeFilterData value
                in dutyFreeFilterBaseResponse?.result.exclusive?.filterData ??
                    []) {
              exclusiveDutyFreeFilterViewModel.subCategories?.add(
                DutyFreeFilterViewModel(title: value.title, code: value.code),
              );
            }

            exclusiveDutyFreeFilterViewModel.filteredSubCategories =
                List.of(exclusiveDutyFreeFilterViewModel.subCategories ?? []);
            dutyFreeFilterList.add(exclusiveDutyFreeFilterViewModel);
          }
          if (dutyFreeFilterBaseResponse
                  ?.result.includeOOS.filterData.isNotEmpty ??
              false) {
            final DutyFreeFilterViewModel includeOOSDutyFreeFilterViewModel =
                DutyFreeFilterViewModel(
              title: dutyFreeFilterBaseResponse?.result.includeOOS.filterTitle,
              code: dutyFreeFilterBaseResponse?.result.includeOOS.filterCode,
              isIncludeOOS: true,
            )..subCategories = List.empty(
                    growable: true,
                  );
            for (final DutyFreeFilterData value
                in dutyFreeFilterBaseResponse?.result.includeOOS.filterData ??
                    []) {
              includeOOSDutyFreeFilterViewModel.subCategories?.add(
                DutyFreeFilterViewModel(
                  title: value.title,
                  code: value.code,
                ),
              );
            }

            includeOOSDutyFreeFilterViewModel.filteredSubCategories =
                List.of(includeOOSDutyFreeFilterViewModel.subCategories ?? []);
            dutyFreeFilterList.add(includeOOSDutyFreeFilterViewModel);
          }
          for (final DutyFreeFilterCategoryModel value
              in dutyFreeFilterBaseResponse?.result.categories ?? []) {
            final DutyFreeFilterViewModel dutyFreeFilterViewModel =
                DutyFreeFilterViewModel(
              title: value.filterTitle,
              code: value.filterCode,
              isCategory: true,
              showInPrimary: value.showInPrimery,
            )..subCategories = List.empty(growable: true);
            for (final value1 in value.filterData) {
              dutyFreeFilterViewModel.subCategories?.add(
                DutyFreeFilterViewModel(
                  title: value1.title,
                  code: value1.code,
                  showInPrimary: value.showInPrimery,
                ),
              );
            }
            dutyFreeFilterViewModel.filteredSubCategories =
                List.of(dutyFreeFilterViewModel.subCategories ?? []);
            if (dutyFreeFilterViewModel.subCategories?.isNotEmpty ?? false) {
              dutyFreeFilterList.add(dutyFreeFilterViewModel);
            }
          }

          final DutyFreeFilterViewModel brandDutyFreeFilterViewModel =
              DutyFreeFilterViewModel(
            title: dutyFreeFilterBaseResponse?.result.brands.filterTitle,
            code: dutyFreeFilterBaseResponse?.result.brands.filterCode,
            isBrand: true,
          )..subCategories = List.empty(
                  growable: true,
                );
          for (final DutyFreeFilterData value
              in dutyFreeFilterBaseResponse?.result.brands.filterData ?? []) {
            brandDutyFreeFilterViewModel.subCategories?.add(
              DutyFreeFilterViewModel(title: value.title, code: value.code),
            );
          }
          brandDutyFreeFilterViewModel.filteredSubCategories =
              List.of(brandDutyFreeFilterViewModel.subCategories ?? []);
          dutyFreeFilterList.add(brandDutyFreeFilterViewModel);

          final List<DutyFreeFilterCategoryModel> category =
              (dutyFreeFilterBaseResponse?.result ??
                      const DutyFreeFilterResultModel())
                  .categories;
          filterMinPrice = num.tryParse(
                dutyFreeFilterBaseResponse?.result.price.filterData
                        .singleWhere((element) => element.code == 'minprice')
                        .filterValue ??
                    '',
              ) ??
              0;

          filterMaxPrice = num.tryParse(
                dutyFreeFilterBaseResponse?.result.price.filterData
                        .singleWhere((element) => element.code == 'maxprice')
                        .filterValue ??
                    '',
              ) ??
              0;
          filterMaxPriceBackup = filterMaxPrice;
          final Map<String, List<String>>? categoryMap =
              appliedFilterMap[DutyFreeFilterConstants.category];
          if (dutyFreeFilterBaseResponse?.result.exclusive != null) {
            dataList.add(
              DutyFreeFilter(
                name: 'Exclusive',
                code: 'exclusive',
                isSelected: ValueNotifier(false),
                showInPrimery: true,
              ),
            );
          }

          for (int count = 0; count < category.length; count++) {
            dataList.add(
              DutyFreeFilter(
                name: category[count].filterTitle,
                code: category[count].filterCode,
                showInPrimery: category[count].showInPrimery,
                isSelected: ValueNotifier(
                  categoryMap?.containsKey(category[count].filterCode) ??
                      false ||
                          (dutyFreeFilterBaseResponse
                                  ?.result.selectedFilter?.category
                                  .contains(category[count].filterCode) ??
                              false),
                ),
              ),
            );
          }
          dataList.add(
            DutyFreeFilter(
              name: 'All Filters',
              code: 'allFilters',
              leading: 'lib/assets/images/svg/icons/filter/filter_new.svg',
              isSelected: ValueNotifier(false),
              showInPrimery: true,
            ),
          );
        }
        setSlugFilters();
        if (context == null) {
          applyFilter(context: context);
        }
      },
    );
  }

  void setSlugFilters() {
    final DutyFreeSelectedFilterResponse? selectedFilter =
        dutyFreeFilterBaseResponse?.result.selectedFilter;
    final String title = catalogListTitle;
    if (selectedFilter != null) {
      for (final String category in selectedFilter.category) {
        setFilters(
          data: DutyFreeItem(
            materialGroup: selectedFilter.materialGroup,
            category: category,
          ),
        );
      }
      for (final String subCategory in selectedFilter.subCategory) {
        setFilters(
          data: DutyFreeItem(
            materialGroup: selectedFilter.materialGroup,
            subCategory: subCategory,
          ),
        );
      }
      for (final String brand in selectedFilter.brand) {
        setFilters(
          data: DutyFreeItem(
            materialGroup: selectedFilter.materialGroup,
            brand: brand,
          ),
        );
      }
      for (final String offer in selectedFilter.offers) {
        setFilters(
          data: DutyFreeItem(
            materialGroup: selectedFilter.materialGroup,
          ),
          offers: offer,
        );
      }
      // for (final String exclusive in selectedFilter.exclusive) {
      //   setFilters(
      //     materialGroup: selectedFilter.materialGroup,
      //     exclusive: exclusive,
      //   );
      // }
    }
    catalogListTitle = title;
  }

  void updateFilterListStatus(Status status) {
    filterListState.viewStatus = status;
    notifyListeners();
  }

  void updateProductListStatus(Status status) {
    productListState.viewStatus = status;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  void updateProductListPaginationStatus(Status status) {
    productPaginationState.viewStatus = status;
    notifyListeners();
  }

  void onDropDownAndRemoveItemClick(
    ItemDetailResponse productList,
    String qty,
    BuildContext buildContext,
  ) {
    addProgress(productList.skuCode);
    notifyListeners();
    appSessionState ??= buildContext.read<AppSessionState>();
    shoppingCartContent = [
      ShoppingCartContent(
        title: totalPrice ?? '',
        price:
            dutyFreeCartResponse?.unitPriceResponse?.amount.toString() ?? '0',
      ),
    ];
    addDiscount();
    addPreOrderDiscount();
    addCouponDiscount();

    final request = DutyFreeAddToCartRequest.fromItemDetailResponse(
      productList,
      terminalModel.value.code,
      int.parse(qty),
    );
    dutyFreeCartResponseCopy = dutyFreeCartResponse;
    _repository.addToCart(addToCartRequest: request).then((v) {
      //const int waitTime = 4000;

      removeProgress(productList.skuCode, updateProgress: false);
      if (v.viewStatus == Status.complete) {
        try {
          final CustomTabScaffold customTabScaffold =
              BottomBarState.key.currentWidget as CustomTabScaffold;
          customTabScaffold.heightNotifier.value =
              customTabScaffold.tabBar.height;
        } catch (e) {
          adLog(e.toString());
        }

        cartError.value = '';
        dutyFreeCartResponse =
            v.data != null ? DutyFreeCartResponse.fromJson(v.data) : null;
        // updatePriceDetails(context);
        shoppingCartContent = [];
        if (dutyFreeCartResponse?.itemDetails.isEmpty ?? true) {
          dutyFreeEventState.clearCartEvent(
            response: dutyFreeCartResponseCopy,
            type: CartType.dutyFree,
            isExclusive: productList.isExclusive,
          );
        }
        if (shoppingCartContent.isNotEmpty) {
          shoppingCartContent.first.price =
              '${dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0}';
        } else {
          shoppingCartContent.add(
            ShoppingCartContent(
              title: totalPrice ?? '',
              price:
                  dutyFreeCartResponse?.unitPriceResponse?.amount.toString() ??
                      '0',
            ),
          );
        }
        addDiscount();
        addPreOrderDiscount();
        addCouponDiscount();
        // addedItemMap[productList.skuCode] = 0;
        // addedItemMap.forEach((k, v) => addedItemMap[k] = 0);
        // final List<DutyFreeProductDataModel> result =
        //     dashboardListResponseModel?.result ?? [];

        // for (int dashboardIndex = 0;
        //     dashboardIndex < (dashboardListResponseModel?.result ?? []).length;
        //     dashboardIndex++) {
        //   for (final ItemDetailResponse element
        //       in dutyFreeCartResponse?.itemDetails ?? []) {
        //     if (dashboardListResponseModel?.result[dashboardIndex].skuCode ==
        //         element.skuCode) {
        //       dashboardListResponseModel?.result[dashboardIndex] =
        //           (dashboardListResponseModel ??
        //                   const CatalogListResponseModel())
        //               .result[dashboardIndex]
        //               .copyWith(
        //                 quantity: element.quantity,
        //               );
        //     } else {
        //       dashboardListResponseModel?.result[dashboardIndex] =
        //           (dashboardListResponseModel ??
        //                   const CatalogListResponseModel())
        //               .result[dashboardIndex]
        //               .copyWith(
        //                 quantity: 0,
        //               );
        //     }
        //   }
        // }
        // dashboardListResponseModel =
        //     dashboardListResponseModel?.copyWith(result: result);
        // for (final ValueNotifier<bool> element in dashboardItemNotifierList) {
        //   try {
        //     element.value = !element.value;
        //   } catch (e) {
        //     adLog(e.toString());
        //   }
        // }
        // try {
        //   dashboardItemNotifier?.value =
        //       !(dashboardItemNotifier?.value ?? false);
        // } catch (e) {
        //   adLog(e.toString());
        // }

        // updateCartMap();
        cartDetailState.viewStatus = Status.complete;
        // notifyListeners();
        appSessionState?.saveCart(
          (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
              ? CartType.dutyFree.name
              : CartType.noDataInCart.name,
        );
        appSessionState?.cartType =
            (dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false)
                ? CartType.dutyFree
                : CartType.noDataInCart;
        if (productList.quantity > int.parse(qty)) {
          dutyFreeEventState
            ..removeFromCartEvent(
              request: request,
              quantity: productList.quantity - int.parse(qty),
              isExclusive: productList.isExclusive,
              isPromotion: productList.promotions.isNotEmpty,
            )
            ..cartUpdated(
              addToCartRequest: request,
              quantity: productList.quantity - int.parse(qty),
              type: 'remove',
              isExclusive: productList.isExclusive,
            );
        } else {
          dutyFreeEventState
            ..addToCartEvent(
              skuCode: productList.skuCode,
              quantity: int.parse(qty) - productList.quantity,
              isExclusive: productList.isExclusive,
            )
            ..cartUpdated(
              skuCode: productList.skuCode,
              quantity: int.parse(qty) - productList.quantity,
              type: 'add',
              isExclusive: productList.isExclusive,
            );
        }
        getCartDetails(
          buildContext,
          showProgress: false,
        ).then((value) => adLog('getCartDetails $value'));
      } else {
        notifyListeners();
        cartLiquorLimitError(buildContext, v);
        // cartError.value = v.message ?? '';
        // SnackBarUtil.showSnackBar(
        //   buildContext,
        //   v.message ?? '',
        //   waitTime,
        // );
      }
    });
  }

  ///Function to create order for added cart
  //TODO Make user id dynamic
  Future<ADResponseState> updatePassengerDetails() {
    return _repository.updatePassengerDetails(
      passengerDetails: DutyFreePassengerDetails(
        countryCode: countryCode,
        countryName: countryNameController.text.trim(),
        pickupDate: pickupDateController.text,
        flightNo: flightStatusSegment?.flightnumber ??
            dutyFreeCartResponse?.passengerDetail.first.flightNo ??
            '',
        countryDialCode: countryCodeController.text.trim(),
        customerDOB: dateOfBirthController.text.trim(),
        pickupTime: pickupTime,
        emailId: emailIdController.text.trim(),
        assistanceCode: assistanceCodeController.text.trim(),
        isAssistance: isCheckSelected,
        // customerId: ProfileSingleton.profileSingleton.userID,
        totalAmount: dutyFreeCartResponse?.finalAmount?.amount ?? 0,
        flightTime: flightStatusSegment?.scheduletime ??
            dutyFreeCartResponse?.passengerDetail.first.flightTime ??
            '',
        passportNumber: passportNumberController.text.trim(),
        customerName: nameOnPassportController.text.trim(),
        mobile: phoneNumberController.text.trim(),
        passportExpiry: passportExpiryController.text.trim(),
      ),
    );
  }

  Future<void> validatePreOrderDiscount(BuildContext context) async {
    final response = await _repository.validatePreOrderDiscount(
      preOrderDiscount: DutyFreePassengerDetails(
        countryCode: countryCode,
        countryName: countryNameController.text.trim(),
        pickupDate: pickupDateController.text,
        flightNo: '',
        countryDialCode: countryCodeController.text.trim(),
        customerDOB: dateOfBirthController.text.trim(),
        pickupTime: pickupTime,
        emailId: emailIdController.text.trim(),
        assistanceCode: assistanceCodeController.text.trim(),
        isAssistance: isCheckSelected,
        // customerId: ProfileSingleton.profileSingleton.userID,
        totalAmount: dutyFreeCartResponse?.finalAmount?.amount ?? 0,
        flightTime: '',
        passportNumber: passportNumberController.text.trim(),
        customerName: nameOnPassportController.text.trim(),
        mobile: phoneNumberController.text.trim(),
        passportExpiry: passportExpiryController.text.trim(),
      ),
    );
    if (response.viewStatus == Status.complete &&
        response.data is DutyFreeCartResponse) {
      dutyFreeCartResponse = response.data;
      notifyListeners();
      unawaited(getCartDetails(
        context,
        callYouMayAlsoLike: true,
      ).then((value) => adLog(value.toString())));
    }
  }

  @override
  void dispose() {
    super.dispose();
    countryNameController.dispose();
    countryCodeController.dispose();
    nameOnPassportController.dispose();
    passportNumberController.dispose();
    phoneNumberController.dispose();
    passportExpiryController.dispose();
    flightNumberController.dispose();
    pickupDateController.dispose();
    dateOfBirthController.dispose();
    emailIdController.dispose();
    assistanceCodeController.dispose();
    applyCouponController.dispose();
    couponError.dispose();
  }

  // void filterClickActionCategory(
  //   int selectedIndex,
  //   int index,
  // ) {
  // final String category = dutyFreeFilterBaseResponse
  //         ?.result.categories[selectedIndex].filterCode ??
  //     '';
  //
  // final String subCategory = dutyFreeFilterBaseResponse
  //         ?.result.categories[selectedIndex].filterData[index].code ??
  //     '';
  //
  // if (addedCategoryMap[category] == null) {
  //   addedCategoryMap[category] = [subCategory];
  //   addCategoryList(category, selectedIndex);
  // } else if (addedCategoryMap[category] != null) {
  //   final List<String> addedItems = addedCategoryMap[category] ?? [];
  //   if (addedItems.contains(subCategory)) {
  //     final bool remove1 = addedItems.remove(subCategory);
  //     addedCategoryMap[category] = addedItems;
  //     if (addedCategoryMap[category]?.isEmpty ?? true) {
  //       removeCategoryList(category, selectedIndex);
  //       final List remove2 = addedCategoryMap.remove(category) ?? [];
  //       adLog(remove2.toString());
  //     }
  //     adLog('$remove1');
  //   } else {
  //     addedItems.add(subCategory);
  //   }
  // }
  //
  // adLog(
  //   'selected map ========> ${addedCategoryMap.toString()}',
  // );
  // adLog(
  //   'filtered map ========> ${appliedFilterMap.toString()}',
  // );
  //
  // notifyListeners();
  // }

  void removeCategoryList(String category, int selectedIndex) {
    dataList[selectedIndex + preFixIndex].isSelected.value = false;
    final List<String> addedCategory =
        dutyFreeProductListRequest?.category ?? [];
    final bool removed = addedCategory.remove(category);
    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      category: addedCategory,
      slug: null,
    );
    adLog(removed.toString());
  }

  void addCategoryList(String category, int selectedIndex) {
    dataList[selectedIndex + preFixIndex].isSelected.value = true;
    final List<String> addedCategory =
        dutyFreeProductListRequest?.category ?? [];
    adLog(
      'Avoid cascade consecutive method invocations on the same reference.',
    );
    addedCategory.add(category);
    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      category: addedCategory,
      slug: null,
    );
  }

  //// this is being called from catalog page on click of filter
  // void filterClickActionCategoryFromCatalogPage(int selectedIndex) {
  //   // isFilterApplied = dutyFreeProductListRequest?.category?.isNotEmpty ?? false;
  //
  //   final List<DutyFreeFilterData> filterDataList = dutyFreeFilterBaseResponse
  //           ?.result.categories[selectedIndex].filterData ??
  //       [];
  //
  //   final List<String> subCategoryList = [];
  //   final bool isSelected = dataList[selectedIndex + preFixIndex].isSelected.value;
  //
  //   for (int count = 0; count < filterDataList.length; count++) {
  //     final DutyFreeFilterData? dutyFreeFilterData = dutyFreeFilterBaseResponse
  //         ?.result.categories[selectedIndex].filterData[count]
  //         .copyWith(
  //       filterSelected: isSelected,
  //     );
  //     dutyFreeFilterBaseResponse?.result.categories[selectedIndex]
  //         .filterData[count] = dutyFreeFilterData ?? const DutyFreeFilterData();
  //     if (isSelected) {
  //       subCategoryList.add(dutyFreeFilterData?.code ?? '');
  //     }
  //   }
  //
  //   final String category = dutyFreeFilterBaseResponse
  //           ?.result.categories[selectedIndex].filterCode ??
  //       '';
  //   if (addedCategoryMap[category] == null) {
  //     addedCategoryMap[category] = subCategoryList;
  //   } else if (addedCategoryMap[category] != null) {
  //     final List remove2 = addedCategoryMap.remove(category) ?? [];
  //     adLog(remove2.toString());
  //   }
  //   appliedFilterMap.clear();
  //   addedCategoryMap.forEach(
  //     (key, value) => appliedFilterMap[key] = List.of(value),
  //   );
  //   adLog(
  //     'selected map ========> ${addedCategoryMap.toString()}',
  //   );
  //   notifyListeners();
  // }

  //// this is being called from catalog page on click of filter
  void filterCopy(String filterCode) {
    // isFilterApplied = dutyFreeProductListRequest?.category?.isNotEmpty ?? false;
    final Map<String, List<String>>? categoryMap =
        appliedFilterMap[DutyFreeFilterConstants.category] ?? {};
    if (categoryMap?.containsKey(filterCode) ?? false) {
      final removed = categoryMap?.remove(filterCode);
      adLog('filters removed $removed');
    } else {
      categoryMap?[filterCode] = dutyFreeFilterList
              .singleWhere((element) => element.code == filterCode)
              .subCategories
              ?.map((e) => e.code ?? '')
              .toList() ??
          List.empty(growable: true);
    }

    appliedFilterMap[DutyFreeFilterConstants.category] = categoryMap ?? {};

    // final int dataIndex = dataList.indexOf(
    //   dataList.firstWhere((element) {
    //     return element.code == filterCode;
    //   }),
    // );
    dutyFreeProductDataList.clear();
    updateProductListStatus(Status.loading);
    // final List<String> categoryFirst =
    //     dutyFreeProductListRequest?.category ?? [];

    // if (categoryFirst.contains(dataList[dataIndex].code)) {
    //   final bool removed = categoryFirst.remove(dataList[dataIndex].code);
    //   adLog('$removed');
    //   dataList[dataIndex].isSelected.value = false;
    // } else {
    //   categoryFirst.add(dataList[dataIndex].code);
    //   dataList[dataIndex].isSelected.value = true;
    // }

    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      category: getCategory(),
      slug: null,
    );
    adLog(
      'Avoid cascade consecutive method invocations on the same reference.',
    );
    isFilterApplied = true;
    adLog(
      'Avoid cascade consecutive method invocations on the same reference.',
    );

    dutyFreeSelectedIndex = -1;

    // adLog(
    //   'Avoid cascade consecutive method invocations on the same reference.',
    // );
    //
    // final DutyFreeFilterCategoryModel? singleCategory =
    //     dutyFreeFilterBaseResponse?.result.categories.firstWhere(
    //   (DutyFreeFilterCategoryModel element) => element.filterCode == filterCode,
    // );
    //
    // final int selectedIndex = dutyFreeFilterBaseResponse?.result.categories
    //         .indexOf(singleCategory ?? const DutyFreeFilterCategoryModel()) ??
    //     0;
    // final List<DutyFreeFilterData> filterDataList =
    //     singleCategory?.filterData ?? [];
    // final List<String> subCategoryList = [];
    // final bool isSelected =
    //     dataList[selectedIndex + preFixIndex].isSelected.value;
    //
    // for (int count = 0; count < filterDataList.length; count++) {
    //   final DutyFreeFilterData? dutyFreeFilterData = dutyFreeFilterBaseResponse
    //       ?.result.categories[selectedIndex].filterData[count]
    //       .copyWith(
    //     filterSelected: isSelected,
    //   );
    //   dutyFreeFilterBaseResponse?.result.categories[selectedIndex]
    //       .filterData[count] = dutyFreeFilterData ?? const DutyFreeFilterData();
    //   if (isSelected) {
    //     subCategoryList.add(dutyFreeFilterData?.code ?? '');
    //   }
    // }

    // final String category = dutyFreeFilterBaseResponse
    //         ?.result.categories[selectedIndex].filterCode ??
    //     '';
    // if (addedCategoryMap[category] == null) {
    //   addedCategoryMap[category] = subCategoryList;
    // } else if (addedCategoryMap[category] != null) {
    //   final List remove2 = addedCategoryMap.remove(category) ?? [];
    //   adLog(remove2.toString());
    // }
    // appliedFilterMap.clear();
    // addedCategoryMap.forEach(
    //   (key, value) => appliedFilterMap[key] = List.of(value),
    // );
    // adLog(
    //   'selected map ========> ${addedCategoryMap.toString()}',
    // );
    notifyListeners();
  }

  void filterClickAction(
    int index,
  ) {
    final DutyFreeFilterViewModel dutyFreeFilterViewModel =
        dutyFreeFilterList[selectedIndex];
    final String subCategoryCode =
        dutyFreeFilterList[selectedIndex].filteredSubCategories?[index].code ??
            '';

    if (dutyFreeFilterViewModel.isCategory) {
      final Map<String, List<String>> categoryMap =
          tempFilterMap[DutyFreeFilterConstants.category] ?? {};
      if (categoryMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
        final List<String> addedSubCategories =
            categoryMap[dutyFreeFilterViewModel.code ?? ''] ??
                List.empty(growable: true);
        if (addedSubCategories.contains(subCategoryCode)) {
          final removed = addedSubCategories.remove(subCategoryCode);
          adLog('Subcategories removed $removed');
        } else {
          addedSubCategories.add(subCategoryCode);
        }
        categoryMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
      } else {
        categoryMap[dutyFreeFilterViewModel.code ?? ''] =
            List.empty(growable: true)..add(subCategoryCode);
      }
      if (categoryMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
        final removed = categoryMap.remove(dutyFreeFilterViewModel.code ?? '');
        adLog('category removed $removed');
      }
      tempFilterMap[DutyFreeFilterConstants.category] = categoryMap;
    } else if (dutyFreeFilterViewModel.isBrand) {
      final Map<String, List<String>> brandMap = tempFilterMap['brands'] ?? {};
      if (brandMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
        final List<String> addedSubCategories =
            brandMap[dutyFreeFilterViewModel.code ?? ''] ??
                List.empty(growable: true);
        if (addedSubCategories.contains(subCategoryCode)) {
          final removed = addedSubCategories.remove(subCategoryCode);
          adLog('Subcategories removed $removed');
        } else {
          addedSubCategories.add(subCategoryCode);
        }
        brandMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
      } else {
        brandMap[dutyFreeFilterViewModel.code ?? ''] =
            List.empty(growable: true)..add(subCategoryCode);
      }
      if (brandMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
        final removed = brandMap.remove(dutyFreeFilterViewModel.code ?? '');
        adLog('brand removed $removed');
      }
      tempFilterMap['brands'] = brandMap;
    } else if (dutyFreeFilterViewModel.isOffer) {
      final Map<String, List<String>> offerMap =
          tempFilterMap[DutyFreeFilterConstants.offers] ?? {};
      if (offerMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
        final List<String> addedSubCategories =
            offerMap[dutyFreeFilterViewModel.code ?? ''] ??
                List.empty(growable: true);
        if (addedSubCategories.contains(subCategoryCode)) {
          final removed = addedSubCategories.remove(subCategoryCode);
          adLog('Subcategories removed $removed');
        } else {
          addedSubCategories.add(subCategoryCode);
        }
        offerMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
      } else {
        offerMap[dutyFreeFilterViewModel.code ?? ''] =
            List.empty(growable: true)..add(subCategoryCode);
      }
      if (offerMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
        final removed = offerMap.remove(dutyFreeFilterViewModel.code ?? '');
        adLog('brand removed $removed');
      }
      tempFilterMap[DutyFreeFilterConstants.offers] = offerMap;
    } else if (dutyFreeFilterViewModel.isIncludeOOS) {
      final Map<String, List<String>> includeOOSMap =
          tempFilterMap[DutyFreeFilterConstants.includeOOS] ?? {};
      if (includeOOSMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
        final List<String> addedSubCategories =
            includeOOSMap[dutyFreeFilterViewModel.code ?? ''] ??
                List.empty(growable: true);
        if (addedSubCategories.contains(subCategoryCode)) {
          final removed = addedSubCategories.remove(subCategoryCode);
          adLog('Subcategories removed $removed');
        } else {
          addedSubCategories.add(subCategoryCode);
        }
        includeOOSMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
      } else {
        includeOOSMap[dutyFreeFilterViewModel.code ?? ''] =
            List.empty(growable: true)..add(subCategoryCode);
      }
      if (includeOOSMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
        final removed =
            includeOOSMap.remove(dutyFreeFilterViewModel.code ?? '');
        adLog('brand removed $removed');
      }
      tempFilterMap[DutyFreeFilterConstants.includeOOS] = includeOOSMap;
    } else {
      final Map<String, List<String>> exclusiveMap =
          tempFilterMap[DutyFreeFilterConstants.exclusive] ?? {};
      if (exclusiveMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
        final List<String> addedSubCategories =
            exclusiveMap[dutyFreeFilterViewModel.code ?? ''] ??
                List.empty(growable: true);
        if (addedSubCategories.contains(subCategoryCode)) {
          final removed = addedSubCategories.remove(subCategoryCode);
          adLog('Subcategories removed $removed');
        } else {
          addedSubCategories.add(subCategoryCode);
        }
        exclusiveMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
      } else {
        exclusiveMap[dutyFreeFilterViewModel.code ?? ''] =
            List.empty(growable: true)..add(subCategoryCode);
      }
      if (exclusiveMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
        final removed = exclusiveMap.remove(dutyFreeFilterViewModel.code ?? '');
        adLog('brand removed $removed');
      }
      tempFilterMap[DutyFreeFilterConstants.exclusive] = exclusiveMap;
    }

    // if (tempFilterMap.containsKey('category')) {
    //   final List<String>? appliedList = tempFilterMap[code];
    //   if (appliedList?.contains(subCategoryCode) ?? false) {
    //     final removed = appliedList?.remove(
    //           dutyFreeFilterList[selectedIndex]
    //                   .filteredSubCategories?[index]
    //                   .code ??
    //               '',
    //         ) ??
    //         false;
    //     adLog('Removed subcategory $code $subCategoryCode $removed}');
    //   } else {
    //     appliedList?.add(
    //       dutyFreeFilterList[selectedIndex]
    //               .filteredSubCategories?[index]
    //               .code ??
    //           '',
    //     );
    //   }
    //   tempFilterMap[code] = appliedList ?? [];
    // } else {
    //   tempFilterMap[code] = List.empty(growable: true)
    //     ..add(
    //       dutyFreeFilterList[selectedIndex]
    //               .filteredSubCategories?[index]
    //               .code ??
    //           '',
    //     );
    // }
    // const String category = allBrand;
    //
    // final String subCategory =
    //     dutyFreeFilterBaseResponse?.searchFilterBrandData[index].code ?? '';
    //
    // if (addedCategoryMap[category] == null) {
    //   addedCategoryMap[category] = [subCategory];
    // } else if (addedCategoryMap[category] != null) {
    //   final List<String> addedItems = addedCategoryMap[category] ?? [];
    //   if (addedItems.contains(subCategory)) {
    //     final bool remove1 = addedItems.remove(subCategory);
    //     addedCategoryMap[category] = addedItems;
    //     if (addedCategoryMap[category]?.isEmpty ?? true) {
    //       final List remove2 = addedCategoryMap.remove(category) ?? [];
    //       adLog(remove2.toString());
    //     }
    //     adLog('$remove1');
    //   } else {
    //     addedItems.add(subCategory);
    //   }
    // }

    notifyListeners();
  }

  void setExclusiveFilterCount() {
    final Map<String, List<String>> exclusiveMap =
        appliedFilterMap[DutyFreeFilterConstants.exclusive] ?? {};
    final dutyFreeFilterViewModel = dutyFreeFilterList.singleWhere(
      (element) => element.code == DutyFreeFilterConstants.exclusive,
      orElse: () => dutyFreeFilterList.first,
    );
    final String subCategoryCode =
        dutyFreeFilterViewModel.subCategories?.first.code ?? '';
    if (exclusiveMap.containsKey(dutyFreeFilterViewModel.code ?? '')) {
      final List<String> addedSubCategories =
          exclusiveMap[dutyFreeFilterViewModel.code ?? ''] ??
              List.empty(growable: true);
      if (addedSubCategories.contains(subCategoryCode)) {
        final removed = addedSubCategories.remove(subCategoryCode);
        adLog('Subcategories removed $removed');
      } else {
        addedSubCategories.add(subCategoryCode);
      }
      exclusiveMap[dutyFreeFilterViewModel.code ?? ''] = addedSubCategories;
    } else {
      exclusiveMap[dutyFreeFilterViewModel.code ?? ''] =
          List.empty(growable: true)..add(subCategoryCode);
    }
    if (exclusiveMap[dutyFreeFilterViewModel.code ?? '']?.isEmpty ?? true) {
      final removed = exclusiveMap.remove(dutyFreeFilterViewModel.code ?? '');
      adLog('brand removed $removed');
    }
    appliedFilterMap[DutyFreeFilterConstants.exclusive] = exclusiveMap;
  }

  int selectedIndex = 0;
  DutyFreeFilterLeftMenuEnum leftSelectedMenu = DutyFreeFilterLeftMenuEnum.size;

  void updateSwitchStatus(
    int index,
  ) {
    searchTextController.clear();
    dutyFreeFilterList[selectedIndex].filteredSubCategories =
        List.of(dutyFreeFilterList[selectedIndex].subCategories ?? []);

    selectedIndex = index;

    switch (index) {
      case case7:
        leftSelectedMenu = DutyFreeFilterLeftMenuEnum.size;
        break;

      case case8:
        leftSelectedMenu = DutyFreeFilterLeftMenuEnum.price;
        break;
    }
    updateState(ViewState.success);
  }

// Future<DutyFreeFilterBaseResponse?> getFilterList() async {
//   final jsonString = await rootBundle.loadString(JsonAssets.dutyFreeFilter);
//   final Map<String, dynamic> data = json.decode(jsonString);
//   dutyFreeFilterBaseResponse = DutyFreeFilterBaseResponse.fromJson(data);
//   adLog(dutyFreeFilterBaseResponse.toString());
//   return dutyFreeFilterBaseResponse;
// }

  List<String> getBrand() {
    final Map<String, List<String>>? brandMap = appliedFilterMap['brands'];
    final List<String> brands = List.empty(growable: true);
    final iterator = brandMap?.values;
    iterator?.forEach((element) {
      brands.addAll(element);
    });
    return brands;
  }

  List<String> getOffers() {
    final Map<String, List<String>>? offerMap =
        appliedFilterMap[DutyFreeFilterConstants.offers];
    final List<String> offers = List.empty(growable: true);
    final iterator = offerMap?.values;
    iterator?.forEach((element) {
      offers.addAll(element);
    });
    return offers;
  }

  List<String> getExclusive() {
    final Map<String, List<String>>? exclusiveMap =
        appliedFilterMap[DutyFreeFilterConstants.exclusive];
    final List<String> exclusive = List.empty(growable: true);
    final iterator = exclusiveMap?.values;
    iterator?.forEach((element) {
      exclusive.addAll(element);
    });
    return exclusive;
  }

  List<String> getIncludeOutOfStock() {
    final Map<String, List<String>>? includeOutOfStockMap =
        appliedFilterMap[DutyFreeFilterConstants.includeOOS];
    final List<String> includeOutOfStock = List.empty(growable: true);
    final iterator = includeOutOfStockMap?.values;
    iterator?.forEach((element) {
      includeOutOfStock.addAll(element);
    });
    return includeOutOfStock;
  }

  // void addBrand(String brand) {
  //   if (appliedFilterMap.containsKey(allBrand)) {
  //     final List<String>? addedBrands = appliedFilterMap[allBrand];
  //     if (!(addedBrands?.contains(brand) ?? false)) {
  //       addedBrands?.add(brand);
  //     }
  //     appliedFilterMap[allBrand] = addedBrands ?? [];
  //   } else {
  //     appliedFilterMap[allBrand] = [brand];
  //   }
  //   adLog(appliedFilterMap.toString());
  // }
  //
  // void clearBrand() {
  //   final List? list = appliedFilterMap.remove(allBrand);
  //   adLog(list.toString());
  // }

  List<String> getCategory() {
    final Map<String, List<String>>? categoryMap =
        appliedFilterMap[DutyFreeFilterConstants.category];
    // return removeBrandFromCategory().keys.toList();
    return categoryMap?.keys.toList() ?? [];
  }

  List<String> getSubCategory() {
    final Map<String, List<String>>? categoryMap =
        appliedFilterMap[DutyFreeFilterConstants.category];
    final List<String> subCategories = List.empty(growable: true);
    final iterator = categoryMap?.values;
    iterator?.forEach((element) {
      subCategories.addAll(element);
    });
    // final List<List<String>> subCategoryListArr =
    //     removeBrandFromCategory().values.toList();
    // final List<String> subCategoryList = [];
    // for (int count = 0; count < subCategoryListArr.length; count++) {
    //   subCategoryList.addAll(subCategoryListArr[count]);
    // }
    return subCategories;
  }

  int getTotalFilterCount() {
    int count = 0;
    appliedFilterMap.forEach((key, value) {
      value.forEach((key, value) {
        count += value.length;
      });
    });
    // final List<List<String>> subCategoryListArr =
    //     appliedFilterMap;
    // final List<String> subCategoryList = [];
    // for (int count = 0; count < subCategoryListArr.length; count++) {
    //   subCategoryList.addAll(subCategoryListArr[count]);
    // }
    return count;
  }

  // Map<String, List<String>> removeBrandFromCategory() {
  //   final Map<String, List<String>> map = {};
  //   adLog('');
  //   map.addAll(appliedFilterMap);
  //   final List<String>? remove1 = map.remove(allBrand);
  //   adLog('$remove1');
  //   return map;
  // }

  void resetFilter(BuildContext context, {bool shouldFinish = true}) {
    exclusive = false;
    includeOOS = false;
    currentPage = 1;
    priceSelectedValue = 0;
    priceSelectedValueBackup = 0;
    isFilterApplied = false;
    dutyFreeFilterBaseResponse =
        DutyFreeFilterBaseResponse.fromJson(productFilterState.data);

    final DutyFreeFilterViewModel dutyFreeFilterViewModel =
        dutyFreeFilterList.singleWhere((element) => element.isBrand);
    dutyFreeFilterViewModel.filteredSubCategories =
        List.of(dutyFreeFilterViewModel.subCategories ?? []);

    dutyFreeFilterList[dutyFreeFilterList.indexOf(dutyFreeFilterViewModel)] =
        dutyFreeFilterViewModel;

    for (int count = 0; count < dataList.length; count++) {
      dataList[count].isSelected.value = false;
    }
    selectedBrandDataList.clear();
    selectedCategoryDataList.clear();
    selectedSubCategoryDataList.clear();
    filterMinPrice = num.tryParse(
          dutyFreeFilterBaseResponse?.result.price.filterData
                  .singleWhere((element) => element.code == 'minprice')
                  .filterValue ??
              '',
        ) ??
        0;

    filterMaxPrice = num.tryParse(
          dutyFreeFilterBaseResponse?.result.price.filterData
                  .singleWhere((element) => element.code == 'maxprice')
                  .filterValue ??
              '',
        ) ??
        0;
    // addedCategoryMap.clear();
    dutyFreeProductDataList.clear();
    appliedFilterMap.clear();
    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      category: [],
      subCategory: [],
      brand: [],
      restricted: !ageAbove25,
      sort: '',
      page: currentPage,
      pageSize: pageSize,
      offers: [],
      skuCode: [],
      slug: null,
      // exclusive: false,
    );
    appliedSort = 'sort'.localize(context);
    updateProductListStatus(Status.loading);
    getDutyFreeProductList(
      dutyFreeProductListRequest ??
          DutyFreeProductListRequest(
            airportCode: selectedAirportsData?.airportCode ?? '',
          ),
    );
    if (shouldFinish) {
      navigatorPopScreen(context);
    }

    dutyFreeEventState.filterResetEvent();
  }

  void clearDutyFreeCartApi(AppSessionState appSessionState) {
    dutyFreeEventState.clearCartEvent(
      response: dutyFreeCartResponse,
      type: appSessionState.cartType,
    );
    _repository
        .removeDutyFreeCart()
        .then((value) => clearCart(appSessionState));
  }

  Future<ADResponseState> removeOutOfStockItems(List<Map> outOfStockItems) {
    return _repository.removeMultipleOutOfStock(outOfStockItems);
  }

  void clearCart(AppSessionState appSessionState) {
    appSessionState.cartType = CartType.noDataInCart;
    addedItemMap.clear();

    ((addedItemMap[dutyFreeCartResponse?.airportCode ?? ''] ??
                {})[terminalModel.value.code] ??
            {})
        .clear();
    dutyFreeCartResponse = null;
    adLog('map=>> ${addedItemMap.toString()}');
    // for (final ValueNotifier<bool> element in dashboardItemNotifierList) {
    //   try {
    //     element.value = !element.value;
    //   } catch (e) {
    //     adLog(e.toString());
    //   }
    // }
    appSessionState.updateCartCountFromCache(
      dutyFreeCartResponse?.itemDetails.length ?? 0,
    );
    Future.delayed(const Duration(milliseconds: 100), () {
      appSessionState.saveCart(CartType.noDataInCart.name);
    });
    notifyListeners();
  }

  // CatalogListResponseModel? pdpPageResponse;
  Status pdpStatus = Status.loading;
  Status cartItemClick = Status.complete;
  ValueNotifier<Status> bankOfferStatus = ValueNotifier(Status.loading);
  Status importantInformationStatus = Status.complete;

  //
  // void getPdpResponse(
  //   DutyFreeProductListRequest request,
  // ) {
  //   repository
  //       .getDutyFreeProducts(
  //     catalogRequest: request,
  //   )
  //       .then(
  //     (value) async {
  //       pdpPageResponse = value.data != null
  //           ? CatalogListResponseModel.fromJson(value.data)
  //           : null;
  //
  //       // final jsonString = await rootBundle.loadString(JsonAssets.pdp);
  //       // final Map<String, dynamic> data = json.decode(jsonString);
  //       // pdpPageResponse = CatalogListResponseModel.fromJson(data['data']);
  //       // adLog(pdpPageResponse.toString());
  //       pdpStatus = Status.complete;
  //       notifyListeners();
  //     },
  //   );
  // }

  String getFormattedPercent() {
    // return '(${Utils.removeExtraZeros('${(dutyFreeCartResponse?.preOrderDiscount?.amount ?? 1) / (dutyFreeCartResponse?.totalAmount?.amount ?? 1) * percent}')}%)';
    return '(${dutyFreeCartResponse?.preOrderDiscount?.percentageDiscount}%)';
  }

  void applyFilter({BuildContext? context}) {
    // appliedFilterMap.clear();
    // addedCategoryMap.forEach(
    //   (key, value) => appliedFilterMap[key] = List.of(value),
    // );
    priceSelectedValueBackup = priceSelectedValue;
    // if (priceSelectedValueBackup == filterMaxPriceBackup) {
    //   final List<String>? list = appliedFilterMap.remove(price);
    //   adLog(list.toString());
    // } else {
    //   if (priceSelectedValueBackup != 0) {
    //     appliedFilterMap[price] = List.of([price]);
    //   }
    // }
    adLog(appliedFilterMap.toString());
    isFilterApplied = true;
    adLog('');
    updateProductListStatus(Status.loading);
    adLog('');
    final List<String>? category = getCategory();
    final List<String>? subCategory = getSubCategory();
    final bool remove1 = category?.remove(price) ?? false;
    final bool remove2 = subCategory?.remove(price) ?? false;
    adLog('$remove1');
    adLog('$remove2');
    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      category: category,
      brand: selectedBrand.isNotEmpty ? [selectedBrand] : getBrand(),
      subCategory: subCategory,
      page: 1,
      restricted: !ageAbove25,
      storeType: (storeType ?? '').isNotEmpty
          ? storeType ?? ''
          : terminalModel.value.code,
      pageSize: pageSize,
      offers: getOffers(),
      exclusive: exclusive,
      includeOOS: includeOOS,
    );
    adLog('');
    getDutyFreeProductList(
      dutyFreeProductListRequest ??
          DutyFreeProductListRequest(
            airportCode: selectedAirportsData?.airportCode ?? '',
          ),
    );
    if (context == null) {
      final Map<String, List<String>>? categoryMap =
          appliedFilterMap[DutyFreeFilterConstants.category];
      for (int count = 0; count < dataList.length; count++) {
        dataList[count].isSelected.value =
            categoryMap?.containsKey(dataList[count].code) ?? false;
      }
    } else {
      navigatorPopScreen(context);
    }
  }

  int currentPage = 1;

  void addProgress(String? skuCode) {
    isProgressMap[skuCode ?? ''] = '';
  }

  void removeProgress(String? skuCode, {bool updateProgress = true}) {
    final String? remove = isProgressMap.remove(skuCode ?? '');
    adLog(remove ?? '');
    if (updateProgress) {
      notifyListeners();
    }
  }

  void updateCategoriesListState({
    required ADResponseState state,
  }) {
    categoriesListState = state;
    notifyListeners();
  }

  Future<void> saveCategories() async {
    updateCategoriesListState(state: ADResponseState.loading());
    productCategoriesList = List.empty(growable: true);
    await _repository
        .getAllCategories(
      storeType: terminalModel.value.code,
      ageAbove25: ageAbove25,
    )
        .then((response) {
      try {
        if (response.viewStatus == Status.complete && response.data != null) {
          final jsonResponse =
              (response.data as List).first as Map<String, dynamic>;
          final Map<String, dynamic> fields =
              jsonResponse['fields'] as Map<String, dynamic>;
          final Map<String, dynamic> widget =
              fields['widget'] as Map<String, dynamic>;
          final List<dynamic> widgetItems = widget['widgetItems'];

          for (final Map<String, dynamic> item in widgetItems) {
            productCategoriesList.add(ProductCategories.fromJson(item));
          }
          updateCategoriesListState(
            state: ADResponseState.completed(productCategoriesList),
          );
        }
      } catch (e) {
        updateCategoriesListState(
          state: ADResponseState.error('Something went wrong'),
        );
      }
    });
    notifyListeners();
  }

  /// coupon response
  DutyFreeCouponResponse? dutyFreeCouponResponse;

  /// coupon state
  ADResponseState couponState = ADResponseState.loading();

  /// get list of available coupon
  void getCoupon(
    DutyFreeState dutyFreeState,
    DutyFreeGetCouponRequest request,
  ) {
    couponState.viewStatus = Status.loading;
    _repository.getCoupon(dutyFreeGetCouponRequest: request).then(
      (value) {
        updateProductListStatus(Status.complete);
        if (value.data != null) {
          couponState.viewStatus = Status.complete;
          dutyFreeCouponResponse = DutyFreeCouponResponse.fromJson(value.data);

          dutyFreeState.dutyFreeEventState.couponListEvent();
          dutyFreeState.dutyFreeEventState
              .applyCouponClick(loginStatus: 'login');
        } else {
          couponState.viewStatus = Status.complete;
        }
      },
    );
  }

  Status validateCartStatus = Status.complete;

  /// get list of available coupon
  Future<ADResponseState> validateCartApi() {
    // couponState.viewStatus = Status.loading;
    return _repository.validateCart();
  }

  /// apply coupon
  void applyCoupon({
    required BuildContext context,
    int? index,
    required String action,
  }) {
    DutyFreeApplyCouponRequest request = const DutyFreeApplyCouponRequest();

    if (index == -1) {
      if (applyCouponController.text.trim().isNotEmpty) {
        isCouponApplying.value = true;
        isCouponAppliedFromInput = true;
        notifyListeners();
        request = request.copyWith(
          promoCode: applyCouponController.text.trim(),
          amount: dutyFreeCartResponse?.finalAmount?.amount ?? 0,
        );
        GaEvent.getInstance().offersCouponApplyEvent(
          '',
          applyCouponController.text.trim(),
          'duty_free',
        );
      }
    } else {
      isCouponApplying.value = true;
      request = request.copyWith(
        promoCode: action == 'apply'
            ? dutyFreeCouponResponse
                    ?.coupons[index ?? 0].promoStaticPromoCode ??
                ''
            : '',
        amount: dutyFreeCartResponse?.finalAmount?.amount ?? 0,
      );
      CouponDataItem couponDataItem =
          dutyFreeCouponResponse?.coupons[index ?? 0] ?? const CouponDataItem();

      couponDataItem = couponDataItem.copyWith(isSelected: true);
      dutyFreeCouponResponse?.coupons[index ?? 0] = couponDataItem;
      GaEvent.getInstance().offersCouponApplyEvent(
        dutyFreeCouponResponse?.coupons[index ?? 0].promoDescription ?? '',
        dutyFreeCouponResponse?.coupons[index ?? 0].promoStaticPromoCode ?? '',
        'duty_free',
      );

      notifyListeners();
    }

    ///GA Offers coupon apply
    ClickEvents.offers_coupon_apply
        .logEvent(parameters: GaEvent.getInstance().parameterMap);

    _repository.applyCoupon(applyCouponRequest: request).then(
      (value) async {
        isCouponAppliedFromInput = false;
        updateProductListStatus(Status.complete);
        String errorMessage = '';
        if (value.viewStatus == Status.error) {
          ///GA Offers coupon error
          final map = GaEvent.getInstance().parameterMap;
          map[Parameters.error_text.name] = value.message ??
              'Looks like you entered invalid coupon. Please try again.';
          map[Parameters.error_code.name] = value.errorCode ?? '';
          ClickEvents.offers_coupon_code_error
              .logEvent(parameters: GaEvent.getInstance().parameterMap);
          errorMessage = value.message ?? '';
          if (applyCouponController.text.trim().isEmpty) {
            getView(
              context: context,
              dialogEnm: DialogTypeEnm.toast,
              message: errorMessage,
              backgroundColor: context.adColors.black,
            );
          }
        }

        couponError.value =
            applyCouponController.text.trim().isNotEmpty ? errorMessage : '';

        if (value.data != null) {
          // final DutyFreeApplyCouponResponse applyCouponResponse =
          //     DutyFreeApplyCouponResponse.fromJson(value.data);
          final response = await getCartDetails(
            context,
            event: ClickEvents.duty_free_coupon_applied,
          );
          isCouponApplying.value = false;
          adLog(response.toString());
          if ((dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0) >
              0) {
            navigatorPopScreen(context);
            final Future future = showDialog(
              context: context,
              builder: (BuildContext context) {
                PlaySound.playAudioSound('coupon_code.mp3');
                return ConfettiView(
                  couponCode: dutyFreeCartResponse?.promoCoupon?.promoCode
                          ?.toString() ??
                      '',
                  amount: dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0.0,
                  couponMessage: '',
                );
              },
            );
            adLog(future.toString());
          }
        } else {
          selectedCouponNotFound.value = two;
          isCouponApplying.value = false;
          if ((index ?? 0) >= 0) {
            CouponDataItem couponDataItem =
                dutyFreeCouponResponse?.coupons[index ?? 0] ??
                    const CouponDataItem();

            couponDataItem = couponDataItem.copyWith(isSelected: false);
            dutyFreeCouponResponse?.coupons[index ?? 0] = couponDataItem;
          }
        }

        notifyListeners();
      },
    );
  }

  /// apply coupon
  void removeCoupon({
    required BuildContext context,
  }) {
    DutyFreeApplyCouponRequest request = const DutyFreeApplyCouponRequest();
    request = request.copyWith(
      promoCode: '',
      amount: dutyFreeCartResponse?.finalAmount?.amount ?? 0,
    );
    isRemovedCouponClicked = true;
    notifyListeners();

    _repository.applyCoupon(applyCouponRequest: request).then(
      (value) async {
        updateProductListStatus(Status.complete);
        if (value.data != null) {
          // final DutyFreeApplyCouponResponse applyCouponResponse =
          //     DutyFreeApplyCouponResponse.fromJson(value.data);
          final response = await getCartDetails(
            context,
            showProgress: false,
            event: ClickEvents.duty_free_coupon_removed,
          );
          isRemovedCouponClicked = false;
          adLog(response.toString());
          notifyListeners();
        } else {
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.toast,
            message: value.message,
          );
          onError(context, value.message);
          notifyListeners();
        }
      },
    );
  }

  Future<List<WidgetItem>> getAllOffers(
    BuildContext context, {
    required String airportCode,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'AirportCode':
          airportPrefixName(context, airportCode: airportCode).toString(),
      'isBankOffer': true,
      'appType': 'app',
      'LOB': 'dutyfree',
    };
    // print('codeAirppor $queryParameters');

    final value = await OfferRepository().fetchOffers(
      queryParameters: queryParameters,
    );
    // offersState = value;
    // print('ooooooooo $value');
    return (value.data as OfferItems).result;
    // filteredOfferList = (offersState.data as OfferItems).result;
    // notifyListeners();
  }

  String? airportPrefixName(BuildContext context, {String? airportCode}) {
    String airportPrefixName = '';
    try {
      airportPrefixName = context
              .read<SiteCoreStateManagement>()
              .adaniAirportsList
              .singleWhere(
                (element) =>
                    element.airportCode ==
                    (airportCode ?? dutyFreeCartResponse?.airportCode),
                orElse: () => selectedAirportsData ?? AirportItemModel(),
              )
              .airportPrefixName ??
          '';
    } catch (e) {
      adLog(e.toString());
    }
    return airportPrefixName.isNotEmpty
        ? airportPrefixName
        : 'adani-one-airport';
  }

  void onError(BuildContext context, String? message) {
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: 76,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message ?? '',
          textAlign: TextAlign.left,
          style: ADTextStyle400.size12.setTextColor(Colors.white),
        ),
        duration: const Duration(
          milliseconds: 1000,
        ),
        backgroundColor: context.adColors.storyViewBarFillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
        ),
      ),
    );
    adLog(showSnackBar.toString());
  }

  void couponDiscountToast(
    BuildContext context,
    String? message1,
    String? message2,
    String? message3,
  ) {
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: 76,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text.rich(
          TextSpan(
            text: message1,
            style: ADTextStyle400.size14.copyWith(
              color: context.adColors.whiteTextColor,
            ),
            children: [
              TextSpan(
                text: message2,
                style: ADTextStyle700.size14.copyWith(
                  color: context.adColors.whiteTextColor,
                ),
              ),
              TextSpan(
                text: message3,
                style: ADTextStyle400.size14.copyWith(
                  color: context.adColors.whiteTextColor,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(
          milliseconds: 2000,
        ),
        backgroundColor: context.adColors.storyViewBarFillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
        ),
      ),
    );
    adLog(showSnackBar.toString());
  }

  Future<ADResponseState> removeDutyFreeCart() async {
    return _repository.removeDutyFreeCart();
  }

  /// all these for coupon input box
  ValueNotifier<int> selectedCouponNotFound = ValueNotifier(0);
  ValueNotifier<bool> applyButtonEnableNotifier = ValueNotifier(false);
  ValueNotifier<String> couponTextErrorNotifier = ValueNotifier('');
  ValueNotifier<String> couponError = ValueNotifier('');

  // ValueNotifier<bool> couponTextChangeNotifier = ValueNotifier(false);

  void cancelIconClick() {
    couponError.value = '';
    couponTextErrorNotifier.value = '';
    applyCouponController.clear();
    selectedCouponNotFound.value = 0;
    applyButtonEnableNotifier.value = false;
  }

  void showClearCartDialog(
    BuildContext context,
    void Function() callBack,
  ) {
    getCartDetails(context).then((value) {
      Utils.clearDutyFreeCartDialog(
        context,
        (dialogContext) {
          _repository.removeDutyFreeCart().then((value) {
            if (value.viewStatus == Status.complete) {
              (addedItemMap[terminalModel.value.code] ?? {}).clear();
              notifyListeners();
              clearCart(context.read<AppSessionState>());
              callBack.call();
            } else {
              getView(
                context: context,
                dialogEnm: DialogTypeEnm.snackBar,
                message: value.message ?? 'Something went wrong',
              );
            }
          });
          Navigator.of(dialogContext).pop();
        },
      );
    });
  }

  void toggleExclusive() {
    exclusive = !exclusive;
    notifyListeners();
  }

  void toggleIsSelected() {
    isCheckSelected = !isCheckSelected;
    notifyListeners();
  }
}

extension BoolParsing on String {
  bool parsingBool() {
    if (toLowerCase() == 'true') {
      return true;
    }
    return false;
  }
}
