import 'dart:math' as math;

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class LocationInformation extends StatefulWidget {
  const LocationInformation({
    Key? key,
    required this.onTapCallback,
  }) : super(key: key);

  final void Function() onTapCallback;

  @override
  _LocationInformationState createState() => _LocationInformationState();
}

class _LocationInformationState extends State<LocationInformation> {
  int valueOfAngle = 180;
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  UpdateProfileState? updateProfileState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    updateProfileState = context.read<UpdateProfileState>();
  }

  void _onTap(bool value) {
    updateProfileState?.updateValueForLocation(
      value: !value,
    );
    if(!value) {
      widget.onTapCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Selector<UpdateProfileState, bool>(
      selector: (context, model) => model.checkForLocation,
      builder: (context, value, child) => Column(
        children: [
          GestureDetector(
            onTap: () => _onTap(value),
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'location'.localize(context),
                  style: ADTextStyle700.size22.setTextColor(
                    context.adColors.black,
                  ),
                ),
                if (value)
                  Transform.rotate(
                    angle: math.pi * valueOfAngle / valueOfAngle,
                    child: SvgPicture.asset(
                      SvgAssets.trailingArrow,
                      height: context.k_26,
                      width: context.k_26,
                      color: context.adColors.darkGreyTextColor,
                    ),
                  )
                else
                  SvgPicture.asset(
                    SvgAssets.trailingArrow,
                    height: context.k_26,
                    width: context.k_26,
                    color: context.adColors.darkGreyTextColor,
                  ),
              ],
            ),
          ),
          if (value)
            SizedBox(
              height: context.k_22,
            ),
          Visibility(
            visible: value,
            maintainState: true,
            child: Column(
              children: [
                ADDefaultEditableText(
                  componentData: updateProfileState?.updateProfileFormBuilder
                          ?.updateProfileForm.pinCode ??
                      ADEditableTextModel.defaultValue(),
                  nextFocus: (abc) => FocusScope.of(context).nextFocus(),
                ),
                SizedBox(
                  height: context.k_20,
                ),
                ADDefaultEditableText(
                  iconHeight: context.k_20,
                  iconWidth: context.k_20,
                  componentData: updateProfileState?.updateProfileFormBuilder
                          ?.updateProfileForm.countryOfResidence ??
                      ADEditableTextModel.defaultValue(),
                  onTap: () => adShowBottomSheet(
                    context: context,
                    childWidget: ADCountryCodeBottomSheet(
                      selectedCountry: updateProfileState
                              ?.updateProfileFormBuilder
                              ?.updateProfileForm
                              .countryOfResidence
                              .controller
                              .text ??
                          '',
                      onTap: (value) => onCountryTap(
                        updateProfileState
                                ?.updateProfileFormBuilder
                                ?.updateProfileForm
                                .countryOfResidence
                                .controller ??
                            TextEditingController(),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    controller.text = value.countryName.validateWithDefaultValue();
    //widget.flag.value = value.flag.validateWithDefaultValue();
  }
}
