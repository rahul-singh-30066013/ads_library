/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_live_tracking_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_driver_details.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_live_tracking/view/sos_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CabLiveTrackingScreen extends StatefulWidget {
  final CabLiveTrackingNavigateModel cabLiveTrackingNavigateModel;

  const CabLiveTrackingScreen({
    Key? key,
    required this.cabLiveTrackingNavigateModel,
  }) : super(key: key);

  @override
  State<CabLiveTrackingScreen> createState() => _CabLiveTrackingScreenState();
}

class _CabLiveTrackingScreenState extends State<CabLiveTrackingScreen> {
  final double bottomSheetBorderRadius = 16.sp;
  final double driverDisplayImageRadius = 26.sp;
  final double fabBorderRadius = 26.sp;
  final double trackingButtonWidth = 220.sp;
  final double sosOpacity = 0.07;
  final int preCautionMsgLines = 3;
  final GlobalKey bottomWidgetKey = GlobalKey();
  double bottomWidgetOldSize = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => {
        setState(() {
          {
            bottomWidgetOldSize =
                bottomWidgetKey.currentContext?.size?.height ?? 0.0;
          }
        }),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const redColor = Color(0xffdc464b);
    const darkGeryBackgroundColor = Color(0xffD3D3D3);

    String shareDetail;
    return Scaffold(
      body: Container(
        color: darkGeryBackgroundColor,
        child: Stack(
          children: [
            Image.asset(
              'lib/assets/images/cab_booking/map_with_car.jpg',
              fit: BoxFit.contain,
              height: context.heightOfScreen -
                  bottomWidgetOldSize +
                  bottomSheetBorderRadius,
              width: context.widthOfScreen,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: TouchableOpacity(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      radius: context.k_16,
                      backgroundColor: context.adColors.whiteTextColor,
                      child: Icon(
                        Icons.close,
                        color: context.adColors.neutralInfoMsg,
                      ),
                    ),
                  ),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
                const Spacer(),
                Center(
                  child: TouchableOpacity(
                    onTap: () => {
                      CabGoogleAnalytics()
                          .sendgaparameterscabbookingtracklocation(
                        widget.cabLiveTrackingNavigateModel,
                      ),
                      openMap(
                        '${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.pickup?.latitude ?? ''},${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.pickup?.longitude ?? ''}',
                        '${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.drop?.latitude ?? ''},${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.drop?.longitude ?? ''}',
                      ),
                    },
                    child: Container(
                      height: context.k_48,
                      width: trackingButtonWidth,
                      decoration: BoxDecoration(
                        color: context.adColors.whiteTextColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            fabBorderRadius,
                          ),
                        ),
                        border: Border.all(
                          color: context.adColors.blackTextColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'track_location'.localize(context),
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ).paddingBySide(
                          top: context.k_14,
                          bottom: context.k_14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_30,
                ),
                Container(
                  key: bottomWidgetKey,
                  decoration: BoxDecoration(
                    color: context.adColors.whiteTextColor,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x80cecece),
                        blurRadius: context.k_24,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(bottomSheetBorderRadius),
                      topRight: Radius.circular(bottomSheetBorderRadius),
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.k_34,
                      ),
                      if (!(widget
                              .cabLiveTrackingNavigateModel
                              .filteredVendorDataResponseModel
                              ?.result
                              ?.trackingPrecautionMessage
                              ?.isNullOrEmpty ??
                          true))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget
                                      .cabLiveTrackingNavigateModel
                                      .filteredVendorDataResponseModel
                                      ?.result
                                      ?.trackingPrecautionMessage ??
                                  '',
                              style: ADTextStyle600.size16.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                              maxLines: preCautionMsgLines,
                            ),
                            SizedBox(
                              height: context.k_20,
                            ),
                            Container(
                              height: 1.sp,
                              color: context.adColors.tileBorderColor,
                            ).paddingBySide(
                              bottom: context.k_20,
                            ),
                          ],
                        ),
                      CabDriverDetails(
                        cabOrderDetailResponseModel: widget
                            .cabLiveTrackingNavigateModel
                            .cabOrderDetailResponseModel,
                        carNumber: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.bookingInfo
                                ?.carNumber ??
                            '',
                        carName: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.bookingInfo
                                ?.carModelName ??
                            '',
                        driverName: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.bookingInfo
                                ?.driverName ??
                            '',
                        driverPhone: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.bookingInfo
                                ?.driverPhone ??
                            '',
                        isCall: false,
                      ).paddingBySide(
                        bottom: context.k_20,
                      ),
                      Container(
                        height: 1.sp,
                        color: context.adColors.tileBorderColor,
                      ),
                      PickupAndDestinationAddressView(
                        pickUpLocationText: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.pickup
                                ?.locationCode ??
                            '',
                        destinationLocationText: widget
                                .cabLiveTrackingNavigateModel
                                .cabOrderDetailResponseModel
                                ?.drop
                                ?.locationCode ??
                            '',
                      ).paddingBySide(
                        top: context.k_20,
                        bottom: context.k_32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TouchableOpacity(
                              onTap: () => {
                                CabGoogleAnalytics()
                                    .sendGAParametersCabBookingSosPage(
                                  widget.cabLiveTrackingNavigateModel,
                                ),
                                _showSOSBottomSheet(
                                  context,
                                  widget.cabLiveTrackingNavigateModel
                                          .orderReferenceId ??
                                      '',
                                  widget
                                          .cabLiveTrackingNavigateModel
                                          .filteredVendorDataResponseModel
                                          ?.result
                                          ?.policeHelpline ??
                                      '',
                                ),
                              },
                              child: Container(
                                height: context.k_48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      fabBorderRadius,
                                    ),
                                  ),
                                  color: redColor.withOpacity(sosOpacity),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: context.k_20,
                                      width: context.k_22,
                                      child: SvgPicture.asset(
                                        'lib/assets/images/cab_booking/sos.svg',
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.k_6,
                                    ),
                                    Text(
                                      'sos'.localize(context),
                                      overflow: TextOverflow.ellipsis,
                                      style: ADTextStyle700.size16.setTextColor(
                                        redColor,
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(
                                  top: context.k_10,
                                  bottom: context.k_10,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.k_16,
                          ),
                          Expanded(
                            child: TouchableOpacity(
                              onTap: () => {
                                CabGoogleAnalytics()
                                    .sendGAParametersCabBookingShare(
                                  widget.cabLiveTrackingNavigateModel,
                                ),
                                shareDetail = '${widget.cabLiveTrackingNavigateModel.filteredVendorDataResponseModel?.result?.shareMessage ?? ''}\n${'route'.localize(
                                      context,
                                    ).replaceAll(
                                      '%',
                                      '${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.pickup?.locationCode ?? ''} to ${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.drop?.locationCode ?? ''}',
                                    )}\n${'driver_details'.localize(
                                      context,
                                    ).replaceAll(
                                      '%',
                                      '${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.bookingInfo?.driverName ?? ''} ${widget.cabLiveTrackingNavigateModel.cabOrderDetailResponseModel?.bookingInfo?.driverPhone ?? ''}',
                                    )}\n${'car_model'.localize(context).replaceAll(
                                      '%',
                                      widget
                                              .cabLiveTrackingNavigateModel
                                              .cabOrderDetailResponseModel
                                              ?.bookingInfo
                                              ?.carModelName ??
                                          '',
                                    )}\n${'car_registration_no'.localize(
                                      context,
                                    ).replaceAll(
                                      '%',
                                      widget
                                              .cabLiveTrackingNavigateModel
                                              .cabOrderDetailResponseModel
                                              ?.bookingInfo
                                              ?.carNumber ??
                                          '',
                                    )}\n${'cab_operator'.localize(context).replaceAll(
                                      '%',
                                      widget
                                              .cabLiveTrackingNavigateModel
                                              .cabOrderDetailResponseModel
                                              ?.supplierInfo
                                              ?.name ??
                                          widget
                                              .cabLiveTrackingNavigateModel
                                              .cabOrderDetailResponseModel
                                              ?.securityKey
                                              ?.providerName ??
                                          '',
                                    )}\n${'booked_through'.localize(context).replaceAll(
                                      '%',
                                      Environment
                                          .instance.configuration.appName,
                                    )}',
                                adLog(
                                  shareDetail,
                                ),
                                Share.share(
                                  shareDetail,
                                ),
                              },
                              child: Container(
                                height: context.k_48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      fabBorderRadius,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: context.adColors.blackTextColor,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'share'.localize(context),
                                    overflow: TextOverflow.ellipsis,
                                    style: ADTextStyle500.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ).paddingBySide(
                                    top: context.k_10,
                                    bottom: context.k_10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SafeArea(
                        top: false,
                        child: SizedBox(
                          height: context.k_20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSOSBottomSheet(
    BuildContext context,
    String orderReferenceId,
    String police,
  ) {
    adShowBottomSheet(
      context: context,
      childWidget: SOSView(
        orderReferenceId: orderReferenceId,
        titleText: 'are_you_in_emergency'.localize(context),
        alertIcon: SvgAssets.sosIcon,
        infoText:
            'contact_the_police_or_the_adani_one_support_team_for_immediate_assistance'
                .localize(context),
        buttonDialText:
            'call_the_police_at'.localize(context).replaceAll('%', police),
        buttonActionText: 'alert_adani_one_support'.localize(context),
        buttonDial: () => {
          CabGoogleAnalytics().sendGAParametersCabBookingSosPageCalledPolice(
            widget.cabLiveTrackingNavigateModel,
          ),
          Utils.redirectToPhoneEmail(
            police,
          ),
        },
        buttonAction: () => CabGoogleAnalytics()
            .sendGAParametersCabBookingSosPageAlertCarZonRent(
          widget.cabLiveTrackingNavigateModel,
        ),
      ),
      headerTitle: '',
    );
  }

  Future<void> openMap(String origin, String destination) async {
    final String googleMapUrl =
        'https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination&travelmode=car';
    if (await canLaunchUrlString(googleMapUrl)) {
      await launchUrlString(googleMapUrl, mode: LaunchMode.externalApplication)
          .then((value) => null);
    }
  }
}
