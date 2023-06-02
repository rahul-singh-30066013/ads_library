/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/service_booking_form.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/arrival_departure_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/round_trip_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/transit_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double radiusOfGreyDot = 2.5.sp;
final double formItemHeight = 60.sp;
Color borderColor = Colors.grey;
double horizontalPadding = 16.sp;
double constant_5 = 5.sp;
double buttonHeight = 52.sp;
double verticalPadding = 52.sp;
double height = 30.sp;

///this class widgetView it does not contain business logic
/// state is used here to business logic from booking screen controller
class BookingScreenWidgetView
    extends WidgetView<ServiceBookingForm, BookingScreenController> {
  const BookingScreenWidgetView(
    BookingScreenController state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final double widthOfLogo = context.widthOfScreen * (0.2811);
    const double fontSize = 15;
    adLog('Widget build', className: this);
    adLog('bottom=>${widget.item?.itemMargin.bottom.sp}');
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: Selector<PranaamAppDataStateManagement, bool>(
          selector: (context, viewModel) => viewModel.isFromConfirmation,
          builder: (context, value, child) {
            if (value) {
              pranaamAppDataStateManagement
                ..isFromConfirmation = false
                ..setInitialDataBookingForm();
              pranaamAppDataStateManagement.flightTimeTopSpacing.value = 0;
              adLog('Pranaam Confirmation');
            } else {
              adLog('Pranaam ');
            }
            return SingleChildScrollView(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer(
                    builder: (BuildContext context, value, Widget? child) {
                      return Container();
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.fromDashboard || widget.showImage)
                        InkWell(
                          onTap: () => {
                            //state.updateUI(),
                            navigatorPopScreen(context),
                          },
                          child: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            size: context.k_22,
                            color: context.adColors.darkGreyTextColor,
                          ),
                        ).paddingBySide(
                          right: context.k_16,
                        )
                      else
                        const ADSizedBox.shrink(),
                      if (widget.showImage)
                        Text(
                          widget.fromDashboard
                              ? 'edit_label_2'.localize(context)
                              : 'edit_booking_label'.localize(context),
                          style: ADTextStyle700.size22
                              .setTextColor(context.adColors.filterBlackText)
                              .copyWith(decoration: TextDecoration.none),
                        ).paddingBySide(top: context.k_20)
                      else
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                SvgAssets.prannamLogo,
                                width: widthOfLogo,
                                height: height,
                              ).paddingBySide(top: context.k_40),
                              TouchableOpacity(
                                onTap: () => context
                                    .read<PranaamAppDataStateManagement>()
                                    .scrollToHowItWorks(),
                                child: Text(
                                  'How it works',
                                  style: ADTextStyle400.size16
                                      .copyWith(
                                        color: context.adColors.blackTextColor,
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ).paddingBySide(
                                  left: context.k_4,
                                ),
                              ).paddingBySide(top: context.k_40),
                            ],
                          ),
                        ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ArrivalDepartureView(state: state),
                  ADSizedBox(
                    height: context.k_12,
                  ),
                  TransitView(bookingScreenController: state),
                  RoundTripView(bookingScreenController: state),
                  ValueListenableBuilder(
                    valueListenable:
                        pranaamAppDataStateManagement.flightTimeTopSpacing,
                    builder: (
                      BuildContext context,
                      double selectedService,
                      Widget? child,
                    ) {
                      return ADSizedBox(
                        height: selectedService,
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable:
                        pranaamAppDataStateManagement.flightTimeTopSpacing,
                    builder: (
                      BuildContext context,
                      double topSpacing,
                      Widget? child,
                    ) {
                      return topSpacing > 0
                          ? Wrap(
                              runSpacing: context.k_4,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pranaamAppDataStateManagement
                                              .flightFirstTimeTextLabel,
                                      builder: (
                                        BuildContext context,
                                        String flightFirstTimeTextLabel,
                                        Widget? child,
                                      ) {
                                        return Text(
                                          flightFirstTimeTextLabel,
                                          style: ADTextStyle400.size16
                                              .setTextColor(
                                                context.adColors.greyTextColor,
                                              )
                                              .copyWith(fontSize: fontSize),
                                        );
                                      },
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pranaamAppDataStateManagement
                                              .flightFirstTimeTextValue,
                                      builder: (
                                        BuildContext context,
                                        String flightFirstTimeTextValue,
                                        Widget? child,
                                      ) {
                                        return Text(
                                          flightFirstTimeTextValue,
                                          style: ADTextStyle700.size16
                                              .setTextColor(
                                                context.adColors.neutralInfoMsg,
                                              )
                                              .copyWith(fontSize: fontSize),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                ADSizedBox(
                                  width: context.k_12,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pranaamAppDataStateManagement
                                              .flightSecondTimeTextLabel,
                                      builder: (
                                        BuildContext context,
                                        String flightSecondTimeTextLabel,
                                        Widget? child,
                                      ) {
                                        return Text(
                                          flightSecondTimeTextLabel,
                                          style: ADTextStyle400.size16
                                              .setTextColor(
                                                context.adColors.greyTextColor,
                                              )
                                              .copyWith(fontSize: fontSize),
                                        );
                                      },
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pranaamAppDataStateManagement
                                              .flightSecondTimeTextValue,
                                      builder: (
                                        BuildContext context,
                                        String flightSecondTimeTextValue,
                                        Widget? child,
                                      ) {
                                        return Text(
                                          flightSecondTimeTextValue,
                                          style: ADTextStyle700.size16
                                              .setTextColor(
                                                context.adColors.neutralInfoMsg,
                                              )
                                              .copyWith(fontSize: fontSize),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const ADSizedBox.shrink();
                    },
                  ),
                  ADSizedBox(
                    height: context.k_28,
                  ),
                  Container(
                    height: buttonHeight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: context.adColors.blueColor,
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                          vertical: context.k_14,
                        ),
                      ),
                      onPressed: () => {
                        if (!DeBounce.isRedundantClick() && state.isValidate())
                          {
                            state.handleElevatedButtonTapHandler(
                              context,
                            ),
                          }
                        else
                          {
                            adLog('tapped'),
                          },
                      },
                      child: Selector<PranaamAppDataStateManagement, bool>(
                        selector: (context, model) =>
                            state.bookingServiceState.isLoginClicked,
                        builder: (context, value, child) => value
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                              )
                            : Selector<PranaamAppDataStateManagement, bool>(
                                selector: (context, model) =>
                                    state.bookingServiceState.isFormFilled,
                                builder: (context, value, child) => value
                                    ? Text(
                                        widget.showImage
                                            ? 'Modify'
                                            : 'Book Now',
                                        style:
                                            ADTextStyle700.size16.setTextColor(
                                          context.adColors.whiteTextColor,
                                        ),
                                      )
                                    : Text(
                                        'Book Now',
                                        style:
                                            ADTextStyle700.size16.setTextColor(
                                          context.adColors.whiteTextColor,
                                        ),
                                      ),
                              ),
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                left: widget.item?.itemMargin.left.sp ?? horizontalPadding,
                right: widget.item?.itemMargin.right.sp ?? horizontalPadding,
                bottom: verticalPadding,
              ),
            );
          },
        ),
      ),
    );
  }
}
