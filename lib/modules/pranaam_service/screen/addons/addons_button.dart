/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_add_on/add_cart_add_on_request_model/add_cart_add_on_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/add_ons_container_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AddOnsButton extends StatefulWidget {
  final ValueNotifier<String> priceNorifer;
  const AddOnsButton({
    Key? key,
    required this.priceNorifer,
  }) : super(key: key);

  @override
  State<AddOnsButton> createState() => _AddOnsButtonState();
}

class _AddOnsButtonState extends State<AddOnsButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final PranaamAppDataStateManagement state =
        context.read<PranaamAppDataStateManagement>();
    final List<PackageAddOn> package =
        state.cartDataResponse?.packageAddOn ?? [];
    final List<PackageAddOn> availableAddOns =
        state.cartDataResponse?.availiableAddOn ?? [];
    final int qty = getAddonQuantity(package);
    const double iconSize = 16;
    const maxPorterCount = 15;

    return ElevatedButton(
      onPressed: qty > 0
          ? () => {}
          : () => addCartRequest(
                getPackageAddOn(availableAddOns),
                1,
                context,
              ),
      style: ElevatedButton.styleFrom(
        backgroundColor: qty > 0
            ? context.adColors.whiteTextColor
            : context.adColors.whiteTextColor,
        fixedSize: Size(
          context.scaled(buttonWidth),
          context.scaled(buttonHeight),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.scaled(context.k_40),
          ),
          side: BorderSide(
            color: context.adColors.black,
          ),
        ),
        elevation: 0,
      ),
      child: !(qty > 0)
          ? isLoading
              ? ADDotProgressView(
                  size: context.k_8,
                  color: context.adColors.blackTextColor,
                )
              : RichText(
                  text: TextSpan(
                    style: ADTextStyle700.size16
                        .setTextColor(
                          context.adColors.black,
                        )
                        .setFontHeight(1),
                    children: [
                      const TextSpan(text: ' Add '),
                      TextSpan(
                        text: '\u207A',
                        style: TextStyle(fontSize: context.k_20)
                            .setTextColor(ADColors.black),
                      ),
                    ],
                  ),
                )
          : isLoading
              ? ADDotProgressView(
                  size: context.k_8,
                  color: context.adColors.blackTextColor,
                )
              : Row(
                  children: [
                    SizedBox(
                      width: context.k_20,
                      child: IconButton(
                        color: ADColors.black,
                        padding: EdgeInsets.zero,
                        onPressed: () => addCartRequest(
                          getPackageAddOn(package),
                          getAddonQuantity(package) - 1,
                          context,
                        ),
                        //     widget.state.onAddTap(
                        //   widget.packageAddon,
                        //   quantity: widget.packageAddon.qty > 0
                        //       ? widget.packageAddon.qty - 1
                        //       : 0,
                        //   context: context,
                        //   addonIndex: widget.index,
                        //   cartItemIndex: 0,
                        // ),
                        icon: const Icon(
                          Icons.remove,
                          size: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      qty.toString(),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.blackColor,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: context.k_20,
                      child: IconButton(
                        color: ADColors.black,
                        padding: EdgeInsets.zero,
                        onPressed: () => {
                          if (qty < maxPorterCount)
                            {
                              addCartRequest(
                                getPackageAddOn(package),
                                getAddonQuantity(package) + 1,
                                context,
                              ),
                            },
                        },
                        //   widget.state.onAddTap(
                        //   widget.packageAddon,
                        //   quantity: widget.packageAddon.qty + 1,
                        //   context: context,
                        //   addonIndex: widget.index,
                        //   cartItemIndex: 0,
                        // ),
                        icon: Icon(
                          Icons.add,
                          color: qty < maxPorterCount
                              ? null
                              : context.adColors.geryBorderColor,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ],
                ),
    ).paddingAllSide(context.k_8);
  }

  double getAddonPrice(List packageAddOn) {
    for (final PackageAddOn addOn in packageAddOn) {
      if (addOn.addOnServiceName == 'Porter') {
        return addOn.price;
      }
    }
    return 0;
  }

  PackageAddOn getPackageAddOn(List packageAddOn) {
    for (final PackageAddOn addOn in packageAddOn) {
      if (addOn.addOnServiceName == 'Porter') {
        return addOn;
      }
    }
    return const PackageAddOn();
  }

  void addCartRequest(
    PackageAddOn packageAddOn,
    int quantity,
    BuildContext context,
    // {bool isAddonLoading = false,
    //   int addonIndex = 0,
    //   int cartItemIndex = 0,}
  ) {
    isLoading = true;
    setState(() => {});
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    // if(isAddonLoading){
    //   addonItemLoadings[addonIndex].value = true;
    // }else {
    //   cartItemLoadings[cartItemIndex] = true;
    // }
    pranaamAppDataStateManagement
        .cartAddOnItem(
      getAddCartAddOnRequest(packageAddOn, quantity, context).toJson(),
      context.read<AppSessionState>(),
    )
        .then(
      (value) {
        closeProgressAndValidate(
          value,
          context,
        );
        isLoading = false;
        final PranaamAppDataStateManagement state =
            context.read<PranaamAppDataStateManagement>();
        num porterCartQuantity = getAddonQuantity(
          pranaamAppDataStateManagement.cartDataResponse?.packageAddOn ?? [],
        );
        porterCartQuantity =
            porterCartQuantity == 0 ? 1 : porterCartQuantity.toDouble();
        widget.priceNorifer.value = FlightUtils.getPriceFormatWithSymbol(
          price: getPorterPrice(state.cartDataResponse) *
              porterCartQuantity.toDouble(),
        );
        setState(() => {});
        // cartItemLoadings[cartItemIndex]R = false;
        // addonItemLoadings[addonIndex].value = false;
        PranaamBookingGaAnalytics().ecommerceEventCartAddOn(
          ClickEvents.add_to_cart,
          context.read<PranaamAppDataStateManagement>(),
        );
      },
    );
  }

  AddCartAddOnRequestModel getAddCartAddOnRequest(
    PackageAddOn packageAddOn,
    int quantity,
    BuildContext context,
  ) {
    return AddCartAddOnRequestModel(
      packageId: context
              .read<PranaamAppDataStateManagement>()
              .cartDataResponse
              ?.packageDetail
              .packageId ??
          0,
      serviceName: packageAddOn.addOnServiceName,
      serviceDescription: packageAddOn.addOnServiceDescription,
      price: packageAddOn.price,
      quantity: quantity,
      addOnServiceId: packageAddOn.addOnServiceId,
    );
  }

  void closeProgressAndValidate(
    ADResponseState state,
    BuildContext context,
  ) {
    if (state.viewStatus == Status.complete ||
        state.viewStatus == Status.error) {
      ProcessDialog.closeLoadingDialog(context);
    }
  }
}

int getAddonQuantity(List packageAddOn) {
  for (final PackageAddOn addOn in packageAddOn) {
    if (addOn.addOnServiceName == 'Porter') {
      return addOn.qty;
    }
  }
  return 0;
}
