/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_codes/country_codes_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_master/response_model/country_masters.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/salutation_form_radio.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/country_code_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PersonalDetailView extends StatefulWidget {
  /// This is used to draw the view consist of fields like name,
  /// country and mobile.
  const PersonalDetailView({
    Key? key,
    required this.countryCodeController,
    required this.countryController,
    required this.lastNameController,
    required this.genderController,
    required this.firstNameController,
    this.ageController,
    required this.state,
    this.controllerIndex,
    this.titleHeading,
    this.isPlacardView = false,
    required this.flag,
    this.isPlacardEditableView,
  }) : super(key: key);
  final ControllersAndFocus countryCodeController;

  final ControllersAndFocus countryController;
  final ControllersAndFocus lastNameController;
  final ControllersAndFocus genderController;
  final ControllersAndFocus firstNameController;
  final ControllersAndFocus? ageController;

  final PranaamTravellerScreenState state;
  final int? controllerIndex;
  final ValueNotifier<String> flag;
  final String? titleHeading;
  final bool isPlacardView;
  final bool? isPlacardEditableView;

  @override
  _PersonalDetailViewState createState() => _PersonalDetailViewState();
}

class _PersonalDetailViewState extends State<PersonalDetailView> {
  List<site_core.Salutation> salutations = [];

  CountryCodeState codeState = CountryCodeState();
  List<CountryCodesList>? countryCodesList;

  List<CountryMasters> countryMasterList = [];

  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  final ValueNotifier<bool> _updateField = ValueNotifier(false);

  @override
  void initState() {
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    codeState.getCountryCodesfromJSON().then((value) {
      final CountryCodesResponseModel countryCodesResponseModel = value;
      countryCodesList = countryCodesResponseModel.data;
      if (widget.flag.value.isEmpty) {
        widget.flag.value =
            '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7';
      }
      /*countryMasterList =
          widget.pranaamAppDataStateManagement.getCountryMaster();*/
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    if ((widget.titleHeading ?? '').contains('adult'.localize(context))) {
      salutations = getSalutationsByCategory(
        'adult',
        _siteCoreStateManagement.salutation,
      );
    } else if ((widget.titleHeading ?? '')
        .contains('child'.localize(context))) {
      salutations = getSalutationsByCategory(
        'child',
        _siteCoreStateManagement.salutation,
      );
    } else {
      salutations = getSalutationsByCategory(
        'infant',
        _siteCoreStateManagement.salutation,
      );
    }

    if (salutations.isNotEmpty) {
      salutations.sort((a, b) => a.order.compareTo(b.order));
    }

    const nameMaxLength = 27;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SalutationFormRadio(
          controller: widget.genderController.controller,
          validator: (val) => Validations.validateSalutation(val, context),
          salutations: salutations,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ).paddingBySide(bottom: context.k_20),
        ValueListenableBuilder(
          valueListenable: _updateField,
          builder: (_, value, __) {
            return ValidatedTextField(
              nextFocus: widget.lastNameController.focusNode,
              textLength: nameMaxLength,
              focus: widget.firstNameController.focusNode,
              notifyParent: widget.state.refreshAndValidate,
              type: 'firstName'.localize(context),
              controller: widget.firstNameController.controller,
              validation: (String? value, BuildContext context) =>
                  Validations.validateFirstName(
                value,
                context,
              ),
              isDisabled: widget.isPlacardEditableView ?? false,
            );
          },
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ValidatedTextField(
          textLength: nameMaxLength,
          focus: widget.lastNameController.focusNode,
          notifyParent: widget.state.refreshAndValidate,
          type: 'last_name_middle_name'.localize(context),
          validation: Validations.validateLastName,
          //isDisabled: widget.isPlacardEditableView ?? false,
          controller: widget.lastNameController.controller,
          nextFocus: widget.titleHeading != '${'adult'.localize(context)} 1'
              ? widget.ageController?.focusNode
              : null,
        ),
        if (widget.controllerIndex == 0 &&
                widget.titleHeading == 'adult'.localize(context) ||
            widget.titleHeading == '${'adult'.localize(context)} 1')
          Column(
            children: [
              ADSizedBox(
                height: context.k_20,
              ),
              if (!widget.isPlacardView)
                Column(
                  children: [
                    Container(
                      key: widget.state.key,
                      child: DropDownGeneric(
                        //     focusScopeNode: widget.state.countryFocusScopeNode,
                        focus: widget.countryController.focusNode,
                        errorMsg: widget.state.countryNotifier,
                        needRightPadding: false,
                        type: 'country'.localize(context),
                        onTap: () => adShowBottomSheet(
                          context: context,
                          childWidget: ADCountryCodeBottomSheet(
                            selectedCountry:
                                widget.countryController.controller.text,
                            onTap: (value) => onCountryTap(
                              widget.countryController.controller,
                              value,
                            ),
                            countryListCodes: _siteCoreStateManagement.country,
                          ),
                          headerTitle: 'Country',
                        ).then(
                          (value) => {
                            searchTextController.clear(),
                            context
                                .read<PranaamAppDataStateManagement>()
                                .buildSearchCountryList(
                                  '',
                                  _siteCoreStateManagement.country,
                                ),
                          },
                        ),
                        controller: widget.countryController.controller,
                      ),
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
  }

  void onPrefixWidgetTap(
    BuildContext context,
    TextEditingController controller,
  ) {
    adShowBottomSheet(
      context: context,
      childWidget: ADCountryCodeBottomSheet(
        visibleCountryCode: true,
        visibleCountryDialCode: true,
        selectedCountry: controller.text,
        onTap: (value) => onBottomSheetTap(controller, value),
        countryListCodes: _siteCoreStateManagement.country,
      ),
      headerTitle: 'Country Code',
    );
  }

  void updateData(
    String value,
    TextEditingController controller,
  ) {
    navigatorPopScreen(context);
    controller.text = value;
    _updateField.value = !_updateField.value;
  }

  void onBottomSheetTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    controller.text = value.isO2.validateWithDefaultValue();
    widget.flag.value = value.countryFlagImage.validateWithDefaultValue();
  }

  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    controller.text = value.countryName.validateWithDefaultValue();
    widget.state.countryNotifier.value = '';
    // widget.countryCodeController.controller.text = value.id;
    context.read<PranaamAppDataStateManagement>().travellerSelectedCountryCode =
        value.id;
    //widget.flag.value = value.flag.validateWithDefaultValue();
  }
}
