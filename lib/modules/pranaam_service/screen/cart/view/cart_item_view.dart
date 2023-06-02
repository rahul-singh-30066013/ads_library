/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is a component for a cart item
///In this we have all the description of the item present in the cart.

class CartItemView extends StatefulWidget {
  final LocalCartModel cartItemModel;

  final ADTapCallback adTapCallback;

  final bool isRemoveLoading;
  final bool isLoading;
  final ADTapCallback? onTap;

  const CartItemView({
    Key? key,
    required this.cartItemModel,
    required this.adTapCallback,
    required this.isRemoveLoading,
    required this.isLoading,
    this.onTap,
  }) : super(key: key);

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  ///TODO
  final Color borderColor = const Color(0xffcacaca);
  final Color iconColor = const Color(0xffbbbbbb);
  final double horizontalPadding = 10.sp;
  final double containerHeight = 155.sp;
  final double containerWidth = 114.sp;
  final int flex = 3;
  final int maxLines = 2;
  final double imageWidth = 93.sp;
  final double imageHeight = 41.sp;
  final double addOnsContainerHeight = 320.sp;
  final double addOnsInnerContainerHeight = 190.sp;
  final double paddingFive = 5.sp;
  static const double buttonWidth = 95;
  static const double buttonHeight = 42;
  PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    final _pranaamDataState = context.read<PranaamAppDataStateManagement>();
    adLog(
      'service airport ${_pranaamDataState.cartDataResponse?.tripDetail.serviceAirport}',
    );
    final bool isAddOnService = widget.cartItemModel.isCartAddOn;
    final int travellerCount =
        getTotalPassengers(_pranaamDataState.cartDataResponse);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.k_10),
            border: Border.all(
              color: !isAddOnService ? borderColor : Colors.transparent,
            ),
          ),
          height: containerHeight,
          width: containerWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.k_10),
            child: !isAddOnService
                ? widget.cartItemModel.packageImage != null &&
                        widget.cartItemModel.packageImage != ''
                    ? ADCachedImage(
                        imageUrl: widget.cartItemModel.packageImage ??
                            'lib/assets/images/pranaam/svg/pranaan_logo.svg',
                        width: imageWidth,
                        height: imageHeight,
                      )
                    : Container(
                        padding: EdgeInsets.only(
                          left: context.k_8,
                          right: context.k_10,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/assets/images/pranaam/svg/pranaan_logo.svg',
                            width: imageWidth,
                            height: imageHeight,
                          ),
                        ),
                      )
                : widget.cartItemModel.packageAddOn?.addOnImage != null
                    ? ADCachedImage(
                        imageUrl:
                            widget.cartItemModel.packageAddOn?.addOnImage ??
                                'lib/assets/images/pranaam/porter2.png',
                        width: imageWidth,
                        height: imageHeight,
                      )
                    : Image.asset(
                        'lib/assets/images/pranaam/porter2.png',
                        width: imageWidth,
                        height: imageHeight,
                        fit: isAddOnService ? BoxFit.cover : null,
                      ),
          ),
        ),
        SizedBox(
          width: context.k_20,
        ),
        Expanded(
          flex: flex,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isAddOnService)
                SizedBox(
                  height: context.k_24,
                ),
              // ADSizedBox(
              //   height: context.k_8,
              // ),
              Text(
                widget.cartItemModel.name,
                style: ADTextStyle700.size18,
              ),
              SizedBox(
                height: context.k_16,
              ),

              if (isAddOnService)
                // widget.cartItemModel.name.toLowerCase() != 'porter'
                //     ? Text(
                //         '${'quantity'.localize(context)} ${widget.cartItemModel.quantity}',
                //         style: ADTextStyle400.size16,
                //       )
                //     :
                ElevatedButton(
                  onPressed: widget.onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.adColors.whiteTextColor,
                    fixedSize: Size(
                      context.scaled(buttonWidth),
                      context.scaled(buttonHeight),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        context.scaled(context.k_40),
                      ),
                      side: BorderSide(
                        color: context.adColors.geryBorderColor,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: widget.isLoading
                      ? ADDotProgressView(
                          size: context.k_8,
                          color: context.adColors.blackTextColor,
                        )
                      : Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: ADTextStyle700.size16
                                    .setTextColor(
                                      context.adColors.blueColor,
                                    )
                                    .setFontHeight(1),
                                children: [
                                  TextSpan(
                                    text: 'qtyLabel'.localize(context),
                                    style: ADTextStyle500.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${widget.cartItemModel.quantity}',
                                    style: ADTextStyle500.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: context.adColors.darkGreyTextColor,
                              ).paddingBySide(right: context.k_15),
                            ),
                          ],
                        ),
                ),
              if (isAddOnService)
                SizedBox(
                  height: context.k_6,
                ),
              if (!isAddOnService)
                Row(
                  children: [
                    Text(
                      getCityName(
                        _pranaamDataState
                                .cartDataResponse?.tripDetail.serviceAirport ??
                            '',
                        context.read<SiteCoreStateManagement>(),
                      ),
                      style: ADTextStyle500.size16,
                    ),
                    ADSizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      travellerCount > 1
                          ? '($travellerCount ${'guests'.localize(context)})'
                          : '($travellerCount ${'guest'.localize(context)})',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ],
                ),

              if (!isAddOnService)
                Row(
                  children: [
                    Text(
                      _pranaamDataState
                                  .cartDataResponse?.tripDetail.serviceType ==
                              'Round Trip'
                          ? 'Departure'
                          : _pranaamDataState
                                  .cartDataResponse?.tripDetail.serviceType ??
                              '',
                      style: ADTextStyle500.size16,
                      maxLines: maxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: context.k_4,
                    ),
                    Expanded(
                      child: Text(
                        '(${_pranaamDataState.cartDataResponse?.tripDetail.travelSector ?? ''})',
                        style: ADTextStyle500.size16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ).paddingBySide(
                  top: paddingFive,
                  bottom: paddingFive,
                ),
              if (!isAddOnService)
                Row(
                  children: [
                    Text(
                      formatDateTime(
                        dateTimeType: formatFlightDateForCartScreen(
                          _pranaamDataState
                                  .cartDataResponse?.tripDetail.flightDate ??
                              '2022-04-10',
                        ),
                        dateTimeFormat: dateTimeFormatDayMonthYear,
                      ),
                      style: ADTextStyle500.size16,
                    ),
                    Text(
                      ', ${formatPaymentServiceTime(_pranaamDataState.cartDataResponse?.tripDetail.serviceDateTime ?? '')}',
                      style: ADTextStyle500.size16,
                    ),
                  ],
                ).paddingBySide(bottom: paddingFive),
              if (!isAddOnService)
                Row(
                  children: [
                    Text(
                      _pranaamDataState
                              .cartDataResponse?.tripDetail.flightName ??
                          '',
                      style: ADTextStyle500.size16,
                    ),
                  ],
                ),

              // if (!isAddOnService)
              //   Text(
              //     ' ${_pranaamDataState.cartDataResponse?.tripDetail.flightName}',
              //     style: ADTextStyle400.size16,
              //   ).paddingBySide(
              //     top: paddingFive,
              //   ),
//TODO generic method and compare with id
              if (_pranaamDataState.cartDataResponse?.tripDetail.serviceType ==
                  'Round Trip')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isAddOnService)
                      Row(
                        children: [
                          Text(
                            'arrival'.localize(context),
                            style: ADTextStyle500.size16,
                            maxLines: maxLines,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ).paddingBySide(
                        top: paddingFive,
                        bottom: paddingFive,
                      ),

                    Row(
                      children: [
                        Text(
                          formatDateTime(
                            dateTimeType: formatFlightDateForCartScreen(
                              _pranaamDataState.cartDataResponse?.tripDetail
                                      .transitRoundTripSecFlightDate ??
                                  '2022-04-10',
                            ),
                            dateTimeFormat: dateTimeFormatDayMonthYear,
                          ),
                          style: ADTextStyle500.size16,
                        ),
                        Text(
                          ', ${reviewArrivalTime(_pranaamDataState.cartDataResponse?.tripDetail.transitRoundTripSecFlightTime ?? '')}',
                          style: ADTextStyle500.size16,
                        ),
                      ],
                    ).paddingBySide(bottom: paddingFive),
                    Row(
                      children: [
                        Text(
                          _pranaamDataState.cartDataResponse?.tripDetail
                                  .transitRoundTripSecFlightName ??
                              '',
                          style: ADTextStyle500.size16,
                        ),
                      ],
                    ),
                    // if (!isAddOnService)
                    //   Text(
                    //     ' ${_pranaamDataState.cartDataResponse?.tripDetail.transitRoundTripSecFlightName}',
                    //     style: ADTextStyle400.size16,
                    //   ).paddingBySide(
                    //     top: paddingFive,
                    //     bottom: paddingFive,
                    //   ),
                  ],
                ),
              // if (!cartItemModel.isAddOnService)
              //   Text(
              //     '₹${_pranaamDataState.addCartItemResponseModel?.cartResponse.totalFare.amount}',
              //     style: ADTextStyle400.size14.copyWith(
              //       decoration: TextDecoration.lineThrough,
              //     ),
              //   ),

              ADSizedBox(
                height: context.k_8,
              ),
              Row(
                children: [
                  Text(
                    '${FlightUtils.getPriceFormatWithSymbol(
                      price: !isAddOnService
                          ? _pranaamDataState.cartDataResponse?.packageDetail
                                  .pricingInfo.totalFare.amount ??
                              0
                          : widget.cartItemModel.packageAddOn?.totalPrice ?? 0,
                    )} ',
                    //'₹${cartItemModel.price}',
                    style: ADTextStyle700.size18,
                  ),
                  if (isUpgradeBooking(
                    _pranaamDataState.cartDataResponse?.pranaamBookingType ??
                        '',
                  ))
                    SizedBox(
                      width: context.k_16,
                      height: context.k_16,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset(
                          'lib/assets/images/pranaam/information.png',
                        ),
                        onPressed: () =>
                            showUpgradePriceBreakup(context, _pranaamDataState),
                      ),
                    ),
                  const Spacer(),
                  if (widget.isRemoveLoading)
                    const ADDotProgressView()
                  else
                    GestureDetector(
                      onTap: widget.adTapCallback,
                      child: Text(
                        'remove'.localize(context),
                        style: ADTextStyle400.size14
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),

              ADSizedBox(
                height: context.k_12,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> showUpgradePriceBreakup(
    BuildContext context,
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    return adShowBottomSheet(
      context: context,
      childWidget: UpgradePriceBreakupTypeView(
        pranaamAppDataStateManagement: pranaamAppDataStateManagement,
      ),
      headerTitle: 'Upgraded Price',
    );
  }
}

class UpgradePriceBreakupTypeView extends StatelessWidget {
  const UpgradePriceBreakupTypeView({
    Key? key,
    required this.pranaamAppDataStateManagement,
  }) : super(key: key);
  final PranaamAppDataStateManagement pranaamAppDataStateManagement;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RowView(
          leftText: 'New Pack price',
          amount: pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                  .originalPricingInfo?.totalFare.amount ??
              0,
          dividerHeight: context.k_20,
          showDivider: false,
        ),
        RowView(
          leftText: 'Old Pack price',
          isOldPrice: true,
          amount: pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                  .oldPricingInfo?.totalFare.amount ??
              0,
          showDivider: true,
          dividerHeight: context.k_40,
        ),
        RowView(
          leftText: 'Total Amount',
          amount: pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                  .pricingInfo.totalFare.amount ??
              0,
          showDivider: true,
          dividerHeight: context.k_40,
          leftTextStyle: ADTextStyle500.size20,
          rightTextStyle: ADTextStyle700.size20,
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}

class GreyCircleIcon extends StatelessWidget {
  const GreyCircleIcon({
    Key? key,
    required this.iconColor,
  }) : super(key: key);

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: context.k_6,
      color: iconColor,
    );
  }
}
