/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_add_on/add_cart_add_on_request_model/add_cart_add_on_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/pranaam_remove_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/models/active_cart/response/get_active_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This contains the business logic of cart screen.
bool isAdded = false;

class CartScreenController extends State<CartScreen> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  AppSessionState appSessionState = AppSessionState();
  List<PackageDetail> packagesList = [];
  PackageDetail selectedPackageDetail = const PackageDetail(
    name: 'name',
    shortDesc: 'shortDesc',
    packageNumber: '1',
    packageId: 1,
  );

  List<bool> cartItemLoadings = [];
  List<ValueNotifier<bool>> addonItemLoadings = [];
  List<ValueNotifier<bool>> localCartItemLoadings = [];
  ValueNotifier<ADResponseState> offersState =
      ValueNotifier(ADResponseState.loading());

  @override
  void initState() {
    super.initState();
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    appSessionState = context.read<AppSessionState>();
    selectedPackageDetail =
        context.read<PranaamAppDataStateManagement>().selectedPackageDetail;

    if (!widget.showTopBar) {
      pranaamAppDataStateManagement.responseState = ADResponseState.loading();
      ProfileSingleton.profileSingleton
          .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData)
          .then((userData) {
        adLog('userprofile getCart value : ${userData.userId}');
        pranaamAppDataStateManagement.cartDataResponse = null;
        Future.wait(
          [getUserCartRequest(userData.userId, context), getAllOffers()],
        ).then((value) {
          adLog('cart and offer request complete');
          GaEvent.getInstance().viewCartEvent(pranaamAppDataStateManagement);
          ClickEvents.view_cart
              .logEvent(parameters: GaEvent.getInstance().parameterMap);
        });
      });
    }

    // context.read<PranaamAppDataStateManagement>().getCartItemDetails(
    //       getAddCartItemRequest().toJson(),
    //       cartData,
    //     );
  }

  Future<void> getAllOffers() async {
    final Map<String, String> queryParameters = {
      'language': 'en',
      'AirportCode': airportPrefixName().toString(),
      'isBankOffer': 'true',
      'appType': 'app',
      'LOB': 'pranaam',
    };

    final value = await OfferRepository().fetchOffers(
      queryParameters: queryParameters,
    );
    offersState.value = value;
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }

  void onAddTap(
    PackageAddOn packageAddOn, {
    required int quantity,
    required BuildContext context,
    bool isAddonLoading = true,
    required int cartItemIndex,
    required int addonIndex,
  }) {
    context.read<AppSessionState>().updatePranaamCart(
          getAddonCount(),
        );

    ///increase counter on add on button
    addCartRequest(
      packageAddOn,
      quantity,
      context,
      isAddonLoading: isAddonLoading,
      addonIndex: addonIndex,
      cartItemIndex: cartItemIndex,
    );
  }

  void addCartRequest(
    PackageAddOn packageAddOn,
    int quantity,
    BuildContext context, {
    bool isAddonLoading = false,
    int addonIndex = 0,
    int cartItemIndex = 0,
  }) {
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    if (isAddonLoading) {
      addonItemLoadings[addonIndex].value = true;
    } else {
      cartItemLoadings[cartItemIndex] = true;
    }
    pranaamAppDataStateManagement
        .cartAddOnItem(
      getAddCartAddOnRequest(packageAddOn, quantity).toJson(),
      appSessionState,
    )
        .then(
      (value) {
        // bool? result =
        // pranaamAppDataStateManagement.cartDataResponse?.availiableAddOn.remove(packageAddOn);
        closeProgressAndValidate(
          value,
          context,
        );
        cartItemLoadings[cartItemIndex] = false;
        addonItemLoadings[addonIndex].value = false;
        PranaamBookingGaAnalytics().ecommerceEventAddOn(
          ClickEvents.book_pranaam_add_on,
          context.read<PranaamAppDataStateManagement>(),
        );
        if (quantity == 0) {
          PranaamBookingGaAnalytics().ecommerceEventCartAddOn(
            ClickEvents.remove_from_cart,
            context.read<PranaamAppDataStateManagement>(),
          );
        } else {
          PranaamBookingGaAnalytics().ecommerceEventCartAddOn(
            ClickEvents.add_to_cart,
            context.read<PranaamAppDataStateManagement>(),
          );
        }
      },
    );
  }

  void onQuantitySelect(
    PackageAddOn packageAddOn, {
    required int quantity,
    required BuildContext context,
    bool isAddonLoading = true,
    required int cartItemIndex,
    required int addonIndex,
  }) {
    context.read<AppSessionState>().updatePranaamCart(
          getAddonCount(),
        );

    ///increase counter on add on button
    selectOnQuantity(
      packageAddOn,
      quantity,
      context,
      isAddonLoading: isAddonLoading,
      addonIndex: addonIndex,
      cartItemIndex: cartItemIndex,
    );
  }

  void selectOnQuantity(
    PackageAddOn packageAddOn,
    int quantity,
    BuildContext context, {
    bool isAddonLoading = false,
    int addonIndex = 0,
    int cartItemIndex = 0,
  }) {
    final int previousQuantity = context
            .read<PranaamAppDataStateManagement>()
            .cartDataResponse
            ?.packageAddOn[addonIndex - 1]
            .qty ??
        0;
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    if (isAddonLoading) {
      localCartItemLoadings[addonIndex].value = true;
    } else {
      cartItemLoadings[cartItemIndex] = true;
    }
    pranaamAppDataStateManagement
        .cartAddOnItem(
      getAddCartAddOnRequest(packageAddOn, quantity).toJson(),
      appSessionState,
    )
        .then(
      (value) {
        closeProgressAndValidate(
          value,
          context,
        );
        cartItemLoadings[cartItemIndex] = false;
        localCartItemLoadings[addonIndex].value = false;

        PranaamBookingGaAnalytics().ecommerceEventAddOn(
          ClickEvents.book_pranaam_add_on,
          context.read<PranaamAppDataStateManagement>(),
        );
        if (previousQuantity < quantity) {
          PranaamBookingGaAnalytics().ecommerceEventCartAddOn(
            ClickEvents.add_to_cart,
            context.read<PranaamAppDataStateManagement>(),
          );
        } else {
          PranaamBookingGaAnalytics().ecommerceEventCartAddOn(
            ClickEvents.remove_from_cart,
            context.read<PranaamAppDataStateManagement>(),
          );
        }
        ClickEvents.book_pranaam_add_on
            .logEvent(parameters: GaEvent.getInstance().parameterMap);
      },
    );
  }

  Future<ADResponseState> getCartRequest(
    String oldAgentId,
    BuildContext context, {
    bool guestLogIn = false,
  }) async {
    //ProcessDialog.showLoadingDialog(context);
    final ADResponseState responseState =
        await context.read<PranaamAppDataStateManagement>().getUserCart(
              appSessionState,
              oldAgentId,
              guestLogIn: guestLogIn,
              isFromContinue: true,
            );
    //closeProgressAndValidate(responseState, context);
    return responseState;
  }

  Future<void> getUserCartRequest(
    String oldAgentId,
    BuildContext context, {
    bool guestLogIn = false,
  }) async {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final ADResponseState responseState =
        await pranaamAppDataStateManagement.getUserCart(
      appSessionState,
      oldAgentId,
      guestLogIn: guestLogIn,
    );

    pranaamAppDataStateManagement.bookingID =
        pranaamAppDataStateManagement.cartDataResponse?.bookingId.toString() ??
            '';
    adLog(pranaamAppDataStateManagement.bookingID.toString());
    adLog(responseState.toString());
  }

  void closeProgressAndValidate(
    ADResponseState state,
    BuildContext context,
  ) {
    if (state.viewStatus == Status.complete ||
        state.viewStatus == Status.error) {
      ProcessDialog.closeLoadingDialog(context);
    }
  }

  int getAddOnSelectedId(int index) {
    return selectedPackageDetail.packageAddOn[index].addOnServiceId;
  }

  int getAddonCount() {
    final CartResponse? addCartAddOnResponseModel =
        context.read<PranaamAppDataStateManagement>().cartDataResponse;
    return getAddonAddedByUserCount(addCartAddOnResponseModel);
  }

  List<LocalCartModel> getCartAdded() {
    final List<LocalCartModel> listLocalCartModel = [];
    final CartResponse? cartResponse = getCartResponse();
    if (cartResponse == null) {
      return listLocalCartModel;
    } else {
      /// case 1 : check for package detail
      final LocalCartModel localCartModel = LocalCartModel(
        cartResponse.packageDetail.packageId,
        cartResponse.packageDetail.name,
        cartResponse.packageDetail.pricingInfo.totalBaseFare.amount,
        0,
        packageImage: cartResponse.packageDetail.packageImage,
      );
      listLocalCartModel.add(localCartModel);
      cartItemLoadings.add(false); //adding pranaam item loading
      final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
      final int size = packageAddOnList.length;
      for (int index = 0; index < size; index++) {
        if (packageAddOnList[index].qty > 0) {
          adLog('packageAddOnList qty $packageAddOnList[index].qty');
          cartItemLoadings.add(false); //adding addon item loading
          listLocalCartModel.add(
            LocalCartModel(
              cartResponse.packageAddOn[index].packageId,
              cartResponse.packageAddOn[index].addOnServiceName,
              cartResponse.packageAddOn[index].price.toDouble(),
              cartResponse.packageAddOn[index].qty,
              isCartAddOn: true,
              packageAddOn: cartResponse.packageAddOn[index],
              packageImage: cartResponse.packageDetail.packageImage,
            ),
          );
        }
      }
      //init loading for available addon
      for (final element in cartResponse.availiableAddOn) {
        addonItemLoadings.add(ValueNotifier(false));
        adLog(element.toString());
      }
      for (final element in listLocalCartModel) {
        localCartItemLoadings.add(ValueNotifier(false));
        adLog(element.toString());
      }
    }
    return listLocalCartModel;
  }

  CartResponse? getCartResponse() {
    return context.read<PranaamAppDataStateManagement>().cartDataResponse;
  }

  void eventRemoveCartOnPopupRemoveButton() {
    PranaamBookingGaAnalytics().ecommerceEventRemoveCart(
      ClickEvents.remove_from_cart,
      context.read<PranaamAppDataStateManagement>(),
    );
  }

  void openDeleteCartScreen({
    required bool isAddonAdded,
    PackageAddOn? packageAddOn,
    required int cartItemIndex,
    required BuildContext mainContext,
  }) {
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
        return PranaamRemoveItem(
          detailString: !isAddonAdded
              ? 'sure_want_to_remove_package'.localize(context)
              : 'sure_want_to_remove_item'.localize(context),
          titleString: !isAddonAdded
              ? 'remove_package'.localize(context)
              : 'remove_one_item'.localize(context),
          yesCallBack: () => setState(() {
            if (isAddonAdded) {
              navigatorPopScreen(dialogContext);
              _deleteItemCardData(
                packageAddOn,
                cartItemIndex,
                mainContext,
              );
            } else {
              navigatorPopScreen(dialogContext);
              _callRemoveCart();
            }
          }),
          noCallBack: () => navigatorPopScreen(dialogContext),
        );
      },
    );
    if (cartItemIndex == 0) {
      PranaamBookingGaAnalytics().ecommerceEventRemoveCart(
        ClickEvents.book_pranaam_remove_from_cart_start,
        context.read<PranaamAppDataStateManagement>(),
      );
    }
    adLog('$bottomSheet.this');
  }

  void _deleteItemCardData(
    PackageAddOn? packageAddon,
    int index,
    BuildContext context,
  ) {
    ///TODO this cane be delete with package Id///
    if (packageAddon != null) {
      //const operationId = 2;
      onAddTap(
        packageAddon,
        quantity: 0,
        context: context,
        isAddonLoading: false,
        cartItemIndex: index,
        addonIndex: 0,
      );
    }
  }

  void _callRemoveCart() {
    //ProcessDialog.showLoadingDialog(context);
    /*pranaamAppDataStateManagement.callDeleteCart(
      cartData: cartData,
      removeCartItemsRequestModel: RemoveCartItemsRequestModel(
        userId: pranaamAppDataStateManagement.cartDataResponse?.userId ?? '',
      ).toJson(),
    );*/
    context
        .read<PranaamAppDataStateManagement>()
        .callDeleteCart(
          appSessionState: appSessionState,
        )
        .then((value) => closeProgressAndValidateDeleteItem(value, context));
    eventRemoveCartOnPopupRemoveButton();
  }

  void closeProgressAndValidateDeleteItem(
    ADResponseState state,
    BuildContext context,
  ) {
    ProcessDialog.closeLoadingDialog(context);
    if (state.viewStatus == Status.complete) {
      adLog('message');
      // save pranaam cart name in preferences
      context.read<AppSessionState>().saveCart(CartType.noDataInCart.name);
    } else {
      SnackBarUtil.showSnackBar(
        context,
        state.message ?? 'something_went_wrong_try_again'.localize(context),
      );
    }
  }

  AddCartAddOnRequestModel getAddCartAddOnRequest(
    PackageAddOn packageAddOn,
    int quantity,
  ) {
    return AddCartAddOnRequestModel(
      packageId: context
              .read<PranaamAppDataStateManagement>()
              .cartDataResponse
              ?.packageDetail
              .packageId ??
          0,
      serviceName: packageAddOn.addOnServiceName,
      serviceDescription: packageAddOn.addOnServiceDescription,
      price: packageAddOn.price,
      quantity: quantity,
      addOnServiceId: packageAddOn.addOnServiceId,
    );
  }

  bool isCartItemPresentInCart(PackageAddOn packageAddOn) {
    final CartResponse? cartResponse = getCartResponse();
    if (cartResponse == null) {
      return false;
    } else {
      final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
      final int size = packageAddOnList.length;
      for (int index = 0; index < size; index++) {
        if (packageAddOnList[index].addOnServiceId ==
                packageAddOn.addOnServiceId &&
            packageAddOnList[index].qty > 0) {
          return true;
        }
      }
    }
    return false;
  }

  int getAddonQuantity(PackageAddOn packageAddOn) {
    final CartResponse? cartResponse = getCartResponse();
    if (cartResponse == null) {
      return 0;
    } else {
      final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
      final int size = packageAddOnList.length;
      for (int index = 0; index < size; index++) {
        if (packageAddOnList[index].addOnServiceId ==
                packageAddOn.addOnServiceId &&
            packageAddOnList[index].qty > 0) {
          return packageAddOnList[index].qty;
        }
      }
    }
    return 0;
  }

  PackageAddOn getSelectedPackageAddOn(
    List<PackageAddOn> packageAddOnList,
    PackageAddOn availablePackageAddOn,
  ) {
    if (isCartItemPresentInCart(availablePackageAddOn)) {
      for (final PackageAddOn packageAddOn in packageAddOnList) {
        if (packageAddOn.addOnServiceId ==
                availablePackageAddOn.addOnServiceId &&
            packageAddOn.qty > 0) {
          return packageAddOn;
        }
      }
    } else {
      return availablePackageAddOn;
    }
    return const PackageAddOn();
  }

  void clickOnCrossButton(BuildContext context) {
    pranaamAppDataStateManagement.selectedPackageValue(value: false);
    Navigator.of(context).pop();
  }

  void scrollToDown(GlobalKey<ShakeWidgetState>? shakeKeyReview) {
    if (widget.scrollController?.position.pixels ==
        widget.scrollController?.position.maxScrollExtent) {
      shakeKeyReview?.currentState?.shake();
    } else {
      widget.scrollController?.animateTo(
        widget.scrollController?.position.maxScrollExtent ?? 0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void eventBeginCheckoutContinueButton(BuildContext context) {
    // GaEvent.getInstance().continueButtonBeginCheckEvent(
    //   context.read<PranaamAppDataStateManagement>(),
    // );
    // PranaamClickEvents.begin_checkout
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
    if (isStandAloneService(
      pranaamAppDataStateManagement.cartDataResponse?.pranaamBookingType ?? '',
    )) {
      StandAloneGaAnalytics().addToCartEvent(
        context,
        ClickEvents.begin_checkout,
      );
    } else {
      PranaamBookingGaAnalytics().ecommerceEventCheckout(
        ClickEvents.begin_checkout,
        context.read<PranaamAppDataStateManagement>(),
      );
    }
  }

  void onPressed(BuildContext context) {
    eventBeginCheckoutContinueButton(context);
    if (!DeBounce.isRedundantClick()) {
      if (ProfileSingleton.profileSingleton.isLoggedIn) {
        navigateToNextScreen(context);
      } else {
        // adShowBottomSheet(
        //   context: context,
        //   childWidget: SignInScreen(
        //     signInStatusModel: SignInStatusModel(
        //       isLoginStatusTap: (value) =>
        //           navigateToNextScreen(context, value: value),
        //       isNotFromSplash: true,
        //       currentRouteName: cart,
        //     ),
        //   ),
        //   headerTitle: '',
        //   isHeaderRequired: false,
        // );
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          signInScreen,
          argumentObject: SignInStatusModel(
            isLoginStatusTap: (value) =>
                value ? navigateWithLogin(context) : null,
            isNotFromSplash: true,
            //popUpRequired: true,
            currentRouteName: genericCartScreen,
          ),
        );
      }
    }
  }

  void navigateToNextScreen(BuildContext context) {
    ProfileSingleton.profileSingleton
        .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData)
        .then((userData) {
      adLog('userprofile getCart value : ${userData.userId}');
      getCartRequest(userData.userId, context).then(
        (value) {
          final GetCartResponseModel response = value.data;
          isUpgradeBooking(
            pranaamAppDataStateManagement
                    .cartDataResponse?.pranaamBookingType ??
                '',
          )
              ? navigateToScreenUsingNamedRouteWithArguments(
                  context,
                  genericPaymentScreen,
                  argumentObject: PaymentModule.pranaam,
                )
              : navigateToScreenUsingNamedRoute(
                  context,
                  response.cartResponse.pranaamBookingType ==
                          'StandalonePorterBooking'
                      ? standAloneReview
                      : pranaamTravellerDetailScreen,
                );
        },
      );
    });
  }

  void navigateWithLogin(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 5),
      () => Navigator.of(context, rootNavigator: true)
          .pushNamed(
            pranaamAppDataStateManagement
                        .cartDataResponse?.pranaamBookingType ==
                    'StandalonePorterBooking'
                ? standAloneReview
                : pranaamTravellerDetailScreen,
          )
          .then(
            (value) => setState(() {
              adLog('update');
            }),
          ),
      //     navigateToScreenUsingNamedRoute(
      //   context,
      //   pranaamTravellerDetailScreen,
      // ),
    );
  }

  Future<void> callCartPackageOnBasisOfCartExists(
    BuildContext context, {
    required Function(BuildContext) dutyFreeYesCallBack,
    required Function(BuildContext) pranaamYesCallBack,
    required ADTapCallback addToCartFunction,
  }) async {
    final activeCartResponseModel = context
        .read<AppSessionState>()
        .activeCartResponseState.data as GetActiveCartResponseModel?;
    final bool isCartExists = activeCartResponseModel?.businessSubType ==
                                  'dutyFree' ||
                              activeCartResponseModel?.businessSubType ==
                                  'Dutyfree';
    final bool isPranaamCartExists = activeCartResponseModel?.businessSubType ==
                                  'Pranaam' ||
                              activeCartResponseModel?.businessSubType ==
                                  'pranaam';
    if (isCartExists) {
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
              yesCallBack: () async => dutyFreeYesCallBack(dialogContext),
              noCallBack: () => navigatorPopScreen(dialogContext),
            );
          },
        ),
      );
    } else {
      if (isPranaamCartExists) {
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
                  pranaamYesCallBack(dialogContext),
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
        addToCartFunction();
      }
    }
  }

  Future<void> clearDutyFreeCartAndAddPackage({
    required BuildContext context,
    required BuildContext dialogContext,
    required ADTapCallback addToCartFunction,
  }) async {
    navigatorPopScreen(dialogContext);
    // ProcessDialog.showLoadingDialog(dialogContext);
    final ADResponseState responseState =
        await context.read<AppSessionState>().clearDutyFreeCartApi(
              context: context,
            );
    if (responseState.viewStatus == Status.complete) {
      context.read<AppSessionState>().clearPranaamCartLocally();
      addToCartFunction();
    } else {
      /// Error Case
      // ProcessDialog.closeLoadingDialog(dialogContext);
      SnackBarUtil.showSnackBar(
        context,
        responseState.message ?? 'Something went wrong',
      );
    }
  }

  Future<void> clearPranaamCartAndAddPackage({
    required BuildContext context,
    required BuildContext dialogContext,
    required ADTapCallback addToCartFunction,
    required ADTapCallback errorFunction,
  }) async {
    navigatorPopScreen(dialogContext);
    // ProcessDialog.showLoadingDialog(context);
    // PranaamClickEvents.popup_display
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
    PranaamBookingGaAnalytics()
        .popupDisplayGaAnalytics(context.read<PranaamAppDataStateManagement>());
    // context
    //     .read<PranaamAppDataStateManagement>()
    //     .updateBookPackageClick(value: true);
    final ADResponseState adResponseState = await CartRepository().deleteCart();
    if (adResponseState.viewStatus == Status.complete) {
      context.read<AppSessionState>().clearPranaamCartLocally();
      addToCartFunction();
    } else {
      /// Error Case
      errorFunction();
      // context
      //     .read<PranaamAppDataStateManagement>()
      //     .updateBookPackageClick(value: false);
      ProcessDialog.closeLoadingDialog(context);
      SnackBarUtil.showSnackBar(
        context,
        adResponseState.message ?? 'Something went wrong',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CartScreenWidgetView(this);
  }
}
