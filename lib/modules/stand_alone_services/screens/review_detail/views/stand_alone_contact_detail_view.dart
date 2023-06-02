import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneContactDetailView extends StatelessWidget {
  const StandAloneContactDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<StandAloneReviewDetailStateManagement>();
    const mobileNumberLength = 15;
    const lineHight = 1.4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_details'.localize(context),
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
        Text(
          'Booking detail will be sent to this email address and phone number.',
          style: ADTextStyle400.size16.copyWith(
            color: const Color(0xff666666),
            height: lineHight,
          ),
        ).paddingBySide(bottom: context.k_30, top: context.k_13),

        /// Email text field
        ValidatedTextField(
          key: state.emailController.key,
          focus: state.emailController.focusNode,
          validation: Validations.validateEmail,
          notifyParent: (p0) => {},
          type: 'emailID'.localize(context),
          controller: state.emailController.controller,
          keyboardType: TextInputType.emailAddress,
        ),

        ADSizedBox(
          height: context.k_20,
        ),

        /// Mobile number text field
        ValidatedTextField(
          key: state.mobileNumberController.key,
          focus: state.mobileNumberController.focusNode,
          notifyParent: (p0) => {},
          type: 'mobileNo'.localize(context),
          validation: Validations.validateMobile,
          textLength: mobileNumberLength,
          controller: state.mobileNumberController.controller,
          keyboardType: TextInputType.number,
          //isDisabled: false,
          prefixWidget: DropDownGeneric(
            key: state.countryCodeController.key,
            type: 'countryCode'.localize(context),
            isForCountyCode: true,
            showDivider: true,
            onTap: () => CountryCodeBottomSheet(
              context: context,
              type: BottomSheetType.fromCountryCode,
            ).openCountryCodeBottomSheet((value) {
              final CountryCodeData countryCodeData = value;
              final state =
                  context.read<StandAloneReviewDetailStateManagement>();
              state.flag.value =
                  countryCodeData.flag.validateWithDefaultValue();
              state.countryCodeController.controller.text =
                  countryCodeData.callingCode?.validateWithDefaultValue() ??
                      '+91';
            }),
            controller: state.countryCodeController.controller,
            prefixIconUrl: state.flag,
          ),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ValueListenableBuilder(
          valueListenable: state.useGSTNumber,
          builder: (_, value, __) {
            return InkWell(
              onTap: () => state.useGSTNumber.value = !state.useGSTNumber.value,
              child: Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-2, 0),
                    child: SizedBox(
                      height: context.k_26,
                      child: Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4),
                        value: state.useGSTNumber.value,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: context.k_30,
                        checkColor: context.adColors.whiteTextColor,
                        fillColor: MaterialStateProperty.all(
                          context.adColors.blackTextColor,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        side: BorderSide(
                          color: context.adColors.greyTextColor,
                        ),
                        onChanged: (bool? value) =>
                            state.useGSTNumber.value = value ?? false,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.k_10,
                  ),
                  Text(
                    'use_gst_number'.localize(context),
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                ],
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: state.useGSTNumber,
          builder: (_, value, __) {
            const maxCompanyNameLength = 100;
            return state.useGSTNumber.value
                ? Column(
                    children: [
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      ValidatedTextField(
                        validation: (value, context) =>
                            Validations.validateGstNumber(
                          value,
                          context,
                          state.selectedState.tinCode,
                        ),
                        // textLength: maxAddressLength,
                        focus: state.gstNumber.focusNode,
                        notifyParent: (p0) => {},
                        type: 'gst_number'.localize(context),
                        controller: state.gstNumber.controller,
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      ValidatedTextField(
                        validation: Validations.validateCompanyName,
                        textLength: maxCompanyNameLength,
                        focus: state.companyName.focusNode,
                        notifyParent: (p0) => {},
                        type: 'company_name'.localize(context),
                        controller: state.companyName.controller,
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
