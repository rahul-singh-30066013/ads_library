import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/address_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_gst_in_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/city_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/country_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/state_prov_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/response/create_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as imp;
import 'package:adani_airport_mobile/modules/pranaam_service/repository/booking_payment_cancellation/booking_payment_cancellation_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core_masters;
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/generic_billing_details_view.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/profile/user_profile.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandAloneReviewDetailStateManagement extends BaseViewModel {
  // StandAloneReviewDetailStateManagement(this.standAloneStateManagement);
  // StandAloneStateManagement standAloneStateManagement;
  // void update(StandAloneStateManagement _standAloneStateManagement){
  //   standAloneStateManagement = _standAloneStateManagement;
  //   adLog('newStandAloneStateManagement $_standAloneStateManagement');
  // }

  ScrollController scrollController = ScrollController();
  ControllersAndFocusV2 salutationController =
      ControllersAndFocusV2(debugLabel: 'salutation');
  ControllersAndFocusV2 firstNameController =
      ControllersAndFocusV2(debugLabel: 'firstName');
  ControllersAndFocusV2 lastNameController =
      ControllersAndFocusV2(debugLabel: 'lastName');
  ControllersAndFocusV2 emailController =
      ControllersAndFocusV2(debugLabel: 'email');
  ControllersAndFocusV2 countryCodeController =
      ControllersAndFocusV2(text: '+91', debugLabel: 'countryCode');
  ControllersAndFocusV2 mobileNumberController =
      ControllersAndFocusV2(debugLabel: 'mobileNumber');
  ControllersAndFocusV2 commentController =
      ControllersAndFocusV2(debugLabel: 'comment');
  ControllersAndFocusV2 pincodeController =
      ControllersAndFocusV2(debugLabel: 'pincode');
  ControllersAndFocusV2 addressController =
      ControllersAndFocusV2(debugLabel: 'address');
  ControllersAndFocusV2 cityController =
      ControllersAndFocusV2(debugLabel: 'city');
  ControllersAndFocusV2 stateController =
      ControllersAndFocusV2(debugLabel: 'state');
  ControllersAndFocusV2 countryController =
      ControllersAndFocusV2(debugLabel: 'country');
  ControllersAndFocusV2 gstNumber =
      ControllersAndFocusV2(debugLabel: 'gstNumber');
  ControllersAndFocusV2 companyName =
      ControllersAndFocusV2(debugLabel: 'companyName');
  SiteCoreStateManagement? siteCoreStateManagement;
  final BookingPaymentCancellationRepository _travellerDetailsRepository =
      BookingPaymentCancellationRepository();

  ValueNotifier<String> flag = ValueNotifier(
    _indiaFlag,
  );
  site_core_masters.State selectedState = const site_core_masters.State();
  site_core_masters.Country selectedCountry = const site_core_masters.Country();
  city_list.Result selectedCity = const city_list.Result();

  ValueNotifier<String> countryErrorMsg = ValueNotifier('');

  ValueNotifier<String> cityErrorMsg = ValueNotifier('');

  ValueNotifier<String> stateErrorMsg = ValueNotifier('');

  ValueNotifier<bool> buttonLoading = ValueNotifier(false);

  ValueNotifier<bool> useGSTNumber = ValueNotifier(false);

  // FocusNode salutationNode = FocusNode();
  // FocusNode firstNameNode = FocusNode();
  // FocusNode lastNameNode = FocusNode();
  // FocusNode emailNode = FocusNode();
  // FocusNode countryNode = FocusNode();
  // FocusNode mobileNode = FocusNode();
  // FocusNode commentNode = FocusNode();
  int bookingID = 0;

  bool validateBillingDropDowns() {
    if (countryController.controller.text.isEmpty) {
      countryErrorMsg.value = 'Please select country';
    } else {
      if (stateController.controller.text.isEmpty) {
        stateErrorMsg.value = 'Please select state';
      } else if (cityController.controller.text.isEmpty) {
        cityErrorMsg.value = 'Please select city';
      }
    }

    return countryController.controller.text.isNotEmpty &&
        stateController.controller.text.isNotEmpty &&
        cityController.controller.text.isNotEmpty;
  }

  GlobalKey<ShakeWidgetState>? shakeKeyReview = GlobalKey<ShakeWidgetState>();
  final formGlobalKey = GlobalKey<FormState>();

  List<imp.ContentList> impInfoState = [];

  void setInitials(BuildContext context) {
    final UserProfile userProfile =
        ProfileSingleton.profileSingleton.userProfile ?? UserProfile();
    final personInfo = context.read<AppSessionState>().profileModel.personInfo;
    countryCodeController.controller.text =
        userProfile.countryCodeData.callingCode ?? '+91';
    mobileNumberController.controller.text =
        userProfile.isLoggedIn ? userProfile.userId : '';
    emailController.controller.text =
        '${(personInfo?.emails?.isNotEmpty ?? false) ? personInfo?.emails?.first.emailAddress : ''}';
    firstNameController.controller.text =
        '${(personInfo?.firstName?.isNotEmpty ?? false) ? personInfo?.firstName : ''}';
    lastNameController.controller.text =
        '${(personInfo?.lastName?.isNotEmpty ?? false) ? personInfo?.lastName : ''}';
    salutationController.controller.text =
        '${(personInfo?.title?.isNotEmpty ?? false) ? personInfo?.title : ''}';
    flag.value = context.read<SiteCoreStateManagement>().getFlag();
  }

  void scrollToDown() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      shakeKeyReview?.currentState?.shake();
    } else {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void requireFocusOnError(context) {
    if (Validations.validateName(
          firstNameController.controller.text,
          context,
          firstNameController.controller,
        ) !=
        null) {
      firstNameController.scrollPage(context);
      firstNameController.focusNode.requestFocus();
      return;
    }
    if (Validations.validateName(
          lastNameController.controller.text,
          context,
          lastNameController.controller,
        ) !=
        null) {
      lastNameController.scrollPage(context);
      lastNameController.focusNode.requestFocus();
      return;
    }
    if (Validations.validateEmail(
          emailController.controller.text,
          context,
        ) !=
        null) {
      emailController.scrollPage(context);
      emailController.focusNode.requestFocus();
      return;
    }
    if (Validations.validateMobile(
          mobileNumberController.controller.text,
          context,
        ) !=
        null) {
      mobileNumberController.scrollPage(context);
      mobileNumberController.focusNode.requestFocus();
      return;
    }
    if (Validations.validateAddressLine(
          addressController.controller.text,
          context,
        ) !=
        null) {
      addressController.scrollPage(context);
      addressController.focusNode.requestFocus();
      return;
    }

    if (countryController.text.isEmpty) {
      countryController.scrollPage(context);
      primaryFocus?.unfocus();
      return;
    }
    if (stateController.text.isEmpty) {
      stateController.scrollPage(context);
      primaryFocus?.unfocus();
      return;
    }
    if (cityController.text.isEmpty) {
      cityController.scrollPage(context);
      primaryFocus?.unfocus();
      return;
    }
    if (Validations.validatePinCode(pincodeController.text, context) != null) {
      pincodeController.scrollPage(context);
      pincodeController.focusNode.requestFocus();
      return;
    }
  }

  void onContinueTap(context) {
    final isFormValid = formGlobalKey.currentState?.validate() ?? false;
    final isDropDrownValid = validateBillingDropDowns();
    requireFocusOnError(context);
    if (isFormValid && isDropDrownValid) {
      primaryFocus?.unfocus();
      createBooking(context).then(
        (val) {
          if (val.viewStatus == Status.complete && val.data != null) {
            StandAloneGaAnalytics().removeCartEvent(
              context,
              StandAloneGaName(context).addGuestDetailName(),
            );
            buttonLoading.value = false;
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              genericPaymentScreen,
              argumentObject: PaymentModule.standAlone,
            );
          }
        },
      );
    }
  }

  Future<ADResponseState> createBooking(BuildContext context) async {
    buttonLoading.value = true;
    final ADResponseState responseState = await _travellerDetailsRepository
        .createBooking(createBookingRequest(context).toJson());
    if (responseState.viewStatus == Status.complete &&
        responseState.data != null) {
      final CreateBookingResponseModel createBookingResponseModel =
          responseState.data;
      adLog('createBooking ${createBookingResponseModel.bookingId}');
      bookingID = createBookingResponseModel.bookingId;
    } else if (responseState.viewStatus == Status.complete) {
      SnackBarUtil.showSnackBar(context, responseState.message ?? '');
    }
    return responseState;
  }

  CreateBookingRequestModel createBookingRequest(BuildContext context) {
    final CreateBookingRequestModel createBookingRequestModel =
        CreateBookingRequestModel(
      //TODO hardcode as of now
      bookedOn: DateTime.now().toIso8601String(),
      bookingStatusId: '0',
      travellers: getTravellers(context),
      isGSTEnable: useGSTNumber.value,
      billingInfo: BillingInfo(
        billingGstInModel: BillingGstInModel(
          gstName: companyName.text,
          gstNumber: gstNumber.text,
          mobileNumber: mobileNumberController.controller.text,
          emailId: emailController.controller.text,
          address: addressController.controller.text,
          pinCode: int.tryParse(pincodeController.controller.text) ?? 0,
          countryDetails: CountryModel(
            countryCode: int.tryParse(selectedCountry.id) ?? 0,
            countryName: selectedCountry.countryName.isEmpty
                ? ''
                : selectedCountry.countryName,
          ),
          cityDetails: CityModel(
            cityId: selectedCity.id.isEmpty ? 0 : int.parse(selectedCity.id),
            cityName: cityController.controller.text.isEmpty
                ? ''
                : cityController.controller.text,
          ),
          stateDetails: StateProvModel(
            stateCode:
                selectedState.id.isEmpty ? 0 : int.parse(selectedState.id),
            stateName: stateController.controller.text.isEmpty
                ? ''
                : stateController.controller.text,
          ),
        ),
        countryDialCode: countryCodeController.controller.text.isEmpty
            ? ''
            : countryCodeController.controller.text,
        emailId: emailController.controller.text,
        mobileNumber: mobileNumberController.controller.text,
        personName: PersonNameModel(
          salutationText: salutationController.controller.text.isEmpty
              ? ''
              : salutationController.controller.text,
          salutationId: int.parse(
            siteCoreStateManagement?.salutation
                    .firstWhere(
                      (salutation) =>
                          salutation.label ==
                          salutationController.controller.text,
                      orElse: () => const site_core_masters.Salutation(id: '1'),
                    )
                    .id ??
                '',
          ),
          lastName: lastNameController.controller.text.isEmpty
              ? ''
              : lastNameController.controller.text,
          firstName: firstNameController.controller.text.isEmpty
              ? ''
              : firstNameController.controller.text,
        ),
        addressModel: AddressModel(
          addressLine_1: addressController.controller.text.isEmpty
              ? ''
              : addressController.controller.text,
          addressLine_2: '',
          pinCode: pincodeController.controller.text.isEmpty
              ? ''
              : pincodeController.controller.text,
          countryDetails: CountryModel(
            countryCode: int.tryParse(selectedCountry.id) ?? 0,
            countryName: selectedCountry.countryName.isEmpty
                ? ''
                : selectedCountry.countryName,
          ),
          cityDetails: CityModel(
            cityId: selectedCity.id.isEmpty ? 0 : int.parse(selectedCity.id),
            cityName: cityController.controller.text.isEmpty
                ? ''
                : cityController.controller.text,
          ),
          stateDetails: StateProvModel(
            stateCode:
                selectedState.id.isEmpty ? 0 : int.parse(selectedState.id),
            stateName: stateController.controller.text.isEmpty
                ? ''
                : stateController.controller.text,
          ),
        ),
      ),
    );
    return createBookingRequestModel;
  }

  List<TravellersModel> getTravellers(BuildContext context) {
    siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    final List<TravellersModel> travellersList = [
      TravellersModel(
        personName: PersonNameModel(
          salutationText: salutationController.controller.text.isEmpty
              ? ''
              : salutationController.controller.text,
          salutationId: int.parse(
            siteCoreStateManagement?.salutation
                    .firstWhere(
                      (salutation) =>
                          salutation.label ==
                          salutationController.controller.text,
                      orElse: () => const site_core_masters.Salutation(id: '1'),
                    )
                    .id ??
                '',
          ),
          lastName: lastNameController.controller.text.isEmpty
              ? ''
              : lastNameController.controller.text,
          firstName: firstNameController.controller.text.isEmpty
              ? ''
              : firstNameController.controller.text,
        ),
        countryDetails: CountryModel(
          countryName: '',
          countryCode: countryCodeController.controller.text.isEmpty
              ? 0
              : int.parse(countryCodeController.controller.text),
        ),
        email: emailController.controller.text,        
        spocPhone: mobileNumberController.controller.text,
        passengerTypeId: int.parse(
          siteCoreStateManagement?.passengerType
                  .firstWhere(
                    (passengerType) => passengerType.label == 'Adult',
                    orElse: () =>
                        const site_core_masters.BookingStatus(id: '0'),
                  )
                  .id ??
              '',
        ),
      ),
    ];
    //

    return travellersList;
  }

  void resetControllers() {
    firstNameController.controller.clear();
    lastNameController.controller.clear();
    emailController.controller.clear();
    countryCodeController.controller.text = '+91';
    mobileNumberController.controller.clear();
    commentController.controller.clear();
    addressController.controller.clear();
    countryController.controller.clear();
    stateController.controller.clear();
    cityController.controller.clear();
    pincodeController.controller.clear();
    gstNumber.controller.clear();
    companyName.controller.clear();
    selectedState = const site_core_masters.State();
    selectedCountry = const site_core_masters.Country();
    selectedCity = const city_list.Result();
    flag.value = _indiaFlag;
  }

  String getImportantInfoItem(BuildContext context) {
    switch (context
        .read<PranaamAppDataStateManagement>()
        .cartDataResponse
        ?.pranaamBookingType
        .toLowerCase()) {
      case 'standaloneporterbooking':
        return SiteCoreApiUrls.siteCorePorterImportantInfo;
      case 'standalonewheelchairbooking':
        return SiteCoreApiUrls.siteCoreWheelChairImportantInfo;
      default:
        return SiteCoreApiUrls.siteCorePorterImportantInfo;
    }
  }

  Future<void> getImportantInformation({
    required String infoType,
    required BuildContext context,
  }) async {
    updateState(ViewState.loading);
    try {
      final ADResponseState responseState =
          await SiteCoreStateManagement().fetchImportantInformationFromSiteCore(
        infoType: infoType,
        item: getImportantInfoItem(context),
      );
      impInfoState = (responseState.data as imp.Element).fields.contentList;
      if (responseState.viewStatus == Status.complete) {
        updateState(ViewState.success);
      } else {
        updateState(ViewState.error);
      }
    } on Exception catch (e) {
      adLog('e$e');
      updateState(ViewState.error);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    salutationController.controller.dispose();
    firstNameController.controller.dispose();
    lastNameController.controller.dispose();
    emailController.controller.dispose();
    countryCodeController.controller.dispose();
    mobileNumberController.controller.dispose();
    commentController.controller.dispose();
    super.dispose();
  }
}

const String _indiaFlag =
    'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg';
