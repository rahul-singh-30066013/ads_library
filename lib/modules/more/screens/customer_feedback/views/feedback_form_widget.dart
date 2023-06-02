/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/feedback_model/feedback_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FeedbackFormWidget extends StatefulWidget {
  const FeedbackFormWidget({
    Key? key,
    required this.feedbackStateManagement,
  }) : super(key: key);
  final FeedbackStateManagement feedbackStateManagement;

  @override
  State<StatefulWidget> createState() {
    return _FeedbackFormWidgetState();
  }
}

class _FeedbackFormWidgetState extends State<FeedbackFormWidget> {
  final int _k_3 = 3;
  final int _k_5 = 5;
  final _k_54 = 54.sp;
  final errorColor = 0xffef645a;
  final double titleDropDownWidth = 110.sp;
  final GlobalKey _descriptionKey = GlobalKey();
  final GlobalKey _checkBoxKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final minCharacter = 1;

  String selectedCountryCode = 'IN';

  final _focusNode = FocusNode();
  bool isDescriptionActive = false;

  ValueNotifier<String> flag = ValueNotifier(
    ProfileSingleton.profileSingleton.countryCodeData.flag ?? '',
  );

  void _onFocusChange() {
    setState(() {
      adLog('Focus: ${_focusNode.hasFocus.toString()}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    initializeFeedBackFormData();
    super.initState();
  }

  void initializeFeedBackFormData() {
    widget.feedbackStateManagement.feedbackFormBuilder =
        FeedbackFormBuilder.dataFromState(
      feedbackStateManagement: widget.feedbackStateManagement,
      appSessionState: context.read<AppSessionState>(),
      profileModel: context.read<AppSessionState>().profileModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Selector<FeedbackStateManagement, bool>(
        selector: (context, viewModel) => viewModel.isAbsorbing,
        builder: (context, isAbsorbing, Widget? child) {
          return AbsorbPointer(
            absorbing: isAbsorbing,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ADDefaultEditableText(
                    prefixWidget: DropDownGeneric(
                      widthOfDropDown: titleDropDownWidth,
                      type: (widget.feedbackStateManagement.feedbackFormBuilder
                                  ?.feedBackForm.title.placeHolder ??
                              '')
                          .localize(context),
                      showDivider: true,
                      onTap: () => adShowBottomSheet(
                        childWidget: GenericBottomSheet(
                          onBottomSheetItemSelect: (value) =>
                              onBottomSheetSelect(
                            widget.feedbackStateManagement.feedbackFormBuilder
                                ?.feedBackForm.title,
                            value,
                            isLocalizeOrNot: true,
                          ),
                          bottomSheetHeader: (widget
                                      .feedbackStateManagement
                                      .feedbackFormBuilder
                                      ?.feedBackForm
                                      .title
                                      .placeHolder ??
                                  '')
                              .localize(context),
                          bottomSheetList: bottomFlightSheetTitleList,
                          screenType:
                              GenericBottomSheetScreenType.flightTraveller,
                          selectedItem: widget.feedbackStateManagement
                              .feedbackFormBuilder?.feedBackForm.title.text,
                        ),
                        context: context,
                        headerTitle: (widget
                                    .feedbackStateManagement
                                    .feedbackFormBuilder
                                    ?.feedBackForm
                                    .title
                                    .placeHolder ??
                                '')
                            .localize(context),
                      ),
                      controller: widget
                              .feedbackStateManagement
                              .feedbackFormBuilder
                              ?.feedBackForm
                              .title
                              .controller ??
                          TextEditingController(),
                    ),
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.firstName ??
                        ADEditableTextModel.defaultValue(),
                    nextFocus: (value) => FocusScope.of(context).requestFocus(
                      widget.feedbackStateManagement.feedbackFormBuilder
                          ?.feedBackForm.lastName.focusNode,
                    ),
                    //enable it when require validation for first name with"please_select_salutation"
                    selectedTitle: widget.feedbackStateManagement
                        .feedbackFormBuilder?.feedBackForm.title.text,
                    needLocalize: false,
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.lastName ??
                        ADEditableTextModel.defaultValue(),
                    nextFocus: (value) => FocusScope.of(context).requestFocus(
                      widget.feedbackStateManagement.feedbackFormBuilder
                          ?.feedBackForm.contactNumber.focusNode,
                    ),
                    needLocalize: false,
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.contactNumber ??
                        ADEditableTextModel.defaultValue(),
                    prefixWidget: DropDownGeneric(
                      type: (widget.feedbackStateManagement.feedbackFormBuilder
                                  ?.feedBackForm.countryCode.placeHolder ??
                              '')
                          .localize(context),
                      showDivider: true,
                      isForCountyCode: true,
                      onTap: () => showBottomSheetDialog(
                        BottomSheetType.fromCountryCode,
                      ),
                      controller: widget
                              .feedbackStateManagement
                              .feedbackFormBuilder
                              ?.feedBackForm
                              .countryCode
                              .controller ??
                          TextEditingController(),
                      prefixIconUrl: flag,
                    ),
                    selectedCountryCode: selectedCountryCode,
                    nextFocus: (abc) => FocusScope.of(context).requestFocus(
                      widget.feedbackStateManagement.feedbackFormBuilder
                          ?.feedBackForm.emailAddress.focusNode,
                    ),
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.emailAddress ??
                        ADEditableTextModel.defaultValue(),
                    needLocalize: false,
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    needLocalize: false,
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.selectAirport ??
                        ADEditableTextModel.defaultValue(),
                    onTap: () => adShowBottomSheet(
                      childWidget: GenericBottomSheet(
                        onBottomSheetItemSelect: (value) => {
                          navigatorPopScreen(context),
                          if (widget.feedbackStateManagement.airportController
                                  .text !=
                              value)
                            {
                              widget
                                  .feedbackStateManagement
                                  .feedbackFormBuilder
                                  ?.feedBackForm
                                  .selectAirport
                                  .controller
                                  .text = value,
                              widget.feedbackStateManagement.airportController
                                  .text = value,
                              widget.feedbackStateManagement.isAirportSelect
                                  .value = value,
                              /* _moveFocusToErrorField(
                                        _flightNumberKey.currentContext ?? context,
                                      ),*/
                            },
                        },
                        bottomSheetHeader: widget
                                .feedbackStateManagement
                                .feedbackFormBuilder
                                ?.feedBackForm
                                .selectAirport
                                .placeHolder ??
                            '',
                        bottomSheetList: widget
                            .feedbackStateManagement.bottomSheetAirportList,
                        selectedItem: widget
                            .feedbackStateManagement
                            .feedbackFormBuilder
                            ?.feedBackForm
                            .selectAirport
                            .controller
                            .text,
                      ),
                      context: context,
                      headerTitle: widget
                              .feedbackStateManagement
                              .feedbackFormBuilder
                              ?.feedBackForm
                              .selectAirport
                              .placeHolder ??
                          '',
                    ),
                    placeHolderValue: widget.feedbackStateManagement
                            .elementsField?.selectAirportLabel ??
                        '',
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.flightNumber ??
                        ADEditableTextModel.defaultValue(),
                    needLocalize: false,
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    needLocalize: false,
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.flightDate ??
                        ADEditableTextModel.defaultValue(),
                    onTap: () =>
                        widget.feedbackStateManagement.pickUpDate(context),
                  ).paddingBySide(top: context.k_20),
                  ADDefaultEditableText(
                    needLocalize: false,
                    componentData: widget.feedbackStateManagement
                            .feedbackFormBuilder?.feedBackForm.selectOption ??
                        ADEditableTextModel.defaultValue(),
                    onTap: () => adShowBottomSheet(
                      childWidget: GenericBottomSheet(
                        localizeText: false,
                        onBottomSheetItemSelect: (value) => onBottomSheetSelect(
                          widget.feedbackStateManagement.feedbackFormBuilder
                              ?.feedBackForm.selectOption,
                          value,
                          isLocalizeOrNot: false,
                        ),
                        bottomSheetHeader: widget
                                .feedbackStateManagement
                                .feedbackFormBuilder
                                ?.feedBackForm
                                .selectOption
                                .placeHolder ??
                            '',
                        bottomSheetList:
                            widget.feedbackStateManagement.bottomSheetPostList,
                        selectedItem: widget
                            .feedbackStateManagement
                            .feedbackFormBuilder
                            ?.feedBackForm
                            .selectOption
                            .controller
                            .text,
                        screenType:
                            GenericBottomSheetScreenType.flightTraveller,
                      ),
                      context: context,
                      headerTitle: widget
                              .feedbackStateManagement
                              .feedbackFormBuilder
                              ?.feedBackForm
                              .selectOption
                              .placeHolder ??
                          '',
                    ),
                    placeHolderValue: widget.feedbackStateManagement
                            .elementsField?.issueTypeLabel ??
                        '',
                  ).paddingBySide(top: context.k_20),
                  ValueListenableBuilder(
                    valueListenable:
                        widget.feedbackStateManagement.descriptionErrorMsg,
                    child: const ADSizedBox(),
                    builder: (context, String value, child) => Column(
                      children: [
                        Container(
                          key: _descriptionKey,
                          padding: EdgeInsets.only(
                            left: context.k_16,
                            right: context.k_16,
                            bottom: context.k_10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: widget.feedbackStateManagement
                                      .descriptionErrorMsg.value.isNotEmpty
                                  ? Color(errorColor)
                                  : isDescriptionActive
                                      ? context.adColors.tileBorderColor
                                      : _focusNode.hasFocus
                                          ? context.adColors.blackColor
                                          : context.adColors.greyReviewShade,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_8),
                            ),
                          ),
                          child: TextFormField(
                            focusNode: _focusNode,
                            textAlignVertical: TextAlignVertical.top,
                            controller: widget
                                .feedbackStateManagement.commentController,
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                            cursorColor: context.adColors.blackTextColor,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            maxLength: int.parse(
                              widget.feedbackStateManagement.elementsField
                                      ?.helpTextMaxCharacter ??
                                  '',
                            ),
                            onChanged: (value) => {
                              if (!(value.toString().trim() == ''))
                                {
                                  widget.feedbackStateManagement
                                      .descriptionErrorMsg.value = '',
                                }
                              else
                                {
                                  widget.feedbackStateManagement
                                      .descriptionErrorMsg.value = widget
                                          .feedbackStateManagement
                                          .elementsField
                                          ?.helpTextRequired ??
                                      '',
                                },
                            },
                            maxLines: _k_5,
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: widget.feedbackStateManagement
                                      .elementsField?.helpTextLabel ??
                                  '',
                              labelStyle: ADTextStyle400.size16.setTextColor(
                                context.adColors.greyTextColor,
                              ),
                              border: InputBorder.none,
                            ),
                            // validator: (value) =>
                            //     validatorDescription(value ?? ''),
                          ),
                        ).paddingBySide(top: context.k_20),
                        if (value.isNotEmpty)
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              value,
                              style: ADTextStyle400.size12.setTextColor(
                                Color(errorColor),
                              ),
                            ).paddingBySide(top: context.k_4),
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                  ),
                  if (!widget.feedbackStateManagement.isLoggedInUser())
                    Row(
                      key: _checkBoxKey,
                      children: <Widget>[
                        SizedBox(
                          height: context.k_20,
                          width: context.k_20,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(_k_3.toDouble()),
                              ),
                            ),
                            activeColor:
                                widget.feedbackStateManagement.checkboxValue
                                    ? context.adColors.black
                                    : context.adColors.greyTextColor,
                            value: widget.feedbackStateManagement.checkboxValue,
                            onChanged: (value) => {
                              setState(() {
                                widget.feedbackStateManagement.checkboxValue =
                                    value ?? false;
                              }),
                            },
                          ),
                        ).paddingBySide(right: context.k_10),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    widget.feedbackStateManagement
                                            .checkboxValue =
                                        !widget.feedbackStateManagement
                                            .checkboxValue;
                                  });
                                },
                              text: 'terms_and_condition_content'
                                  .localize(context),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigateToScreenUsingNamedRouteWithArguments(
                                        context,
                                        webViewContainer,
                                        argumentObject: WebViewModel(
                                          title: 'terms_and_condition'
                                              .localize(context),
                                          url:
                                              '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditions}',
                                        ),
                                      );
                                    },
                                  text: 'T_C'.localize(context),
                                  style: ADTextStyle600.size14
                                      .setTextColor(
                                        context.adColors.blackTextColor,
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                TextSpan(
                                  text: '.',
                                  style: ADTextStyle600.size14.setTextColor(
                                    context.adColors.neutralInfoMsg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //Text
                        //Checkbox
                      ], //<Widget>[]
                    ).paddingBySide(top: context.k_16)
                  else
                    const SizedBox.shrink(),
                  ADSizedBox(
                    height: context.k_34,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.adColors.blueColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.k_28),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        _k_54,
                      ),
                    ),
                    onPressed: () => continueToFeedBack(),
                    child: Selector<FeedbackStateManagement, ADResponseState>(
                      selector: (context, model) => model.feedbackResponseState,
                      builder: (context, value, child) {
                        return value.viewStatus == Status.loading
                            ? ADSizedBox(
                                height: context.k_20,
                                child: ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                ),
                              )
                            : Text(
                                widget.feedbackStateManagement.elementsField
                                        ?.submitButtonLabel ??
                                    '',
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// this will be return widget of country list and country code list
  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    CountryCodeBottomSheet(
      context: context,
      type: type,
      selectedItem: widget.feedbackStateManagement.feedbackFormBuilder
          ?.feedBackForm.contactNumber.controller.text
          .toString(),
    ).openCountryCodeBottomSheet(
      (value) {
        final CountryCodeData countryCodeData = value;
        onTapCountryCodeBottomSheet(countryCodeData);
      },
    );
  }

  /// this method is for set value of country code on selection
  void onTapCountryCodeBottomSheet(CountryCodeData value2) {
    // CountryCodesList value2 = value;
    if (widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
            .countryCode.controller.text !=
        value2.callingCode) {
      widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
          .contactNumber.controller.text = '';
    }
    widget
        .feedbackStateManagement
        .feedbackFormBuilder
        ?.feedBackForm
        .countryCode
        .controller
        .text = value2.callingCode?.validateWithDefaultValue() ?? '+91';

    flag.value = value2.flag?.validateWithDefaultValue() ?? '';

    setState(() {
      selectedCountryCode = value2.countryCode ?? 'IN';
    });
  }

  Future<void> continueToFeedBack() async {
    if (_formKey.currentState?.validate() == true && validateForComment()) {
      widget.feedbackStateManagement.navigateToFeedback(
        context: context,
      );
    } else {
      if (widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
              .firstName.controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
                  .firstName.globalKey?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
              .firstName.focusNode,
        );
      } else if (widget.feedbackStateManagement.feedbackFormBuilder
              ?.feedBackForm.lastName.controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
                  .firstName.globalKey?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
              .firstName.focusNode,
        );
      } else if (widget.feedbackStateManagement.feedbackFormBuilder
              ?.feedBackForm.contactNumber.controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
                  .contactNumber.globalKey?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
              .contactNumber.focusNode,
        );
      } else if (widget.feedbackStateManagement.feedbackFormBuilder
              ?.feedBackForm.emailAddress.controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
                  .emailAddress.globalKey?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          widget.feedbackStateManagement.feedbackFormBuilder?.feedBackForm
              .emailAddress.focusNode,
        );
      }
    }
  }

  void onBottomSheetSelect(
    ADEditableTextModel? title,
    String value, {
    required bool isLocalizeOrNot,
  }) {
    setState(() {
      title?.controller.text =
          isLocalizeOrNot ? value.localize(context) : value;
      title?.text = value;
      title?.onChange.call();
      title?.errorMessage = '';
      navigatorPopScreen(context);
    });
  }

  String? validatorDescription(String value) {
    return value.isEmpty || value == ' '
        ? widget.feedbackStateManagement.descriptionErrorMsg.value =
            widget.feedbackStateManagement.elementsField?.helpTextRequired ?? ''
        : null;
  }

  bool validateForComment() {
    FocusScope.of(context).unfocus();
    if (widget.feedbackStateManagement.commentController.text
            .toString()
            .trim() ==
        '') {
      widget.feedbackStateManagement.descriptionErrorMsg.value =
          widget.feedbackStateManagement.elementsField?.helpTextRequired ?? '';
      return false;
    } else if (!ProfileSingleton.profileSingleton.isLoggedIn &&
        !widget.feedbackStateManagement.checkboxValue) {
      widget.feedbackStateManagement
          .showToastMessage(context, 'please_accept_terms'.localize(context));
      //_moveFocusToErrorField(_checkBoxKey.currentContext ?? context);
      return false;
    } else {
      return true;
    }
  }
}
