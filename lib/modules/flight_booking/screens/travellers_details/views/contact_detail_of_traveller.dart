/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for contact detail of traveller details
class ContactDetailOfTraveller extends StatefulWidget {
  final ContactDetails? contactDetails;
  final FlightViewItineraryResponseModel flightViewItineraryResponseModel;

  const ContactDetailOfTraveller({
    Key? key,
    this.contactDetails,
    required this.flightViewItineraryResponseModel,
  }) : super(key: key);

  @override
  State<ContactDetailOfTraveller> createState() =>
      _ContactDetailOfTravellerState();
}

/// this class is use for create form of contact detail and perform operation
class _ContactDetailOfTravellerState extends State<ContactDetailOfTraveller> {
  ValueNotifier<String> flag = ValueNotifier(
    ProfileSingleton.profileSingleton.countryCodeData.flag ?? '',
  );

  String selectedCountryCode = 'IN';

  /// this is use for country code data
  CountryCodeData? countryCodeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCountryCode =
        widget.contactDetails?.countryCode.selectedCountryCode ?? 'IN';

    flag.value = widget.flightViewItineraryResponseModel.paxInfoList?.first
                .personName?.firstName !=
            ''
        ? context.read<FlightCommonState>().countryCodeData?.flag ?? ''
        : context.read<SiteCoreStateManagement>().getFlag();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_details'.localize(context),
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          'ticket_will_be_send'.localize(context),
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.darkGreyTextColor),
        ),
        ADSizedBox(
          height: context.k_30,
        ),

        /// this is use for implement country code list and phone number filed
        ADDefaultEditableText(
          componentData: widget.contactDetails?.contactNumber ??
              ADEditableTextModel.defaultValue(),
          prefixWidget: DropDownGeneric(
            type: (widget.contactDetails?.countryCode.placeHolder ?? '')
                .localize(context),
            showDivider: true,
            isForCountyCode: true,
            onTap: () => showBottomSheetDialog(
              BottomSheetType.fromCountryCode,
            ),
            controller: widget.contactDetails?.countryCode.controller ??
                TextEditingController(),
            prefixIconUrl: flag,
          ),
          selectedCountryCode: selectedCountryCode,
          nextFocus: (abc) => FocusScope.of(context)
              .requestFocus(widget.contactDetails?.emailAddress.focusNode),
        ),
        SizedBox(
          height: context.k_20,
        ),
        ADDefaultEditableText(
          componentData: widget.contactDetails?.emailAddress ??
              ADEditableTextModel.defaultValue(),
        ),
      ],
    );
  }

  /// this will be return widget of country list and country code list
  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    CountryCodeBottomSheet(
      context: context,
      type: type,
      selectedItem:
          widget.contactDetails?.contactNumber.controller.text.toString(),
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
    if (widget.contactDetails?.countryCode.controller.text !=
        value2.callingCode) {
      widget.contactDetails?.contactNumber.controller.text = '';
    }
    widget.contactDetails?.countryCode.controller.text =
        value2.callingCode.validateWithDefaultValue();

    flag.value = value2.flag?.validateWithDefaultValue() ?? '';
    widget.contactDetails?.contactNumber.length = FlightUtils.lengthOfNumber(
      widget.contactDetails?.countryCode.controller.text ?? '',
    );
    widget.contactDetails?.countryCode.onChange.call();

    setState(() {
      selectedCountryCode = value2.countryCode ?? 'IN';
      widget.contactDetails?.countryCode.selectedCountryCode =
          selectedCountryCode;
      countryCodeData = value2;
      context.read<FlightCommonState>().countryCodeData = value2;
    });
  }
}
