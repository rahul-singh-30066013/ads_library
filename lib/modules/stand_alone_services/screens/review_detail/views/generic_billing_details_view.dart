/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_codes/country_codes_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/city_list_with_search.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/state_list_with_search.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/country_code_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/site_core_master_util.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core_masters;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class GenericBillingDetailsView extends StatefulWidget {
  /// this is used to fill information about the billing details.
  const GenericBillingDetailsView({
    Key? key,
    required this.countryController,
    this.countryErrorMsg,
    required this.stateController,
    this.stateErrorMsg,
    required this.cityController,
    this.cityErrorMsg,
    required this.addressController,
    required this.pincodeController,
    this.onStateSelected,
    this.onCountrySelected,
    this.onCitySelected,
  }) : super(key: key);
  final ControllersAndFocusV2 countryController;
  final ValueNotifier<String>? countryErrorMsg;
  final ControllersAndFocusV2 stateController;
  final ValueNotifier<String>? stateErrorMsg;
  final ControllersAndFocusV2 cityController;
  final ValueNotifier<String>? cityErrorMsg;
  final ControllersAndFocusV2 addressController;
  final ControllersAndFocusV2 pincodeController;
  final void Function(site_core_masters.State value)? onStateSelected;
  final void Function(site_core_masters.Country value)? onCountrySelected;
  final void Function(city_list.Result value)? onCitySelected;

  @override
  _GenericBillingDetailsViewState createState() =>
      _GenericBillingDetailsViewState();
}

class _GenericBillingDetailsViewState extends State<GenericBillingDetailsView>
    with AutomaticKeepAliveClientMixin {
  List<site_core.State>? stateData;
  List<city_list.Result>? citiesData;
  CountryCodeState codeState = CountryCodeState();
  List<CountryCodesList>? countryCodesList;
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  ValueNotifier<site_core_masters.Country?> selectedCountry =
      ValueNotifier(const site_core_masters.Country());
  final ValueNotifier<bool> _isIndiaCountrySelected = ValueNotifier(false);
  final ValueNotifier<bool> _isCityDisabled = ValueNotifier(true);
  final ValueNotifier<bool> _isCityDropDown = ValueNotifier(false);
  final ValueNotifier<bool> _citiesLoading = ValueNotifier(false);
  final ValueNotifier<bool> _isPinCodeDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    // _isCityDropDown.value = citiesAvailable();
    _siteCoreStateManagement.statesListByCountry.clear();
    codeState.getCountryCodesfromJSON().then((value) {
      final CountryCodesResponseModel countryCodesResponseModel = value;
      countryCodesList = countryCodesResponseModel.data;
      stateData = _siteCoreStateManagement.state;
      citiesData = _siteCoreStateManagement.citiesListData;
      adLog('citiesData ${citiesData?.length}', className: this);
      /*countryMasterList =
          widget.pranaamAppDataStateManagement.getCountryMaster();*/
    });
  }

  @override
  void dispose() {
    _isIndiaCountrySelected.dispose();
    super.dispose();
  }

  /// refresh and validting
  void refreshAndValidate(isValidate) {
    adLog('refreshAndValidate $isValidate');
    // validateForm();
    //  adLog(isValidate.toString());
  }

  @override
  Widget build(BuildContext context) {
    final temp = super.build(context);
    final state = context.read<StandAloneReviewDetailStateManagement>();

    adLog('$temp');
    const maxAddressLength = 400;
    const Color dividerColor = Color(0xfff8f8f8);

    adLog('Widget build', className: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: state.useGSTNumber,
          builder: (_, value, __) {
            return !state.useGSTNumber.value
                ? Text(
                    'billing_details'.localize(context),
                    style: ADTextStyle700.size22
                        .setTextColor(context.adColors.black),
                  ).paddingBySide(
                    bottom: context.k_20,
                  )
                : const SizedBox.shrink();
          },
        ),
        ValidatedTextField(
          key: widget.addressController.key,
          validation: Validations.validateAddressLine,
          textLength: maxAddressLength,
          focus: widget.addressController.focusNode,
          notifyParent: refreshAndValidate,
          type: 'address'.localize(context),
          controller: widget.addressController.controller,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Selector<SiteCoreStateManagement, SiteCoreStateManagement>(
                selector: (_, viewModel) => viewModel,
                builder: (_, viewModel, __) {
                  return DropDownGeneric(
                    key: widget.countryController.key,
                    errorMsg: widget.countryErrorMsg,
                    focus: widget.countryController.focusNode,
                    type: 'country'.localize(context),
                    needRightPadding: false,
                    onTap: () => adShowBottomSheet(
                      context: context,
                      childWidget: ADCountryCodeBottomSheet(
                        onTap: (value) => onCountryTap(
                          widget.countryController.controller,
                          value,
                        ),
                        countryListCodes: _siteCoreStateManagement.country,
                        selectedCountry: selectedCountry.value != null
                            ? selectedCountry.value?.countryName ?? ''
                            : '',
                      ),
                      headerTitle: 'Country Code',
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
                  );
                },
              ),
            ),
            ADSizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: selectedCountry,
                builder: (context, value, child) {
                  return !statesAvailable()
                      ? AbsorbPointer(
                          absorbing:
                              widget.countryController.controller.text.isEmpty,
                          child: ValidatedTextField(
                            // //focus: widget.stateController.focusNode,
                            key: widget.stateController.key,
                            notifyParent: (_) => _isCityDisabled.value =
                                widget.stateController.controller.text.isEmpty,
                            //widget.state.refreshAndValidate,
                            type: 'state'.localize(context),
                            controller: widget.stateController.controller,
                            isDisabled: widget
                                .countryController.controller.text.isEmpty,
                          ),
                        )
                      : Selector<SiteCoreStateManagement,
                          List<site_core_masters.State>>(
                          selector: (_, viewModel) => viewModel.state,
                          builder: (_, stateList, __) {
                            return AbsorbPointer(
                              absorbing: widget
                                  .countryController.controller.text.isEmpty,
                              child: DropDownGeneric(
                                key: widget.stateController.key,
                                errorMsg: widget.stateErrorMsg,
                                focus: widget.stateController.focusNode,
                                type: 'state'.localize(context),
                                needRightPadding: false,
                                isDisabled: widget
                                    .countryController.controller.text.isEmpty,
                                onTap: () => adShowBottomSheet(
                                  childWidget: StateListWithSearch(
                                    callback: (value) => onStateTap(
                                      widget.stateController.controller,
                                      value,
                                    ),
                                    selectedState:
                                        widget.stateController.controller.text,
                                  ),
                                  context: context,
                                  headerTitle: 'state'.localize(context),
                                ).then(
                                  (value) => {
                                    searchTextController.clear(),
                                  },
                                ),
                                controller: widget.stateController.controller,
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _isCityDisabled,
                builder: (context, bool value, child) {
                  return ValueListenableBuilder(
                    valueListenable: _isCityDropDown,
                    builder: (context, bool isCityDropDown, child) {
                      return !isCityDropDown
                          ? AbsorbPointer(
                              absorbing: value,
                              child: ValueListenableBuilder(
                                valueListenable: _citiesLoading,
                                builder: (context, bool citiesLoading, child) {
                                  return citiesLoading
                                      ? Container(
                                          height: context.k_60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: context
                                                  .adColors.tileBorderColor,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                context.k_8,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: const ADDotProgressView(
                                            size: 7,
                                          ),
                                        )
                                      : ValidatedTextField(
                                          //focus: widget.cityController.focusNode,
                                          key: widget.cityController.key,
                                          notifyParent: (_) =>
                                              _isPinCodeDisabled.value = widget
                                                  .cityController
                                                  .controller
                                                  .text
                                                  .isEmpty,
                                          //widget.state.refreshAndValidate,
                                          type: 'city'.localize(context),
                                          controller:
                                              widget.cityController.controller,
                                          isDisabled: value,
                                        );
                                },
                              ),
                            )
                          : Selector<SiteCoreStateManagement,
                              List<city_list.Result>>(
                              selector: (_, viewModel) =>
                                  viewModel.citiesListData,
                              builder: (_, citiesList, __) {
                                return ValueListenableBuilder(
                                  valueListenable: _citiesLoading,
                                  builder:
                                      (context, bool citiesLoading, child) {
                                    return AbsorbPointer(
                                      absorbing: value,
                                      child: citiesLoading
                                          ? Container(
                                              height: context.k_60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: context
                                                      .adColors.tileBorderColor,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    context.k_8,
                                                  ),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: const ADDotProgressView(
                                                size: 7,
                                              ),
                                            )
                                          : DropDownGeneric(
                                              key: widget.cityController.key,
                                              errorMsg: widget.cityErrorMsg,
                                              focus: widget
                                                  .cityController.focusNode,
                                              needRightPadding: false,
                                              type: 'city'.localize(context),
                                              isDisabled: widget.stateController
                                                  .controller.text.isEmpty,
                                              onTap: () => adShowBottomSheet(
                                                childWidget: CityListWithSearch(
                                                  callback: (value) =>
                                                      updateData(
                                                    widget.cityController
                                                        .controller,
                                                    value,
                                                  ),
                                                  selectedCity: widget
                                                      .cityController
                                                      .controller
                                                      .text,
                                                ),
                                                context: context,
                                                headerTitle:
                                                    'city'.localize(context),
                                              ).then(
                                                (value) => {
                                                  searchTextController.clear(),
                                                },
                                              ),
                                              controller: widget
                                                  .cityController.controller,
                                            ),
                                    );
                                  },
                                );
                              },
                            );
                    },
                  );
                },
              ),
            ),
            ADSizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _isIndiaCountrySelected,
                builder: (context, bool value, child) {
                  adLog('ValueListenableBuilder $value');
                  const otherCountryLimit = 10;
                  const indiaCountryLimit = 6;
                  return ValueListenableBuilder(
                    valueListenable: _isPinCodeDisabled,
                    builder: (context, bool isPinDisabled, child) {
                      return AbsorbPointer(
                        absorbing: isPinDisabled,
                        child: ValidatedTextField(
                          key: widget.pincodeController.key,
                          isDisabled: isPinDisabled,
                          focus: isPinDisabled
                              ? null
                              : widget.pincodeController.focusNode,
                          validation: isPinDisabled
                              ? null
                              : Validations.validatePinCode,
                          notifyParent: refreshAndValidate,
                          type: 'pincode'.localize(context),
                          keyboardType:
                              value ? TextInputType.number : TextInputType.text,
                          controller: widget.pincodeController.controller,
                          formatters: [
                            LengthLimitingTextInputFormatter(
                              value ? indiaCountryLimit : otherCountryLimit,
                            ),
                            if (value)
                              FilteringTextInputFormatter.deny(
                                RegExp(r'\s'),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        ADSizedBox(
          width: context.k_20,
        ),
      ],
    );
  }

  bool statesAvailable() {
    adLog(
      'statesAvailable ${context.read<SiteCoreStateManagement>().statesListByCountry.length}',
    );

    return context
        .read<SiteCoreStateManagement>()
        .statesListByCountry
        .isNotEmpty;
  }

  bool citiesAvailable() {
    adLog(
      'citiesAvailable ${context.read<SiteCoreStateManagement>().citiesListDataByState.length}',
    );

    return context
        .read<SiteCoreStateManagement>()
        .citiesListDataByState
        .isNotEmpty;
  }

  void updateData(
    TextEditingController controller,
    city_list.Result selectedCity,
  ) {
    navigatorPopScreen(context);
    widget.onCitySelected?.call(selectedCity);
    controller.text = selectedCity.name;
    _isPinCodeDisabled.value = false;
    widget.cityErrorMsg?.value = '';
  }

  void onCountryTap(
    TextEditingController controller,
    site_core_masters.Country value,
  ) {
    selectedCountry.value = value;
    adLog('onCountryTap $value $selectedCountry');
    controller.text = value.countryName.validateWithDefaultValue();
    widget.onCountrySelected?.call(value);
    //widget.flag.value = value.flag.validateWithDefaultValue();
    _siteCoreStateManagement.updateStateOnCountryBasis(
      getStateOnBasisOfCountryCode(
        stateData ?? [],
        value.isO2.validateWithDefaultValue(),
      ),
    );
    final bool isIndiaSelected = isCountryIndiaSelected(
      controller,
    );
    Validations.isPinCodeForIndia = isIndiaSelected;
    _isIndiaCountrySelected.value = isIndiaSelected;
    widget.countryErrorMsg?.value = '';
    _isCityDropDown.value = false;
    _isCityDisabled.value = true;
    _isPinCodeDisabled.value = true;
    widget.countryController.focusNode.unfocus();
    widget.stateController.controller.clear();
    widget.cityController.controller.clear();
    widget.pincodeController.controller.clear();
  }

  void onStateTap(
    TextEditingController controller,
    site_core_masters.State value,
  ) {
    adLog('onStateTap $value');
    widget.onStateSelected?.call(value);
    controller.text = value.name.validateWithDefaultValue();
    _isCityDisabled.value = false;
    navigatorPopScreen(context);

    // citiesData?.clear();

    // ProcessDialog.showLoadingDialog(context);
    _citiesLoading.value = true;

    _siteCoreStateManagement
        .fetchCitiesDataFromSiteCoreUsingStateCode(
      value.stateCode,
      selectedCountry.value?.isO2 ?? 'IN',
    )
        .then(
      (value) {
        if (value.viewStatus == Status.complete ||
            value.viewStatus == Status.error) {
          // ProcessDialog.closeLoadingDialog(context);
          _citiesLoading.value = false;
          _isCityDropDown.value = false;
        }
        if (value.viewStatus == Status.complete && value.data != null) {
          final city_list.Element element = value.data;
          final citiesListDataByState = element.fields.results;
          _isCityDropDown.value = citiesListDataByState.isNotEmpty;
        }
      },
      onError: (err) {
        _isCityDropDown.value = false;
      },
    );
    _siteCoreStateManagement.updateCityOnStateBasis(
      getCitiesOnBasisOfState(
        citiesData ?? [],
        value.countryCode.validateWithDefaultValue(),
        value.stateCode.validateWithDefaultValue(),
      ),
    );
    widget.stateErrorMsg?.value = '';
    widget.cityController.controller.clear();
    widget.cityController.focusNode.unfocus();
    _isPinCodeDisabled.value = true;
    widget.pincodeController.controller.clear();
  }

  @override
  bool get wantKeepAlive => true;
}

class ControllersAndFocusV2 {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  GlobalKey key = GlobalKey();

  ControllersAndFocusV2({String? text, String? debugLabel}) {
    controller = TextEditingController(text: text);
    key = GlobalKey(debugLabel: debugLabel);
  }

  String get text => controller.text;

  void scrollPage(BuildContext context) {
    const double alignment = 0.5;
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject != null) {
      final temp = PrimaryScrollController.of(context)?.position.ensureVisible(
            renderObject,
            alignment: alignment,
            duration: const Duration(milliseconds: 500),
          );
      adLog('$temp');
    }
  }
}
