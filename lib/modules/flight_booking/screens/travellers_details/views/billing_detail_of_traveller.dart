import 'dart:async';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class BillingDetailOfTraveller extends StatefulWidget {
  final BillingDetails? billingDetails;
  final GstDetail? gstDetail;

  const BillingDetailOfTraveller({
    this.billingDetails,
    this.gstDetail,
    Key? key,
  }) : super(key: key);

  @override
  _BillingDetailOfTravellerState createState() =>
      _BillingDetailOfTravellerState();
}

class _BillingDetailOfTravellerState extends State<BillingDetailOfTraveller> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  Timer? _timer;
  final timerInitiationLength = 5;
  final timerInitiationLengthForOther = 2;
  ProfileModel? profileModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    widget.billingDetails?.pinCode.controller.addListener(pinCodeListener);
    profileModel = context.read<AppSessionState>().profileModel;
    context
        .read<TravellerDetailState>()
        .formBuilderObject
        ?.billingDetail
        ?.setMaxLengthOfPin(
          widget.billingDetails?.country.controller.text ?? '',
        );
    FlightValidations.setCountryName(
      widget.billingDetails?.country.controller.text ?? '',
    );

    if ((widget.billingDetails?.city.controller.text.trim() ?? '').isNotEmpty ||
        (widget.billingDetails?.state.controller.text.trim() ?? '')
            .isNotEmpty) {
      widget.billingDetails?.city.enable = true;
      widget.billingDetails?.state.enable = true;
      widget.billingDetails?.city.readonly = false;
      widget.billingDetails?.state.readonly = false;
      widget.billingDetails?.state.validation =
          (String? value) => FlightValidations.validateState(value ?? '');
      widget.billingDetails?.city.validation =
          (String? value) => FlightValidations.validateCity(value ?? '');
    } else {
      widget.billingDetails?.city.enable = false;
      widget.billingDetails?.state.enable = false;
      widget.billingDetails?.city.readonly = true;
      widget.billingDetails?.state.readonly = true;
    }
  }

  @override
  void dispose() {
    widget.billingDetails?.pinCode.controller.removeListener(pinCodeListener);
    super.dispose();
  }

  void pinCodeListener() {
    if (context.read<TravellerDetailState>().isNeedToUpdatePinCode) {
      if (_timer != null) {
        _timer?.cancel();
        context.read<TravellerDetailState>().resetStateCity();
      }
      if (widget.billingDetails?.country.controller.text == 'India') {
        if ((widget.billingDetails?.pinCode.controller.text.length ?? 0) >
                timerInitiationLength &&
            context.read<TravellerDetailState>().oldPinValue !=
                widget.billingDetails?.pinCode.controller.text) {
          _timer = Timer(const Duration(milliseconds: 1000), fetchStateCity);
        }
      } else {
        if ((widget.billingDetails?.pinCode.controller.text.length ?? 0) >
                timerInitiationLengthForOther &&
            context.read<TravellerDetailState>().oldPinValue !=
                widget.billingDetails?.pinCode.controller.text) {
          _timer = Timer(const Duration(milliseconds: 1000), fetchStateCity);
        }
      }
    } else {
      context.read<TravellerDetailState>().isNeedToUpdatePinCode = true;
    }
  }

  void fetchStateCity() {
    context
        .read<TravellerDetailState>()
        .searchStateCityByPinCode(
          widget.billingDetails?.pinCode.controller.text ?? '',
          false,
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
    return Selector<TravellerDetailState, bool>(
      selector: (context, model) => model.isCheckGst,
      builder: (context, value, child) {
        return value
            ? ProfileFilledDetails(
                billingDetails: widget.billingDetails,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'billing_details'.localize(context),
                    style: ADTextStyle700.size22
                        .setTextColor(context.adColors.black),
                  ),
                  ADDefaultEditableText(
                    componentData: widget.billingDetails?.address ??
                        ADEditableTextModel.defaultValue(),
                  ).paddingBySide(top: context.k_20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ADDefaultEditableText(
                          componentData: widget.billingDetails?.country ??
                              ADEditableTextModel.defaultValue(),
                          onTap: () => adShowBottomSheet(
                            context: context,
                            childWidget: ADCountryCodeBottomSheet(
                              selectedCountry: widget.billingDetails?.country
                                      .controller.text ??
                                  '',
                              onTap: (value) => onCountryTap(
                                widget.billingDetails?.country.controller ??
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
                      Selector<TravellerDetailState, bool>(
                        selector: (context, model) => model.fetchingCityState,
                        builder: (context, value, child) => Expanded(
                          child: ADDefaultEditableText(
                            componentData: widget.billingDetails?.pinCode ??
                                ADEditableTextModel.defaultValue(),
                            isLoadedEnable: value,
                          ),
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    top: context.k_20,
                  ),
                  Selector<TravellerDetailState, bool>(
                    selector: (context, model) => model.fetchingCityState,
                    builder: (context, value, child) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ADDefaultEditableText(
                            componentData: widget.billingDetails?.state ??
                                ADEditableTextModel.defaultValue(),
                            // onTap: () =>
                            // showToast(
                            //   context,
                            //   context.adColors.black,
                            //   '',
                            //   Text(
                            //     (widget.billingDetails?.state.controller.text
                            //                 .isNotEmpty ??
                            //             false)
                            //         ? 'selected_state_city'.localize(context)
                            //         : 'please_enter_your_pincode'.localize(context),
                            //     style: ADTextStyle600.size14
                            //         .copyWith(color: ADColors.white),
                            //   ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: context.k_16,
                        ),
                        Expanded(
                          child: ADDefaultEditableText(
                            componentData: widget.billingDetails?.city ??
                                ADEditableTextModel.defaultValue(),
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_20,
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
                top: context.k_40,
                bottom: context.k_40,
              );
      },
    );
  }

  // this method is use for set country name
  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    setState(() {
      controller.text = value.countryName.validateWithDefaultValue();
    });
    FlightValidations.setCountryName(
      widget.billingDetails?.country.controller.text ?? '',
    );
    context
        .read<TravellerDetailState>()
        .formBuilderObject
        ?.billingDetail
        ?.setMaxLengthOfPin(
          widget.billingDetails?.country.controller.text ?? '',
        );
    context.read<TravellerDetailState>().oldPinValue = null;
    widget.billingDetails?.pinCode.controller.clear();
    widget.billingDetails?.state.controller.clear();
    widget.billingDetails?.city.controller.clear();
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
}

class ProfileFilledDetails extends StatefulWidget {
  final BillingDetails? billingDetails;

  const ProfileFilledDetails({this.billingDetails, Key? key}) : super(key: key);

  @override
  State<ProfileFilledDetails> createState() => _ProfileFilledDetailsState();
}

class _ProfileFilledDetailsState extends State<ProfileFilledDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _navigateBillingEditingScreen(context),
      child: Selector<TravellerDetailState, bool>(
        selector: (context, model) => model.fromBottomSheet,
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'billing_details'.localize(context),
                      style: ADTextStyle700.size22
                          .setTextColor(context.adColors.black),
                    ),
                    Text(
                      '${widget.billingDetails?.address.controller.text} ${widget.billingDetails?.city.controller.text} ${widget.billingDetails?.state.controller.text} - ${widget.billingDetails?.pinCode.controller.text} ${widget.billingDetails?.country.controller.text}',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(
                      right: context.k_10,
                      top: context.k_10,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: context.adColors.darkGreyTextColor,
                size: context.k_16,
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
            bottom: context.k_20,
          );
        },
      ),
    );
  }

  void _navigateBillingEditingScreen(
    BuildContext context,
  ) {
    context.read<TravellerDetailState>().setValueFromBootmSheet();
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      genericBillingScreen,
      argumentObject: TravellerDetailNavigateModel(
        UpdateBillingModel(
          widget.billingDetails?.address.controller.text ?? '',
          widget.billingDetails?.country.controller.text ?? '',
          widget.billingDetails?.pinCode.controller.text ?? '',
          widget.billingDetails?.city.controller.text ?? '',
          widget.billingDetails?.state.controller.text ?? '',
        ),
        (billingDetailForm) => {
          if (billingDetailForm != null)
            {
              context.read<TravellerDetailState>().isNeedToUpdatePinCode =
                  false,
              context
                  .read<TravellerDetailState>()
                  .setBillingEditValue(billingDetailForm),
            },
        },
      ),
    );
  }
}
