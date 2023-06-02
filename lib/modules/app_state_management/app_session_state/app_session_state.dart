/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_cart_utils.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/common_service/repository/common_service_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/catalog_list_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_balance_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/repositories/loyalty_repository.dart';
import 'package:adani_airport_mobile/modules/more/models/response/profile_image_response.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/my_bookings/repositories/my_booking_repository.dart';
import 'package:adani_airport_mobile/modules/my_bookings/utils/booking_tab_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/generic_cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/session/models/active_cart/response/get_active_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/sign_out_request.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_airport_mobile/modules/session/state_management/otp_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_plugin/adani_mobile_plugin.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class is used to manage the state of whole app.
class AppSessionState extends ADBaseViewModel {
  /// Login Session State Begin
  bool _isLoggedIn = false;
  bool _isRegistered = false;

  bool get isLoggedIn => _isLoggedIn;

  bool get isRegistered => _isRegistered;

  static const int pageSize = 7;

  String mainTabType = '';

  /// this list is used to display on screen
  List<MyBookingListItem> currentOrdersStrip = [];

  /// unique id of removed upcoming bookings done by user greater than 12 hrs
  List<String> initialRemovedOrders = [];

  /// unique id of removed upcoming bookings done by user less than 12 hrs and equal to 12 hrs
  List<String> finalRemovedOrders = [];

  /// bottom strip hour logic currently set to 12
  final int bottomStripHours = 12;

  AndroidDeviceInfo? androidDeviceInfo;
  IosDeviceInfo? iosDeviceInfo;

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  AppSessionState() {
    if (Platform.isAndroid) {
      _deviceInfoPlugin.androidInfo.then((value) {
        androidDeviceInfo = value;
      });
    }
    if (Platform.isIOS) {
      _deviceInfoPlugin.iosInfo.then((value) {
        iosDeviceInfo = value;
      });
    }
  }

  void updateIsLoggedIn({required bool loginStatus}) {
    _isLoggedIn = loginStatus;
    notifyListeners();
  }

  Future<void> updateSessionOnLogout({required bool loginStatus}) async {
    _isLoggedIn = loginStatus;
    _profileModel = null;
    await clearUpcomingBookings();
    notifyListeners();
  }

  void updateIsRegistered({required bool isRegistered}) {
    _isRegistered = isRegistered;
    notifyListeners();
  }

  bool updateBookingValue = false;

  FlightBookingType flightBookingType = FlightBookingType.none;

  BookingHistory? allOrders;
  BookingHistory? shoppingOrders;
  BookingHistory? bookingOrders;

  void initializeAllOrders() {
    allOrders = BookingHistory(
      typeOfHistory: BookingTabType.all,
      pageSize: pageSize,
      isReload: false,
      tabType: 'all',
      pageIndex: 1,
    );
    shoppingOrders = BookingHistory(
      typeOfHistory: BookingTabType.shopping,
      pageSize: pageSize,
      isReload: false,
      tabType: 'shopping',
      pageIndex: 1,
    );
    bookingOrders = BookingHistory(
      typeOfHistory: BookingTabType.booking,
      pageSize: pageSize,
      isReload: false,
      tabType: 'booking',
      pageIndex: 1,
    );
    // notifyListeners();
  }

  /// Login Session State End

  /// Profile State Begin
  ProfileModel? _profileModel;

  File? _profileImageFile;

  bool isPullToRefresh = false;

  ///For storing otp destination
  OtpType sendOtpTo = OtpType.sms;

  void setValueForOtp(OtpType otpType) {
    sendOtpTo = otpType;
    notifyListeners();
  }

  void setValueForPullToRefresh({required bool value}) {
    isPullToRefresh = value;
    notifyListeners();
  }

  ProfileModel get profileModel => _profileModel ?? const ProfileModel();

  File? get profileImageFile => _profileImageFile;
  final SessionRepository _sessionRepository = SessionRepository();

  final CommonServiceRepository _commonServiceRepository =
      CommonServiceRepository();

  ///Use to check the required fields are already filled or not.
  bool isRequiredDetailAvailable() {
    final checkFirstName = profileModel.personInfo?.firstName != null &&
        (profileModel.personInfo?.firstName?.isNotEmpty ?? false);
    final emails = profileModel.personInfo?.emails;
    final checkEmail = emails?.isNotEmpty ?? false;
    return checkFirstName && checkEmail;
  }

  Future<void> getProfileDetails() async {
    final ADResponseState responseState = await _sessionRepository.getProfile();
    if (responseState.viewStatus == Status.complete) {
      updateProfileModel(profileModel: responseState.data);
    }
  }

  void updateProfileModel({required ProfileModel? profileModel}) {
    _profileModel = profileModel;
    if (_profileModel != null &&
        _profileModel?.loyaltyProfile?.avaliableBalance != null) {
      _loyaltyPoint =
          int.parse(_profileModel?.loyaltyProfile?.avaliableBalance ?? '0');
      rewardBalance.value = _loyaltyPoint;
    }
    notifyListeners();
  }

  ///It will get profile image
  Future<ADResponseState> _getProfileImage() async {
    final responseState = await _sessionRepository.getProfileImage();
    return responseState;
  }

  Future<void> parseProfileImage() async {
    final imageState = await _getProfileImage();
    final imageResponse = imageState.data as ProfileImageResponse?;
    if (imageResponse == null) {
      return;
    }
    final bytesData = base64.decode(imageResponse.byteArray ?? '');
    final fileName = _parseFileName(imageResponse.name ?? '');
    final receivedFile = await MyProfileUtils.createFile(
      bytesData,
      fileName,
    );
    updateProfileImage(receivedFile);
  }

  String _parseFileName(String responseFileName) {
    if (responseFileName.isEmpty) {
      return '';
    }
    final stringList = responseFileName.split('_');
    return stringList.length == MyProfileUtils.avatarNameCount
        ? '${stringList[1]}_${stringList.last}'
        : stringList.last;
  }

  void updateProfileImage(File file) {
    _profileImageFile = file;
    notifyListeners();
  }

  void eraseProfileImage() {
    _profileImageFile = null;
  }

  Future<void> sendFCMToBackend(String fcmToken) async {
    final profileData = ProfileModel(
      fcm: fcmToken,
      personInfo: _profileModel?.personInfo,
      isLoyaltyMember: _profileModel?.isLoyaltyMember,
      loyaltyProfile: _profileModel?.loyaltyProfile,
    );
    final sendFCMToBackend =
        _sessionRepository.sendFCMToBackend(profileModel: profileData);
    adLog(sendFCMToBackend.toString());
  }

  void updateValueOfTab(String tabType) {
    mainTabType = tabType;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => notifyListeners(),
    );
  }

  void updateValueOfBooking({required bool updateValue}) {
    updateBookingValue = updateValue;
    notifyListeners();
  }

  Future<bool> serviceCallForSignOut() async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    final refreshToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.refreshToken);
    final state = await _sessionRepository.signOut(
      signOutRequest: SignOutRequest(accessToken ?? '', refreshToken ?? ''),
    );

    adLog(state.data.toString());
    return Future.value(state.data as bool);
  }

  Future<bool> serviceCallForDeleteAccount() async {
    final state = await _commonServiceRepository.deleteUserAccount();
    return state.viewStatus == Status.complete;
  }

  /// Profile Session State End

  /// CartData State Begin
  List<ProductList> addedItemList = [];
  int cartCount = 0;
  bool animationVisibility = false;
  int previousCartCount = -1;
  final CartRepository cartRepository = CartRepository();

  CartType cartType = CartType.noDataInCart;

  Future<void> getPranaamCartItemDetails({
    String? oldAgentId,
  }) async {
    final ADResponseState responseState = await cartRepository.fetchCartDetails(
      oldUserAgentId: oldAgentId,
      isGuestLogin: oldAgentId?.isNotEmpty ?? false,
    );
    if (responseState.viewStatus == Status.complete &&
        responseState.data != null) {
      final GetCartResponseModel getCartResponseModel = responseState.data;
      // context.read<PranaamAppDataStateManagement>().cartDataResponse =
      //     getCartResponseModel.cartResponse;
      updatePranaamCart(
        getAddonAddedByUserCount(getCartResponseModel.cartResponse),
      );
    }
  }

  void updatePranaamCart(int count) {
    cartCount = count;
    saveCartCount(count);
    if (cartCount > 0) {
      saveCart(CartType.pranaam.name);
    }
    notifyListeners();
  }

  void updateCartCountFromCache(int count) {
    cartCount = count;
    if (cartCount > 0) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          animationVisibility = false;
          notifyListeners();
        },
      );
      animationVisibility = true;
    }
    notifyListeners();
  }

  Future<void> saveCartCount(int count) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedCartCount = await sharedPreferences.setInt(
      SharedPreferenceKeys.keyCartCount,
      count,
    );
    adLog(storedCartCount.toString());
  }

  void clearProductList() {
    addedItemList.clear();
    notifyListeners();
  }

  double couponDiscount = 0;

  void updateCouponDiscount(double val) {
    couponDiscount = val;
    notifyListeners();
  }

  void clearPranaamCartLocally() {
    updatePranaamCart(0);
    saveCart(CartType.noDataInCart.name);
  }

  Future<void> clearPranaamCart(
    BuildContext dialogContext,
  ) async {
    final ADResponseState adResponseState = await cartRepository.deleteCart();
    navigatorPopScreen(dialogContext);
    if (adResponseState.viewStatus == Status.complete) {
      updatePranaamCart(0);
      HomeBottomAssets.homeBottomPages[BottomTabNavKeys.cartTabItemKey] =
          const GenericCartScreen();
      await saveCart(CartType.noDataInCart.name);
    }
  }

  Future<bool> isCartEmptyOrNot(CartType cartType) async {
    final String cartName = await AppCartUtils().readCartName() ?? '';
    adLog('cartType : $cartName');
    if (cartName == CartType.noDataInCart.name) {
      return false;
    } else if (cartName == cartType.name &&
        cartName == CartType.dutyFree.name) {
      //means dutyFree cart exists
      return true;
    } else if (cartName == cartType.name && cartName == CartType.pranaam.name) {
      //means pranaam exists
      return true;
    } else {
      return false;
    }
  }

  void clearDutyFreeCartDialog(BuildContext context) {
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
          detailString: 'remove_cart_item_pranaam'.localize(context),
          titleString: 'cart_confirmation'.localize(context),
          yesCallBack: () =>
              context.read<DutyFreeState>().clearDutyFreeCartApi(this),
          noCallBack: () => navigatorPopScreen(dialogContext),
        );
      },
    );

    adLog(bottomSheet.toString());
  }

  Future<ADResponseState> clearDutyFreeCartApi({
    required BuildContext context,
  }) async {
    try {
      context.read<DutyFreeState>().dutyFreeEventState.clearCartEvent(
            response: context.read<DutyFreeState>().dutyFreeCartResponse,
            type: CartType.pranaam,
          );
    } catch (e) {
      adLog(e.toString());
    }
    final ADResponseState responseState =
        await context.read<DutyFreeState>().removeDutyFreeCart();
    context.read<DutyFreeState>().clearCart(this);
    return responseState;
  }

  void clearDutyFreeCartLocally(BuildContext context) {
    cartType = CartType.noDataInCart;
    // save pranaam cart name in preferences
    clearDutyFreeCart(context);
    // means now call AddPackage to cart API for pranaam
  }

  void clearDutyFreeCart(BuildContext context) {
    saveCart(CartType.noDataInCart.name);
    context.read<DutyFreeState>().dutyFreeCartResponse?.itemDetails.clear();
    context.read<DutyFreeState>().updateCartMap();
    context.read<DutyFreeState>().dutyFreeCartResponse = null;
    context.read<DutyFreeState>().notifyListeners();
  }

  /// CartData State End

  /// MyBooking State Begin
  final MyBookingRepository _myBookingRepository = MyBookingRepository();

  /// Initiate loading state for api hit
  // ADResponseState myBooking = ADResponseState.loading();
  ADResponseState myBooking = ADResponseState.loading();
  ADResponseState shopping = ADResponseState.loading();
  ADResponseState flightBooking = ADResponseState.loading();

  /// Initiate loading state for api hit
  ADResponseState myUpcomingBooking = ADResponseState.completed({});

  ///This is to store all the bookings
  MyBookingResponseModel? myBookingResponseModel;

  ///This is to store upcoming bookings only
  MyBookingResponseModel? myUpcomingBookingResponseModel;
  BookingTabType? bookingTabType;

  void setInitialStateToLoading(BookingTabType? bookingTabType) {
    this.bookingTabType = bookingTabType;
    if (bookingTabType == BookingTabType.all) {
      myBooking = ADResponseState.loading();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => notifyListeners(),
      );
    } else if (bookingTabType == BookingTabType.shopping) {
      shopping = ADResponseState.loading();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => notifyListeners(),
      );
    } else if (bookingTabType == BookingTabType.booking) {
      flightBooking = ADResponseState.loading();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => notifyListeners(),
      );
    }
  }

  ///It will provide details related itinerary
  Future<ADResponseState> getBookings({
    String? bookType,
    int? pageSize = pageSize,
    int? pageIndex = 1,
  }) async {
    if (bookType == 'All') {
      notifyResponse(myBooking, pageIndex ?? 0);
    } else if (bookType == 'Shopping') {
      notifyResponse(shopping, pageIndex ?? 0);
    } else if (bookType == 'Booking') {
      notifyResponse(flightBooking, pageIndex ?? 0);
    }

    final value = await _myBookingRepository.getBookings(
      (bookType ?? 'all').toLowerCase(),
      pageSize,
      pageIndex,
    );
    updateMyBookingState(value, bookType);
    return value;
  }

  void notifyResponse(ADResponseState state, int pageIndex) {
    if (pageIndex == 1) {
      if (state.viewStatus != Status.loading) {
        state = ADResponseState.loading();
        notifyListeners();
      }
    }
  }

  /// to display booking on home screen that are upcoming - booking strip
  Future<void> _getUpcomingBookings() async {
    // if (_isLoggedIn) {
    if (myUpcomingBooking.viewStatus != Status.loading) {
      myUpcomingBooking = ADResponseState.loading();
      notifyListeners();
    }
    final bookingState = await _myBookingRepository.getUpcomingBookings();
    await updateMyUpcomingBookingState(bookingState);
    // }
  }

  void getUpcomingBookings() {
    if (isLoggedIn) {
      _getUpcomingBookings();
    }
  }

  Future<void> saveCart(String cartName) async {
    await AppCartUtils().saveCartName(cartName);
  }

  ///It will update ADResponseState status related my bookings
  void updateMyBookingState(ADResponseState response, String? bookType) {
    if (bookType == 'All') {
      myBooking = ADResponseState.completed(response.data);
    } else if (bookType == 'Shopping') {
      shopping = ADResponseState.completed(response.data);
    } else if (bookType == 'Booking') {
      flightBooking = ADResponseState.completed(response.data);
    }
    myBookingResponseModel = myBooking.data;
    //const MyBookingListItem dummy= MyBookingListItem(subType: BookingType.trainman);
    //myBookingResponseModel?.all?.insert(0, dummy);
    notifyListeners();
  }

  ///It will update ADResponseState status related my bookings
  Future<void> updateMyUpcomingBookingState(ADResponseState response) async {
    myUpcomingBooking = ADResponseState.completed(response.data);
    myUpcomingBookingResponseModel = myUpcomingBooking.data;
    currentOrdersStrip = myUpcomingBookingResponseModel?.currentOrders ?? [];
    await getDataFromPref();
    notifyListeners();
  }

  Future<void> removeUpcomingBooking(MyBookingListItem? itemToBeRemoved) async {
    adLog('removed itemToBeRemoved?.uniqueId');
    adLog(itemToBeRemoved?.orderReferenceId ?? '');

    /// removed item saved to preference
    saveToPreference(itemToBeRemoved);
    await getDataFromPref().then(
      (value) {
        notifyListeners();
      },
    );
    notifyListeners();
  }

  ///called when user gets logged out
  Future<void> clearUpcomingBookings() async {
    myUpcomingBookingResponseModel?.currentOrders = [];
    currentOrdersStrip = [];
    notifyListeners();
  }

  ///fetching initial and final removedOrders from shared prefs
  Future<void> getDataFromPref() async {
    ///first fetching initialRemovedOrders
    final dataObj = <String, Object>{
      'key': SharedPreferenceKeys.keyUpcomingInitialRemovedOrders,
      'dataType': 'string',
    };
    await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
      if (value.toString().isNotEmpty) {
        List _localList = [];
        _localList = json.decode(value);

        /// get removed orders id from shared prefs and store in removed orders list
        initialRemovedOrders = List<String>.from(_localList);
      }
      notifyListeners();
    });

    ///fetching finalRemovedOrders
    final dataObj2 = <String, Object>{
      'key': SharedPreferenceKeys.keyUpcomingFinalRemovedOrders,
      'dataType': 'string',
    };
    await AdaniMobilePlugin.readSharedPref(dataObj2).then((value) {
      if (value.toString().isNotEmpty) {
        List _localList = [];
        _localList = json.decode(value);

        /// get removed orders id from shared prefs and store in removed orders list
        finalRemovedOrders = List<String>.from(_localList);
        if (finalRemovedOrders.isNotEmpty || initialRemovedOrders.isNotEmpty) {
          final List<MyBookingListItem> localList = [...currentOrdersStrip];
          for (int index = 0; index < currentOrdersStrip.length; index++) {
            final element = currentOrdersStrip[index];

            ///hour difference between current time and service date time
            final int hourDifference = DateTime.parse(element.createdOn ?? '')
                .difference(DateTime.now())
                .inHours;
            if (hourDifference > bottomStripHours &&
                initialRemovedOrders.contains(element.orderReferenceId)) {
              final bool isRemoved = localList.remove(element);
              adLog(isRemoved.toString());
            } else if (finalRemovedOrders.contains(element.orderReferenceId)) {
              final bool isRemoved = localList.remove(element);
              adLog(isRemoved.toString());
            }
          }
          currentOrdersStrip = localList;
        }
        adLog('list of present unique ids');
        for (final MyBookingListItem element in currentOrdersStrip) {
          adLog(element.orderReferenceId.toString());
        }
      }
      notifyListeners();
    });
    return;
  }

  /// save removed orders to prefs
  void saveToPreference(MyBookingListItem? itemToBeRemoved) {
    /// check time to store in initialRemovedList or finalRemovedList
    final int hourDifference = DateTime.parse(itemToBeRemoved?.createdOn ?? '')
        .difference(DateTime.now())
        .inHours;
    if (hourDifference > bottomStripHours) {
      if (itemToBeRemoved?.orderReferenceId != null) {
        initialRemovedOrders.add(itemToBeRemoved?.orderReferenceId ?? '');
      }
    } else {
      if (itemToBeRemoved?.orderReferenceId != null) {
        finalRemovedOrders.add(itemToBeRemoved?.orderReferenceId ?? '');
      }
    }

    final dataObj = <String, Object>{
      'key': SharedPreferenceKeys.keyUpcomingInitialRemovedOrders,
      'dataType': 'string',
      'value': jsonEncode(initialRemovedOrders),
    };

    AdaniMobilePlugin.writeSharedPref(dataObj);

    final dataObj2 = <String, Object>{
      'key': SharedPreferenceKeys.keyUpcomingFinalRemovedOrders,
      'dataType': 'string',
      'value': jsonEncode(finalRemovedOrders),
    };

    AdaniMobilePlugin.writeSharedPref(dataObj2);
  }

  /// Get Active cart from API
  Future<String> getActiveCart() async {
    final ADResponseState responseState =
        await _sessionRepository.getActiveCart();
    String activeCartName = '';
    if (responseState.viewStatus == Status.complete &&
        responseState.data != null) {
      final GetActiveCartResponseModel getActiveCartResponseModel =
          responseState.data;
      activeCartName = getActiveCartResponseModel.businessSubType;
      adLog(
        'getActiveCart Name $activeCartName',
        className: this,
      );
    }
    return activeCartName;
  }

  ADResponseState activeCartResponseState = ADResponseState.loading();

  void getActiveGeneralCart() {
    getActiveGeneralCartWithFuture();
  }

  /// Get Active general cart from API
  Future<void> getActiveGeneralCartWithFuture() async {
    activeCartResponseState = ADResponseState.loading();
    notifyListeners();
    activeCartResponseState = await _sessionRepository.getActiveCart();
    if (activeCartResponseState.viewStatus == Status.complete &&
        activeCartResponseState.data != null) {
      adLog(
        'getActiveCart Name '
        '${(activeCartResponseState.data as GetActiveCartResponseModel).businessSubType}',
        className: this,
      );
    }
    notifyListeners();
  }

  ///Loyalty point begin
  int _loyaltyPoint = 0;
  int _pendingPoint = 0;
  final LoyaltyRepository _loyaltyRepository = LoyaltyRepository();
  ValueNotifier<int> rewardBalance = ValueNotifier(0);

  /// To get loyalty point balance from API
  Future<void> getBalance() async {
    if (!ProfileSingleton.profileSingleton.isLoggedIn) {
      return;
    }
    final Map<String, String> queryParameters = {
      //'mobileNo': ProfileSingleton.profileSingleton.userID,
      'balanceTypes': 'available',
    };
    final ADResponseState responseState =
        await _loyaltyRepository.fetchPointBalance(
      queryParameters: queryParameters,
    );

    LoyaltyBalanceModel? loyaltyBalanceModel;
    if (responseState.viewStatus == Status.complete &&
        responseState.data != null) {
      loyaltyBalanceModel = responseState.data;
    }
    if (loyaltyBalanceModel != null) {
      _loyaltyPoint = loyaltyBalanceModel.availableBalancePoints;
      _pendingPoint = loyaltyBalanceModel.totalPendingPoints;
      rewardBalance.value = _loyaltyPoint;
    }
  }

  /// To get loyalty point
  String get loyaltyPoint {
    return _loyaltyPoint.toString();
  }

  ///To get pending point
  String get pendingPoint => _pendingPoint.toString();

  /// To update loyalty point
  void updateLoyalty(int point) {
    _loyaltyPoint = point;
    rewardBalance.value = point;
  }

  /// Loyalty point end
}

enum CartType {
  noDataInCart,
  pranaam,
  dutyFree,
}
