/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_add_on/add_cart_add_on_request_model/add_cart_add_on_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/address_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_gst_in_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/city_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/country_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/placard_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/state_prov_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/addons_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_porter_quantity_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/add_porter_service_bottom_buttons.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core_masters;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/profile/user_profile.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamTravellerScreen extends StatefulWidget {
  const PranaamTravellerScreen({Key? key}) : super(key: key);

  @override
  State<PranaamTravellerScreen> createState() => PranaamTravellerScreenState();
}

class PranaamTravellerScreenState extends State<PranaamTravellerScreen> {
  PranaamAppDataStateManagement? pranaamAppDataStateManagement;
  SiteCoreStateManagement? siteCoreStateManagement;
  AppSessionState? appSessionState;
  List<AdultControllers> adultControllersList = [];
  List<ChildrenControllers> childrenControllersList = [];
  List<InfantControllers> infantControllersList = [];

  site_core_masters.State selectedState = const site_core_masters.State();
  city_list.Result selectedCity = const city_list.Result();

  final formGlobalKey = GlobalKey<FormState>();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  bool isProceedTapped = false;

  num totalPorters = 0;
  bool isValidate = false;
  ValueNotifier<bool> isTermConditionValidate = ValueNotifier(true);
  ValueNotifier<bool> isCityDisabled = ValueNotifier(true);
  ValueNotifier<bool> isCityDropDown = ValueNotifier(false);
  ValueNotifier<bool> citiesLoading = ValueNotifier(false);
  ValueNotifier<bool> isPinCodeDisabled = ValueNotifier(true);
  PlacardCardControllers placardCardControllers = PlacardCardControllers.name(
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ValueNotifier(
      'https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg',
    ),
  );
  GSTControllers gstControllers = GSTControllers.name(
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
  );

  BillingControllers billingControllers = BillingControllers.name(
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
  );

  SameBillingControllers sameBillingControllers = SameBillingControllers.name(
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
    ControllersAndFocus.name(
      TextEditingController(),
      FocusNode(),
    ),
  );

  ValueNotifier<bool> isSameAdultCheckBox = ValueNotifier(true);
  ValueNotifier<bool> useGSTNumber = ValueNotifier(false);
  ValueNotifier<bool> tNCCheckBox = ValueNotifier(false);

  ValueNotifier<bool> isSameCheckBox = ValueNotifier(false);
  ValueNotifier<String> countryNotifier = ValueNotifier('');
  ValueNotifier<String> billingCountryNotifier = ValueNotifier('');
  ValueNotifier<String> travelClassNotifier = ValueNotifier('');
  ValueNotifier<String> totalBaggageErrorNotifier = ValueNotifier('');

  ValueNotifier<String> stateNotifier = ValueNotifier('');
  ValueNotifier<String> cityNotifier = ValueNotifier('');

  ScrollController myController = ScrollController();

  final key = GlobalKey();
  final travelClassKey = GlobalKey();
  final totalBaggaeClassKey = GlobalKey();
  final countryKey = GlobalKey();
  final stateKey = GlobalKey();
  final cityKey = GlobalKey();
  bool isIndia = false;
  double alignment = 0.5;

  int? noOfBagsAllowed = 0;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    appSessionState = context.read<AppSessionState>();
    siteCoreStateManagement
      ?..filteredStatesList = []
      ..statesListByCountry = []
      ..citiesListDataByState = []
      ..filteredCitiesList = [];
    resetData();

    final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
        0;
    final int freeAllowedPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
        0;
    // final int baggageCount = maxAllowedBaggagePerPorter *
    //     (getTotalPassengersByType(
    //           pranaamAppDataStateManagement?.cartDataResponse,
    //           adultPassengerCode,
    //         ) +
    //         getTotalPassengersByType(
    //           pranaamAppDataStateManagement?.cartDataResponse,
    //           childPassengerCode,
    //         ));

    final List<PackageAddOn> packageAddOnList =
        pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn ?? [];
    if (packageAddOnList.isNotEmpty) {
      final int portersQuantity = pranaamAppDataStateManagement
              ?.cartDataResponse?.packageAddOn.first.qty ??
          0;
      noOfBagsAllowed =
          (portersQuantity + freeAllowedPorter) * maxAllowedBaggagePerPorter;
      // +
      // baggageCount;
    } else {
      noOfBagsAllowed = freeAllowedPorter * maxAllowedBaggagePerPorter;
      // + baggageCount;
    }

    // adultControllersList.first.baggageCountController.controller.text =
    //     noOfBagsAllowed.toString();

    settingInitials(adultControllersList);

    super.initState();
  }

  void settingInitials(List<AdultControllers> adultControllersList) {
    final adultControllers = adultControllersList.first;
    final personInfo = appSessionState?.profileModel.personInfo;
    final UserProfile userProfile =
        ProfileSingleton.profileSingleton.userProfile ?? UserProfile();
    adultControllers.countryCodeController.controller.text =
        userProfile.countryCodeData.callingCode ?? '+91';
    adultControllers.mobileController.controller.text =
        userProfile.isLoggedIn ? userProfile.userId : '';
    adultControllers.emailController.controller.text =
        personInfo?.emails?.firstOrNull?.emailAddress ?? '';
    adultControllers.firstNameController.controller.text =
        personInfo?.firstName ?? '';
    adultControllers.lastNameController.controller.text =
        personInfo?.lastName ?? '';
    adultControllers.titleController.controller.text = personInfo?.title ?? '';
    adultControllers.flag.value =
        context.read<SiteCoreStateManagement>().getFlag();
    placardCardControllers.flag.value =
        context.read<SiteCoreStateManagement>().getFlag();
    placardCardControllers.countryCodeController.controller.text =
        userProfile.countryCodeData.callingCode ?? '+91';
    updateSameAdultCheckBox(
      value: isSameAdultCheckBox.value,
    );
    pranaamAppDataStateManagement?.travellerSelectedCountryCode = null;
  }

  @override
  Widget build(BuildContext context) {
    return PranaamTravellerScreenWidgetView(this);
  }

  void scrollDown() {
    if (myController.position.pixels == myController.position.maxScrollExtent) {
      shakeKey.currentState?.shake();
    } else {
      myController.animateTo(
        myController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  Future<void> hideKeyBoard() async {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // PranaamAppDataStateManagement bookingServiceState =
  // PranaamAppDataStateManagement();
  int getAddonCount() {
    final CartResponse? addCartAddOnResponseModel =
        context.read<PranaamAppDataStateManagement>().cartDataResponse;
    return getAddonAddedByUserCount(addCartAddOnResponseModel);
  }

  void navigateToPage() {
    isProceedTapped = true;
    bool? isFormValid = formGlobalKey.currentState?.validate();
    isTermConditionValidate.value = true;
    if (pranaamAppDataStateManagement?.isSameAdultCheckBox ?? false) {
      placardCardControllers
        ..fNameController.controller =
            adultControllersList.first.firstNameController.controller
        ..lNameController.controller =
            adultControllersList.first.lastNameController.controller
        ..mobileController.controller =
            adultControllersList.first.mobileController.controller
        ..genderController.controller =
            adultControllersList.first.titleController.controller
        ..countryController.controller =
            adultControllersList.first.countryController.controller
        ..countryCodeController.controller =
            adultControllersList.first.countryCodeController.controller;
    }
    isFormValid = adultControllersList
            .first.countryController.controller.text.isNotEmpty &&
        adultControllersList.first.classController.controller.text.isNotEmpty &&
        adultControllersList
            .first.baggageCountController.controller.text.isNotEmpty &&
        (isFormValid ?? false);
    // }

    // final availableAddOn =
    //     pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn;
    // final noOfBags = noOfBagsAllowed ?? 0;

    adLog(
      'Baggage Count ${adultControllersList.first.baggageCountController.controller.text}',
    );
    if (isFormValid) {
      // if (int.parse(
      //           adultControllersList
      //               .first.baggageCountController.controller.text,
      //         ) >
      //         noOfBags &&
      //     availableAddOn != null &&
      //     availableAddOn.isNotEmpty &&
      //     isFormValid)
      // if(isFormValid)
      // {
      //   totalPorters = isPorterRequiredAsPerBaggageCount(
      //     int.parse(
      //       adultControllersList.first.baggageCountController.controller.text,
      //     ),
      //     noOfBags,
      //     pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
      //             .maxAllowedBaggagePerPorter ??
      //         0,
      //   );
      //   print("${pranaamAppDataStateManagement?.cartDataResponse?.packageDetail}");
      //   // addOnsBottomSheet(context);
      //   GaEvent.getInstance().proceedToPayEvent(
      //     context.read<PranaamAppDataStateManagement>(),
      //     '',
      //   );
      //   PranaamClickEvents.book_pranaam_add_traveller_details.logEvent(
      //     parameters: GaEvent.getInstance().parameterMap,
      //   );
      // }

      if (isFormValid && isTermConditionValidate.value) {
        hideKeyBoard();
        final CreateBookingRequestModel createBookingRequestModel =
            createBooking();
        GaEvent.getInstance().proceedToPayEvent(
          context.read<PranaamAppDataStateManagement>(),
          '',
        );
        ClickEvents.book_pranaam_add_traveller_details.logEvent(
          parameters: GaEvent.getInstance().parameterMap,
        );
        pranaamAppDataStateManagement?.pranaamCreateBooking =
            createBookingRequestModel;
        //ProcessDialog.showLoadingDialog(context);
        pranaamAppDataStateManagement
            ?.createBooking(createBookingRequestModel)
            .then(
          (value) {
            if (value.viewStatus == Status.complete) {
              //ProcessDialog.closeLoadingDialog(context);
              navigateToScreenUsingNamedRouteWithArguments(
                context,
                genericPaymentScreen,
                argumentObject: PaymentModule.pranaam,
              );
            } else {
              if (value.viewStatus == Status.error) {
                //ProcessDialog.closeLoadingDialog(context);
                final String errorMessage = value.message ?? 'Something Wrong';
                SnackBarUtil.showSnackBar(
                  context,
                  errorMessage,
                );
              }
            }
          },
        );
        adLog('inside');
      }
    } else {
      hideKeyBoard();
      const int dura = 100;
      Future.delayed(
        const Duration(milliseconds: dura),
        () => {
          formGlobalKey.currentState?.validate(),
          validateForm(),
        },
      );
      adLog('Not Validated Form');

      //      firstNameFocus.requestFocus();
    }
  }

  Future<void> addOnsBottomSheet(BuildContext context) {
    const double widthOfImage = 88;
    const double heightOfImage = 87;
    num porterCartQuantity = getAddonQuantity(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn ?? [],
    );
    porterCartQuantity =
        porterCartQuantity == 0 ? 1 : porterCartQuantity.toDouble();
    final ValueNotifier<String> price = ValueNotifier(
      FlightUtils.getPriceFormatWithSymbol(
        price: getPorterPrice(
              pranaamAppDataStateManagement?.cartDataResponse,
            ) *
            porterCartQuantity.toDouble(),
      ),
    );
    return adShowBottomSheet(
      context: context,
      childWidget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add_Porter_Service'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            'One_porter_can_carry_3_bags_at_max'.localize(context),
            style: ADTextStyle400.size16,
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          ADSizedBox(
            height: context.k_12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/assets/images/pranaam/porter2.png',
                width: widthOfImage,
                height: heightOfImage,
                fit: BoxFit.fill,
              ),
              ADSizedBox(
                width: context.k_20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Porter',
                    style: ADTextStyle500.size16.copyWith(),
                  ),
                  ADSizedBox(
                    width: context.k_16,
                    height: context.k_16,
                  ),
                  ValueListenableBuilder(
                    valueListenable: price,
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        '$value',
                        style: ADTextStyle700.size16,
                      ).paddingBySide(right: context.k_16);
                    },
                  ),
                ],
              ),
              const Spacer(),
              AddOnsButton(
                priceNorifer: price,
              ).paddingBySide(right: context.k_16),
            ],
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              SizedBox(
                width: context.k_56,
              ),
              AddPorterServiceBottomButtons(
                textColor: context.adColors.whiteTextColor,
                bgColor: context.adColors.black,
                name: 'Confirm',
                onTap: () => {
                  navigatorPopScreen(context),
                  ClickEvents.book_pranaam_add_on
                      .logEvent(parameters: GaEvent.getInstance().parameterMap),
                  context.read<AppSessionState>().updatePranaamCart(
                        getAddonCount(),
                      ),
                  PranaamBookingGaAnalytics().ecommerceEventAddCart(
                    ClickEvents.add_to_cart,
                    context.read<PranaamAppDataStateManagement>(),
                  ),
                },
              ),
              ADSizedBox(
                width: context.k_56,
              ),
            ],
          ),
        ],
      ).paddingBySide(left: context.k_16),
      headerTitle: '',
    ).then((value) {
      final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
              ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
          0;
      final int freeAllowedPorter = pranaamAppDataStateManagement
              ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
          0;
      final List<PackageAddOn> packageAddOnList =
          pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn ?? [];
      if (packageAddOnList.isNotEmpty) {
        final int portersQuantity = pranaamAppDataStateManagement
                ?.cartDataResponse?.packageAddOn.first.qty ??
            0;
        noOfBagsAllowed =
            (portersQuantity + freeAllowedPorter) * maxAllowedBaggagePerPorter;
        // +
        // baggageCount;
      } else {
        noOfBagsAllowed = freeAllowedPorter * maxAllowedBaggagePerPorter;
        // + baggageCount;
      }

      // adultControllersList.first.baggageCountController.controller.text =
      //     noOfBagsAllowed.toString();
    });
  }

  AddCartAddOnRequestModel getAddCartAddOnRequest(
    PackageAddOn packageAddOn,
    int quantity,
    double price,
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
      price: price,
      quantity: quantity,
      addOnServiceId: packageAddOn.addOnServiceId,
    );
  }

  Future<void> addCartRequest(
    PackageAddOn packageAddOn,
    double price,
    int quantity,
    BuildContext context,
  ) async {
    ///ProcessDialog.showLoadingDialog(context);
    final ADResponseState state =
        await context.read<PranaamAppDataStateManagement>().cartAddOnItem(
              getAddCartAddOnRequest(packageAddOn, quantity, price).toJson(),
              appSessionState ?? AppSessionState(),
            );
    switch (state.viewStatus) {
      case Status.complete:
        final CreateBookingRequestModel createBookingRequestModel =
            createBooking();
        final PranaamAppDataStateManagement pranaamAppDataStateManagement =
            context.read<PranaamAppDataStateManagement>()
              ..pranaamCreateBooking = createBookingRequestModel;
        final ADResponseState responseState =
            await pranaamAppDataStateManagement
                .createBooking(createBookingRequestModel);
        switch (responseState.viewStatus) {
          case Status.complete:
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              genericPaymentScreen,
              argumentObject: PaymentModule.pranaam,
            );
            break;
          case Status.error:
            SnackBarUtil.showSnackBar(
              context,
              responseState.message ?? '',
            );
            break;
          case Status.loading:
            ProcessDialog.showLoadingDialog(context);
            break;
          default:
            break;
        }
        break;
      case Status.error:
        SnackBarUtil.showSnackBar(
          context,
          state.message ?? '',
        );
        break;
      case Status.loading:
        ProcessDialog.showLoadingDialog(context);
        break;
      default:
        break;
    }
    adLog(state.toString());
  }

  CreateBookingRequestModel createBooking() {
    if (isSameAdultCheckBox.value) {
      updateSameAdultCheckBox(value: true);
    }
    final CreateBookingRequestModel createBookingRequestModel =
        CreateBookingRequestModel(
      //TODO hardcode as of now
      bookedOn: DateTime.now().toIso8601String(),
      isGSTEnable: useGSTNumber.value,
      bookingStatusId: '0',
      billingInfo: getBillingInfo(),
      placardInfo: PlacardInfo(
        personName: PersonNameModel(
          salutationText:
              placardCardControllers.genderController.controller.text.isEmpty
                  ? ''
                  : placardCardControllers.genderController.controller.text,
          salutationId: int.parse(
            siteCoreStateManagement?.salutation
                    .firstWhere(
                      (salutation) =>
                          salutation.label ==
                          placardCardControllers
                              .genderController.controller.text,
                      orElse: () => const site_core_masters.Salutation(id: '1'),
                    )
                    .id ??
                '',
          ),
          lastName:
              placardCardControllers.lNameController.controller.text.isEmpty
                  ? ''
                  : placardCardControllers.lNameController.controller.text,
          firstName:
              placardCardControllers.fNameController.controller.text.isEmpty
                  ? ''
                  : placardCardControllers.fNameController.controller.text,
        ),
        baggageCount: int.tryParse(
              adultControllersList.first.baggageCountController.controller.text,
            ) ??
            0,
        countryDialCode:
            placardCardControllers.fNameController.controller.text.isEmpty
                ? ''
                : placardCardControllers.countryCodeController.controller.text,
        mobileNumber:
            adultControllersList.first.mobileController.controller.text,
        porterName: '',
        specialInstruction:
            placardCardControllers.fNameController.controller.text.isEmpty
                ? ''
                : placardCardControllers.commentsController.controller.text,
      ),
      travellers: getTravellers(),
    );

    return createBookingRequestModel;
  }

  void porterAddOn(BuildContext context) {
    final cartResponse = pranaamAppDataStateManagement?.cartDataResponse;
    final PackageAddOn _packageAddon = getPorterAddon(
      cartResponse,
    );
    final PackageAddOn _packageAvailableAddon = getPorterAvailableAddon(
      cartResponse,
    );
    context.read<AppSessionState>().updatePranaamCart(
          getAddonAddedByUserCount(
            cartResponse,
          ),
        );

    ///increase counter on add on button
    addCartRequest(
      _packageAvailableAddon,
      _packageAvailableAddon.price,
      _packageAddon.qty + totalPorters.toInt(),
      context,
    );
    navigatorPopScreen(context);
  }

  BillingInfo getBillingInfo() {
    return BillingInfo(
      billingGstInModel: getBillingGSTInfo(),
      personName: PersonNameModel(
        salutationText:
            placardCardControllers.genderController.controller.text.isEmpty
                ? ' '
                : placardCardControllers.genderController.controller.text,
        salutationId: int.parse(
          siteCoreStateManagement?.salutation
                  .firstWhere(
                    (salutation) =>
                        salutation.label ==
                        placardCardControllers.genderController.controller.text,
                    orElse: () => const site_core_masters.Salutation(id: '1'),
                  )
                  .id ??
              '',
        ),
        lastName: placardCardControllers.lNameController.controller.text.isEmpty
            ? ''
            : placardCardControllers.lNameController.controller.text,
        firstName:
            placardCardControllers.fNameController.controller.text.isEmpty
                ? ''
                : placardCardControllers.fNameController.controller.text,
      ),
      addressModel: AddressModel(
        addressLine_1: billingControllers.addressController.controller.text,
        addressLine_2: '',
        cityDetails: CityModel(
          cityId: int.tryParse(selectedCity.id) ?? 0,
          cityName: billingControllers.cityController.controller.text,
        ),
        countryDetails: CountryModel(
          countryCode: int.parse(
            siteCoreStateManagement?.country
                    .firstWhere(
                      (country) =>
                          country.countryName ==
                          billingControllers.countryController.controller.text,
                      orElse: () => const site_core_masters.Country(id: '0'),
                    )
                    .id ??
                '',
          ),
          countryName: billingControllers.countryController.controller.text,
        ),
        pinCode: billingControllers.pincodeController.controller.text,
        stateDetails: StateProvModel(
          //when passing actual state id response is invalid state id.
          stateCode: int.tryParse(selectedState.id) ?? 0,
          stateName: billingControllers.stateController.controller.text,
        ),
      ),
      mobileNumber: adultControllersList.first.mobileController.controller.text,
      emailId: adultControllersList.first.emailController.controller.text,
      countryDialCode:
          adultControllersList.first.countryCodeController.controller.text,
    );
  }

  BillingGstInModel getBillingGSTInfo() {
    return BillingGstInModel(
      countryDetails: CountryModel(
        countryCode: int.parse(
          siteCoreStateManagement?.country
                  .firstWhere(
                    (country) =>
                        country.countryName ==
                        billingControllers.countryController.controller.text,
                    orElse: () => const site_core_masters.Country(id: '0'),
                  )
                  .id ??
              '',
        ),
        countryName: billingControllers.countryController.controller.text,
      ),
      mobileNumber: gstControllers.mobileNumberController.controller.text,
      stateDetails: StateProvModel(
        //when passing actual state id response is invalid state id.
        stateCode: int.tryParse(selectedState.id) ??
            0, //check this its is causing exeption when state is typed
        stateName: billingControllers.stateController.controller.text,
      ),
      pinCode: int.parse(
        sameBillingControllers.pincodeController.controller.text
            .validateWithDefaultValue(defaultValue: '110027'),
      ),
      cityDetails: CityModel(
        cityId: int.tryParse(selectedCity.id) ?? 0,
        cityName: billingControllers.cityController.controller.text,
      ),
      address: billingControllers.addressController.controller.text,
      emailId: gstControllers.emailIDController.controller.text,
      gstName: useGSTNumber.value
          ? gstControllers.companyNameController.controller.text
          : '',
      gstNumber: useGSTNumber.value
          ? gstControllers.gstNumberController.controller.text
          : '',
    );
  }

  List<TravellersModel> getTravellers() {
    final List<TravellersModel> travellersList = [];
    final int adultControllersListLength = adultControllersList.length;

    for (int index = 0; index < adultControllersListLength; index++) {
      final ageField =
          adultControllersList[index].ageController.controller.text;
      final flyingClassName =
          adultControllersList[index].classController.controller.text.isEmpty
              ? adultControllersList.first.classController.controller.text
              : adultControllersList[index].classController.controller.text;
      travellersList.add(
        TravellersModel(
          personName: PersonNameModel(
            firstName:
                adultControllersList[index].firstNameController.controller.text,
            lastName:
                adultControllersList[index].lastNameController.controller.text,
            salutationId: int.parse(
              siteCoreStateManagement?.salutation
                      .firstWhere(
                        (salutation) =>
                            salutation.label ==
                            adultControllersList[index]
                                .titleController
                                .controller
                                .text,
                        orElse: () =>
                            const site_core_masters.Salutation(id: '0'),
                      )
                      .id ??
                  '',
            ),
            salutationText:
                adultControllersList[index].titleController.controller.text,
          ),
          countryDetails: CountryModel(
            countryName: adultControllersList[index]
                    .countryController
                    .controller
                    .text
                    .isEmpty
                ? adultControllersList.first.countryController.controller.text
                : adultControllersList[index].countryController.controller.text,
            countryCode: int.tryParse(
                  pranaamAppDataStateManagement?.travellerSelectedCountryCode ??
                      '1',
                ) ??
                1,
          ),
          flyingClass: flyingClassName,
          flyingClassName: flyingClassName,
          passportNumber: adultControllersList[index]
                  .passportNoController
                  .controller
                  .text
                  .isEmpty
              ? adultControllersList.first.passportNoController.controller.text
              : adultControllersList[index]
                  .passportNoController
                  .controller
                  .text,
          flyingClassId: adultControllersList[index]
                  .classController
                  .controller
                  .text
                  .isEmpty
              ? int.parse(
                  siteCoreStateManagement?.flyingClass
                          .firstWhere(
                            (flyingClass) =>
                                flyingClass.label ==
                                adultControllersList
                                    .first.classController.controller.text,
                            orElse: () =>
                                const site_core_masters.BookingStatus(id: '0'),
                          )
                          .id ??
                      '',
                )
              : int.parse(
                  siteCoreStateManagement?.flyingClass
                          .firstWhere(
                            (flyingClass) =>
                                flyingClass.label ==
                                adultControllersList[index]
                                    .classController
                                    .controller
                                    .text,
                            orElse: () =>
                                const site_core_masters.BookingStatus(id: '0'),
                          )
                          .id ??
                      '',
                ),
          passengerTypeCode: 'ADT',
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
          passengerTypeName: 'Adult',
          spocPhone:
              adultControllersList.first.mobileController.controller.text,
          travellersAge: int.parse(
            ageField.isNotEmpty ? ageField : '16',
          ),
        ),
      );
    }
    getChildren(travellersList, adultControllersList);
    getInfants(travellersList, adultControllersList);

    return travellersList;
  }

  void getChildren(
    List<TravellersModel> travellersList,
    List<AdultControllers> adultControllersList,
  ) {
    final int childrenControllersListLength = childrenControllersList.length;

    for (int index = 0; index < childrenControllersListLength; index++) {
      final childAge =
          childrenControllersList[index].ageController.controller.text;
      travellersList.add(
        TravellersModel(
          personName: PersonNameModel(
            firstName: childrenControllersList[index]
                .firstNameController
                .controller
                .text,
            lastName: childrenControllersList[index]
                .lastNameController
                .controller
                .text,
            salutationId: int.parse(
              siteCoreStateManagement?.salutation
                      .firstWhere(
                        (salutation) =>
                            salutation.label ==
                            childrenControllersList[index]
                                .genderController
                                .controller
                                .text,
                        orElse: () =>
                            const site_core_masters.Salutation(id: '0'),
                      )
                      .id ??
                  '',
            ),
            salutationText:
                childrenControllersList[index].genderController.controller.text,
          ),
          countryDetails: CountryModel(
            countryName: adultControllersList
                    .first.countryController.controller.text.isEmpty
                ? 'India'
                : adultControllersList.first.countryController.controller.text,
            countryCode: int.parse(
              adultControllersList.first.countryCodeController.controller.text,
            ),
          ),
          flyingClass:
              adultControllersList.first.classController.controller.text.isEmpty
                  ? '1'
                  : adultControllersList.first.classController.controller.text,
          flyingClassName:
              adultControllersList.first.classController.controller.text.isEmpty
                  ? '1'
                  : adultControllersList.first.classController.controller.text,
          passportNumber: adultControllersList
                  .first.passportNoController.controller.text.isEmpty
              ? '1'
              : adultControllersList.first.passportNoController.controller.text,
          flyingClassId: int.parse(
            siteCoreStateManagement?.flyingClass
                    .firstWhere(
                      (flyingClass) =>
                          flyingClass.label ==
                          adultControllersList
                              .first.classController.controller.text,
                      orElse: () =>
                          const site_core_masters.BookingStatus(id: '0'),
                    )
                    .id ??
                '',
          ),
          passengerTypeCode: 'CHD',
          passengerTypeName: 'Children',
          passengerTypeId: int.parse(
            siteCoreStateManagement?.passengerType
                    .firstWhere(
                      (passengerType) => passengerType.label == 'Children',
                      orElse: () =>
                          const site_core_masters.BookingStatus(id: '0'),
                    )
                    .id ??
                '',
          ),
          spocPhone:
              adultControllersList.first.mobileController.controller.text,
          travellersAge: int.parse(childAge.isNotEmpty ? childAge : '4'),
        ),
      );
    }
  }

  void getInfants(
    List<TravellersModel> travellersList,
    List<AdultControllers> adultControllersList,
  ) {
    final int infantControllersListLength = infantControllersList.length;

    for (int index = 0; index < infantControllersListLength; index++) {
      final infantController =
          infantControllersList[index].ageController.controller.text;
      travellersList.add(
        TravellersModel(
          personName: PersonNameModel(
            firstName: infantControllersList[index]
                .firstNameController
                .controller
                .text,
            lastName:
                infantControllersList[index].lastNameController.controller.text,
            salutationId: int.parse(
              siteCoreStateManagement?.salutation
                      .firstWhere(
                        (salutation) =>
                            salutation.label ==
                            infantControllersList[index]
                                .genderController
                                .controller
                                .text,
                        orElse: () =>
                            const site_core_masters.Salutation(id: '0'),
                      )
                      .id ??
                  '',
            ),
            salutationText:
                infantControllersList[index].genderController.controller.text,
          ),
          countryDetails: CountryModel(
            countryName: adultControllersList
                    .first.countryController.controller.text.isEmpty
                ? 'India'
                : adultControllersList.first.countryController.controller.text,
            countryCode: int.parse(
              adultControllersList.first.countryCodeController.controller.text,
            ),
          ),
          flyingClass:
              adultControllersList.first.classController.controller.text.isEmpty
                  ? '1'
                  : adultControllersList.first.classController.controller.text,
          flyingClassName:
              adultControllersList.first.classController.controller.text.isEmpty
                  ? '1'
                  : adultControllersList.first.classController.controller.text,
          passportNumber: adultControllersList
                  .first.passportNoController.controller.text.isEmpty
              ? '1'
              : adultControllersList.first.passportNoController.controller.text,
          flyingClassId: int.parse(
            siteCoreStateManagement?.flyingClass
                    .firstWhere(
                      (flyingClass) =>
                          flyingClass.label ==
                          adultControllersList
                              .first.classController.controller.text,
                      orElse: () =>
                          const site_core_masters.BookingStatus(id: '0'),
                    )
                    .id ??
                '',
          ),
          passengerTypeCode: 'INF',
          passengerTypeName: 'Infant',
          passengerTypeId: int.parse(
            siteCoreStateManagement?.passengerType
                    .firstWhere(
                      (passengerType) => passengerType.label == 'Infant',
                      orElse: () =>
                          const site_core_masters.BookingStatus(id: '0'),
                    )
                    .id ??
                '',
          ),
          spocPhone:
              adultControllersList.first.mobileController.controller.text,
          travellersAge:
              int.parse(infantController.isNotEmpty ? infantController : '1'),
        ),
      );
    }
  }

  void resetData() {
    // resetAdultControllers();
    adultControllersList.clear();
    childrenControllersList.clear();
    infantControllersList.clear();

    billingControllers.addressController.controller.clear();
    billingControllers.cityController.controller.clear();
    billingControllers.stateController.controller.clear();
    billingControllers.countryController.controller.clear();
    billingControllers.pincodeController.controller.clear();

    placardCardControllers.countryController.controller.clear();
    placardCardControllers.countryCodeController.controller.clear();
    placardCardControllers.mobileController.controller.clear();
    placardCardControllers.emailController.controller.clear();
    placardCardControllers.genderController.controller.clear();
    placardCardControllers.commentsController.controller.clear();
    placardCardControllers.lNameController.controller.clear();
    placardCardControllers.fNameController.controller.clear();

    updateAdultControllers();
    updateChildrenControllers();
    updateInfantControllers();

    pranaamAppDataStateManagement?.isValidate = false;
  }

  void updateAdultControllers() {
    final int count = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      adultPassengerCode,
    );

    adLog('Adult Count $count');
    for (int index = 0; index < count; index++) {
      adultControllersList.add(
        AdultControllers.name(
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ValueNotifier(''),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
        ),
      );
    }
  }

  void updateChildrenControllers() {
    final int count = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      childPassengerCode,
    );
    for (int index = 0; index < count; index++) {
      childrenControllersList.add(
        ChildrenControllers.name(
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
        ),
      );
    }
  }

  void updateInfantControllers() {
    final int count = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      infantPassengerCode,
    );
    for (int index = 0; index < count; index++) {
      infantControllersList.add(
        InfantControllers.name(
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
          ControllersAndFocus.name(
            TextEditingController(),
            FocusNode(),
          ),
        ),
      );
    }
  }

  void updateSameCheckBox({
    required bool value,
  }) {
    isSameCheckBox.value = value;
    if (value) {
      sameBillingControllers.addressController.controller.text =
          billingControllers.addressController.controller.text;
      sameBillingControllers.pincodeController.controller.text =
          billingControllers.pincodeController.controller.text;
      sameBillingControllers.countryController.controller.text =
          billingControllers.countryController.controller.text;
      sameBillingControllers.stateController.controller.text =
          billingControllers.stateController.controller.text;
      sameBillingControllers.cityController.controller.text =
          billingControllers.cityController.controller.text;
    } else {
      sameBillingControllers = SameBillingControllers.name(
        ControllersAndFocus.name(
          TextEditingController(),
          FocusNode(),
        ),
        ControllersAndFocus.name(
          TextEditingController(),
          FocusNode(),
        ),
        ControllersAndFocus.name(
          TextEditingController(),
          FocusNode(),
        ),
        ControllersAndFocus.name(
          TextEditingController(),
          FocusNode(),
        ),
        ControllersAndFocus.name(
          TextEditingController(),
          FocusNode(),
        ),
      );
    }
    // notifyListeners();
  }

  /// refresh and validting
  void refreshAndValidate(isValidate) {
    adLog('refreshAndValidate $isValidate');
    // validateForm();
    //  adLog(isValidate.toString());
  }

  void validateForm() {
    //  const int domesticId = 3;
    final int travellerCount = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      adultPassengerCode,
    );

    final int childCount = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      childPassengerCode,
    );
    final int infantCount = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      infantPassengerCode,
    );

    adLog('TravellersCount$travellerCount');
    adLog('ChildCount$childCount');
    adLog('InfantCount$infantCount');

    for (int index = 0; index < travellerCount; index++) {
      final adultControllersListValue = adultControllersList[index];
      if (index == 0) {
        if (adultControllersListValue.countryController.controller.text == '') {
          countryNotifier.value = 'Please select country';
        }
        if (adultControllersListValue.classController.controller.text == '') {
          travelClassNotifier.value = 'Please select travel class';
        }
        if (adultControllersListValue.baggageCountController.controller.text ==
            '') {
          totalBaggageErrorNotifier.value = 'Please select baggage count';
        }
        validateBillingDropDowns();
        if (!RegExp(Validations.firstNameRegex).hasMatch(
              adultControllersListValue.firstNameController.controller.text,
            ) ||
            adultControllersListValue.titleController.controller.text.isEmpty) {
          adLog('validating other first name');
          adultControllersListValue.firstNameController.focusNode
              .requestFocus();
        } else if (!RegExp(Validations.lastNameRegex).hasMatch(
          adultControllersListValue.lastNameController.controller.text,
        )) {
          adLog('validating other last name');
          adultControllersListValue.lastNameController.focusNode.requestFocus();
        } else if (adultControllersListValue
                .countryController.controller.text ==
            '') {
          adLog('validating other country');

          adLog(
            'selectedCountryy ${adultControllersListValue.countryController.controller.text}',
          );
          adultControllersListValue.countryController.focusNode.requestFocus();
          final RenderObject? renderObject =
              key.currentContext?.findRenderObject();
          scrollPage(renderObject);
        } else if (!RegExp(Validations.mobileRegex).hasMatch(
          adultControllersListValue.mobileController.controller.text,
        )) {
          adLog('validating other mobile');
          // adultControllersListValue.mobileController.focusNode.requestFocus();
        } else if (!RegExp(Validations.emailRegex).hasMatch(
          adultControllersListValue.emailController.controller.text,
        )) {
          adLog('validating other email');
          adultControllersListValue.emailController.focusNode.requestFocus();
        } else if (adultControllersListValue.classController.controller.text ==
            '') {
          adLog('validating other class');
          adultControllersListValue.classController.focusNode.requestFocus();

          final RenderObject? renderObject =
              travelClassKey.currentContext?.findRenderObject();
          scrollPage(renderObject);
        } else if (!RegExp(Validations.ageRegex).hasMatch(
          adultControllersListValue.ageController.controller.text,
        )) {
          adLog('validating other age');
          adultControllersListValue.ageController.focusNode.requestFocus();
        } else if (adultControllersListValue
                .baggageCountController.controller.text ==
            '') {
          adultControllersListValue.baggageCountController.focusNode
              .requestFocus();
          final RenderObject? renderObject =
              totalBaggaeClassKey.currentContext?.findRenderObject();
          scrollPage(renderObject);
        } else {
          adLog('validating other fields');
          validateOtherFields(travellerCount, childCount, infantCount);
        }
      } else {
        if (!RegExp(Validations.firstNameRegex).hasMatch(
              adultControllersListValue.firstNameController.controller.text,
            ) ||
            adultControllersListValue.titleController.controller.text.isEmpty) {
          adultControllersListValue.firstNameController.focusNode
              .requestFocus();
        } else if (!RegExp(Validations.lastNameRegex).hasMatch(
          adultControllersListValue.lastNameController.controller.text,
        )) {
          adultControllersListValue.lastNameController.focusNode.requestFocus();
        } else if (!RegExp(Validations.ageRegex).hasMatch(
          adultControllersListValue.ageController.controller.text,
        )) {
          adultControllersListValue.ageController.focusNode.requestFocus();
        }
      }
    }
  }

  void validateOtherFields(
    int travellerCount,
    int childCount,
    int infantCount,
  ) {
    if (travellerCount > 0 && childCount > 0 && infantCount > 0) {
      validateBilling();
      validateInfantForm();
      validateChildForm();
      validatePlacard();
    } else if (travellerCount > 0 && infantCount > 0) {
      adLog('validating Adults and infant fields');

      validateBilling();
      validateInfantForm();
      validatePlacard();
    } else if (travellerCount > 0 && childCount > 0) {
      adLog('validating Adults and children fields');
      validateBilling();
      validateChildForm();
      validatePlacard();
    } else {
      adLog('validating Adults and Billing fields');
      validateBilling();
      validatePlacard();
    }
  }

  void validatePlacard() {
    adLog('validating placard');

    if (!RegExp(Validations.firstNameRegex).hasMatch(
      placardCardControllers.fNameController.controller.text,
    )) {
      placardCardControllers.fNameController.focusNode.requestFocus();
    } else if (!RegExp(Validations.lastNameRegex).hasMatch(
      placardCardControllers.lNameController.controller.text,
    )) {
      placardCardControllers.lNameController.focusNode.requestFocus();
    } else if (!RegExp(Validations.mobileRegex).hasMatch(
      placardCardControllers.mobileController.controller.text,
    )) {
      placardCardControllers.mobileController.focusNode.requestFocus();
    }
  }

  void validateChildForm() {
    final int travellerCount = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      childPassengerCode,
    );
    adLog('childPassenger TravellersCount$travellerCount');
    for (int index = 0; index < travellerCount; index++) {
      final childControllersListValue = childrenControllersList[index];

      if (!RegExp(Validations.firstNameRegex).hasMatch(
        childControllersListValue.firstNameController.controller.text,
      )) {
        childControllersListValue.firstNameController.focusNode.requestFocus();
      } else if (!RegExp(Validations.lastNameRegex).hasMatch(
        childControllersListValue.lastNameController.controller.text,
      )) {
        childControllersListValue.lastNameController.focusNode.requestFocus();
      } else if (!RegExp(Validations.childAgeRegex).hasMatch(
        childControllersListValue.ageController.controller.text,
      )) {
        childControllersListValue.ageController.focusNode.requestFocus();
      }
    }
  }

  void validateInfantForm() {
    final int travellerCount = getTotalPassengersByType(
      pranaamAppDataStateManagement?.cartDataResponse,
      infantPassengerCode,
    );
    adLog('infantControllersList TravellersCount$travellerCount');

    for (int index = 0; index < travellerCount; index++) {
      final infantControllersListValue = infantControllersList[index];

      if (!RegExp(Validations.firstNameRegex).hasMatch(
        infantControllersListValue.firstNameController.controller.text,
      )) {
        infantControllersListValue.firstNameController.focusNode.requestFocus();
      } else if (!RegExp(Validations.lastNameRegex).hasMatch(
        infantControllersListValue.lastNameController.controller.text,
      )) {
        infantControllersListValue.lastNameController.focusNode.requestFocus();
      } else if (!RegExp(Validations.infantAgeRegex).hasMatch(
        infantControllersListValue.ageController.controller.text,
      )) {
        infantControllersListValue.ageController.focusNode.requestFocus();
      }
    }
  }

  void validateBilling() {
    if (Validations.validateGstNumber(
          gstControllers.gstNumberController.controller.text,
          context,
          selectedState.tinCode,
        )?.isNotEmpty ??
        false) {
      gstControllers.gstNumberController.focusNode.requestFocus();
    } else if (Validations.validateCompanyName(
          gstControllers.companyNameController.controller.text,
          context,
        )?.isNotEmpty ??
        false) {
      gstControllers.companyNameController.focusNode.requestFocus();
    }
    if (billingControllers.addressController.controller.text.isEmpty) {
      billingControllers.addressController.focusNode.requestFocus();
    } else if (!RegExp(Validations.pincodeRegex)
        .hasMatch(billingControllers.pincodeController.controller.text)) {
      billingControllers.pincodeController.focusNode.requestFocus();
    }
    if (billingControllers.countryController.controller.text.isEmpty) {
      final RenderObject? renderObject =
          countryKey.currentContext?.findRenderObject();
      billingCountryNotifier.value = 'Please select country';
      scrollPage(renderObject);
    } else if (isIndia) {
      adLog('isIndia $isIndia');
      if (billingControllers.stateController.controller.text.isEmpty) {
        final RenderObject? renderObject =
            stateKey.currentContext?.findRenderObject();
        stateNotifier.value = 'Please select state';
        scrollPage(renderObject);
      } else if (billingControllers.cityController.controller.text.isEmpty) {
        final RenderObject? renderObject =
            cityKey.currentContext?.findRenderObject();
        cityNotifier.value = 'Please select city';
        scrollPage(renderObject);
      }
    } else {
      adLog('isIndia $isIndia');
      if (billingControllers.stateController.controller.text.isEmpty) {
        billingControllers.stateController.focusNode.requestFocus();
      } else if (billingControllers.cityController.controller.text.isEmpty) {
        billingControllers.cityController.focusNode.requestFocus();
      }
    }
  }

  void validateBillingDropDowns() {
    if (billingControllers.countryController.controller.text.isEmpty) {
      billingCountryNotifier.value = 'Please select country';
    } else {
      if (billingControllers.stateController.controller.text.isEmpty) {
        stateNotifier.value = 'Please select state';
      } else if (billingControllers.cityController.controller.text.isEmpty) {
        cityNotifier.value = 'Please select city';
      }
    }
  }

  void scrollPage(RenderObject? renderObject) {
    if (renderObject != null) {
      adLog('Not null Context');
      myController.position.ensureVisible(
        renderObject,
        alignment: alignment,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void onTNCChecked({bool? value}) {
    if (value != null) {
      tNCCheckBox.value = value;
      isTermConditionValidate.value = value;
    }
  }

  void updateSameAdultCheckBox({
    required bool value,
  }) {
    isSameAdultCheckBox.value = value;
    if (value) {
      adLog('Filling placard controllers $value');
      placardCardControllers.genderController.controller.text =
          adultControllersList.first.titleController.controller.text;
      placardCardControllers.lNameController.controller.text =
          adultControllersList.first.lastNameController.controller.text;
      placardCardControllers.fNameController.controller.text =
          adultControllersList.first.firstNameController.controller.text;
      placardCardControllers.countryCodeController.controller.text =
          adultControllersList.first.countryCodeController.controller.text;
      placardCardControllers.countryController.controller.text =
          adultControllersList.first.countryController.controller.text;
      placardCardControllers.mobileController.controller.text =
          adultControllersList.first.mobileController.controller.text;
      placardCardControllers.flag.value = adultControllersList.first.flag.value;
    } else {
      adLog('Initializing placard controllers $value');
      final userProfile = ProfileSingleton.profileSingleton.userProfile;
      placardCardControllers.genderController.controller.text = '';
      placardCardControllers.lNameController.controller.text = '';
      placardCardControllers.fNameController.controller.text = '';
      placardCardControllers.countryCodeController.controller.text =
          userProfile?.countryCodeData.callingCode ?? '+91';
      placardCardControllers.countryController.controller.text = '';
      placardCardControllers.mobileController.controller.text = '';
      placardCardControllers.flag.value =
          context.read<SiteCoreStateManagement>().getFlag();
    }
    // if (isProceedTapped) {
    //    adLog(formGlobalKey.currentState?.validate().toString() ?? '');
    //    placardCardControllers.mobileController.focusNode.requestFocus();
    // }
  }

  void updateGSTCheckBox({
    required bool value,
  }) {
    useGSTNumber.value = value;

    if (isProceedTapped) {
      adLog(formGlobalKey.currentState?.validate().toString() ?? '');
    }
  }

  Future<void> selectTotalBaggageCount(
    BuildContext context, {
    required TextEditingController baggageController,
  }) {
    final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
        0;
    final int freeAllowedPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
        0;
    int _maxBaggageCount = 45;
    final List<PackageAddOn> addOnsList =
        pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn ?? [];
    const String porterAddOnServiceName = 'Porter';
    bool porterAvailable = false;
    for (final element in addOnsList) {
      if (element.addOnServiceName == porterAddOnServiceName) {
        porterAvailable = true;
        break;
      }
    }

    if (!porterAvailable) {
      _maxBaggageCount = freeAllowedPorter * maxAllowedBaggagePerPorter;
    }

    return adShowBottomSheet(
      context: context,
      childWidget: SelectPorterQuantityScreen(
        startFromZero: true,
        itemCounts: _maxBaggageCount,
        selectedIndexNotifier:
            ValueNotifier<int>(int.tryParse(baggageController.text) ?? -1),
        subtitleText: 'One_porter_can_carry_3_bags_at_max'.localize(context),
        adGenericCallback: (value) => {
          Navigator.pop(context),
          if (value != -1)
            checkIfPorterQuantityNeedsToChange(
              value,
              baggageController: baggageController,
            ),
          // baggageController.text = value.toString(),
        },
      ),
      headerTitle: 'Total Baggage',
    );
  }

  void checkIfPorterQuantityNeedsToChange(
    int selectedBaggageCount, {
    required TextEditingController baggageController,
  }) {
    final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
        0;
    final int freeAllowedPorter = pranaamAppDataStateManagement
            ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
        0;
    final int portersQuantity = (pranaamAppDataStateManagement
                ?.cartDataResponse?.packageAddOn.isNotEmpty ??
            false)

        /// todo: compare with id
        ? pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn
                .firstWhere(
                  (element) => element.addOnServiceName == 'Porter',
                  orElse: () => const PackageAddOn(),
                )
                .qty ??
            0
        : 0;
    final int totalPorterRequired = (selectedBaggageCount /
            ((maxAllowedBaggagePerPorter == 0)
                ? 3
                : maxAllowedBaggagePerPorter))
        .ceil();
    final int totalPorterPresent = freeAllowedPorter + portersQuantity;
    if (totalPorterPresent < totalPorterRequired) {
      /// Add additional porter
      addAdditionalPorterBottomSheet(
        context,
        noOfPorterNeedsToAdded: totalPorterRequired - freeAllowedPorter,
        additionalPorterRequired: totalPorterRequired - totalPorterPresent,
        baggageCount: selectedBaggageCount,
        baggageController: baggageController,
      );
    } else if (totalPorterPresent > totalPorterRequired) {
      /// check to remove additional porter
      if (portersQuantity > 0) {
        removeAdditionalPorterBottomSheet(
          context,
          porterCountsForUpdate: totalPorterRequired - freeAllowedPorter > 0
              ? totalPorterRequired - freeAllowedPorter
              : 0,
          baggageController: baggageController,
          baggageCount: selectedBaggageCount,
        );
      } else {
        baggageController.text = selectedBaggageCount.toString();
        totalBaggageErrorNotifier.value = '';
      }
    } else if (totalPorterPresent == totalPorterRequired) {
      baggageController.text = selectedBaggageCount.toString();
      totalBaggageErrorNotifier.value = '';
    }
  }

  Future<void> addAdditionalPorterBottomSheet(
    BuildContext context, {
    required int noOfPorterNeedsToAdded,
    required int additionalPorterRequired,
    required int baggageCount,
    required TextEditingController baggageController,
  }) {
    const double widthOfImage = 88;
    const double heightOfImage = 87;
    final ValueNotifier<String> price = ValueNotifier(
      FlightUtils.getPriceFormatWithSymbol(
        price: getPorterPrice(
              pranaamAppDataStateManagement?.cartDataResponse,
            ) *
            additionalPorterRequired.toDouble(),
      ),
    );
    return adShowBottomSheet(
      context: context,
      childWidget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'One porter can carry 3 bags at max, we recommend you take $additionalPorterRequired more ${additionalPorterRequired > 1 ? 'porters' : 'porter'}.',
            style: ADTextStyle400.size16,
          ).paddingBySide(right: context.k_20),
          ADSizedBox(
            height: context.k_32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
                child: Image.asset(
                  'lib/assets/images/pranaam/porter1.png',
                  width: widthOfImage,
                  height: heightOfImage,
                  fit: BoxFit.fill,
                ),
              ),
              ADSizedBox(
                width: context.k_20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Porter',
                    style: ADTextStyle700.size16.copyWith(),
                  ),
                  ADSizedBox(
                    width: context.k_16,
                    height: context.k_8,
                  ),
                  Text(
                    'Quantity: $additionalPorterRequired',
                    style: ADTextStyle500.size16,
                  ).paddingBySide(right: context.k_16),
                  ADSizedBox(
                    width: context.k_16,
                    height: context.k_8,
                  ),
                  ValueListenableBuilder(
                    valueListenable: price,
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        '$value',
                        style: ADTextStyle700.size16,
                      ).paddingBySide(right: context.k_16);
                    },
                  ),
                ],
              ),
            ],
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              AddPorterServiceBottomButtons(
                textColor: context.adColors.black,
                bgColor: context.adColors.whiteTextColor,
                name: 'Cancel',
                onTap: () => {
                  navigatorPopScreen(context),
                  ClickEvents.book_pranaam_add_on
                      .logEvent(parameters: GaEvent.getInstance().parameterMap),
                  context.read<AppSessionState>().updatePranaamCart(
                        getAddonCount(),
                      ),
                  PranaamBookingGaAnalytics().ecommerceEventAddCart(
                    ClickEvents.add_to_cart,
                    context.read<PranaamAppDataStateManagement>(),
                  ),
                },
                borderWidth: 1,
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Consumer<PranaamAppDataStateManagement>(
                builder: (context, value, __) {
                  return AddPorterServiceBottomButtons(
                    textColor: context.adColors.whiteTextColor,
                    bgColor: context.adColors.black,
                    name: 'Confirm',
                    isLoading: value.isPorterAdding,
                    onTap: () => {
                      onAdditionalPorterConfirmTap(
                        context: context,
                        totalPorterRequired: noOfPorterNeedsToAdded,
                        baggageController: baggageController,
                        baggageCount: baggageCount,
                      ),
                    },
                  );
                },
              ),
              ADSizedBox(
                width: context.k_20,
              ),
            ],
          ),
        ],
      ).paddingBySide(left: context.k_16),
      headerTitle: 'Additional porter required',
    ).then((value) {
      final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
              ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
          0;
      final int freeAllowedPorter = pranaamAppDataStateManagement
              ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
          0;
      final List<PackageAddOn> packageAddOnList =
          pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn ?? [];
      if (packageAddOnList.isNotEmpty) {
        final int portersQuantity = pranaamAppDataStateManagement
                ?.cartDataResponse?.packageAddOn
                .firstWhere((element) => element.addOnServiceName == 'Porter')
                .qty ??
            0;
        noOfBagsAllowed =
            (portersQuantity + freeAllowedPorter) * maxAllowedBaggagePerPorter;
      } else {
        noOfBagsAllowed = freeAllowedPorter * maxAllowedBaggagePerPorter;
      }
    });
  }

  void onAdditionalPorterConfirmTap({
    required BuildContext context,
    required int totalPorterRequired,
    required int baggageCount,
    required TextEditingController baggageController,
  }) {
    final PackageAddOn packageAddOn =
        getPorterAddonFromPackageAddOnOrAvailableAddOn(
      pranaamAppDataStateManagement?.cartDataResponse,
    );
    pranaamAppDataStateManagement
        ?.cartAddOnItem(
          getAddCartAddOnRequest(
            packageAddOn,
            totalPorterRequired,
            packageAddOn.price,
          ).toJson(),
          context.read<AppSessionState>(),
        )
        .then(
          (value) => _handleAddPorterResponse(
            context,
            value,
            baggageCount: baggageCount,
            baggageController: baggageController,
          ),
        );
  }

  void _handleAddPorterResponse(
    BuildContext context,
    ADResponseState response, {
    required int baggageCount,
    required TextEditingController baggageController,
  }) {
    if (response.viewStatus == Status.complete) {
      baggageController.text = baggageCount.toString();
      totalBaggageErrorNotifier.value = '';
      Navigator.pop(context);
      ClickEvents.book_pranaam_add_on
          .logEvent(parameters: GaEvent.getInstance().parameterMap);
      context.read<AppSessionState>().updatePranaamCart(
            getAddonCount(),
          );
      PranaamBookingGaAnalytics().ecommerceEventAddCart(
        ClickEvents.add_to_cart,
        context.read<PranaamAppDataStateManagement>(),
      );
    } else if (response.viewStatus == Status.error) {
      SnackBarUtil.showSnackBar(
        context,
        response.message ?? 'Something went Wrong',
      );
    }
  }

  Future<void> removeAdditionalPorterBottomSheet(
    BuildContext context, {
    required int porterCountsForUpdate,
    required int baggageCount,
    required TextEditingController baggageController,
  }) async {
    await adShowBottomSheet(
      context: context,
      childWidget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Additional porter no
          Text(
            'Additional porter not required for your total baggage. We recommend you remove it from the cart.',
            style: ADTextStyle400.size16,
          ).paddingBySide(right: context.k_20),

          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              AddPorterServiceBottomButtons(
                textColor: context.adColors.black,
                bgColor: context.adColors.whiteTextColor,
                borderWidth: 1,
                name: 'Cancel',
                onTap: () => {
                  navigatorPopScreen(context),
                },
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              Consumer<PranaamAppDataStateManagement>(
                builder: (context, value, child) {
                  return AddPorterServiceBottomButtons(
                    textColor: context.adColors.whiteTextColor,
                    bgColor: context.adColors.black,
                    name: 'Remove',
                    isLoading: value.isPorterAdding,
                    onTap: () => onAdditionalPorterConfirmTap(
                      context: context,
                      totalPorterRequired: porterCountsForUpdate,
                      baggageCount: baggageCount,
                      baggageController: baggageController,
                    ),
                  );
                },
              ),
              ADSizedBox(
                width: context.k_20,
              ),
            ],
          ),
        ],
      ).paddingBySide(left: context.k_16),
      headerTitle: 'Remove porter',
    );
  }
}

class AdultControllers {
  ControllersAndFocus titleController;
  ControllersAndFocus firstNameController;
  ControllersAndFocus lastNameController;
  ControllersAndFocus countryController;
  ControllersAndFocus countryCodeController;
  ControllersAndFocus mobileController;
  ControllersAndFocus classController;
  ControllersAndFocus ageController;
  ControllersAndFocus passportNoController;
  ControllersAndFocus baggageCountController;
  ControllersAndFocus emailController;

  ValueNotifier<String> flag;

  AdultControllers.name(
    this.titleController,
    this.firstNameController,
    this.lastNameController,
    this.countryController,
    this.countryCodeController,
    this.mobileController,
    this.classController,
    this.ageController,
    this.passportNoController,
    this.baggageCountController,
    this.flag,
    this.emailController,
  );
}

class ControllersAndFocus {
  TextEditingController controller;
  FocusNode focusNode;

  ControllersAndFocus.name(this.controller, this.focusNode);
}

class ChildrenControllers {
  ControllersAndFocus genderController;
  ControllersAndFocus firstNameController;
  ControllersAndFocus lastNameController;
  ControllersAndFocus ageController;

  ChildrenControllers.name(
    this.genderController,
    this.firstNameController,
    this.lastNameController,
    this.ageController,
  );
}

class InfantControllers {
  ControllersAndFocus genderController;
  ControllersAndFocus firstNameController;
  ControllersAndFocus lastNameController;
  ControllersAndFocus ageController;

  InfantControllers.name(
    this.genderController,
    this.firstNameController,
    this.lastNameController,
    this.ageController,
  );
}

class PlacardCardControllers {
  ControllersAndFocus genderController;
  ControllersAndFocus fNameController;
  ControllersAndFocus lNameController;
  ControllersAndFocus countryController;
  ControllersAndFocus countryCodeController;
  ControllersAndFocus mobileController;
  ControllersAndFocus commentsController;
  ControllersAndFocus emailController;
  ValueNotifier<String> flag;

  PlacardCardControllers.name(
    this.genderController,
    this.fNameController,
    this.lNameController,
    this.countryController,
    this.countryCodeController,
    this.mobileController,
    this.commentsController,
    this.emailController,
    this.flag,
  );
}

class GSTControllers {
  ControllersAndFocus gstNumberController;
  ControllersAndFocus companyNameController;
  ControllersAndFocus mobileNumberController;
  ControllersAndFocus countryCodeController;
  ControllersAndFocus emailIDController;

  GSTControllers.name(
    this.gstNumberController,
    this.companyNameController,
    this.mobileNumberController,
    this.countryCodeController,
    this.emailIDController,
  );
}

class BillingControllers {
  ControllersAndFocus addressController;
  ControllersAndFocus pincodeController;
  ControllersAndFocus countryController;
  ControllersAndFocus stateController;
  ControllersAndFocus cityController;

  BillingControllers.name(
    this.addressController,
    this.pincodeController,
    this.countryController,
    this.stateController,
    this.cityController,
  );
}

class SameBillingControllers {
  ControllersAndFocus addressController;
  ControllersAndFocus pincodeController;
  ControllersAndFocus countryController;
  ControllersAndFocus stateController;
  ControllersAndFocus cityController;

  SameBillingControllers.name(
    this.addressController,
    this.pincodeController,
    this.countryController,
    this.stateController,
    this.cityController,
  );
}
