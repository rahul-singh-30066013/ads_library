/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/personal_detail_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PlacardNameView extends StatefulWidget {
  /// This class is used to fill guest details to be displayed on placard.
  const PlacardNameView({
    Key? key,
    this.controllerIndex,
    required this.titleHeading,
    required this.state,
    this.isPrimary = false,
  }) : super(key: key);

  final int? controllerIndex;
  final String titleHeading;
  final PranaamTravellerScreenState state;
  final bool isPrimary;

  @override
  _PlacardNameViewState createState() => _PlacardNameViewState();
}

class _PlacardNameViewState extends State<PlacardNameView> {
  @override
  Widget build(BuildContext context) {
    const maxCommentsLength = 400;
    adLog('Widget build', className: this);
    const internationalMobileNumberLength = 15;
    const indianMobileNumberLength = 10;
    return Visibility(
      visible: widget.isPrimary,
      child: Column(
        children: [
          ADSizedBox(
            height: context.k_32,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: widget.state.isSameAdultCheckBox,
            builder: (_, value, __) {
              return Column(
                children: [
                  InkWell(
                    onTap: () => onClickCheckBox(
                      newValue: !widget.state.isSameAdultCheckBox.value,
                    ),
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(-2, 0),
                          child: SizedBox(
                            height: context.k_26,
                            child: Checkbox(
                              visualDensity:
                                  const VisualDensity(horizontal: -4),
                              value: widget.state.isSameAdultCheckBox.value,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              splashRadius: context.k_30,
                              checkColor: context.adColors.whiteTextColor,
                              fillColor: MaterialStateProperty.all(
                                context.adColors.blackTextColor,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              side: BorderSide(
                                color: context.adColors.greyTextColor,
                              ),
                              onChanged: (bool? value) =>
                                  onClickCheckBox(newValue: value),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.k_10,
                        ),
                        Text(
                          'Keep placard name same as primary guest info.',
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.controllerIndex == 0 &&
                        !widget.state.isSameAdultCheckBox.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ADSizedBox(
                          height: context.k_22,
                        ),
                        Selector<PranaamAppDataStateManagement, bool>(
                          selector: (_, viewModel) =>
                              viewModel.isSameAdultCheckBox,
                          builder: (a, b, c) {
                            return ValueListenableBuilder(
                              valueListenable: widget.state.isSameAdultCheckBox,
                              builder: (
                                BuildContext context,
                                bool plackCardView,
                                child,
                              ) {
                                return PersonalDetailView(
                                  state: widget.state,
                                  countryCodeController: widget
                                      .state
                                      .placardCardControllers
                                      .countryCodeController,
                                  countryController: widget.state
                                      .placardCardControllers.countryController,
                                  firstNameController: widget.state
                                      .placardCardControllers.fNameController,
                                  lastNameController: widget.state
                                      .placardCardControllers.lNameController,
                                  genderController: widget.state
                                      .placardCardControllers.genderController,
                                  controllerIndex: widget.controllerIndex,
                                  titleHeading: widget.titleHeading,
                                  isPlacardView: true,
                                  flag:
                                      widget.state.placardCardControllers.flag,
                                  isPlacardEditableView: plackCardView,
                                );
                              },
                            );
                          },
                        ),
                        ValidatedTextField(
                          focus: widget.state.placardCardControllers
                              .mobileController.focusNode,
                          notifyParent: widget.state.refreshAndValidate,
                          type: 'mobileNo'.localize(context),
                          asyncValidation: Validations.validateMobileLib,
                          textLength: widget.state.placardCardControllers
                                      .mobileController.controller.text ==
                                  '+91'
                              ? indianMobileNumberLength
                              : internationalMobileNumberLength,

                          controller: widget.state.placardCardControllers
                              .mobileController.controller,
                          keyboardType: TextInputType.number,
                          //isDisabled: false,
                          prefixWidget: DropDownGeneric(
                            //  widthOfDropDown: dropDownWidth,
                            type: 'countryCode'.localize(context),
                            isForCountyCode: true,
                            showDivider: true,
                            onTap: () => CountryCodeBottomSheet(
                              context: context,
                              type: BottomSheetType.fromCountryCode,
                            ).openCountryCodeBottomSheet((value) {
                              if (value is CountryCodeData) {
                                widget.state.placardCardControllers.flag.value =
                                    value.flag?.validateWithDefaultValue() ??
                                        '';
                                widget
                                    .state
                                    .placardCardControllers
                                    .countryCodeController
                                    .controller
                                    .text = value.callingCode
                                        ?.validateWithDefaultValue() ??
                                    '+91';
                              }
                            }),
                            controller: widget.state.placardCardControllers
                                .countryCodeController.controller,
                            prefixIconUrl:
                                widget.state.placardCardControllers.flag,
                          ),
                        ),
                        SizedBox(
                          height: context.k_20,
                        ),
                        ValidatedTextField(
                          textLength: maxCommentsLength,
                          notifyParent: widget.state.refreshAndValidate,
                          type: 'comments'.localize(context),
                          controller: widget.state.placardCardControllers
                              .commentsController.controller,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void onClickCheckBox({
    bool? newValue,
  }) {
    widget.state.updateSameAdultCheckBox(
      value: newValue ?? false,
    );
  }
}
