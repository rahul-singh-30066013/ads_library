/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/car_parking/screens/car_parking.dart';
import 'package:adani_airport_mobile/modules/car_parking/state_management/car_parking_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/timeline/adtimeline_new.dart';
import 'package:superapp_mobile_style_guide/timeline/timeline_horizontal.dart';

class CarParkingOwnerDetails extends StatelessWidget {
  final CarParkingViewModel carParkingState = CarParkingViewModel();

  final double imageHeightForParkingDetails = 62.sp;
  final double imageWidthForParkingDetails = 80.sp;
  static const double standardBorderRadius = 8;

  final double amount = 750;

  final List<ScreenStatus> screensList = [
    ScreenStatus(
      title: 'booking_payment_cancellation',
      isSelected: ADTimeLineState.progress,
    ),
    ScreenStatus(
      title: 'payment',
      isSelected: ADTimeLineState.initial,
    ),
  ];

  CarParkingOwnerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return context.adColors.greyTextColor;
      }
      return context.adColors.black;
    }

    return ADSelectorStateLessWidget<CarParkingViewModel>(
      viewModel: carParkingState,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'enter_your_details'.localize(context),
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ),
          body: ListView(
            children: // selection view
                <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int index = 0;
                              index < screensList.length;
                              index++)
                            ADTimelineNew(
                              onTap: (value) => adLog('ADTimeline pressed'),
                              initialTextColor:
                                  context.adColors.stepperGreyTextColor,
                              doneColor: context.adColors.greenColor,
                              progressColor: context.adColors.greenColor,
                              initialColor: context.adColors.contentBulletColor,
                              mainText:
                                  screensList[index].title.localize(context),
                              index: index,
                              timelineLength: screensList.length,
                              adTimeLineState: screensList[index].isSelected,
                            ),
                        ],
                      ).paddingBySide(
                        top: context.k_18,
                      ),
                    ] +
                    // textfields
                    [
                      GenericTextField(
                        hintTitle: 'first_name',
                        textController: carParkingState.firstNameController,
                        whenChanged: () => carParkingState.validator(),
                      ),
                      GenericTextField(
                        hintTitle: 'last_name',
                        textController: carParkingState.lastNameController,
                        whenChanged: () => carParkingState.validator(),
                      ),
                      GenericTextField(
                        hintTitle: 'mobileNo',
                        textController: carParkingState.mobileNumberController,
                        keyboardType: TextInputType.number,
                        whenChanged: () => carParkingState.validator(),
                        withDropdown: true,
                      ),
                      GenericTextField(
                        hintTitle: 'email_id',
                        textController: carParkingState.emailController,
                        whenChanged: () => carParkingState.validator(),
                      ),
                      GenericTextField(
                        hintTitle: 'vehicle_number',
                        textController: carParkingState.vehicleNumberController,
                        whenChanged: () => carParkingState.validator(),
                      ),
                    ] +
                    // apply code
                    [
                      StripDivider(
                        withTopPadding: context.k_40,
                      ),
                      Row(
                        children: [
                          const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.local_offer_outlined,
                            ),
                          ),
                          SizedBox(
                            width: context.k_16,
                          ),
                          Text(
                            'apply_coupon_code'.localize(context),
                            style: ADTextStyle700.size18
                                .setTextColor(context.adColors.blackTextColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.k_16,
                            color: context.adColors.neutralInfoMsg,
                          ),
                        ],
                      ).paddingBySide(
                        top: context.k_26,
                        bottom: context.k_6,
                        left: context.k_16,
                        right: context.k_16,
                      ),
                      StripDivider(
                        withTopPadding: context.k_26,
                      ),
                    ] +
                    // parking details
                    [
                      const HeaderText(title: 'parking_details').paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: imageHeightForParkingDetails,
                            width: imageWidthForParkingDetails,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.all(
                                Radius.circular(standardBorderRadius),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.k_20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Terminal 1',
                                style: ADTextStyle600.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                              SizedBox(
                                height: context.k_6,
                              ),
                              Text(
                                'Car (4 Wheelers)',
                                style: ADTextStyle500.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: {
                          'entry_date_and_time': 'Thu, 18 Nov, 09 am - 10 am',
                          'duration': '6 hrs to 8 hrs',
                        }
                            .entries
                            .map(
                              (element) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    element.key.localize(context),
                                    style: ADTextStyle500.size14.setTextColor(
                                      context.adColors.greyTextColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.k_8,
                                  ),
                                  Text(
                                    element.value,
                                    style: ADTextStyle600.size14.setTextColor(
                                      context.adColors.neutralInfoMsg,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_20,
                      ),
                    ] +
                    // price details
                    [
                      StripDivider(
                        withTopPadding: context.k_40,
                      ),
                      const HeaderText(title: 'price_details').paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'booking_fee'.localize(context),
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.greyTextColor,
                            ),
                          ),
                          Text(
                            '₹${amount.toStringAsFixed(0)}',
                            style: ADTextStyle600.size16.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_20,
                      ),
                      Divider(
                        color: context.adColors.dividerColor,
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'total_amount'.localize(context),
                            style: ADTextStyle600.size20.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                          Text(
                            '₹${amount.toStringAsFixed(0)}',
                            style: ADTextStyle600.size20.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_20,
                      ),
                      Divider(
                        color: context.adColors.dividerColor,
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                        top: context.k_16,
                      ),
                    ] +
                    // tnc
                    [
                      StripDivider(
                        withTopPadding: context.k_40,
                      ),
                      GestureDetector(
                        onTap: () => carParkingState.triggerTncSelection(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Selector<CarParkingViewModel, bool>(
                              selector: (_, provider) =>
                                  provider.hasAgreedToTncs,
                              builder: (context, value, child) => Checkbox(
                                checkColor: context.adColors.whiteTextColor,
                                fillColor: MaterialStateProperty.resolveWith(
                                  getColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      context.k_4,
                                    ),
                                  ),
                                ),
                                side: BorderSide(
                                  color: context.adColors.greyTextColor,
                                ),
                                value: carParkingState.hasAgreedToTncs,
                                onChanged: (value) =>
                                    carParkingState.triggerTncSelection(),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'saved_traveller_terms_condition'
                                          .localize(context)
                                          .split(' Terms and Conditions')
                                          .first,
                                      style: ADTextStyle500.size14.setTextColor(
                                        context.adColors.neutralInfoMsg,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'T_C'.localize(context),
                                      style: ADTextStyle600.size14
                                          .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '.',
                                      style: ADTextStyle500.size14.setTextColor(
                                        context.adColors.neutralInfoMsg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          top: context.k_40,
                        ),
                      ),
                    ] +
                    // FAB
                    [
                      SizedBox(
                        height: context.k_30,
                      ),
                      Selector<CarParkingViewModel, bool>(
                        selector: (_, provider) => provider.isDataValidated,
                        builder: (context, value, child) {
                          return ElevatedButton(
                            onPressed: () => value
                                ? navigateToScreenUsingNamedRoute(
                                    context,
                                    carParkingBookingConfirmation,
                                  )
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: value
                                  ? context.adColors.blueColor
                                  : context.adColors.greyReviewShade,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              'continue_to_payment'.localize(context),
                              style: ADTextStyle700.size18.setTextColor(
                                context.adColors.whiteTextColor,
                              ),
                            ).paddingBySide(
                              top: context.k_14,
                              bottom: context.k_14,
                            ),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                            bottom: context.k_20,
                          );
                        },
                      ),
                    ],
          ),
        ),
      ),
    );
  }
}

class GenericTextField extends StatelessWidget {
  static const double standardBorderRadius = 8;
  final double iconsSizeForFlag = 24.sp;

  final String hintTitle;
  final TextEditingController textController;
  final Function() whenChanged;

  final bool? withDropdown;
  final List<String>? valueDomain;
  final String? selectedValue;

  final TextInputType? keyboardType;

  GenericTextField({
    Key? key,
    required this.hintTitle,
    required this.textController,
    required this.whenChanged,
    this.withDropdown,
    this.valueDomain,
    this.selectedValue,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(standardBorderRadius),
        ),
        border: Border.all(
          color: const Color(0xffCACACA),
        ),
      ),
      child: Row(
        children: (withDropdown ?? false
                ? <Widget>[
                    Column(
                      children: [
                        Text(
                          'country_code'.localize(context),
                          style: ADTextStyle500.size12.setTextColor(
                            context.adColors.greyTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: iconsSizeForFlag,
                              width: iconsSizeForFlag,
                              color: Colors.black12,
                            ),
                            Text(
                              '+91',
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ).paddingBySide(
                              left: context.k_10,
                            ),
                          ],
                        ).paddingBySide(
                          top: context.k_2,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: context.adColors.blackTextColor,
                    ).paddingBySide(
                      left: context.k_16,
                    ),
                    Container(
                      color: const Color(0xffCACACA),
                      width: 1,
                      height: context.k_36,
                    ).paddingBySide(
                      left: context.k_20,
                    ),
                  ]
                : <Widget>[
                    const SizedBox(),
                  ]) +
            [
              Flexible(
                child: TextField(
                  controller: textController,
                  onChanged: (value) => whenChanged(),
                  style: ADTextStyle600.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  keyboardType: keyboardType ?? TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: hintTitle.localize(context),
                    labelStyle: ADTextStyle500.size16.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    hintStyle: ADTextStyle500.size16.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    contentPadding: EdgeInsets.all(
                      context.k_6,
                    ),
                  ),
                ).paddingBySide(
                  left: context.k_16,
                ),
              ),
            ],
      ).paddingAllSide(context.k_10),
    ).paddingBySide(
      top: context.k_20,
      left: context.k_16,
      right: context.k_16,
    );
  }
}

class StripDivider extends StatelessWidget {
  final double? withTopPadding;

  const StripDivider({
    Key? key,
    this.withTopPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.k_8,
      width: double.infinity,
      color: context.adColors.containerGreyBg,
    ).paddingBySide(
      top: withTopPadding ?? context.k_16,
    );
  }
}

class ScreenStatus {
  final String title;
  final ADTimeLineState isSelected;

  ScreenStatus({
    required this.title,
    required this.isSelected,
  });
}
