/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/cab_booking_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/duty_free_order_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_itinerary_price_change.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/jus_pay/payment_sdk_manager.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_potential_request_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/repositories/loyalty_repository.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/available_app_parent.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/available_apps.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/payment_info/payload_information.dart';
import 'package:adani_airport_mobile/modules/payment/models/price_detail_model.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/pay_now_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/payment_confirm_request/payment_confirm_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/payment_confirm_response/placement_response.dart';
import 'package:adani_airport_mobile/modules/payment/screens/please_wait_payment_popup.dart';
import 'package:adani_airport_mobile/modules/payment/state_management/bank_list_view_model.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/payment/utils/masked_text_controller_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_fields.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_type_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

// View-Model for Payment screen to populate payment Method Listing Expandable-Collapsable view, and other api calls.
class PaymentMethodState extends ADBaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  String tripId = '0';

  /// Initiate loading state for api hit
  ADResponseState paymentResponseState = ADResponseState.loading();
  ADResponseState itenaryResponseState = ADResponseState.loading();
  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  FlightItineraryPriceChange? flightItineraryPriceChange;
  FlightViewTripResponseModel? flightbookingDetail;
  CabCartDetailResponseModel? cabCartDetailResponseModel;
  PayNowRequest? payNowRequest;
  PaymentConfirmRequest? paymentConfirmRequest;

  List<PaymentTypeList> paymentTypeList = [];
  PaymentFields? paymentFields;
  BankListViewModel? bankListViewModel = BankListViewModel();

  List<Option> listOfPrimeBank = [];
  List<Option> listOfDisplayWallet = [];

  List<Option> listOfAllBank = [];
  double totalFare = 0;
  String defaultCardIcon = '';
  ValueNotifier<double> rewardPoint = ValueNotifier(0);

  // Currently expended payment mode.
  PaymentMode? expendedPaymentMode;

//Card type
  String cardType = 'defaultCard';

  // Currently selected payment mode.
  Option? selectedOption;
  bool isSelectedPayment = false;
  int popularListLength = 4;
  bool isRedeemPointsChecked = true;

  PaymentModule? paymentModule;

  bool? isExpandable;

  bool isPaymentConfirmed = false;
  bool isTransactionFailed = false;

  List<PriceDetailModel> priceDetailsList = List.empty(growable: true);
  String upiServerMessage = '';
  bool upiError = false;
  double totalAmount = 0;
  double totalBaseFare = 0;
  double totalAmountToDisplayAtBottom = 0;
  num travelInsuranceAmount = 0;
  num zeroCancellationAmount = 0;
  int checkLoyalityPoint = 0;
  int unCheckLoyalityPoint = 0;
  List<WidgetItem> filteredOfferList = List.empty();
  PayloadInformation statePayloadInfo = PayloadInformation();

  //This is to check loader need to pop or not
  var isLoaderVisible = false;

  PaymentMethodState();

  double get excludedAmount =>
      travelInsuranceAmount.toDouble() + zeroCancellationAmount.toDouble();

  PaymentMethodState.fromModule(this.paymentModule) {
    switch (paymentModule) {
      case PaymentModule.pranaam:
        break;
      case PaymentModule.standAlone:
        break;
      default:
        break;
    }
  }

  final LoyaltyRepository _loyaltyRepository = LoyaltyRepository();

  // Payment mode selected by default

  // TextField controller for the 16-digit card number.
  final MaskedTextControllerUtils cardNumberController =
      MaskedTextControllerUtils(mask: '0000 0000 0000 0000 000');

  // TextField controller for the expiration date of card.
  final MaskedTextControllerUtils cardExpiryMonthController =
      MaskedTextControllerUtils(mask: '00/00');

  // TextField controller for the cvv code of card.
  final TextEditingController cardCvvController = TextEditingController();

  // TextField controller for the name of owner of card.
  final TextEditingController cardOwnerNameController = TextEditingController();

  // TextField controller for the UPI.
  final TextEditingController upiController = TextEditingController();

  bool buttonDisable = true;
  Map<String, String> cardCVV = {};
  Map<String, String> cardIcon = {};
  Map<String, String> cardRegex = {};
  List<String> upiOptionsList = [];
  List<String> ccOptionsList = [];
  bool cardNumberValidate = false;
  bool cardExpValidate = false;
  bool cardCvvValidate = false;
  bool cardNameValidate = false;

  // List of supported payment methods and their respective options
  // List<PaymentOption> paymentModes = [];

  // Populate payment methods from data source (JSON).
  Future<void> populate() async {
    // paymentModes = await _paymentMethodRepository.getPaymentMethods();
    // delfaultPaymentOption = paymentTypeList.first.options.first;
    notifyListeners();
  }

  void updatePoint() {
    notifyListeners();
  }

  // Update payment option upon selection
  void updatePaymentOptionExpended(PaymentMode? paymentMode) {
    expendedPaymentMode =
        expendedPaymentMode == paymentMode ? null : paymentMode;

    /// Clear all the previous data when user tap on another tile
    selectedOption = null;
    bankListViewModel?.setSelectedBankTo(null);
    removeCardInfo();
    upiController.text = '';
    setExpandableValue(value: true);

    /// Then notify
    notifyListeners();
  }

  void setExpandableValue({required bool value}) {
    isExpandable = value;
    notifyListeners();
  }

  // Update payment option upon selection
  void updatePaymentOption(Option selectedValue) {
    if (selectedValue.code.toString().toLowerCase() == 'others') {
      final Option upiOptions = Option(
        paymentOptionType: PaymentOptionType.addNew,
        mode: PaymentMode.upi,
      );

      for (int index = 0; index < paymentTypeList.length; index++) {
        final PaymentTypeList element = paymentTypeList[index];

        if (element.type == 'UPI' ||
            element.type == 'Android UPI' ||
            element.type == 'IOS UPI') {
          if (element.options?.last.paymentOptionType ==
              PaymentOptionType.addNew) {
            final value = element.options?.remove(element.options?.last);
            adLog(value.toString());
          }
          element.options?.add(upiOptions);
        }
      }
    } else {
      for (int index = 0; index < paymentTypeList.length; index++) {
        final PaymentTypeList element = paymentTypeList[index];
        if (element.type == 'UPI' ||
            element.type == 'Android UPI' ||
            element.type == 'IOS UPI') {
          // element.options?.clear();
          // element.options?.addAll(listUpiOptions);
          if (element.options?.last.paymentOptionType ==
              PaymentOptionType.addNew) {
            final value = element.options?.remove(element.options?.last);
            adLog(value.toString());
          }
        }
      }
    }

    selectedOption = selectedValue;
    paymentSelected();
    if (selectedOption?.mode == PaymentMode.wallet ||
        selectedOption?.mode == PaymentMode.upi) {
      bankListViewModel?.setSelectedBankTo(null);
    }

    isSelectedPayment = true;
    cardNumberController.text = '';
    cardExpiryMonthController.text = '';
    cardCvvController.text = '';
    cardOwnerNameController.text = '';
    upiController.text = '';
    // if (selectedOption?.mode != PaymentMode.upi) {
    //   upiController.text = '';
    // }

    cardType = 'defaultCard';
    notifyListeners();
  }

  void removeCardInfo() {
    cardNumberController.text = '';
    cardType = 'defaultCard';
    cardExpiryMonthController.text = '';
    cardCvvController.text = '';
    cardOwnerNameController.text = '';
    notifyListeners();
  }

  void cardOptionUpdate(Option? selectedValue) {
    if (selectedValue?.mode == PaymentMode.creditordebitcard) {
      bankListViewModel?.setSelectedBankTo(null);
      upiController.text = '';
      if (cardNumberValidate &&
          cardExpValidate &&
          cardCvvValidate &&
          cardNameValidate) {
        selectedOption = selectedValue;
        paymentSelected();
      } else {
        selectedOption = null;
        paymentSelected();
      }
    } else if (selectedValue?.mode == PaymentMode.upi) {
      bankListViewModel?.setSelectedBankTo(null);
      if (upiController.text.isNotEmpty) {
        if (RegExp(upiValidate).hasMatch(
          upiController.text.toString().replaceAll(RegExp(r'\s+\b|\b\s'), ''),
        )) {
          selectedOption = selectedValue;
          paymentSelected();
        } else {
          selectedOption = null;
          paymentSelected();
        }
      } else {
        if (selectedOption?.packageName != null) {
          selectedOption = selectedValue;
          paymentSelected();
        } else {
          selectedOption = null;
          paymentSelected();
        }
      }
    }

    notifyListeners();
  }

  ///It will provide details related itinerary
  Future<ADResponseState> viewItineraryDetails(
    String itineraryId,
  ) async {
    if (paymentResponseState.viewStatus != Status.loading) {
      paymentResponseState = ADResponseState.loading();
      notifyListeners();
    }
    return _flightBookingRepository.viewItinerary(
      itineraryId: itineraryId,
      isCCFRequired: true,
    );
  }

  ///It will update ADResponseState status related view itinerary
  void updateItineraryDetailsState(ADResponseState response) {
    // paymentResponseState = response;
    flightViewItineraryResponseModel = response.data;
    notifyListeners();
  }

  double getAmountPayable(List<PricedItinerary> _pricedList) {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalFare?.amount ?? 0).toDouble();
    }
    return total;
  }

  double getTotalAmount() {
    final double amount = paymentModule == PaymentModule.cabBooking
        ? totalAmountToDisplayAtBottom
        : (flightViewItineraryResponseModel?.pricingSummary?.totalFare ?? 0)
            .toDouble();
    return isRedeemPointsChecked ? calculateBankAmountToPay(amount) : amount;
  }

  double calculateBankAmountToPay(double amount) {
    return rewardPoint.value >= amount
        ? paymentModule == PaymentModule.flight
            ? excludedAmount
            : 0
        : paymentModule == PaymentModule.flight
            ? (amount - rewardPoint.value) > excludedAmount
                ? (amount - rewardPoint.value)
                : excludedAmount
            : amount - rewardPoint.value;
  }

  double calculateLoyaltyAmountToPay(double amount) {
    return rewardPoint.value >= amount
        ? paymentModule == PaymentModule.flight
            ? amount - excludedAmount
            : amount
        : paymentModule == PaymentModule.flight
            ? (amount - rewardPoint.value) > excludedAmount
                ? rewardPoint.value
                : amount - excludedAmount
            : rewardPoint.value;
  }

  double getTotalBaseFare() {
    final List<PricedItinerary> _pricedList =
        flightViewItineraryResponseModel?.pricedItineraries ?? [];
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalBaseFare?.amount ?? 0).toDouble();
    }
    return total;
  }

  double getTotalTax() {
    final List<PricedItinerary> _pricedList =
        flightViewItineraryResponseModel?.pricedItineraries ?? [];
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalTax?.amount ?? 0).toDouble();
    }
    return total;
  }

  ///It will update ADResponse status of payment error
  void updatePaymentError(ADResponseState response) {
    paymentResponseState = response;
    notifyListeners();
  }

  void paymentSelected() {
    buttonDisable = selectedOption == null;
    notifyListeners();
  }

  Future<ADResponseState> checkoutApiCall(
    String requestJson,
    BuildContext context, {
    bool? isFreeReschedule,
  }) async {
    paymentResponseState = ADResponseState.loading();
    notifyListeners();
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final isForUpgrade = isUpgradeBooking(
      pranaamAppDataStateManagement.cartDataResponse?.pranaamBookingType ?? '',
    );
    final isForReschedule = isFreeReschedule ??
        isReschedule(
          pranaamAppDataStateManagement.cartDataResponse?.pranaamBookingType ??
              '',
        );
    return _flightBookingRepository.checkoutPayment(
      requestModel: requestJson,
      isForUpgrade: isForUpgrade,
      isForReschedule: isForReschedule,
    );
  }

  Future<ADResponseState> placementApiCall(
    String requestJson,
    BuildContext context,
  ) async {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final isForUpgrade = isUpgradeBooking(
      pranaamAppDataStateManagement.cartDataResponse?.pranaamBookingType ?? '',
    );
    final isForReschedule = isReschedule(
      pranaamAppDataStateManagement.cartDataResponse?.pranaamBookingType ?? '',
    );
    return _flightBookingRepository.placement(
      requestModel: requestJson,
      isForUpgrade: isForUpgrade,
      isForReschedule: isForReschedule,
    );
  }

  CommonOrderDetailBaseResponse? dutyFreeOrderDetailResponse;
  String orderId = '';

  Future<void> handlePaymentSuccess(
    BuildContext context,
    PlacementResponse placementResponse,
  ) async {
    switch (paymentModule) {
      case PaymentModule.dutyFree:
        orderId = placementResponse.orderReferenceId ?? '';
        final ADResponseState orderDetailsState =
            await _flightBookingRepository.getOrder(
          placementResponse.orderReferenceId ?? '',
        );

        ///Step 1000
        final DutyFreeState dutyFreeState = context.read<DutyFreeState>();

        final ADResponseState responseState =
            await context.read<DutyFreeState>().getCartDetails(context);
        adLog('responseState ${responseState.toString()} ', className: this);
        // TODO if error comes handle that scenario
        if (orderDetailsState.viewStatus == Status.complete) {
          dutyFreeOrderDetailResponse = orderDetailsState.data;
          dutyFreeState.dutyFreeEventState.purchase(
            this,
            placementResponse.orderReferenceId ?? '',
          );
          dutyFreeState.dutyFreeEventState.purchaseSuccess(
            this,
            context.read<AppSessionState>(),
            placementResponse.orderReferenceId ?? '',
          );
          try {
            final AppSessionState appSessionState =
                context.read<AppSessionState>();
            if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
              context.read<AppSessionState>().getUpcomingBookings();
              context
                  .read<AppSessionState>()
                  .updateValueOfBooking(updateValue: true);
            }
            Future.delayed(
              const Duration(milliseconds: 100),
              () => appSessionState.saveCart(CartType.noDataInCart.name),
            );
          } catch (e) {
            adLog(e.toString());
          }
          final PaymentStatus paymentStatus = getPaymentStatusFromOrderStatus(
            orderStatus: placementResponse.orderStatus ?? '',
          );
          final val = Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => PleaseWaitPaymentPopup(
                confirmationWidget: DutyFreeOrderConfirmationScreen(
                  item: dutyFreeOrderDetailResponse
                      as CommonOrderDetailBaseResponse,
                ),
                paymentModule: PaymentModule.dutyFree,
                isPaymentDone: true,
                paymentStatus: paymentStatus,
              ),
              fullscreenDialog: true,
            ),
            (route) => route.settings.name == tabRoute,
          );

          ///TO Avoid dart metrics issue.
          adLog(val.toString());
        }
        break;
      case PaymentModule.pranaam:
        orderId = placementResponse.orderReferenceId ?? '';
        //resetting cart
        final PranaamAppDataStateManagement pranaamAppDataStateManagement =
            context.read<PranaamAppDataStateManagement>();
        context.read<AppSessionState>().clearPranaamCartLocally();
        pranaamAppDataStateManagement.resetCartData();
        pranaamAppDataStateManagement.updateIsFromConfirmation(value: true);
        (BottomBarState.key.currentWidget as CustomTabScaffold)
                    .controller
                    ?.index ==
                0
            ? BottomTabNavKeys.homeTabItemKey.currentState?.popUntil(
                (route) =>
                    (route.settings.name == pranaamService) || route.isFirst,
              )
            : BottomTabNavKeys.businessTabItemKey.currentState?.popUntil(
                (route) =>
                    (route.settings.name == pranaamService) || route.isFirst,
              );
        final PaymentStatus paymentStatus = getPaymentStatusFromOrderStatus(
          orderStatus: placementResponse.orderStatus ?? '',
        );
        final val = Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, anim1, anim2) => PleaseWaitPaymentPopup(
              confirmationWidget: PranaamConfirmationScreen(
                createBookingModel:
                    pranaamAppDataStateManagement.pranaamCreateBooking,
                orderReferenceId: orderId,
              ),
              paymentModule: PaymentModule.pranaam,
              isPaymentDone: true,
              paymentStatus: paymentStatus,
            ),
            fullscreenDialog: true,
          ),
          (route) => route.settings.name == tabRoute,
        );

        ///TO Avoid dart metrics issue.
        adLog(val.toString());
        break;
      case PaymentModule.standAlone:
        orderId = placementResponse.orderReferenceId ?? '';

        final PranaamAppDataStateManagement pranaamAppDataStateManagement =
            context.read<PranaamAppDataStateManagement>();
        context.read<AppSessionState>().clearPranaamCartLocally();
        pranaamAppDataStateManagement.resetCartData();
        pranaamAppDataStateManagement.updateIsFromConfirmation(value: true);
        (BottomBarState.key.currentWidget as CustomTabScaffold)
                    .controller
                    ?.index ==
                0
            ? BottomTabNavKeys.homeTabItemKey.currentState?.popUntil(
                (route) =>
                    (route.settings.name == pranaamService) || route.isFirst,
              )
            : BottomTabNavKeys.businessTabItemKey.currentState?.popUntil(
                (route) =>
                    (route.settings.name == pranaamService) || route.isFirst,
              );
        pranaamAppDataStateManagement.bookingID =
            placementResponse.orderReferenceId ?? '';
        final PaymentStatus paymentStatus = getPaymentStatusFromOrderStatus(
          orderStatus: placementResponse.orderStatus ?? '',
        );
        final val = Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, anim1, anim2) => PleaseWaitPaymentPopup(
              confirmationWidget: PranaamConfirmationScreen(
                orderReferenceId: orderId,
                createBookingModel: context
                    .read<StandAloneReviewDetailStateManagement>()
                    .createBookingRequest(context),
              ),
              paymentModule: PaymentModule.pranaam,
              isPaymentDone: true,
              paymentStatus: paymentStatus,
            ),
            fullscreenDialog: true,
          ),
          (route) => route.settings.name == tabRoute,
        );

        ///TO Avoid dart metrics issue.
        adLog(val.toString());
        break;
      case PaymentModule.flight:
        // TODO: Handle this case.
        break;
      case PaymentModule.cabBooking:
        final ADResponseState orderDetailsState =
            await _flightBookingRepository.getOrder(
          placementResponse.orderReferenceId ?? '',
        );
        try {
          if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
            context.read<AppSessionState>().getUpcomingBookings();
            context
                .read<AppSessionState>()
                .updateValueOfBooking(updateValue: true);
          }
        } catch (e) {
          adLog(e.toString());
        }
        final CommonOrderDetailBaseResponse commonOrderDetailBaseResponse =
            orderDetailsState.data as CommonOrderDetailBaseResponse;
        final bookingStatus =
            commonOrderDetailBaseResponse.statusHistory?.last.status ??
                'confirmed';
        final PaymentStatus paymentStatus =
            getPaymentStatusFromOrderStatus(orderStatus: bookingStatus);
        final val = Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, anim1, anim2) => PleaseWaitPaymentPopup(
              confirmationWidget: CabBookingConfirmationScreen(
                response: orderDetailsState,
                orderReferenceId: placementResponse.orderReferenceId ?? '',
              ),
              paymentModule: PaymentModule.cabBooking,
              isPaymentDone: true,
              paymentStatus: paymentStatus,
            ),
            fullscreenDialog: true,
          ),
          (route) => route.settings.name == tabRoute,
        );

        ///TO Avoid dart metrics issue.
        adLog(val.toString());

        break;
      default:
        break;
    }
  }

  void readData(SiteCoreStateManagement read) {
    const int defaultCard = 0;

    paymentTypeList = read.paymentTypeList ?? [];
    paymentFields = read.paymentFields;
    expendedPaymentMode = paymentTypeList.first.options?[defaultCard].mode;
    defaultCardIcon = read.defaultCard;
    calculatePrimeBankAndWallet();
    createCCardUpiIcon();
    // notifyListeners();
  }

  void backToDefaultStage(SiteCoreStateManagement read) {
    const int defaultCard = 0;
    cardNumberController.text = '';
    cardType = 'defaultCard';
    cardExpiryMonthController.text = '';
    cardCvvController.text = '';
    cardOwnerNameController.text = '';
    upiController.text = '';
    paymentTypeList = read.paymentTypeList ?? [];
    paymentFields = read.paymentFields;
    expendedPaymentMode = paymentTypeList.first.options?[defaultCard].mode;
    defaultCardIcon = read.defaultCard;
    calculatePrimeBankAndWallet();
    createCCardUpiIcon();
    notifyListeners();
  }

  void resetCreditAndUpi() {
    cardNumberController.text = '';
    cardType = 'defaultCard';
    cardExpiryMonthController.text = '';
    cardCvvController.text = '';
    cardOwnerNameController.text = '';
    upiController.text = '';
    notifyListeners();
  }

  void allModeCollapsed(SiteCoreStateManagement read) {
    paymentTypeList = read.paymentTypeList ?? [];
    paymentFields = read.paymentFields;
    expendedPaymentMode = PaymentMode.none;
    defaultCardIcon = read.defaultCard;
    calculatePrimeBankAndWallet();
    createCCardUpiIcon();
    notifyListeners();
  }

  /// This method is use for creating map for CVV,Card Icon,Card regex
  void createCCardUpiIcon() {
    ccOptionsList.clear();
    upiOptionsList.clear();
    cardIcon['defaultCard'] = defaultCardIcon;
    final int length = paymentFields?.paymentTypeList?.length ?? 0;
    for (int index = 0; index < length; index++) {
      final PaymentTypeList? element = paymentFields?.paymentTypeList?[index];
      if (element?.type == 'CARD') {
        final int optionsLength = element?.options?.length ?? 0;
        for (int index2 = 0; index2 < optionsLength; index2++) {
          final Option? elementOptions = element?.options?[index2];
          cardCVV[elementOptions?.name ?? ''] = elementOptions?.cvvLength ?? '';
          cardIcon[elementOptions?.name ?? ''] =
              elementOptions?.smallIcon ?? '';
          cardRegex[elementOptions?.name ?? ''] =
              elementOptions?.regexForCardNumber ?? '';
          if (elementOptions?.isActive ?? false) {
            ccOptionsList.add(elementOptions?.smallIcon ?? '');
          }
        }
      }
    }

    final int upiLength = paymentFields?.upiImageList?.length ?? 0;
    for (int index = 0; index < upiLength; index++) {
      final Option? upiOptions = paymentFields?.upiImageList?[index];
      if (upiOptions?.isActive ?? false) {
        upiOptionsList.add(upiOptions?.smallIcon ?? '');
      }
    }
  }

  /// This method is used for separate prime bank, all bank and InActive wallet
  void calculatePrimeBankAndWallet() {
    listOfAllBank.clear();
    listOfPrimeBank.clear();
    listOfDisplayWallet.clear();

    for (int index = 0; index < paymentTypeList.length; index++) {
      final PaymentTypeList element = paymentTypeList[index];
      if (element.type == 'NETBANKING') {
        final int length = element.options?.length ?? 0;
        for (int innerIndex = 0; innerIndex < length; innerIndex++) {
          final Option? element1 = element.options?[innerIndex];
          if (element1 != null) {
            if (element1.isShowInPage == false) {
              listOfAllBank.add(element1);
            }
          }
          if (element1 != null) {
            if (element1.isShowInPage ?? false) {
              if (listOfPrimeBank.length < popularListLength) {
                listOfPrimeBank.add(element1);
              }
            }
          }
        }
      }

      /// Filter out InActive wallet
      else if (element.type == 'WALLET') {
        final int length = element.options?.length ?? 0;
        for (int innerIndex = 0; innerIndex < length; innerIndex++) {
          final Option? element1 = element.options?[innerIndex];
          if (element1 != null) {
            if (element1.isActive ?? false) {
              listOfDisplayWallet.add(element1);
            }
          }
        }
      }
    }

    /// Remove InActive wallet from main list
    for (int index = 0; index < paymentTypeList.length; index++) {
      final PaymentTypeList element = paymentTypeList[index];
      if (element.type == 'WALLET') {
        element.options?.clear();
        element.options?.addAll(listOfDisplayWallet);
      }
    }
  }

  num _getDiscount(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    return (dutyFreeState.dutyFreeCartResponse?.unitPriceResponse?.amount ??
            0) -
        (dutyFreeState.dutyFreeCartResponse?.totalAmount?.amount ?? 0);
  }

  void initPriceDetails(BuildContext context) {
    priceDetailsList.clear();
    switch (paymentModule) {
      case PaymentModule.dutyFree:
        final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
        priceDetailsList.add(
          PriceDetailModel(
            key: 'unit_price'.localize(context),
            value: FlightUtils.getAmountWithTwoDecimalPoint(
              dutyFreeState.dutyFreeCartResponse?.unitPriceResponse?.amount
                      .toDouble() ??
                  0,
            ),
            color: context.adColors.neutralInfoMsg,
          ),
        );
        if (_getDiscount(context) > 0) {
          priceDetailsList.add(
            PriceDetailModel(
              key: 'discount_price'.localize(context),
              value: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                _getDiscount(context).toDouble(),
              )}',
              color: context.adColors.greenTextColor,
            ),
          );
        }
        if ((dutyFreeState.dutyFreeCartResponse?.preOrderDiscount?.amount ??
                0) >
            0) {
          priceDetailsList.add(
            PriceDetailModel(
              key:
                  '${'pre_order_discount'.localize(context)} ${dutyFreeState.getFormattedPercent()}',
              value: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                dutyFreeState.dutyFreeCartResponse?.preOrderDiscount?.amount
                        .toDouble() ??
                    0,
              )}',
              showInfoIcon: (dutyFreeState.dutyFreeCartResponse
                          ?.preOrderDiscountBreakup.length ??
                      0) >
                  0,
              color: context.adColors.greenTextColor,
            ),
          );
        }

        if ((dutyFreeState.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0) >
            0) {
          priceDetailsList.add(
            PriceDetailModel(
              key: 'coupon_discount_'.localize(context),
              value: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                dutyFreeState.dutyFreeCartResponse?.promoCoupon?.offerValue
                        ?.toDouble() ??
                    0,
              )}',
              color: context.adColors.greenTextColor,
            ),
          );
        }
        totalAmount = dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount
                .toDouble() ??
            0;
        totalBaseFare = dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount
                .toDouble() ??
            0;
        break;
      case PaymentModule.pranaam:
        totalAmount = context
            .read<PranaamAppDataStateManagement>()
            .cartDataResponse
            ?.totalFare
            .amount as double;
        totalBaseFare = context
            .read<PranaamAppDataStateManagement>()
            .cartDataResponse
            ?.pricingInfo
            .totalBaseFare
            .amount as double;
        break;
      case PaymentModule.standAlone:
        totalAmount = context
            .read<PranaamAppDataStateManagement>()
            .cartDataResponse
            ?.totalFare
            .amount as double;
        totalBaseFare = context
            .read<PranaamAppDataStateManagement>()
            .cartDataResponse
            ?.pricingInfo
            .totalBaseFare
            .amount as double;
        break;
      default:
        break;
    }
  }

  Future<ADResponseState> potentialEarning(
    LoyaltyPotentialRequestModel model,
  ) async {
    paymentResponseState = ADResponseState.loading();
    itenaryResponseState = ADResponseState.loading();
    notifyListeners();
    return _loyaltyRepository.potentialEarning(
      model: model,
      promoCode: flightViewItineraryResponseModel?.promoCoupon?.promoCode ?? '',
    );
  }

  /// Show loader in case of user cancel the payment until confirm payment response not received
  void shouldShowLoader({bool show = false}) {
    isPaymentConfirmed = show;
    if (show) {
      resetCreditAndUpi();
    }
    notifyListeners();
  }

  double getCalculatedAmount({
    required double grossAmount,
    required double rewardPoints,
    required bool rewardCheck,
  }) {
    return rewardCheck
        ? rewardPoints > grossAmount
            ? 0
            : grossAmount - rewardPoints
        : grossAmount;
  }

  LoyaltyPotentialRequestModel createPotentialEarningModel(
    BuildContext context,
    check,
    promoCode,
  ) {
    ///TODO please check the requirements as pr respective modules
    String businessSubType = '';
    num grossAmount = 0;
    num nonLoyalityAmount = 0;
    bool isInternational = false;
    final List<SaleItem> skuList = [];
    if (paymentModule == PaymentModule.flight) {
      skuList.clear();
      final grossAmt =
          flightViewItineraryResponseModel?.pricingSummary?.totalFare ?? 0;
      final netAmt =
          (flightViewItineraryResponseModel?.pricingSummary?.totalFare ?? 0) -
              (travelInsuranceAmount + zeroCancellationAmount);
      final nonLoyalty = check
          ? rewardPoint.value >= netAmt
              ? 0
              : netAmt - rewardPoint.value
          : 0;
      businessSubType = businessTypeFlightBooking;
      grossAmount = grossAmt;
      nonLoyalityAmount = nonLoyalty;
      totalBaseFare =
          (flightViewItineraryResponseModel?.pricingSummary?.baseFare ?? 0)
              .toDouble();

      isInternational =
          flightViewItineraryResponseModel?.isInternational ?? false;

      final SaleItem skuSet = SaleItem(
        quantity: 1,
        unitPrice: grossAmount,
        productCode: 'Flight',
      );
      skuList.add(skuSet);
    } else if (paymentModule == PaymentModule.cabBooking) {
      skuList.clear();
      businessSubType = businessTypeCabBooking;
      grossAmount =
          cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount ?? 0;
      totalBaseFare =
          (cabCartDetailResponseModel?.cartDetail?.priceInfo?.basePrice ?? 0)
              .toDouble();
      nonLoyalityAmount = rewardPoint.value > totalAmount
          ? totalAmount - totalAmount
          : totalAmount - (rewardPoint.value);

      final SaleItem skuSet = SaleItem(
        quantity: 1,
        unitPrice: cabCartDetailResponseModel?.cartDetail?.priceInfo?.basePrice,
        productCode: 'CabBooking',
      );
      skuList.add(skuSet);
    } else if (paymentModule == PaymentModule.dutyFree) {
      skuList.clear();
      final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
      skuList.addAll(
        dutyFreeState.dutyFreeCartResponse?.itemDetails
                .map(
                  (e) => SaleItem(
                    quantity: e.quantity,
                    unitPrice: e.unitPrice,
                    productCode: e.skuCode,
                  ),
                )
                .toList() ??
            [],
      );
      businessSubType = businessTypeDutyFree;
      grossAmount = totalAmount;
      nonLoyalityAmount = rewardPoint.value > grossAmount
          ? grossAmount - grossAmount
          : grossAmount - (rewardPoint.value);
    } else if (paymentModule == PaymentModule.pranaam) {
      skuList.clear();
      businessSubType = businessTypePranaam;
      grossAmount = totalAmount.toInt();

      nonLoyalityAmount = rewardPoint.value > grossAmount
          ? grossAmount - grossAmount
          : grossAmount - (rewardPoint.value);
      final SaleItem skuSet = SaleItem(
        quantity: 1,
        unitPrice: grossAmount,
        productCode: 'PRANAAM',
      );
      skuList.add(skuSet);
    } else if (paymentModule == PaymentModule.standAlone) {
      skuList.clear();
      businessSubType = businessTypePranaam;
      grossAmount = totalAmount.toInt();

      nonLoyalityAmount = rewardPoint.value > grossAmount
          ? grossAmount - grossAmount
          : grossAmount - (rewardPoint.value);
      final SaleItem skuSet = SaleItem(
        quantity: 1,
        unitPrice: grossAmount,
        productCode: context
            .read<StandAloneStateManagement>()
            .currentServiceType
            .name
            .toUpperCase(),
      );
      skuList.add(skuSet);
    }
    if (nonLoyalityAmount < 0) {
      nonLoyalityAmount = 0;
    }
    if (paymentModule == PaymentModule.flight) {
      grossAmount =
          grossAmount - (travelInsuranceAmount + zeroCancellationAmount);
    }
    final LoyaltyPotentialRequestModel loyalityPotentialRequestModel =
        LoyaltyPotentialRequestModel(
      businessSubType: businessSubType,
      grossAmount: grossAmount.toInt(),
      taxableAmount: totalBaseFare.toInt(),
      promoCode: paymentModule == PaymentModule.pranaam ? '' : promoCode,
      nonLoyaltyPaymentAmount: check
          ? nonLoyalityAmount.toInt()
          : paymentModule == PaymentModule.cabBooking
              ? totalAmount
              : grossAmount.toInt(),
      saleItems: skuList,
      additionalFilters: AdditionalFilters(
        isInternational: isInternational,
      ),
    );
    return loyalityPotentialRequestModel;
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }

  void initiateSDK({required void Function(bool) fetched}) {
    PaymentSdkManager.instance.initiateHyperSDK(
      hyperSDKCallbackHandler: (methodCall) =>
          PaymentSdkManager.instance.initiateCallbackHandler(
        methodCall: methodCall,
        successfullyInitiated: (value) {
          if (value) {
            getAvailableApps(
              fetched: fetched,
            );
          }
        },
      ),
      alreadyInitaited: () {
        getAvailableApps(
          fetched: fetched,
        );
      },
    );
  }

  void getAvailableApps({required void Function(bool) fetched}) {
    try {
      PaymentSdkManager.instance.getAvailableApps(
        availableAppHandler: (methodCall) =>
            PaymentSdkManager.instance.availableAppHandler(
          methodCall: methodCall,
          availableApps: (AvailableAppParent? availableAppParent) {
            if (availableAppParent != null) {
              calculateUPI(availableAppParent.availableApps, fetched);
            }
          },
        ),
      );
    } catch (e) {
      fetched(false);
    }
  }

  void calculateUPI(
    List<AvailableApps>? availableApps,
    void Function(bool) fetched,
  ) {
    final List<Option> listUpiOptions = [];
    if ((availableApps?.length ?? 0) > 0) {
      for (int index = 0; index < paymentTypeList.length; index++) {
        final PaymentTypeList element = paymentTypeList[index];
        if (element.type == 'UPI' ||
            element.type == 'Android UPI' ||
            element.type == 'IOS UPI') {
          final int length = element.options?.length ?? 0;
          for (int innerIndex = 0; innerIndex < length; innerIndex++) {
            final Option? element1 = element.options?[innerIndex];
            for (int index = 0; index < (availableApps?.length ?? 0); index++) {
              final AvailableApps? data = availableApps?[index];
              if (element1?.packageName?.toLowerCase() ==
                      data?.packageName?.toLowerCase() &&
                  (element1?.isActive ?? false)) {
                listUpiOptions.add(element1 ?? Option());
              }
            }
          }
        }
      }
    }

    for (int index = 0; index < paymentTypeList.length; index++) {
      final PaymentTypeList element = paymentTypeList[index];
      if (element.type == 'UPI' ||
          element.type == 'Android UPI' ||
          element.type == 'IOS UPI') {
        if (element.options?.last.code?.toLowerCase() == 'others') {
          final Option? tempOther = element.options?.last;
          element.options?.clear();
          element.options?.addAll(listUpiOptions);
          element.options?.add(tempOther ?? Option());
        }
      }
    }
    setOtherUPIOption(availableApps);
    fetched(true);
  }

  void setOtherUPIOption(List<AvailableApps>? availableApps) {
    for (int index = 0; index < paymentTypeList.length; index++) {
      final PaymentTypeList element = paymentTypeList[index];
      if (element.type == 'UPI' ||
          element.type == 'Android UPI' ||
          element.type == 'IOS UPI') {
        if ((availableApps?.length ?? 0) == 0 &&
            (element.options?.length ?? 0) >= 1) {
          updatePaymentOption(element.options?.first ?? Option());
        }
      }
    }
  }

  PaymentStatus getPaymentStatusFromOrderStatus({required String orderStatus}) {
    PaymentStatus paymentStatus = PaymentStatus.confirmed;
    try {
      paymentStatus = PaymentStatus.values.byName(
        orderStatus.toLowerCase(),
      );
    } catch (e) {
      adLog(e.toString());
    }
    return paymentStatus;
  }
}

enum PaymentModule {
  dutyFree,
  pranaam,
  flight,
  cabBooking,
  standAlone,
}
