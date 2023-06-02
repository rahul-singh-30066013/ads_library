/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/flight_detail_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/personal_detail_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/placard_view_.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AdultView extends StatefulWidget {
  /// This is used to draw all fields in the adult view
  const AdultView({
    Key? key,
    this.countryCodeController,
    this.countryController,
    required this.lastNameController,
    required this.genderController,
    required this.firstNameController,
    required this.adultHeading,
    this.flag,
    this.controllerIndex,
    this.classController,
    required this.ageController,
    this.passportController,
    this.baggageController,
    required this.state,
    this.ageRegex,
    this.isPrimary = false,
  }) : super(key: key);
  final ControllersAndFocus? countryCodeController;
  final ControllersAndFocus? countryController;
  final ControllersAndFocus lastNameController;
  final ControllersAndFocus genderController;
  final ControllersAndFocus firstNameController;
  final ControllersAndFocus? classController;
  final ControllersAndFocus ageController;
  final ControllersAndFocus? passportController;
  final ControllersAndFocus? baggageController;
  final PranaamTravellerScreenState state;

  final String adultHeading;
  final int? controllerIndex;
  final ValueNotifier<String>? flag;
  final String? Function(String?, BuildContext)? ageRegex;
  final bool isPrimary;

  @override
  _AdultViewState createState() => _AdultViewState();
}

class _AdultViewState extends State<AdultView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    //added to avoid the warning
    adLog(result.toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.controllerIndex == 0)
            ADSizedBox(
              height: context.k_20,
            )
          else
            ADSizedBox(
              height: context.k_34,
            ),
          RichText(
            text: TextSpan(
              text: widget.adultHeading,
              style: ADTextStyle700.size18.setTextColor(context.adColors.black),
            ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          PersonalDetailView(
            state: widget.state,
            ageController: widget.ageController,
            titleHeading: widget.adultHeading,
            countryController: widget.countryController ??
                ControllersAndFocus.name(TextEditingController(), FocusNode()),
            countryCodeController: widget.countryCodeController ??
                ControllersAndFocus.name(TextEditingController(), FocusNode()),
            firstNameController: widget.firstNameController,
            genderController: widget.genderController,
            lastNameController: widget.lastNameController,
            controllerIndex: widget.controllerIndex,
            flag: widget.flag ??
                ValueNotifier<String>(
                  'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
                ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          if (widget.controllerIndex == 0 &&
              (widget.adultHeading == 'adult'.localize(context) ||
                  widget.adultHeading == '${'adult'.localize(context)} 1'))
            FlightDetailView(
              state: widget.state,
              ageController: widget.ageController,
              baggageCountController: widget.baggageController ??
                  ControllersAndFocus.name(
                    TextEditingController(),
                    FocusNode(),
                  ),
              classController: widget.classController ??
                  ControllersAndFocus.name(
                    TextEditingController(),
                    FocusNode(),
                  ),
              passportController: widget.passportController ??
                  ControllersAndFocus.name(
                    TextEditingController(),
                    FocusNode(),
                  ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: ValidatedTextField(
                    focus: widget.ageController.focusNode,
                    textLength: ageLength,
                    validation: widget.ageRegex,
                    notifyParent: widget.state.refreshAndValidate,
                    type: 'age'.localize(context),
                    keyboardType: TextInputType.number,
                    controller: widget.ageController.controller,
                  ),
                ),
                const Spacer(),
              ],
            ),
          PlacardView(
            state: widget.state,
            titleHeading: widget.adultHeading,
            controllerIndex: widget.controllerIndex,
            isPrimary: widget.isPrimary,
          ),
        ],
      ),
    );
  }

  void onPrefixWidgetTap(TextEditingController controller, String value) {
    setState(() {
      controller.text = value;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
