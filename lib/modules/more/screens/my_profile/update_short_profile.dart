/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/models/update_profile/update_profile_display_model/update_profile_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/verify_email_call_back_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/my_profile_radio_buttons.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/view_of_disable_component.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
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
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// this widget is use for update profile of user and get profile
class UpdateShortProfile extends StatefulWidget {
  const UpdateShortProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateShortProfile> {
  /// we are creating object of state class and manage all things from state class
  UpdateProfileState updateProfileState = UpdateProfileState();

  /// this is use for set value  base64
  String image64 = '';

  /// this file is use for height of button
  final double _heightOfSaveButton = 54.sp;

  /// this key is use for validate complete form for update profile
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// this is use for call api of get profile of user
    _fetchUserDataAndInitForm();
  }

  void _fetchUserDataAndInitForm() {
    if (ProfileSingleton.profileSingleton.userID.isNotEmpty) {
      final data = context.read<AppSessionState>().profileModel;
      updateProfileState
        ..profileModel = data
        ..getProfile = ADResponseState.completed(data)
        ..loadingUserProfile = false;
      initializeFormData();
    }
  }

  /// this is use for create model for set value on profile form and manage all things related to form
  void initializeFormData() {
    if (updateProfileState.getProfile.viewStatus == Status.complete) {
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
        updateValueOfEmail(userData, formData);
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
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Selector<UpdateProfileState, ADResponseState>(
          selector: (context, viewModel) => viewModel.getProfile,
          builder: (context, value, Widget? child) {
            final error =
                updateProfileState.getProfile.viewStatus == Status.error &&
                    updateProfileState.isScreenInitiallyLoading;
            if (error) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                navigatorPopScreen(context);
              });
            }
            return updateProfileState.loadingUserProfile &&
                    updateProfileState.getProfile.viewStatus == Status.loading
                ? const ShowShimmerForUpdateShortProfile()
                : error
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          color: context.adColors.whiteTextColor,
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyProfileRadioButtons().paddingBySide(
                                      left: context.k_10,
                                      top: context.k_20,
                                    ),
                                    ADSizedBox(
                                      height: context.k_20,
                                    ),
                                    ADDefaultEditableText(
                                      componentData: updateProfileState
                                              .updateProfileFormBuilder
                                              ?.updateProfileForm
                                              .firstName ??
                                          ADEditableTextModel.defaultValue(),
                                      nextFocus: (_) =>
                                          FocusScope.of(context).nextFocus(),
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
                                          ADEditableTextModel.defaultValue(),
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
                                              child: ViewOfDisableComponent(
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
                                                    emailVerify: (emailValue) =>
                                                        updateValueNotifyForVerifyEmail(
                                                      emailValue,
                                                    ),
                                                    fromBottomSheet: true,
                                                  ),
                                                ),
                                                emailValue: resultValue,
                                              ).paddingBySide(
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),
                                            ),

                                            /// this is use for create email of profile form
                                            Visibility(
                                              visible:
                                                  (resultValue ?? '').isEmpty,
                                              child: ADDefaultEditableText(
                                                componentData: updateProfileState
                                                        .updateProfileFormBuilder
                                                        ?.updateProfileForm
                                                        .emailAddress ??
                                                    ADEditableTextModel
                                                        .defaultValue(),
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
                                    SizedBox(
                                      height: context.k_10,
                                    ),
                                  ],
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
                                              color: context
                                                  .adColors.whiteTextColor,
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
                                      bottom: context.k_20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
            fromBottomSheet: true,
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

  /// this method is use for call Api of Update profile
  void apiCallForUpdateProfile() {
    if (!isUpdateNotNeeded()) {
      if (_formKey.currentState?.validate() ?? false) {
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
      }
    } else {
      navigatorPopScreen(context);
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
}

class ShowShimmerForUpdateShortProfile extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForUpdateShortProfile();
  ///
  ///
  const ShowShimmerForUpdateShortProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemCount = 5;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) => ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: double.infinity,
          height: context.k_56,
        ).paddingBySide(
          bottom: context.k_20,
        ),
      ),
    );
  }
}
