/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/fare_detail_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/review_flight_status_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/billing_detail_of_traveller.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/contact_detail_of_traveller.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/flight_source_destination_address.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/gst_form_and_send_detail_on_whatsapp.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/input_controller_traveller_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/auto_text_size/auto_size_text_main.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for showing passenger form and add traveller for booking
class TravellersDetailsScreen extends StatefulWidget {
  final FlightViewItineraryResponseModel flightViewItineraryResponseModel;

  const TravellersDetailsScreen({
    Key? key,
    required this.flightViewItineraryResponseModel,
  }) : super(key: key);

  @override
  State<TravellersDetailsScreen> createState() =>
      _TravellersDetailsScreenState();
}

class _TravellersDetailsScreenState extends State<TravellersDetailsScreen> {
  /// this is use for height of elevated button
  double heightOfButton = 52.sp;

  /// this is use for scroll controller for single child scroll view
  final ScrollController _scrollController = ScrollController();

  /// this bool is use for check condition
  bool isCheckBoxSelected = false;

  /// this key is use for validate form
  final _formKey = GlobalKey<FormState>();

  /// this is use for strip on header
  final double stepTextSize = 13;

  /// this key use for fare summery
  final shakeKey = GlobalKey<ShakeWidgetState>();

  final double buttonWidth = 200.sp;
  final double buttonHeight = 52.sp;

  /// this variable is use after scroll on click button
  final double maxScroll = 200.sp;

  double stepGranularity = 0.1;

  ProfileModel? profileModel;

  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  /// we are creating object of state class and set default value of first time
  TravellerDetailState provider = TravellerDetailState(
    checkForGst: false,
    checkForTermsAndCondition: false,
    checkForWhatsapp: false,
    isAllFieldValidated: false,
  );

  /// list for reviewFlightStatus
  List flightStatusList = [
    FlightStatusClass(name: 'Flight Details', statusCode: 2),
    FlightStatusClass(name: 'Traveller Details', statusCode: 1),
    FlightStatusClass(name: 'Payment', statusCode: 0),
  ];

  ///It will update ADResponseState status related view itinerary

  void initializeFormData() {
    if (widget.flightViewItineraryResponseModel.paxInfoList?.first.personName
            ?.firstName ==
        '') {
      context.read<FlightCommonState>().countryCodeData =
          ProfileSingleton.profileSingleton.countryCodeData;
    } else {
      final countryAccessCode = widget.flightViewItineraryResponseModel
              .contactDetail?.contactNumber?.first.countryAccessCode ??
          ProfileSingleton.profileSingleton.countryCodeData.callingCode;
      context.read<FlightCommonState>().countryCodeData = context
          .read<SiteCoreStateManagement>()
          .getCountryCodeDataWithCountryCode(countryAccessCode ?? '+91');
    }

    final CountryCodeData countryCodeData =
        context.read<FlightCommonState>().countryCodeData ??
            context.read<SiteCoreStateManagement>().countryCodeIndia;
    if (countryCodeData.max.isNullOrEmpty) {
      countryCodeData.max = '15';
    }
    provider.formBuilderObject = TextFormBuilder.fromItineraryResponseModel(
      flightViewItineraryResponseModel: widget.flightViewItineraryResponseModel,
      onChange: onChangeOfForm,
      profileModel: context.read<AppSessionState>().profileModel,
      countryCodeData: countryCodeData,
      country: _siteCoreStateManagement.country,
    );
    final billingAddress =
        profileModel?.personInfo?.addresses?.firstWhereOrNull(
      (address) => address.type?.toLowerCase() == AddressType.billing.name,
    );
    if (billingAddress != null) {
      provider.setIsCheckGst(value: true);
    }
  }

  ///This function call every time if change in textformfield text to enable button on validation
  void onChangeOfForm() {
    provider.validateAll();
  }

  /// This method is use for some value update according to response of update passenger
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    profileModel = context.read<AppSessionState>().profileModel;
    if (widget.flightViewItineraryResponseModel.gstDetails != null &&
        (widget.flightViewItineraryResponseModel.gstDetails?.gstNumber ?? '')
            .isNotEmpty) {
      provider
        ..checkForGstValue(value: true, profileModel: profileModel)
        ..checkForConditionValue(value: true);
    } else {
      provider.checkForGstValue(value: false);
    }
    initializeFormData();
    ScreenEvents.traveller_details.log();
    // _scrollController.addListener(() {
    //   adLog(
    //     '_scrollController_scrollController :${_scrollController.offset}',
    //   );
    // });
  }

  /// this method is used to dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /// this method is use for set colour on checkbox
  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return context.adColors.greyTextColor;
    }
    return context.adColors.black;
  }

  void _onCheckBoxTap(bool? value) {
    isCheckBoxSelected = value ?? false;
    provider.checkForConditionValue(
      value: value ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<TravellerDetailState>(
      viewModel: provider,
      child: Selector<TravellerDetailState, ADResponseState>(
        selector: (context, viewModel) => viewModel.updatePassengerDetailsData,
        builder: (context, valueParent, Widget? child) {
          final rewardsPoints =
              widget.flightViewItineraryResponseModel.loyaltyPotentialPoint ??
                  0;
          return Selector<TravellerDetailState, ADResponseState>(
            selector: (context, viewModel) =>
                viewModel.updatePassengerDetailsData,
            builder: (context, valueParent, Widget? child) {
              return AbsorbPointer(
                absorbing: valueParent.viewStatus == Status.loading,
                child: Selector<TravellerDetailState, bool>(
                  selector: (context, viewModel) => viewModel.fetchingCityState,
                  builder: (context, valueDataFre, Widget? child) {
                    return AbsorbPointer(
                      absorbing: valueDataFre,
                      child: Scaffold(
                        backgroundColor: context.adColors.whiteTextColor,

                        /// this is showing app bar of screen
                        appBar: AppBar(
                          backgroundColor: context.adColors.whiteTextColor,
                          // leading: GestureDetector(
                          //   behavior: HitTestBehavior.translucent,
                          //   onTap: () => navigatorPopScreen(context),
                          //   child: Icon(
                          //     Platform.isIOS
                          //         ? Icons.arrow_back_ios
                          //         : Icons.arrow_back_outlined,
                          //     size: context.k_20,
                          //   ),
                          // ).paddingBySide(left: context.k_10, right: context.k_10),
                          elevation: 0,
                          title: Text(
                            'travellers_details'.localize(context),
                            style: ADTextStyle700.size22
                                .setTextColor(context.adColors.black),
                          ),
                          actions: [
                            Center(
                              child: Text(
                                'Step 2/3',
                                style: ADTextStyle400.size14
                                    .setFontSize(stepTextSize),
                              ).paddingBySide(right: context.k_16),
                            ),
                          ],
                        ),
                        body: Column(
                          children: [
                            // ReviewFlightStatusView(
                            //   flightStatusList: flightStatusList,
                            // ).paddingBySide(bottom: context.k_30, top: context.k_26),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  GestureDetector(
                                    onTap: () => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    child: SafeArea(
                                      child: SingleChildScrollView(
                                        controller: _scrollController,
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ADSizedBox(
                                                height: context.k_24,
                                              ),

                                              /// this is an use for show flight destination and source detail and time
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  context.k_8,
                                                ),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: widget
                                                      .flightViewItineraryResponseModel
                                                      .flightReviewDetailModel
                                                      ?.flightReviewDetailInfo
                                                      ?.length,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () =>
                                                          navigatorPopScreen(
                                                        context,
                                                      ),
                                                      child: Ink(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: context
                                                              .adColors
                                                              .containerGreyBg,
                                                        ),
                                                        child:
                                                            FlightSourceDestinationAddress(
                                                          flightSegmentData: widget
                                                              .flightViewItineraryResponseModel
                                                              .flightReviewDetailModel
                                                              ?.flightReviewDetailInfo?[index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ).paddingBySide(
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),
                                              /*if (widget
                                                      .flightViewItineraryResponseModel
                                                      .promoCoupon !=
                                                  null)
                                                Container(
                                                  height: context.k_38,
                                                  width: double.infinity,
                                                  //TODO: Add this color in style
                                                  color:
                                                      const Color(0xffebf8f3),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'lib/assets/images/svg/icons/flight/percentage_icon.svg',
                                                      ),
                                                      SizedBox(
                                                        width: context.k_10,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            AutoSizeText.rich(
                                                          TextSpan(
                                                            style: TextStyle(
                                                              fontSize:
                                                                  context.k_16,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    '${widget.flightViewItineraryResponseModel.promoCoupon?.promoCode} ',
                                                                style: ADTextStyle600
                                                                    .size16
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    '${'coupon_applied'.localize(context)}. ',
                                                                style: ADTextStyle400
                                                                    .size16
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 't_and_c_apply'
                                                                    .localize(
                                                                  context,
                                                                ),
                                                                style: ADTextStyle400
                                                                    .size12
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                                recognizer:
                                                                    TapGestureRecognizer()
                                                                      ..onTap =
                                                                          () {
                                                                        if (widget.flightViewItineraryResponseModel.promoCoupon?.promoCode?.isNotEmpty ??
                                                                            false) {
                                                                          navigateToScreenUsingNamedRouteWithArguments(
                                                                            context,
                                                                            offerDetail,
                                                                            rootNavigator:
                                                                                false,
                                                                            argumentObject:
                                                                                OfferKeyModel(
                                                                              id: widget.flightViewItineraryResponseModel.promoCoupon?.promoCode,
                                                                              title: widget.flightViewItineraryResponseModel.promoCoupon?.promoCode,
                                                                              fetchDataFromPromoCode: true,
                                                                              showBookNowButton: false,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                              ),
                                                            ],
                                                          ),
                                                          minFontSize: 0,
                                                          maxLines: 1,
                                                          stepGranularity:
                                                              stepGranularity,
                                                        ),
                                                      ),
                                                    ],
                                                  ).paddingBySide(
                                                    left: context.k_16,
                                                  ),
                                                ).paddingBySide(
                                                  top: context.k_16,
                                                  left: context.k_16,
                                                  right: context.k_16,
                                                ),*/
                                              Text(
                                                'enter_name_mention'
                                                    .localize(context),
                                                style: ADTextStyle400.size16
                                                    .setTextColor(
                                                  context.adColors
                                                      .darkGreyTextColor,
                                                ),
                                              ).paddingBySide(
                                                top: context.k_24,
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),

                                              /// it is use for create run time passenger form
                                              MediaQuery.removePadding(
                                                context: context,
                                                removeBottom: true,
                                                removeTop: true,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: provider
                                                          .formBuilderObject
                                                          ?.formData
                                                          .length ??
                                                      0,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    final onePaxInfo = provider
                                                        .formBuilderObject
                                                        ?.formData[index];
                                                    return InputControllerTravellerDetails(
                                                      data: onePaxInfo,
                                                      onPress: () => {},
                                                    );
                                                  },
                                                ).paddingBySide(
                                                  left: context.k_16,
                                                  right: context.k_16,
                                                ),
                                              ),

                                              Container(
                                                height: context.k_8,
                                                color: context
                                                    .adColors.containerGreyBg,
                                              ).paddingBySide(
                                                top: context.k_30,
                                              ),

                                              // this class is use for contact details
                                              ContactDetailOfTraveller(
                                                contactDetails: provider
                                                    .formBuilderObject
                                                    ?.contactDetails,
                                                flightViewItineraryResponseModel:
                                                    widget
                                                        .flightViewItineraryResponseModel,
                                              ).paddingBySide(
                                                top: context.k_30,
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),

                                              // it is use for gst form
                                              GstFormAndSendDetailOnWhatsapp(
                                                gstDetail: provider
                                                    .formBuilderObject
                                                    ?.gstDetails,
                                                checkForGstValue: (value) =>
                                                    provider.checkForGstValue(
                                                  value: value,
                                                  profileModel: profileModel,
                                                ),
                                                checkForWhatsappValue:
                                                    (value) => provider
                                                        .checkForWhatsAppValue(
                                                  value: value,
                                                ),
                                              ).paddingBySide(
                                                top: context.k_10,
                                              ),

                                              Selector<TravellerDetailState,
                                                  bool>(
                                                selector: (context, model) =>
                                                    model.checkForGst,
                                                builder:
                                                    (context, value, child) =>
                                                        Visibility(
                                                  visible: !value,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: context.k_8,
                                                        color: context.adColors
                                                            .containerGreyBg,
                                                      ),
                                                      BillingDetailOfTraveller(
                                                        billingDetails: provider
                                                            .formBuilderObject
                                                            ?.billingDetail,
                                                        gstDetail: provider
                                                            .formBuilderObject
                                                            ?.gstDetails,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: context.k_8,
                                                color: context
                                                    .adColors.containerGreyBg,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: context
                                                      .adColors.containerGreyBg,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      context.k_10,
                                                    ),
                                                  ),
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'by_proceeding'
                                                        .localize(context),
                                                    style: ADTextStyle400.size14
                                                        .setTextColor(
                                                      context.adColors.black,
                                                    ),
                                                    children: [
                                                      WidgetSpan(
                                                        child: InkWell(
                                                          child: Text(
                                                            'T_C'.localize(
                                                              context,
                                                            ),
                                                            style: ADTextStyle600
                                                                .size14
                                                                .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .blackTextColor,
                                                                )
                                                                .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          ),
                                                          onTap: () =>
                                                              navigateToScreenUsingNamedRouteWithArguments(
                                                            context,
                                                            webViewContainer,
                                                            argumentObject:
                                                                WebViewModel(
                                                              title:
                                                                  'terms_and_condition'
                                                                      .localize(
                                                                context,
                                                              ),
                                                              url:
                                                                  '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsFlightBooking}',

                                                              ///TODO for temporary,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '.',
                                                        style: ADTextStyle600
                                                            .size14
                                                            .setTextColor(
                                                          context.adColors
                                                              .blackTextColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ).paddingBySide(
                                                  top: context.k_20,
                                                  bottom: context.k_20,
                                                  right: context.k_20,
                                                  left: context.k_20,
                                                ),
                                              ).paddingBySide(
                                                left: context.k_16,
                                                right: context.k_16,
                                                top: context.k_40,
                                              ),
                                              if (widget
                                                      .flightViewItineraryResponseModel
                                                      .promoCoupon !=
                                                  null)
                                                Container(
                                                  height: context.k_38,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffebf8f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      context.k_4,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'lib/assets/images/svg/icons/flight/percentage_icon.svg',
                                                      ),
                                                      SizedBox(
                                                        width: context.k_10,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            AutoSizeText.rich(
                                                          TextSpan(
                                                            style: TextStyle(
                                                              fontSize:
                                                                  context.k_16,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    '${widget.flightViewItineraryResponseModel.promoCoupon?.promoCode} ',
                                                                style: ADTextStyle600
                                                                    .size16
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    '${'coupon_applied'.localize(context)}. ',
                                                                style: ADTextStyle400
                                                                    .size16
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 't_and_c_apply'
                                                                    .localize(
                                                                  context,
                                                                ),
                                                                style: ADTextStyle400
                                                                    .size12
                                                                    .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .successInfoMsg,
                                                                ),
                                                                recognizer:
                                                                    TapGestureRecognizer()
                                                                      ..onTap =
                                                                          () {
                                                                        adLog(
                                                                          'onTap T&C',
                                                                        );
                                                                        /*if (widget.flightViewItineraryResponseModel.promoCoupon?.promoCode?.isNotEmpty ??
                                                                            false) {
                                                                          navigateToScreenUsingNamedRouteWithArguments(
                                                                            context,
                                                                            offerDetail,
                                                                            rootNavigator:
                                                                                false,
                                                                            argumentObject:
                                                                                OfferKeyModel(
                                                                              id: widget.flightViewItineraryResponseModel.promoCoupon?.promoCode,
                                                                              title: widget.flightViewItineraryResponseModel.promoCoupon?.promoCode,
                                                                              fetchDataFromPromoCode: true,
                                                                              showBookNowButton: false,
                                                                            ),
                                                                          );
                                                                        }*/
                                                                      },
                                                              ),
                                                            ],
                                                          ),
                                                          minFontSize: 0,
                                                          maxLines: 1,
                                                          stepGranularity:
                                                              stepGranularity,
                                                        ),
                                                      ),
                                                    ],
                                                  ).paddingBySide(
                                                    left: context.k_16,
                                                  ),
                                                ).paddingBySide(
                                                  top: context.k_30,
                                                  left: context.k_16,
                                                  right: context.k_16,
                                                ),

                                              /// it is use for fare detail for passengers
                                              FareDetailView(
                                                shakeKeyReview: shakeKey,
                                                pricedItineraryList: widget
                                                    .flightViewItineraryResponseModel
                                                    .pricedItineraries,
                                                paxInfoList: widget
                                                        .flightViewItineraryResponseModel
                                                        .paxInfoList ??
                                                    [],
                                                reviewScreenType:
                                                    ReviewScreenType.traveller,
                                                priceSummary: widget
                                                    .flightViewItineraryResponseModel
                                                    .pricingSummary,
                                                insurance: widget
                                                    .flightViewItineraryResponseModel
                                                    .insurance,
                                                zeroCancellationSummary: widget
                                                    .flightViewItineraryResponseModel
                                                    .zeroCancellationSummary,
                                              ),
                                              LoyaltyPointsComponent(
                                                points: rewardsPoints,
                                                bottomMargin: context.k_30,
                                              ).paddingBySide(
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),
                                              Visibility(
                                                visible: false,
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Selector<
                                                        TravellerDetailState,
                                                        bool>(
                                                      selector: (
                                                        context,
                                                        model,
                                                      ) =>
                                                          model
                                                              .checkForTermsAndCondition,
                                                      builder: (
                                                        context,
                                                        value,
                                                        child,
                                                      ) =>
                                                          Checkbox(
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        value: value,
                                                        splashRadius:
                                                            context.k_30,
                                                        checkColor: context
                                                            .adColors
                                                            .whiteTextColor,
                                                        fillColor:
                                                            MaterialStateProperty
                                                                .resolveWith(
                                                          _getColor,
                                                        ),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        side: BorderSide(
                                                          color: context
                                                              .adColors
                                                              .greyTextColor,
                                                        ),
                                                        onChanged:
                                                            (bool? value) =>
                                                                _onCheckBoxTap(
                                                          value ?? false,
                                                        ),
                                                      ),
                                                    ),
                                                    ADSizedBox(
                                                      width: context.k_10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          _onCheckBoxTap(
                                                        !isCheckBoxSelected,
                                                      ),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          text:
                                                              'terms_and_condition_content'
                                                                  .localize(
                                                            context,
                                                          ),
                                                          style: ADTextStyle400
                                                              .size14
                                                              .setTextColor(
                                                            context
                                                                .adColors.black,
                                                          ),
                                                          children: [
                                                            WidgetSpan(
                                                              child: InkWell(
                                                                child: Text(
                                                                  'T_C'
                                                                      .localize(
                                                                    context,
                                                                  ),
                                                                  style: ADTextStyle600
                                                                      .size14
                                                                      .setTextColor(
                                                                        context
                                                                            .adColors
                                                                            .blackTextColor,
                                                                      )
                                                                      .copyWith(
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                                onTap: () =>
                                                                    navigateToScreenUsingNamedRouteWithArguments(
                                                                  context,
                                                                  webViewContainer,
                                                                  argumentObject:
                                                                      WebViewModel(
                                                                    title: 'terms_and_condition'
                                                                        .localize(
                                                                      context,
                                                                    ),
                                                                    url:
                                                                        '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsFlightBooking}',

                                                                    ///TODO for temporary,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '.',
                                                              style: ADTextStyle600
                                                                  .size14
                                                                  .setTextColor(
                                                                context.adColors
                                                                    .blackTextColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ).paddingBySide(
                                                        left: context.k_38,
                                                      ),
                                                    ),
                                                    //  const Icon(Icons.wallet_giftcard),
                                                  ],
                                                ).paddingBySide(
                                                  left: context.k_6,
                                                  right: context.k_16,
                                                  top: context.k_26,
                                                  bottom: context.k_64,
                                                ),
                                              ),
                                              // Row(
                                              //   crossAxisAlignment: CrossAxisAlignment.start,
                                              //   children: [
                                              //     Selector<TravellerDetailState, bool>(
                                              //       selector: (context, model) =>
                                              //           model.checkForTermsAndCondition,
                                              //       builder: (context, value, child) => Checkbox(
                                              //         focusColor: Colors.blue,
                                              //         materialTapTargetSize:
                                              //             MaterialTapTargetSize.padded,
                                              //         splashRadius: context.k_30,
                                              //         value: value,
                                              //         checkColor: context.adColors.whiteTextColor,
                                              //         fillColor:
                                              //             MaterialStateProperty.resolveWith(
                                              //           _getColor,
                                              //         ),
                                              //         shape: RoundedRectangleBorder(
                                              //           borderRadius: BorderRadius.all(
                                              //             Radius.circular(
                                              //               context.k_4,
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         side: BorderSide(
                                              //           color: context.adColors.greyTextColor,
                                              //         ),
                                              //         onChanged: (bool? value) =>
                                              //             _onCheckBoxTap(value),
                                              //       ),
                                              //     ),
                                              //     ADSizedBox(
                                              //       width: context.k_2,
                                              //     ),
                                              //     Expanded(
                                              //       child: RichText(
                                              //         text: TextSpan(
                                              //           text: 'terms_and_condition_content'
                                              //               .localize(context),
                                              //           style: ADTextStyle400.size14.setTextColor(
                                              //             context.adColors.neutralInfoMsg,
                                              //           ),
                                              //           children: [
                                              //             WidgetSpan(
                                              //               child: InkWell(
                                              //                 child: Text(
                                              //                   'terms_and_condition'
                                              //                       .localize(context),
                                              //                   style: ADTextStyle500.size14
                                              //                       .setTextColor(
                                              //                         context.adColors
                                              //                             .neutralInfoMsg,
                                              //                       )
                                              //                       .copyWith(
                                              //                         decoration: TextDecoration
                                              //                             .underline,
                                              //                       ),
                                              //                 ),
                                              //                 onTap: () =>
                                              //                     adLog('termsOfUse'),
                                              //               ),
                                              //             ),
                                              //             TextSpan(
                                              //               text: 'and_allow_sharing'
                                              //                   .localize(context),
                                              //               style: ADTextStyle400.size14
                                              //                   .setTextColor(
                                              //                 context.adColors.neutralInfoMsg,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ).paddingBySide(
                                              //   top: context.k_30,
                                              //   right: context.k_16,
                                              // ),
                                              // Selector<TravellerDetailState, bool>(
                                              //   selector: (context, detailProvider) =>
                                              //       detailProvider.isAllFieldValidated,
                                              //   builder: (context, value, Widget? child) {
                                              // Padding(
                                              //   padding: EdgeInsets.all(context.k_16),
                                              //   child: ElevatedButton(
                                              //     style: ElevatedButton.styleFrom(
                                              //       primary: context.adColors.blueColor,
                                              //       minimumSize: Size(
                                              //         double.infinity,
                                              //         heightOfButton,
                                              //       ),
                                              //       shape: const StadiumBorder(),
                                              //     ),
                                              //
                                              //     /// when we click on button validate all field of traveller detail form
                                              //     onPressed: () => continueToPayment(),
                                              //     // valueParent.viewStatus == Status.loading
                                              //     //     ? () => continueToPayment()
                                              //     //     : value
                                              //     //         ? () => {
                                              //     //               setState(() {
                                              //     //                 FocusManager.instance
                                              //     //                     .primaryFocus
                                              //     //                     ?.unfocus();
                                              //     //                 if (provider
                                              //     //                     .isAllFieldValidated) {
                                              //     //                   continueToPayment();
                                              //     //                 }
                                              //     //               }),
                                              //     //             }
                                              //     //         : null,
                                              //     child: valueParent.viewStatus ==
                                              //             Status.loading
                                              //         ? ADDotProgressView(
                                              //             color:
                                              //                 context.adColors.whiteTextColor,
                                              //           )
                                              //         : Text(
                                              //             'continue_to_payment'
                                              //                 .localize(context),
                                              //             style: ADTextStyle700.size16
                                              //                 .setTextColor(
                                              //               context.adColors.whiteTextColor,
                                              //             ),
                                              //           ),
                                              //   ),
                                              // ),
                                              //   },
                                              // ),
                                              // ADSizedBox(
                                              //   height: context.k_20,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).paddingBySide(bottom: context.k_60),
                                  SafeArea(
                                    child: StickyPriceBar(
                                      price:
                                          FlightUtils.getPriceFormatWithSymbol(
                                        price: widget
                                                .flightViewItineraryResponseModel
                                                .pricingSummary
                                                ?.totalFare
                                                ?.toDouble() ??
                                            0,
                                      ),
                                      onSubtitleTap: () =>
                                          scrollToDown(_scrollController),
                                      customButton: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                            Size(buttonWidth, buttonHeight),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                context.k_28,
                                              ),
                                            ),
                                          ),
                                          side: MaterialStateProperty.all(
                                            BorderSide.none,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            context.adColors.blueColor,
                                          ),
                                        ),
                                        onPressed: () => continueToPayment(),
                                        child: valueParent.viewStatus ==
                                                Status.loading
                                            ? ADDotProgressView(
                                                color: context
                                                    .adColors.whiteTextColor,
                                              )
                                            : Text(
                                                'Proceed to Pay',
                                                style: ADTextStyle700.size16
                                                    .setTextColor(
                                                  context
                                                      .adColors.whiteTextColor,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void scrollToDown(ScrollController controllerAll) {
    if (controllerAll.position.pixels ==
        controllerAll.position.maxScrollExtent) {
      shakeKey.currentState?.shake();
    } else {
      controllerAll.animateTo(
        controllerAll.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void _scrollToTop() {
    const int second = 1;
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: second),
      curve: Curves.linear,
    );
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<bool> _isContactNumberValid() async {
    final phoneNumber = provider
            .formBuilderObject?.contactDetails.contactNumber.controller.text ??
        '';
    final countryCode = provider.formBuilderObject?.contactDetails.countryCode
            .selectedCountryCode ??
        'IN';
    final isPhoneNumberValid = await FlightValidations.checkCountryValidation(
      phoneNumber,
      countryCode,
    );
    return isPhoneNumberValid;
  }

  bool updateValueOfTitle() {
    bool titleUpdated = true;
    for (int index = 0;
        index < (provider.formBuilderObject?.formData.length ?? 0);
        index++) {
      titleUpdated = provider.setValueForTitle(
        provider.formBuilderObject?.formData[index].title.controller,
      );
      if (!titleUpdated) {
        break;
      }
    }
    return titleUpdated;
  }

  /// its is use for when we validate all field of form
  Future<void> continueToPayment() async {
    bool checkForTravellerDetails = false;
    bool checkForContactDetail = false;
    final isPhoneNUmberValid = await _isContactNumberValid();

    if (_formKey.currentState?.validate() == true &&
            updateValueOfTitle() &&
            isPhoneNUmberValid
        // &&
        // provider.isAllFieldValidated
        ) {
      final isDuplicateEntryFound =
          provider.formBuilderObject?.isDuplicateDataInForm() ?? false;
      if (isDuplicateEntryFound) {
        SnackBarUtil.showSnackBar(
          context,
          'duplicate_traveller_found'.localize(context),
        );
      } else {
        //ga events calling on detail submit
        FlightBookingGaAnalytics().travelerDetailsAnalyticsData(
          widget.flightViewItineraryResponseModel,
          ClickEvents.book_flight_traveller_detail_submit,
        );
        FocusManager.instance.primaryFocus?.unfocus();
        await provider.updatePassengerDetails(
          _siteCoreStateManagement.country,
          widget.flightViewItineraryResponseModel.itineraryId ?? '',
          (value) {
            valueUpdateAccordingToValue(value);
          },
          context.read<FlightCommonState>().reviewedUserID ?? '',
        );
      }
    } else {
      for (int index = 0;
          index < (provider.formBuilderObject?.formData.length ?? 0);
          index++) {
        final bool titleUpdated = provider.setValueForTitle(
          provider.formBuilderObject?.formData[index].title.controller,
        );
        adLog(titleUpdated.toString());
      }

      /// this is use for auto scroll
      for (int index = 0;
          index < (provider.formBuilderObject?.formData.length ?? 0);
          index++) {
        checkForTravellerDetails = true;
        if (provider.formBuilderObject?.formData[index].title.controller.text ==
            'clickButtonError') {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].title.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].firstName
                .controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;

          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].firstName.globalKey
                    ?.currentContext ??
                context,
          );
          FocusScope.of(context).requestFocus(
            provider.formBuilderObject?.formData[index].firstName.focusNode,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].lastName
                .controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;

          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].lastName.globalKey
                    ?.currentContext ??
                context,
          );
          FocusScope.of(context).requestFocus(
            provider.formBuilderObject?.formData[index].lastName.focusNode,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].dateOfBirth
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].dateOfBirth?.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].passport
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].passport?.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].nationality
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].nationality?.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].issuedCountryName
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].issuedCountryName
                    ?.globalKey?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].issueDate
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].issueDate?.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        } else if (provider.formBuilderObject?.formData[index].expiryDate
                ?.controller.text.isEmpty ??
            false) {
          checkForTravellerDetails = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.formData[index].expiryDate?.globalKey
                    ?.currentContext ??
                context,
          );
          break;
        }
      }
      if (checkForTravellerDetails) {
        checkForContactDetail = true;
        if (provider.formBuilderObject?.contactDetails.contactNumber.controller
                .text.isEmpty ??
            false) {
          checkForContactDetail = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.contactDetails.contactNumber.globalKey
                    ?.currentContext ??
                context,
          );
          FocusScope.of(context).requestFocus(
            provider.formBuilderObject?.contactDetails.contactNumber.focusNode,
          );
        } else if (provider.formBuilderObject?.contactDetails.emailAddress
                .controller.text.isEmpty ??
            false) {
          checkForContactDetail = false;
          await Scrollable.ensureVisible(
            provider.formBuilderObject?.contactDetails.emailAddress.globalKey
                    ?.currentContext ??
                context,
          );
          FocusScope.of(context).requestFocus(
            provider.formBuilderObject?.contactDetails.emailAddress.focusNode,
          );
        }
      }
      checkValidationForGst(checkForContactDetail: checkForContactDetail);
    }
  }

  /// this is use for check validation of gst
  void checkValidationForGst({required bool checkForContactDetail}) {
    if (checkForContactDetail && provider.checkForGst) {
      if (provider.formBuilderObject?.gstDetails?.gstNumber.controller.text
              .isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.gstNumber.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.gstNumber.focusNode,
        );
      } else if (provider.formBuilderObject?.gstDetails?.gstCompanyName
              .controller.text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.gstCompanyName.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.gstCompanyName.focusNode,
        );
      } else if (provider.formBuilderObject?.gstDetails?.gstAddress.controller
              .text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.gstAddress.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.gstAddress.focusNode,
        );
      } else if (provider
              .formBuilderObject?.gstDetails?.pinCode.controller.text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.pinCode.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.pinCode.focusNode,
        );
      } else if (provider
              .formBuilderObject?.gstDetails?.state.controller.text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.state.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.state.focusNode,
        );
      } else if (provider
              .formBuilderObject?.gstDetails?.city.controller.text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.gstDetails?.city.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.gstDetails?.city.focusNode,
        );
      }
    } else if (checkForContactDetail && !provider.checkForGst) {
      if (provider.formBuilderObject?.billingDetail?.address.controller.text
              .isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.billingDetail?.address.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.billingDetail?.address.focusNode,
        );
      } else if (provider.formBuilderObject?.billingDetail?.pinCode.controller
              .text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.billingDetail?.pinCode.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.billingDetail?.pinCode.focusNode,
        );
      } else if (provider.formBuilderObject?.billingDetail?.state.controller
              .text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.billingDetail?.state.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.billingDetail?.state.focusNode,
        );
      } else if (provider
              .formBuilderObject?.billingDetail?.city.controller.text.isEmpty ??
          false) {
        Scrollable.ensureVisible(
          provider.formBuilderObject?.billingDetail?.city.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.formBuilderObject?.billingDetail?.city.focusNode,
        );
      }
    }
  }

  /// this method is use for getting success response of add traveller detail Api
  /// we are set data of add traveller passenger in view itinerary response

  void valueUpdateAccordingToValue(ADResponseState value) {
    //ga events calling on success
    FlightBookingGaAnalytics().travelerDetailsAnalyticsData(
      widget.flightViewItineraryResponseModel,
      ClickEvents.book_flight_payment_start,
    );

    if (value.data != null && value.viewStatus == Status.complete) {
      context.read<FlightCommonState>().travellerPassengerResponseModel =
          value.data;
      final TravellerPassengerResponseModel travellerPassengerResponseModel =
          value.data;
      widget.flightViewItineraryResponseModel.paxInfoList =
          travellerPassengerResponseModel.paxInfoList;
      widget.flightViewItineraryResponseModel.contactDetail =
          travellerPassengerResponseModel.contactDetail;
      widget.flightViewItineraryResponseModel.gstDetails =
          travellerPassengerResponseModel.gstDetails;
      // context.read<FlightCommonState>().reviewedUserID =
      //     ProfileSingleton.profileSingleton.userID;
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        genericPaymentScreen,
        argumentObject: SelectedTravelPassengerDetail(
          flightViewItineraryResponseModel:
              widget.flightViewItineraryResponseModel,
          travellerPassengerResponseModel: travellerPassengerResponseModel,
        ),
      );
      _scrollToTop();
    } else {
      if (value.errorCode != null) {
        SnackBarUtil.showSnackBar(
          context,
          value.errorCode
              .toString()
              .safeLocalize(context, value.message.toString()),
        );
      }
    }
  }
}
