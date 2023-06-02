/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_traveller_details_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/bottom_bar_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_fare_details_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/car_info_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/views/cab_booking_form_builder.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/views/cab_booking_radio_buttons.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/views/cab_form_details_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_reward_points_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_traveller_form_utils.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabTravellerDetailScreen extends StatefulWidget {
  const CabTravellerDetailScreen({
    Key? key,
    required this.cabTravellerDetailsNavigateModel,
  }) : super(key: key);

  final CabTravellerDetailsNavigateModel cabTravellerDetailsNavigateModel;

  @override
  State<CabTravellerDetailScreen> createState() =>
      _CabTravellerDetailScreenState();
}

class _CabTravellerDetailScreenState extends State<CabTravellerDetailScreen> {
  final CabTravellerDetailState _cabTravellerDetailState =
      CabTravellerDetailState();
  final ScrollController scrollController = ScrollController();
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final _formKeyOfCabDetailForm = GlobalKey<FormState>();
  Timer? _timer;
  final timerInitiationLength = 5;
  final timerOtherCountryLength = 2;

  String selectedCountryCode = 'IN';

  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  ValueNotifier<String> flag = ValueNotifier(
    ProfileSingleton.profileSingleton.countryCodeData.flag ?? '',
  );

  @override
  void initState() {
    _cabTravellerDetailState
      ..cabCartDetailResponseModel =
          widget.cabTravellerDetailsNavigateModel.cabCartDetailResponseModel
      ..updateCabBookingFormBuilder =
          CabBookingFormBuilder.fromCabTravellerDetailResponse(
        onChange: onChangeOfForm,
        profileModel: context.read<AppSessionState>().profileModel,
      )
      ..isRewardPointsAvailable = (_cabTravellerDetailState
                  .cabCartDetailResponseModel?.cartDetail?.priceInfo?.loyalty ??
              0) >
          0;
    final billingAddress = context
        .read<AppSessionState>()
        .profileModel
        .personInfo
        ?.addresses
        ?.firstWhereOrNull(
          (address) => address.type?.toLowerCase() == AddressType.billing.name,
        );
    if (billingAddress != null) {
      _cabTravellerDetailState.defaultBillingAddress = UpdateBillingModel(
        billingAddress.line1?.trim() ?? '',
        billingAddress.country?.trim() ?? '',
        billingAddress.pinCode?.trim() ?? '',
        billingAddress.city?.trim() ?? '',
        billingAddress.state?.trim() ?? '',
      );
    }
    CabFormFieldsValidation.countryName = billingAddress?.country ?? 'India';
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    flag.value = _siteCoreStateManagement.getFlag();
    _cabTravellerDetailState
        .updateCabBookingFormBuilder?.updateTravellerForm.pinCode.controller
        .addListener(pinCodeListener);
    selectedCountryCode = _cabTravellerDetailState.updateCabBookingFormBuilder
            ?.updateTravellerForm.countryCode.selectedCountryCode ??
        'IN';
    super.initState();
  }

  void fetchStateCity() {
    _cabTravellerDetailState
        .searchPinCodeData(
      _cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm
              .pinCode.controller.text ??
          '',
    )
        .then((value) {
      if (value.viewStatus != Status.complete) {
        const duration = 2000;
        SnackBarUtil.showSnackBar(
          context,
          'please_enter_valid_pincode'.localize(context),
          duration,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_64 + context.k_30,
          ),
        );
      }
    });
  }

  void pinCodeListener() {
    if (_cabTravellerDetailState.isUpdateAfterEditing) {
      if (_timer != null) {
        _timer?.cancel();
        _cabTravellerDetailState.resetStateCity();
      }
      _cabTravellerDetailState
          .updateCabBookingFormBuilder?.updateTravellerForm.city.enable = false;
      _cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm
          .state.enable = false;
      if (_cabTravellerDetailState.updateCabBookingFormBuilder
              ?.updateTravellerForm.country.controller.text
              .toUpperCase() ==
          'INDIA') {
        if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                    ?.updateTravellerForm.pinCode.controller.text.length ??
                0) >
            timerInitiationLength) {
          _timer = Timer(const Duration(milliseconds: 1000), fetchStateCity);
        }
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.pinCode.controller.text.length ??
              0) >
          timerOtherCountryLength) {
        _timer = Timer(const Duration(milliseconds: 1000), fetchStateCity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CabTravellerDetailState>(
      viewModel: _cabTravellerDetailState,
      child: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 1,
            title: Text(
              'traveller_details'.localize(context),
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.blackTextColor),
            ),
            actions: [
              Center(
                child: Text(
                  'step_2/3'.localize(context),
                  style: ADTextStyle400.size14
                      .setFontSize(context.k_13)
                      .setTextColor(context.adColors.blackTextColor),
                ).paddingBySide(right: context.k_16),
              ),
            ],
          ),
          body: Selector<CabTravellerDetailState, bool>(
            selector: (
              context,
              stateClassObject,
            ) =>
                _cabTravellerDetailState.isUserInformationUpdated,
            builder: (
              BuildContext context,
              isUserInformationUpdated,
              Widget? child,
            ) {
              return Selector<CabTravellerDetailState, bool>(
                selector: (
                  context,
                  stateClassObject,
                ) =>
                    _cabTravellerDetailState.fetchingCityState,
                builder: (
                  BuildContext context,
                  fetchingCityState,
                  Widget? child,
                ) {
                  return AbsorbPointer(
                    absorbing: isUserInformationUpdated || fetchingCityState,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CabBookingRadioButtons(),
                                CabFormDetailsWidget(
                                  cabTravellerDetailState:
                                      _cabTravellerDetailState,
                                  flag: flag,
                                  keyOfCabTravellerDetail:
                                      _formKeyOfCabDetailForm,
                                  siteCoreStateManagement:
                                      _siteCoreStateManagement,
                                  onTap: () =>
                                      _navigateBillingEditingScreen(context),
                                  onChange: onChangeOfForm,
                                  selectedCountryCode: selectedCountryCode,
                                ),
                                Text(
                                  'booking_details'.localize(context),
                                  style: ADTextStyle700.size22.setTextColor(
                                    context.adColors.blackTextColor,
                                  ),
                                ).paddingBySide(
                                  bottom: context.k_20,
                                  top: context.k_40,
                                  left: context.k_16,
                                ),
                                CarInfoView(
                                  bookingDate: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.tripInfo
                                      ?.bookingDate,
                                  providerImage: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.securityKey
                                      ?.providerImage,
                                  vehicleImage: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.vehicleDetails
                                      ?.vehicleImage,
                                  vehicleType: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.vehicleDetails
                                      ?.vehicleType,
                                  vehicleTypeID: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.vehicleDetails
                                      ?.adlCabCategory,
                                  isFromPreBooking: true,
                                  isRideNow: _cabTravellerDetailState
                                          .cabCartDetailResponseModel
                                          ?.cartDetail
                                          ?.tripInfo
                                          ?.isRideNow ??
                                      false,
                                  cabInfo: _cabTravellerDetailState
                                      .cabCartDetailResponseModel
                                      ?.cartDetail
                                      ?.cabInfo,
                                ).paddingBySide(
                                  left: context.k_16,
                                  right: context.k_16,
                                ),
                                PickupAndDestinationAddressView(
                                  pickUpLocationText: _cabTravellerDetailState
                                          .cabCartDetailResponseModel
                                          ?.cartDetail
                                          ?.pickup
                                          ?.locationCode ??
                                      '',
                                  destinationLocationText:
                                      _cabTravellerDetailState
                                              .cabCartDetailResponseModel
                                              ?.cartDetail
                                              ?.drop
                                              ?.locationCode ??
                                          '',
                                ).paddingBySide(
                                  left: context.k_16,
                                  right: context.k_16,
                                  top: context.k_34,
                                  bottom: context.k_48 + context.k_4,
                                ),
                                Selector<CabTravellerDetailState, CartDetail?>(
                                  selector: (
                                    context,
                                    stateClassObject,
                                  ) =>
                                      _cabTravellerDetailState
                                          .cabCartDetailResponseModel
                                          ?.cartDetail,
                                  builder: (
                                    BuildContext context,
                                    cartDetail,
                                    Widget? child,
                                  ) {
                                    return Column(
                                      children: [
                                        CabFareDetailsView(
                                          shakeKey: shakeKey,
                                          priceInfo: _cabTravellerDetailState
                                              .cabCartDetailResponseModel
                                              ?.cartDetail
                                              ?.priceInfo,
                                          couponDiscount: cartDetail
                                                  ?.promoDetails?.promoValue
                                                  ?.toDouble() ??
                                              0.0,
                                          totalAmount: _cabTravellerDetailState
                                                  .cabCartDetailResponseModel
                                                  ?.cartDetail
                                                  ?.priceInfo
                                                  ?.discountPrice ??
                                              0,
                                        ).paddingBySide(
                                          bottom: !_cabTravellerDetailState
                                                  .isRewardPointsAvailable
                                              ? context.k_30
                                              : 0,
                                        ),
                                        if (_cabTravellerDetailState
                                            .isRewardPointsAvailable)
                                          CabRewardPointsView(
                                            loyaltyPoints: _cabTravellerDetailState
                                                    .cabCartDetailResponseModel
                                                    ?.cartDetail
                                                    ?.priceInfo
                                                    ?.loyalty ??
                                                0,
                                          ).paddingBySide(
                                            top: context.k_20,
                                            bottom: context.k_30,
                                          )
                                        else
                                          const SizedBox.shrink(),
                                      ],
                                    ).paddingBySide(
                                      left: context.k_16,
                                      right: context.k_16,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SafeArea(
                          child: BottomBarView(
                            isTravellerScreen: true,
                            price: FlightUtils.getAmountWithTwoDecimalPoint(
                              double.parse(
                                '${_cabTravellerDetailState.cabCartDetailResponseModel?.cartDetail?.priceInfo?.discountPrice ?? 0}',
                              ),
                            ),
                            onSubtitleTap: () =>
                                _viewDetailTap(scrollController),
                            onButtonTap: () => validateEmptyField(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _viewDetailTap(ScrollController scrollController) {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      shakeKey.currentState?.shake();
    } else {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void onChangeOfForm() {
    _cabTravellerDetailState
        .updateCabBookingFormBuilder?.updateTravellerForm.pinCode.controller
        .addListener(pinCodeListener);
  }

  Future<void> validateEmptyField() async {
    if (_formKeyOfCabDetailForm.currentState?.validate() == true) {
      final ADResponseState response =
          await _cabTravellerDetailState.updateCabCartDetail();
      if (response.viewStatus == Status.complete) {
        unawaited(context.read<AppSessionState>().getProfileDetails());
        await _cabTravellerDetailState.fetchCabCartDetail().then(
          (value) {
            widget.cabTravellerDetailsNavigateModel.adTapCallbackWithValue
                ?.call(value);
          },
        );

        navigateToScreenUsingNamedRouteWithArguments(
          context,
          genericPaymentScreen,
          argumentObject: _cabTravellerDetailState.cabCartDetailResponseModel,
        );
        CabGoogleAnalytics().sendGACabBookingTravellerPageOnSubmit(
          _cabTravellerDetailState.cabCartDetailResponseModel,
        );
      } else {
        const duration = 3000;
        SnackBarUtil.showSnackBar(
          context,
          response.message ?? 'ADLMS02'.localize(context),
          duration,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_64 + context.k_30,
          ),
        );
      }
    } else {
      if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.firstName.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.firstName,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.lastName.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.lastName,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.contactNumber.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.contactNumber,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.contactNumber.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.emailAddress,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.emailAddress.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.emailAddress,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.gstNumber.controller.text.isEmpty ??
              false) &&
          (_cabTravellerDetailState.checkForGst)) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.gstNumber,
        );
      } else if ((_cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .gstCompanyName
                  .controller
                  .text
                  .isEmpty ??
              false) &&
          (_cabTravellerDetailState.checkForGst)) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.gstCompanyName,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.gstAddress.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.gstAddress,
        );
      } else if ((_cabTravellerDetailState.updateCabBookingFormBuilder
                  ?.updateTravellerForm.state.controller.text ??
              '')
          .isEmpty) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.pinCode,
        );
      } else if (_cabTravellerDetailState.updateCabBookingFormBuilder
              ?.updateTravellerForm.gstAddress.controller.text.isEmpty ??
          false) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.gstAddress,
        );
      } else if (_cabTravellerDetailState.updateCabBookingFormBuilder
              ?.updateTravellerForm.state.controller.text.isEmpty ??
          false) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.pinCode,
        );
      } else if (_cabTravellerDetailState.updateCabBookingFormBuilder
              ?.updateTravellerForm.city.controller.text.isEmpty ??
          false) {
        scrollToNextFormFilled(
          _cabTravellerDetailState
              .updateCabBookingFormBuilder?.updateTravellerForm.pinCode,
        );
      }
    }
  }

  void scrollToNextFormFilled(ADEditableTextModel? text) {
    Scrollable.ensureVisible(
      text?.globalKey?.currentContext ?? context,
    );
    FocusScope.of(context).requestFocus(
      text?.focusNode,
    );
  }

  void _navigateBillingEditingScreen(
    BuildContext context,
  ) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      genericBillingScreen,
      argumentObject: TravellerDetailNavigateModel(
        _cabTravellerDetailState.defaultBillingAddress,
        (billingDetailFormModel) => {
          if (billingDetailFormModel != null)
            {
              _cabTravellerDetailState.defaultBillingAddress =
                  billingDetailFormModel,
              _cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .gstAddress
                  .controller
                  .text = billingDetailFormModel.address.trim(),
              _cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .country
                  .controller
                  .text = billingDetailFormModel.country.trim(),
              CabFormFieldsValidation.countryName =
                  billingDetailFormModel.country.trim(),
              _cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .state
                  .controller
                  .text = billingDetailFormModel.state.trim(),
              _cabTravellerDetailState.isUpdateAfterEditing = false,
              _cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .pinCode
                  .controller
                  .text = billingDetailFormModel.pinCode.trim(),
              _cabTravellerDetailState
                  .updateCabBookingFormBuilder
                  ?.updateTravellerForm
                  .city
                  .controller
                  .text = billingDetailFormModel.city.trim(),
              _cabTravellerDetailState.updateBillingDetailAfterEdit(),
            },
        },
      ),
    );
  }
}
