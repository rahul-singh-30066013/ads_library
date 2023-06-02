/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/models/update_profile/update_profile_display_model/update_profile_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/verify_email_call_back_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/location_information.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/my_profile_radio_buttons.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/profile_display_widget.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/travel_information_update_profile.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/view_of_disable_component.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/ad_carousel_slider_with_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// this widget is use for update profile of user and get profile
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  /// we are creating object of state class and manage all things from state class
  UpdateProfileState updateProfileState = UpdateProfileState();

  /// this is use for set value  base64
  String image64 = '';

  /// this file is use for height of button
  final double _heightOfSaveButton = 54.sp;

  /// height of expanded widget
  final _expandedWidgetHeight = 180.sp;

  /// this key is use for validate complete form for update profile
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///For scrolling to bottom whenever widget is expanded
  final ScrollController _scrollController = ScrollController();

  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  ValueNotifier<String> flag = ValueNotifier(
    ProfileSingleton.profileSingleton.countryCodeData.flag ?? '',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();

    /// this is use for call api of get profile of user
    _fetchUserDataAndInitForm();
    flag.value = _siteCoreStateManagement.getFlag();
  }

  void _fetchUserDataAndInitForm() {
    if (ProfileSingleton.profileSingleton.userID.isNotEmpty) {
      updateProfileState
          .getProfileAndAvatarsApi(_siteCoreStateManagement)
          .then((value) => initializeFormData());
    }
  }

  /// this is use for create model for set value on profile form and manage all things related to form
  void initializeFormData() {
    if (updateProfileState.getProfile.viewStatus == Status.complete) {
      context
          .read<AppSessionState>()
          .updateProfileModel(profileModel: updateProfileState.profileModel);
      updateProfileState
        ..updateProfileFormBuilder =
            UpdateProfileFormBuilder.fromProfileUserDetailResponse(
          onChange: onChangeOfForm,
          profileModel: updateProfileState.profileModel,
        )
        ..isScreenInitiallyLoading = false;
      visibilityForChangeEmail();
    }
  }

  /// this method is use need for api or not
  bool isUpdateNotNeeded() {
    final PersonInfo userData =
        updateProfileState.profileModel.personInfo ?? const PersonInfo();
    final UpdateProfileForm formData =
        updateProfileState.updateProfileFormBuilder?.updateProfileForm ??
            UpdateProfileForm.defaultValue();
    return (userData.title ?? '') == formData.title.controller.text.trim() &&
        (userData.firstName ?? '') ==
            formData.firstName.controller.text.trim() &&
        (userData.lastName ?? '') == formData.lastName.controller.text.trim() &&
        updateValueOfEmail(userData, formData) &&
        (userData.dob ?? '') ==
            MyProfileUtils.convertToRequestDateFormat(
              formData.dateOfBirth.controller.text.trim(),
            ) &&
        (userData.nationality ?? '') ==
            formData.nationality.controller.text.trim() &&
        (userData.maritalStatus ?? '') ==
            formData.maritalStatus.controller.text.trim() &&
        (userData.anniversary ?? '') ==
            MyProfileUtils.convertToRequestDateFormat(
              formData.anniversary.controller.text.trim(),
            ) &&
        (userData.passportNumber ?? '') ==
            formData.passportNumber.controller.text.trim() &&
        (userData.passportExpiryDate ?? '') ==
            MyProfileUtils.convertToRequestDateFormat(
              formData.passportExpiryDate.controller.text.trim(),
            ) &&
        checkIfAddressNotUpdated(
          userData.addresses,
          formData.pinCode.controller.text,
          formData.countryOfResidence.controller.text,
        );
  }

  ///checks if user has updated any of the address field
  bool checkIfAddressNotUpdated(
    List<Addresses>? addresses,
    String pinCode,
    String countryOfResidence,
  ) {
    if ((addresses == null || addresses.isEmpty) &&
        pinCode.isNullOrEmpty &&
        countryOfResidence.isNullOrEmpty) {
      return true;
    }
    if (addresses == null || addresses.isEmpty) {
      return false;
    }
    return addresses.first.pinCode == pinCode &&
        addresses.first.country == countryOfResidence;
  }

  /// this method is use for validate value of email
  bool updateValueOfEmail(PersonInfo userData, UpdateProfileForm formData) {
    if ((userData.emails?.length ?? 0) > 0) {
      return (userData.emails?.first.emailAddress ?? '') ==
          formData.emailAddress.controller.text;
    } else if (formData.emailAddress.controller.text.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<UpdateProfileState>(
      viewModel: updateProfileState,
      child: Scaffold(
        backgroundColor: context.adColors.whiteTextColor,
        appBar: AppBar(
          backgroundColor: context.adColors.whiteTextColor,
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => navigatorPopScreen(context),
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
              size: context.k_20,
            ),
          ).paddingBySide(left: context.k_10, right: context.k_10),
          elevation: 0,
          title: Text(
            'my_profile'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ),
        ),
        body: Selector<UpdateProfileState, ADResponseState>(
          selector: (context, viewModel) => viewModel.getProfile,
          builder: (context, value, Widget? child) {
            return updateProfileState.loadingUserProfile &&
                    updateProfileState.getProfile.viewStatus == Status.loading
                ? const ShowShimmerForUpdateProfile()
                : updateProfileState.getProfile.viewStatus == Status.error &&
                        updateProfileState.isScreenInitiallyLoading
                    ? NoDataFoundErrorScreen(
                        errorTitle: 'ADLMS02'.localize(context),
                        onRetryTap: _resetPage,
                      )
                    : GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Column(
                                  children: [
                                    const ProfileDisplayWidget(),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'personal'.localize(context),
                                            style: ADTextStyle700.size22
                                                .setTextColor(
                                              context.adColors.blackColor,
                                            ),
                                          ).paddingBySide(
                                            top: context.k_40,
                                            left: context.k_16,
                                          ),
                                          ADSizedBox(
                                            height: context.k_22,
                                          ),
                                          const MyProfileRadioButtons()
                                              .paddingBySide(
                                            left: context.k_10,
                                          ),
                                          ADSizedBox(
                                            height: context.k_20,
                                          ),
                                          ADDefaultEditableText(
                                            componentData: updateProfileState
                                                    .updateProfileFormBuilder
                                                    ?.updateProfileForm
                                                    .firstName ??
                                                ADEditableTextModel
                                                    .defaultValue(),
                                            nextFocus: (value) =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          ADSizedBox(
                                            height: context.k_20,
                                          ),

                                          /// this is use for create last name of passenger form
                                          ADDefaultEditableText(
                                            componentData: updateProfileState
                                                    .updateProfileFormBuilder
                                                    ?.updateProfileForm
                                                    .lastName ??
                                                ADEditableTextModel
                                                    .defaultValue(),
                                            nextFocus: (abc) =>
                                                FocusScope.of(context)
                                                    .unfocus(),
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          SizedBox(
                                            height: context.k_20,
                                          ),
                                          // this is use for create contact number of profile form
                                          ADDefaultEditableText(
                                            styleChange: true,
                                            iconWidth: context.k_19,
                                            iconHeight: context.k_19,
                                            iconColour:
                                                context.adColors.greenTextColor,
                                            componentData: updateProfileState
                                                    .updateProfileFormBuilder
                                                    ?.updateProfileForm
                                                    .contactNumber ??
                                                ADEditableTextModel
                                                    .defaultValue(),
                                            prefixWidget: DropDownGeneric(
                                              svgIcon: '',
                                              isDisabled: true,
                                              type: (updateProfileState
                                                          .updateProfileFormBuilder
                                                          ?.updateProfileForm
                                                          .countryCode
                                                          .placeHolder ??
                                                      '')
                                                  .localize(context),
                                              showDivider: true,
                                              isForCountyCode: true,
                                              onTap: () => false
                                              //     showBottomSheetDialog(
                                              //   BottomSheetType.fromCountryCode,
                                              // )
                                              ,
                                              controller: updateProfileState
                                                      .updateProfileFormBuilder
                                                      ?.updateProfileForm
                                                      .countryCode
                                                      .controller ??
                                                  TextEditingController(),
                                              prefixIconUrl: flag,
                                            ),
                                            nextFocus: (abc) =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          SizedBox(
                                            height: context.k_20,
                                          ),
                                          Selector<UpdateProfileState, String?>(
                                            selector: (context, stateClass) =>
                                                stateClass.valueForVerifyEmail,
                                            builder: (
                                              BuildContext context,
                                              resultValue,
                                              Widget? child,
                                            ) {
                                              return Column(
                                                children: [
                                                  Visibility(
                                                    visible: (resultValue ?? '')
                                                        .isNotEmpty,
                                                    child:
                                                        ViewOfDisableComponent(
                                                      onTapHandler: () =>
                                                          navigateToScreenWithRootNavigatorResult(
                                                        context,
                                                        changeEmail,
                                                        argumentObject:
                                                            VerifyEmailCallBackModel(
                                                          emailIdControllerValue:
                                                              updateProfileState
                                                                  .updateProfileFormBuilder
                                                                  ?.updateProfileForm
                                                                  .emailAddress
                                                                  .controller
                                                                  .text,
                                                          emailVerify:
                                                              (emailValue) =>
                                                                  updateValueNotifyForVerifyEmail(
                                                            emailValue,
                                                          ),
                                                        ),
                                                      ),
                                                      emailValue: resultValue,
                                                    ).paddingBySide(
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                    ),
                                                  ),
                                                  // if ((resultValue ?? '')
                                                  //     .isNotEmpty)
                                                  //   SizedBox(
                                                  //     height: context.k_20,
                                                  //   ),

                                                  /// this is use for create email of profile form
                                                  Visibility(
                                                    visible: (resultValue ?? '')
                                                        .isEmpty,
                                                    child:
                                                        ADDefaultEditableText(
                                                      componentData: updateProfileState
                                                              .updateProfileFormBuilder
                                                              ?.updateProfileForm
                                                              .emailAddress ??
                                                          ADEditableTextModel
                                                              .defaultValue(),
                                                      nextFocus: (abc) =>
                                                          FocusScope.of(context)
                                                              .nextFocus(),
                                                      onTapHandler: () =>
                                                          _emailOtpApiCall(
                                                        context,
                                                      ),
                                                    ).paddingBySide(
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),

                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ADDefaultEditableText(
                                                  componentData: updateProfileState
                                                          .updateProfileFormBuilder
                                                          ?.updateProfileForm
                                                          .dateOfBirth ??
                                                      ADEditableTextModel
                                                          .defaultValue(),
                                                  onTap: () => _pickDate(
                                                    updateProfileState
                                                        .updateProfileFormBuilder
                                                        ?.updateProfileForm
                                                        .dateOfBirth
                                                        .controller,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.k_16,
                                              ),
                                              Expanded(
                                                child: ADDefaultEditableText(
                                                  iconHeight: context.k_20,
                                                  iconWidth: context.k_20,
                                                  componentData: updateProfileState
                                                          .updateProfileFormBuilder
                                                          ?.updateProfileForm
                                                          .nationality ??
                                                      ADEditableTextModel
                                                          .defaultValue(),
                                                  onTap: () =>
                                                      adShowBottomSheet(
                                                    context: context,
                                                    childWidget:
                                                        ADCountryCodeBottomSheet(
                                                      selectedCountry:
                                                          updateProfileState
                                                                  .updateProfileFormBuilder
                                                                  ?.updateProfileForm
                                                                  .nationality
                                                                  .controller
                                                                  .text ??
                                                              '',
                                                      onTap: (value) =>
                                                          onCountryTap(
                                                        updateProfileState
                                                                .updateProfileFormBuilder
                                                                ?.updateProfileForm
                                                                .nationality
                                                                .controller ??
                                                            TextEditingController(),
                                                        value,
                                                      ),
                                                      countryListCodes:
                                                          _siteCoreStateManagement
                                                              .country,
                                                    ),
                                                    headerTitle: 'Country',
                                                  ).then(
                                                    (value) => {
                                                      searchTextController
                                                          .clear(),
                                                      context
                                                          .read<
                                                              PranaamAppDataStateManagement>()
                                                          .buildSearchCountryList(
                                                            '',
                                                            _siteCoreStateManagement
                                                                .country,
                                                          ),
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                            top: context.k_20,
                                          ),
                                          Selector<UpdateProfileState,
                                              MaritalStatus?>(
                                            selector: (_, state) =>
                                                MyProfileUtils
                                                    .convertToMaritalStatus(
                                              state
                                                      .updateProfileFormBuilder
                                                      ?.updateProfileForm
                                                      .maritalStatus
                                                      .controller
                                                      .text ??
                                                  '',
                                            ),
                                            builder:
                                                (context, maritalStatus, _) =>
                                                    Row(
                                              children: [
                                                Expanded(
                                                  child: ADDefaultEditableText(
                                                    iconHeight: context.k_20,
                                                    iconWidth: context.k_20,
                                                    componentData: updateProfileState
                                                            .updateProfileFormBuilder
                                                            ?.updateProfileForm
                                                            .maritalStatus ??
                                                        ADEditableTextModel
                                                            .defaultValue(),
                                                    onTap: () =>
                                                        adShowBottomSheet(
                                                      context: context,
                                                      childWidget:
                                                          GenericBottomSheet(
                                                        onBottomSheetItemSelect:
                                                            (value) =>
                                                                onBottomSheetSelect(
                                                          updateProfileState
                                                              .updateProfileFormBuilder
                                                              ?.updateProfileForm
                                                              .maritalStatus
                                                              .onChange,
                                                          updateProfileState
                                                                  .updateProfileFormBuilder
                                                                  ?.updateProfileForm
                                                                  .maritalStatus
                                                                  .controller ??
                                                              TextEditingController(),
                                                          value,
                                                        ),
                                                        bottomSheetHeader: (updateProfileState
                                                                    .updateProfileFormBuilder
                                                                    ?.updateProfileForm
                                                                    .maritalStatus
                                                                    .placeHolder ??
                                                                '')
                                                            .localize(context),
                                                        bottomSheetList:
                                                            MyProfileUtils
                                                                .maritalStatusList,
                                                        screenType:
                                                            GenericBottomSheetScreenType
                                                                .flightTraveller,
                                                        selectedItem:
                                                            updateProfileState
                                                                .updateProfileFormBuilder
                                                                ?.updateProfileForm
                                                                .maritalStatus
                                                                .controller
                                                                .text
                                                                .toLowerCase(),
                                                      ),
                                                      headerTitle:
                                                          'marital_status'
                                                              .localize(
                                                        context,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (maritalStatus ==
                                                    MaritalStatus.married)
                                                  SizedBox(
                                                    width: context.k_16,
                                                  ),
                                                if (maritalStatus ==
                                                    MaritalStatus.married)
                                                  Flexible(
                                                    child:
                                                        ADDefaultEditableText(
                                                      componentData: updateProfileState
                                                              .updateProfileFormBuilder
                                                              ?.updateProfileForm
                                                              .anniversary ??
                                                          ADEditableTextModel
                                                              .defaultValue(),
                                                      onTap: () => _pickDate(
                                                        updateProfileState
                                                            .updateProfileFormBuilder
                                                            ?.updateProfileForm
                                                            .anniversary
                                                            .controller,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ).paddingBySide(
                                              left: context.k_16,
                                              right: context.k_16,
                                              top: context.k_20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: context.k_30,
                                          ),
                                          TravelInformationUpdateProfile(
                                            onTapCallback: () =>
                                                _scrollToBottom(),
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          SizedBox(
                                            height: context.k_26,
                                          ),
                                          Divider(
                                            height: 1,
                                            color: context
                                                .adColors.greyChartTextColor,
                                          ),
                                          SizedBox(
                                            height: context.k_26,
                                          ),
                                          LocationInformation(
                                            onTapCallback: () =>
                                                _scrollToBottom(),
                                          ).paddingBySide(
                                            left: context.k_16,
                                            right: context.k_16,
                                          ),
                                          SizedBox(
                                            height: context.k_32,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(height: 1, thickness: 1),
                            SafeArea(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: context.adColors.whiteTextColor,
                                ),
                                child: Selector<UpdateProfileState, Status?>(
                                  selector: (_, state) =>
                                      state.getProfile.viewStatus,
                                  builder: (context, status, _) =>
                                      ElevatedButton(
                                    onPressed: () => {
                                      apiCallForUpdateProfile(),
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      minimumSize: Size(
                                        double.infinity,
                                        _heightOfSaveButton,
                                      ),
                                      maximumSize: Size(
                                        double.infinity,
                                        _heightOfSaveButton,
                                      ),
                                    ),
                                    child: status == Status.loading
                                        ? ADDotProgressView(
                                            color:
                                                context.adColors.whiteTextColor,
                                          )
                                        : Text(
                                            'save_changes'.localize(context),
                                            style: ADTextStyle700.size18
                                                .setTextColor(
                                              context.adColors.whiteTextColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                  ).paddingBySide(
                                    left: context.k_16,
                                    right: context.k_16,
                                    top: context.k_10,
                                    bottom: context.k_10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }

  void _emailOtpApiCall(BuildContext context) {
    ClickEvents.verify_email.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
      },
    );
    ClickEvents.otp_verification.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: 'email_verify',
      },
    );
    ClickEvents.submit_email.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: 'email_verify',
      },
    );
    ProcessDialog.showLoadingDialog(context);
    final SendEmailOtpRequest request = SendEmailOtpRequest(
      (updateProfileState.updateProfileFormBuilder?.updateProfileForm
                  .emailAddress.controller.text ??
              '')
          .trim(),
    );
    updateProfileState
        .sendEmailOtp(
      sendEmailOtpRequest: request,
    )
        .then((value) {
      if (value.viewStatus == Status.complete) {
        ProcessDialog.closeLoadingDialog(context);
        String sourceId = '';
        if (value.header != null) {
          final List<String> source = value.header?['source'] ?? [];
          if (source.isNotEmpty) {
            sourceId = source.first;
          }
        }
        final result = navigateToScreenWithRootNavigatorResult(
          context,
          verifyEmail,
          argumentObject: VerifyEmailCallBackModel(
            emailIdControllerValue: updateProfileState.updateProfileFormBuilder
                ?.updateProfileForm.emailAddress.controller.text,
            sourceId: sourceId,
            emailVerify: (value) => updateValueNotifyForVerifyEmail(
              value,
            ),
          ),
        );
        adLog(result.toString());
        ClickEvents.submit_email_success.logEvent(
          parameters: {
            Parameters.category.name: 'profile',
            Parameters.sub_category.name: 'email_verify',
            Parameters.type.name: 'email_verify',
          },
        );
      } else {
        ProcessDialog.closeLoadingDialog(context);
        showToast(
          context,
          context.adColors.black,
          '',
          Text(
            value.message ?? '',
            style: ADTextStyle600.size14.copyWith(color: ADColors.white),
          ),
        );
        ClickEvents.submit_email_fail.logEvent(
          parameters: {
            Parameters.category.name: 'profile',
            Parameters.sub_category.name: 'email_verify',
            Parameters.type.name: 'email_verify',
            Parameters.error_text.name: value.message,
          },
        );
      }
    });
  }

  void showToast(
    BuildContext context,
    Color? color,
    String? iconPath,
    Widget textWidget, {
    int? toastDuration,
  }) {
    Widget text;
    text = textWidget is Text
        ? Text(
            textWidget.data ?? '',
            style: ADTextStyle400.size14.copyWith(color: ADColors.white),
          )
        : textWidget;

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.k_8),
      ),
      margin: EdgeInsets.only(
        bottom: context.k_60,
        left: context.k_16,
        right: context.k_16,
      ),
      backgroundColor: color,
      duration: Duration(seconds: toastDuration ?? 3),
      content: Row(
        children: [
          IconFromAsset(
            iconPath: iconPath ?? SvgAssets.icCircleSuccess,
            height: context.scaled(20),
            width: context.scaled(20),
          ),
          ADSizedBox(
            width: context.k_10,
          ),
          // getSizedBoxWithWidth(context.scaled(12)),
          Expanded(child: text),
        ],
      ),
    );
    final valueOfSnack = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    adLog(valueOfSnack.toString());
  }

  void updateValueNotifyForVerifyEmail(String emailValue) {
    if (emailValue.isNotEmpty) {
      updateProfileState.updateValueForVerifyEmail(value: emailValue);
    }
  }

  bool visibilityForEmailController() {
    bool verifyEmailEditText = true;
    if ((updateProfileState.profileModel.personInfo?.emails?.length ?? 0) > 0) {
      return verifyEmailEditText = !(updateProfileState
              .profileModel.personInfo?.emails?.first.isEmailVerified ??
          false);
    }
    return verifyEmailEditText;
  }

  void visibilityForChangeEmail() {
    if ((updateProfileState.profileModel.personInfo?.emails?.length ?? 0) > 0 &&
        (updateProfileState
                .profileModel.personInfo?.emails?.first.isEmailVerified ??
            false)) {
      updateProfileState.updateValueForVerifyEmail(
        value: updateProfileState
                .profileModel.personInfo?.emails?.first.emailAddress ??
            '',
      );
    } else {
      updateProfileState.updateValueForVerifyEmail(value: '');
    }
  }

  void updateProfileApiVerifyOnEmail({required bool apiHitOrNot}) {
    if (apiHitOrNot) {
      updateProfileState.resetState();
      updateProfileState
          .getProfileAndAvatarsApi(
            _siteCoreStateManagement,
          )
          .then(
            (value) => initializeFormData(),
          );
    }
  }

  void _resetPage() {
    updateProfileState.resetState();
    _fetchUserDataAndInitForm();
  }

  /// this method is use for set country name
  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    controller.text = value.countryName.validateWithDefaultValue();
  }

  /// this method is use for call Api of Update profile
  void apiCallForUpdateProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      if (isUpdateNotNeeded()) {
        navigatorPopScreen(context);
        return;
      }
      if (ProfileSingleton.profileSingleton.userID.isNotEmpty) {
        ProfileGaAnalytics().editProfileAnalyticsData(
          nationality: updateProfileState.updateProfileFormBuilder
                  ?.updateProfileForm.nationality.controller.text ??
              '',
          dateOfBirth: updateProfileState.updateProfileFormBuilder
                  ?.updateProfileForm.dateOfBirth.controller.text ??
              '',
        );
        image64 =
            updateProfileState.profileModel.personInfo?.profileImage ?? '';
        updateProfileState
            .sendProfileApi(
          image64,
        )
            .then((value) {
          if (value.viewStatus == Status.complete) {
            messageForUpdateProfile();
            context.read<AppSessionState>().updateProfileModel(
                  profileModel: value.data,
                );
            ClickEvents.profile_update.logEvent(
              parameters: {
                Parameters.category.name: 'profile',
                Parameters.sub_category.name: 'profile_update',
                Parameters.gender.name:
                    (value.data as ProfileModel).personInfo?.gender ?? '',
              },
            );
            ClickEvents.identify_user.logUserProfileData(
              profileData: value.data,
            );
            navigatorPopScreen(context);
          } else {
            messageForUpdateProfile(message: value.message ?? '');
          }
        });
      }
    } else {
      _openCollapsedFieldsIfNotValidated();
    }
  }

  void _openCollapsedFieldsIfNotValidated() {
    final passportNumber = updateProfileState
        .updateProfileFormBuilder?.updateProfileForm.passportNumber;
    final passportNumberValidated =
        passportNumber?.validation?.call(passportNumber.controller.text);
    if (passportNumberValidated != null) {
      updateProfileState.updateValueForTravel(value: true);
      _scrollToBottom();
      FocusScope.of(context).requestFocus(passportNumber?.focusNode);
    }
    final pincode =
        updateProfileState.updateProfileFormBuilder?.updateProfileForm.pinCode;
    final pincodeValidated = pincode?.validation?.call(pincode.controller.text);
    if (pincodeValidated != null) {
      updateProfileState.updateValueForLocation(value: true);
      _scrollToBottom();
      FocusScope.of(context).requestFocus(pincode?.focusNode);
    }
  }

  void onChangeOfForm() {
    //TODO
  }

  /// this method is use for show snap bar when api response is success
  void messageForUpdateProfile({
    String message = 'profile_updated_success',
  }) {
    SnackBarUtil.showSnackBar(
      context,
      message.localize(context),
    );
  }

  /// its is use for pick date
  Future _pickDate(TextEditingController? controller) async {
    final selectedDate = await _selectDate(
      context,
      initialDate: DateTime.tryParse(
        MyProfileUtils.convertToParsableDateFormat(controller?.text ?? ''),
      ),
    );
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      if (controller != null) {
        setState(() {
          final date = '$day/$month/${selectedDate.year}';
          controller.text = date;
        });
      }
    }
  }

  /// this is use for select date of calender
  Future<DateTime?> _selectDate(
    BuildContext context, {
    DateTime? initialDate,
  }) =>
      showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: ADColors.black,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
            ),
            child: child ?? const Text(''),
          );
        },
        initialDate:
            initialDate ?? DateTime.now().add(const Duration(seconds: 1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    CountryCodeBottomSheet(
      context: context,
      type: type,
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData, type);
    });
  }

  /// this method is for set value of country code on selection
  void onTapCountryCodeBottomSheet(
    CountryCodeData value2,
    BottomSheetType type,
  ) {
    // CountryCodesList value2 = value;
    if (type == BottomSheetType.fromCountryCode) {
      updateProfileState.updateProfileFormBuilder?.updateProfileForm.countryCode
          .controller.text = value2.callingCode.validateWithDefaultValue();
      flag.value = value2.flag?.validateWithDefaultValue() ?? '';
      updateProfileState.updateProfileFormBuilder?.updateProfileForm
          .contactNumber.length = FlightUtils.lengthOfNumber(
        updateProfileState.updateProfileFormBuilder?.updateProfileForm
                .countryCode.controller.text ??
            '',
      );
      updateProfileState
          .updateProfileFormBuilder?.updateProfileForm.countryCode.onChange
          .call();
      updateProfileState.updateProfileFormBuilder?.updateProfileForm
          .contactNumber.controller.text = '';
    } else {
      updateProfileState.updateProfileFormBuilder?.updateProfileForm.nationality
          .controller.text = value2.name.toString();
    }
  }

  /// this method is for open dropdown list of title
  void onBottomSheetSelect(
    void Function()? onChange,
    TextEditingController controller,
    String value,
  ) {
    setState(() {
      controller.text = value.localize(context);
      onChange?.call();
      navigatorPopScreen(context);
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + _expandedWidgetHeight,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }
}

class ShowShimmerForUpdateProfile extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForUpdateProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double heightOfImage = 140;
    const double widthOfImage = 140;
    return Container(
      color: context.adColors.whiteTextColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: context.k_30,
          ),
          const Center(
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.circle,
              width: widthOfImage,
              height: heightOfImage,
            ),
          ),
          ADSizedBox(
            height: context.k_56,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            width: widthOfImage,
            height: context.k_26,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.k_10),
              itemCount: padding_6.toInt(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      width: double.infinity,
                      height: context.k_56,
                    ),
                  ],
                ).paddingBySide(
                  bottom: context.k_10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
