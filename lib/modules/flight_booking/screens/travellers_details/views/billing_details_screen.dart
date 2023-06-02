import 'dart:async';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/billing_detail_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/billing_detail_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/billing_detail_validation.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class BillingDetailsScreen extends StatefulWidget {
  final TravellerDetailNavigateModel? travellerDetailNavigateModel;

  const BillingDetailsScreen({this.travellerDetailNavigateModel, Key? key})
      : super(key: key);

  @override
  _BillingDetailsScreenState createState() => _BillingDetailsScreenState();
}

class _BillingDetailsScreenState extends State<BillingDetailsScreen> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  Timer? _timer;
  final timerInitiationLength = 5;
  BillingDetailState provider = BillingDetailState();
  final _formKey = GlobalKey<FormState>();
  final timerInitiationLengthForOther = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    provider.billingDetailBuilder =
        BillingDetailBuilder.fromBillingDetailResponse(
      onChange: onChangeOfForm,
      updateBillingModel:
          widget.travellerDetailNavigateModel?.updateBillingModel ??
              UpdateBillingModel('', '', '', '', ''),
    );
    provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
        .addListener(pinCodeListener);
    provider.billingDetailBuilder?.billingDetailForm.setMaxLengthOfPin(
      provider.billingDetailBuilder?.billingDetailForm.country.controller
              .text ??
          '',
    );
    BillingDetailValidation.setCountryName(
      provider.billingDetailBuilder?.billingDetailForm.country.controller
              .text ??
          '',
    );
    provider.oldPinValue = provider
        .billingDetailBuilder?.billingDetailForm.pinCode.controller.text;
  }

  @override
  void dispose() {
    provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
        .removeListener(pinCodeListener);
    super.dispose();
  }

  void onChangeOfForm() {
    //TODO
  }

  void pinCodeListener() {
    if (_timer != null) {
      _timer?.cancel();
      provider.resetStateCity();
    }

    if (provider
            .billingDetailBuilder?.billingDetailForm.country.controller.text ==
        'India') {
      if ((provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
                      .text.length ??
                  0) >
              timerInitiationLength &&
          provider.oldPinValue !=
              provider.billingDetailBuilder?.billingDetailForm.pinCode
                  .controller.text) {
        _timer = Timer(const Duration(milliseconds: 400), fetchStateCity);
      }
    } else {
      if ((provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
                      .text.length ??
                  0) >
              timerInitiationLengthForOther &&
          provider.oldPinValue !=
              provider.billingDetailBuilder?.billingDetailForm.pinCode
                  .controller.text) {
        _timer = Timer(const Duration(milliseconds: 400), fetchStateCity);
      }
    }
  }

  void fetchStateCity() {
    provider
        .searchStateCityByPinCode(
      provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
              .text ??
          '',
    )
        .then((value) {
      if (value.viewStatus != Status.complete && value.data == null) {
        showToast(
          context,
          context.adColors.black,
          '',
          Text(
            'please_enter_valid_number'.localize(context),
            style: ADTextStyle600.size14.copyWith(color: ADColors.white),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'billing_details'.localize(context),
            style: ADTextStyle700.size22,
          ).paddingBySide(
            left: context.k_16,
          ),
          ADSelectorStateLessWidget<BillingDetailState>(
            viewModel: provider,
            child: Selector<BillingDetailState, bool>(
              selector: (context, model) => model.fetchingCityState,
              builder: (context, value, child) => Form(
                key: _formKey,
                child: AbsorbPointer(
                  absorbing: value,
                  child: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ADDefaultEditableText(
                          componentData: provider.billingDetailBuilder
                                  ?.billingDetailForm.address ??
                              ADEditableTextModel.defaultValue(),
                        ).paddingBySide(top: context.k_20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ADDefaultEditableText(
                                componentData: provider.billingDetailBuilder
                                        ?.billingDetailForm.country ??
                                    ADEditableTextModel.defaultValue(),
                                onTap: () => adShowBottomSheet(
                                  context: context,
                                  childWidget: ADCountryCodeBottomSheet(
                                    selectedCountry: provider
                                            .billingDetailBuilder
                                            ?.billingDetailForm
                                            .country
                                            .controller
                                            .text ??
                                        '',
                                    onTap: (value) => onCountryTap(
                                      provider
                                              .billingDetailBuilder
                                              ?.billingDetailForm
                                              .country
                                              .controller ??
                                          TextEditingController(),
                                      value,
                                    ),
                                    countryListCodes:
                                        _siteCoreStateManagement.country,
                                  ),
                                  headerTitle: 'Country',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.k_16,
                            ),
                            Selector<BillingDetailState, bool>(
                              selector: (context, model) =>
                                  model.fetchingCityState,
                              builder: (context, value, child) => Expanded(
                                child: ADDefaultEditableText(
                                  componentData: provider.billingDetailBuilder
                                          ?.billingDetailForm.pinCode ??
                                      ADEditableTextModel.defaultValue(),
                                  isLoadedEnable: value,
                                ),
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          top: context.k_20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ADDefaultEditableText(
                                componentData: provider.billingDetailBuilder
                                        ?.billingDetailForm.state ??
                                    ADEditableTextModel.defaultValue(),
                              ),
                            ),
                            SizedBox(
                              width: context.k_16,
                            ),
                            Expanded(
                              child: ADDefaultEditableText(
                                componentData: provider.billingDetailBuilder
                                        ?.billingDetailForm.city ??
                                    ADEditableTextModel.defaultValue(),
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          top: context.k_20,
                        ),
                        SizedBox(
                          height: context.k_48,
                          width: context.widthOfScreen,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    context.k_28,
                                  ),
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide.none,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                context.adColors.blueColor,
                              ),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                  horizontal: context.k_32,
                                  vertical: context.k_14,
                                ),
                              ),
                            ),
                            onPressed: () => continueToBack(),
                            child: Text(
                              'submit'.localize(context),
                              style: ADTextStyle700.size16.setTextColor(
                                context.adColors.whiteTextColor,
                              ),
                            ),
                          ),
                        ).paddingBySide(top: context.k_30),
                      ],
                    ).paddingBySide(left: context.k_16, right: context.k_16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> continueToBack() async {
    if (_formKey.currentState?.validate() == true) {
      widget.travellerDetailNavigateModel?.billingDetailForm(
        UpdateBillingModel(
          provider.billingDetailBuilder?.billingDetailForm.address.controller
                  .text ??
              '',
          provider.billingDetailBuilder?.billingDetailForm.country.controller
                  .text ??
              '',
          provider.billingDetailBuilder?.billingDetailForm.pinCode.controller
                  .text ??
              '',
          provider.billingDetailBuilder?.billingDetailForm.city.controller
                  .text ??
              '',
          provider.billingDetailBuilder?.billingDetailForm.state.controller
                  .text ??
              '',
        ),
      );
      Navigator.of(context).pop();
    } else {
      if (provider.billingDetailBuilder?.billingDetailForm.address.controller
              .text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          provider.billingDetailBuilder?.billingDetailForm.address.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.billingDetailBuilder?.billingDetailForm.address.focusNode,
        );
      } else if (provider.billingDetailBuilder?.billingDetailForm.pinCode
              .controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          provider.billingDetailBuilder?.billingDetailForm.pinCode.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.billingDetailBuilder?.billingDetailForm.pinCode.focusNode,
        );
      } else if (provider.billingDetailBuilder?.billingDetailForm.city
              .controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          provider.billingDetailBuilder?.billingDetailForm.city.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.billingDetailBuilder?.billingDetailForm.city.focusNode,
        );
      } else if (provider.billingDetailBuilder?.billingDetailForm.state
              .controller.text.isEmpty ??
          false) {
        await Scrollable.ensureVisible(
          provider.billingDetailBuilder?.billingDetailForm.state.globalKey
                  ?.currentContext ??
              context,
        );
        FocusScope.of(context).requestFocus(
          provider.billingDetailBuilder?.billingDetailForm.state.focusNode,
        );
      }
    }
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

  // this method is use for set country name
  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    setState(() {
      controller.text = value.countryName.validateWithDefaultValue();
    });
    BillingDetailValidation.setCountryName(
      provider.billingDetailBuilder?.billingDetailForm.country.controller
              .text ??
          '',
    );
    provider.billingDetailBuilder?.billingDetailForm.setMaxLengthOfPin(
      provider.billingDetailBuilder?.billingDetailForm.country.controller
              .text ??
          '',
    );
    provider.oldPinValue = null;
    provider.billingDetailBuilder?.billingDetailForm.pinCode.controller.clear();
    provider.billingDetailBuilder?.billingDetailForm.state.controller.clear();
    provider.billingDetailBuilder?.billingDetailForm.city.controller.clear();
  }
}
