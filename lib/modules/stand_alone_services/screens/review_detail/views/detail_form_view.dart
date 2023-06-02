/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/generic_billing_details_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/stand_alone_contact_detail_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/stand_alone_personal_detail_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DetailFormView extends StatefulWidget {
  const DetailFormView({Key? key}) : super(key: key);

  @override
  State<DetailFormView> createState() => _DetailFormViewState();
}

class _DetailFormViewState extends State<DetailFormView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color dividerColor = Color(0xfff8f8f8);
    void refreshAndValidate(isValidate) {
      adLog('refreshAndValidate $isValidate');
      // validateForm();
      //  adLog(isValidate.toString());
    }

    return Consumer<StandAloneReviewDetailStateManagement>(
      builder: (context, state, _) {
        return Form(
          key: state.formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ADSizedBox(
                height: context.k_24,
              ),
              const StandAlonePersonalDetailView().paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
              ADSizedBox(
                height: context.k_40,
              ),
              Divider(
                thickness: context.k_8,
                color: dividerColor,
              ),
              ADSizedBox(
                height: context.k_40,
              ),
              const StandAloneContactDetailView().paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              ValueListenableBuilder(
                valueListenable: state.useGSTNumber,
                builder: (_, value, __) {
                  return !state.useGSTNumber.value
                      ? Column(
                          children: [
                            ADSizedBox(
                              height: context.k_20,
                            ),
                            Divider(
                              thickness: context.k_8,
                              color: dividerColor,
                            ),
                            ADSizedBox(
                              height: context.k_40,
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                },
              ),
              GenericBillingDetailsView(
                countryController: state.countryController,
                countryErrorMsg: state.countryErrorMsg,
                stateController: state.stateController,
                stateErrorMsg: state.stateErrorMsg,
                cityController: state.cityController,
                cityErrorMsg: state.cityErrorMsg,
                addressController: state.addressController,
                pincodeController: state.pincodeController,
                onCitySelected: (value) => state.selectedCity = value,
                onStateSelected: (value) => state.selectedState = value,
                onCountrySelected: (value) => state.selectedCountry = value,
              ).paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
            ],
          ).paddingBySide(
            bottom: context.k_56,
          ),
        );
      },
    );
  }
}
