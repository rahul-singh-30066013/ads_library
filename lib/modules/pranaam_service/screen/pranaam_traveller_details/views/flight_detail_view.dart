/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/salutation_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const ageLength = 3;

class FlightDetailView extends StatefulWidget {
  /// This view is used to fill your flight details like
  /// class, passport no,baggage count and age.
  const FlightDetailView({
    Key? key,
    required this.classController,
    required this.baggageCountController,
    required this.ageController,
    required this.passportController,
    required this.state,
    this.onTapAddMorePorter,
  }) : super(key: key);
  final ControllersAndFocus classController;
  final ControllersAndFocus baggageCountController;
  final ControllersAndFocus passportController;
  final ControllersAndFocus ageController;
  final PranaamTravellerScreenState state;
  final ADTapCallback? onTapAddMorePorter;

  @override
  _FlightDetailViewState createState() => _FlightDetailViewState();
}

class _FlightDetailViewState extends State<FlightDetailView> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    if (getMaxBaggageCount(pranaamAppDataStateManagement) == 0) {
      widget.baggageCountController.controller.text = '0';
    }
    super.initState();
  }

  final numberOfDots = 15;
  final spaceLength = 8;
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    adLog(
      'selectedService${pranaamAppDataStateManagement.serviceBookingData.selectedTravelSector?.travelSectorTitle}',
    );
    // final packageAvailableAddOn =
    //     pranaamAppDataStateManagement.cartDataResponse?.availiableAddOn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropDownGeneric(
                focus: widget.classController.focusNode,
                key: widget.state.travelClassKey,
                errorMsg: widget.state.travelClassNotifier,
                needRightPadding: false,
                type: 'flying_class'.localize(context),
                onTap: () => adShowBottomSheet(
                  childWidget: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _siteCoreStateManagement.flyingClass.length,
                      itemBuilder: (context, index) {
                        return SalutationView(
                          selectedItem: widget.classController.controller.text,
                          text:
                              _siteCoreStateManagement.flyingClass[index].label,
                          onBottomSheetItemSelect: (value) =>
                              onBottomSheetSelect(
                            widget.classController.controller,
                            value,
                          ),
                        );
                      },
                    ),
                  ),
                  context: context,
                  headerTitle: 'flying_class'.localize(context),
                ),
                controller: widget.classController.controller,
              ),
            ),
            ADSizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: ValidatedTextField(
                focus: widget.ageController.focusNode,
                textLength: ageLength,
                validation: Validations.validateAge,
                notifyParent: widget.state.refreshAndValidate,
                type: 'age'.localize(context),
                keyboardType: TextInputType.number,
                controller: widget.ageController.controller,
              ),
            ),
          ],
        ),
        if (!(pranaamAppDataStateManagement
                    .cartDataResponse?.tripDetail.travelSectorId ==
                id_3 ||
            pranaamAppDataStateManagement
                    .cartDataResponse?.tripDetail.travelSectorId ==
                id_6))
          ADSizedBox(
            height: context.k_20,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pranaamAppDataStateManagement
                        .cartDataResponse?.tripDetail.travelSectorId ==
                    id_3 ||
                pranaamAppDataStateManagement
                        .cartDataResponse?.tripDetail.travelSectorId ==
                    id_6)
              const SizedBox()
            else
              Expanded(
                child: ValidatedTextField(
                  focus: widget.passportController.focusNode,
                  validation: Validations.validateEmptyField,
                  notifyParent: widget.state.refreshAndValidate,
                  type: 'passport_no'.localize(context),
                  controller: widget.passportController.controller,
                  textInputAction: TextInputAction.done,
                ),
              ),
            // if (pranaamAppDataStateManagement
            //             .cartDataResponse?.tripDetail.travelSectorId ==
            //         id_3 ||
            //     pranaamAppDataStateManagement
            //             .cartDataResponse?.tripDetail.travelSectorId ==
            //         id_6)
            //   const ADSizedBox()
            // else
            //   ADSizedBox(
            //     width: context.k_20,
            //   ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        DropDownGeneric(
          isDisabled: getMaxBaggageCount(pranaamAppDataStateManagement) == 0,
          needRightPadding: false,
          iconColor: getMaxBaggageCount(pranaamAppDataStateManagement) == 0
              ? context.adColors.dividerColor
              : null,
          type: 'Total Baggages',
          errorMsg: widget.state.totalBaggageErrorNotifier,
          key: widget.state.totalBaggaeClassKey,
          focus: widget.baggageCountController.focusNode,
          controller: widget.baggageCountController.controller,
          onTap: () => getMaxBaggageCount(pranaamAppDataStateManagement) > 0
              ? widget.state.selectTotalBaggageCount(
                  context,
                  baggageController: widget.baggageCountController.controller,
                )
              : null,
        ),
        ADSizedBox(
          height: context.k_16,
        ),

        Text(
          'One porter can carry upto 3 baggages.',
          style: ADTextStyle400.size14,
        ),

        // if (packageAvailableAddOn != null && packageAvailableAddOn.isEmpty)
        //   const ADSizedBox()
        // else
        //   InkWell(
        //     onTap: () => widget.state.addOnsBottomSheet(context),
        //     child: Row(
        //       children: [
        //         // Container(
        //         //   height: context.k_30,
        //         //   width: context.k_30,
        //         //   decoration: BoxDecoration(
        //         //     border: Border.all(
        //         //       color: Colors.grey,
        //         //     ),
        //         //     shape: BoxShape.circle,
        //         //   ),
        //         //   child: const Icon(Icons.add),
        //         // ),
        //         Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             SizedBox(
        //               width: context.k_30,
        //               height: context.k_30,
        //               child: CustomPaint(
        //                 painter: DottedBorder(
        //                   numberOfDots: numberOfDots,
        //                   spaceLength: spaceLength,
        //                 ),
        //               ),
        //             ),
        //             Icon(
        //               Icons.add,
        //               color: context.adColors.blackTextColor,
        //             ),
        //           ],
        //         ),
        //         ADSizedBox(
        //           width: context.k_16,
        //         ),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               'Add/Update_Bags'.localize(context),
        //               style: ADTextStyle700.size18
        //                   .setTextColor(context.adColors.blackTextColor),
        //             ),
        //             Text(
        //               'One_porter_can_carry_3_bags_at_max'.localize(context),
        //               style: ADTextStyle700.size10
        //                   .setTextColor(context.adColors.brownishGrey),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
      ],
    );
  }

  void onBottomSheetSelect(TextEditingController controller, String value) {
    widget.state.travelClassNotifier.value = '';
    navigatorPopScreen(context);
    controller.text = value;
  }
}
