/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/ad_duty_free_product.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/counter_button.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/out_of_stock.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double k_54 = 54;
const int k_4 = 4;
const int k_6 = 6;
const int k_3 = 3;
const int k_10 = 10;

const Color greenColor = Color(0xff018849);

///This class is use to create ADButtons for
/// - Add to Cart and Buy Now
class BuildButton extends StatefulWidget {
  final DealProductModel dealProductModel;

  const BuildButton({Key? key, required this.dealProductModel})
      : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    // final int index = widget.dealProductModel.index ?? 0;
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();

    return Selector<DutyFreeState, int?>(
      selector: (c, state) => dutyFreeState.getSkuQty(
        widget.dealProductModel.item?.skuCode ??
            widget.dealProductModel.skuCode ??
            '',
        storeType: widget.dealProductModel.item?.storeType ?? '',
        airportCode: widget.dealProductModel.airportCode,
      ),
      builder: (BuildContext context, value, Widget? child) {
        // final DutyFreeState dutyFreeState =
        //     context.read<DutyFreeState>();
        // final int quantity = dutyFreeState.addedItemMap[
        //         widget.dealProductModel.item?.skuCode ?? ''] ??
        //     0;

        return CounterWidget(
          dealProductModel: widget.dealProductModel,
        );
      },
    );
  }

  void updateData(BuildContext context, dutyFreeProductDataModel, increment) {
    adLog(context.toString());
    adLog(dutyFreeProductDataModel.toString());
    adLog(increment.toString());
    // context.read<DutyFreeState>().updateCartPdp(
    //       context: context,
    //       dutyFreeProductDataModel: dutyFreeProductDataModel,
    //       increment: increment,
    //     );
  }
}

class CounterWidget extends StatefulWidget {
  final DealProductModel dealProductModel;

  const CounterWidget({
    Key? key,
    required this.dealProductModel,
  }) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();

    return Selector<DutyFreeState, int?>(
      selector: (context, state) => state.getSkuQty(
        widget.dealProductModel.item?.skuCode ??
            widget.dealProductModel.skuCode ??
            '',
        storeType: widget.dealProductModel.item?.storeType ?? '',
        airportCode: widget.dealProductModel.airportCode,
      ),
      builder: (BuildContext context, state, Widget? child) {
        final int quantity = dutyFreeState.getSkuQty(
          widget.dealProductModel.item?.skuCode ??
              widget.dealProductModel.skuCode ??
              '',
          storeType: widget.dealProductModel.item?.storeType ?? '',
          airportCode: widget.dealProductModel.airportCode,
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!(widget.dealProductModel.item ??
                    const DutyFreeProductDataModel())
                .availability)
              ADSizedBox(
                width: context.widthOfScreen,
                height: k_54.sp,
                child: const OutOfStock(),
              )
            else if (quantity > 0)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Selector<DutyFreeState, bool?>(
                    selector: (context, catalogListViewModel) =>
                        dutyFreeState.isProgressMap.containsKey(
                      widget.dealProductModel.item?.skuCode ??
                          widget.dealProductModel.skuCode,
                    ),
                    builder: (BuildContext context, state, Widget? child) {
                      switch (state) {
                        case false:
                          return Expanded(
                            flex: k_4,
                            child: ADSizedBox(
                              height: k_54.sp,
                              child: CounterButton(
                                onErrorTapHandler: (int value) =>
                                    adLog('value $value'),
                                onDecrementTapHandler: (int value) =>
                                    updateData(
                                  context,
                                  widget.dealProductModel.item ??
                                      const DutyFreeProductDataModel(),
                                  false,
                                ),
                                onIncrementTapHandler: (int value) =>
                                    updateData(
                                  context,
                                  widget.dealProductModel.item ??
                                      const DutyFreeProductDataModel(),
                                  true,
                                ),
                                counterNumber: quantity,
                                maxCounterLimit: min(
                                  Utils.dutyFreeProductMaxQty,
                                  (widget.dealProductModel.item ??
                                          const DutyFreeProductDataModel())
                                      .availableQuantity
                                      .toInt(),
                                ),
                              ),
                            ),
                          );
                        case true:
                          return Expanded(
                            flex: k_4,
                            child: Container(
                              height: k_54.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(context.k_28),
                                ),
                                border:
                                    Border.all(color: context.adColors.black),
                                color: context.adColors.whiteTextColor,
                              ),
                              width: k_80.sp,
                              child: ADDotProgressView(
                                color: context.adColors.black,
                                size: context.k_8,
                              ),
                            ),
                          );

                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                  ADSizedBox(
                    width: context.k_10,
                  ),
                  Expanded(
                    flex: k_6,
                    child: ADSizedBox(
                      height: k_54.sp,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                            greenColor,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                context.k_30,
                              ),
                              side: const BorderSide(
                                color: greenColor,
                              ),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'go_to_Cart'.localize(context),
                              style: ADTextStyle700.size16.setTextColor(
                                context.adColors.whiteTextColor,
                              ),
                            ),

                            Icon(
                              Icons.arrow_forward,
                              size: context.k_16,
                              color: Colors.white,
                            ).paddingBySide(left: context.k_6),
                            // SizedBox(
                            //   height: 16,
                            //   width: 16,
                            //   child: Image.asset(
                            //     'lib/assets/images/duty_free/forward_arrow.png',
                            //   ),
                            // ),
                          ],
                        ),
                        onPressed: () => navigateToScreenUsingNamedRoute(
                          context,
                          dutyFreeShoppingCartRoute,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Selector<DutyFreeState, bool?>(
                selector: (context, catalogListViewModel) =>
                    dutyFreeState.isProgressMap.containsKey(
                  widget.dealProductModel.item?.skuCode ??
                      widget.dealProductModel.skuCode,
                ),
                builder: (BuildContext context, state, Widget? child) {
                  switch (state) {
                    case false:
                      return ADSizedBox(
                        width: context.widthOfScreen - context.k_40,
                        height: k_54.sp,
                        // child: const OutOfStock(),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: context.adColors.blueColor,
                            // elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(context.k_28),
                            ),
                            //////// HERE
                          ),
                          child: Text(
                            'add_to_cart'.localize(context),
                            style: ADTextStyle700.size18.setTextColor(
                              context.adColors.whiteTextColor,
                            ),
                          ),
                          onPressed: () => updateData(
                            context,
                            widget.dealProductModel.item ??
                                const DutyFreeProductDataModel(),
                            true,
                          ),
                        ),
                      );
                    case true:
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(28),
                          ),
                          color: context.adColors.blueColor,
                        ),
                        width: context.widthOfScreen - context.k_40,
                        height: k_54.sp,
                        child: ADDotProgressView(
                          color: context.adColors.whiteTextColor,
                        ),
                      );

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_14,
        );
      },
    );
  }

  void updateData(
    BuildContext context,
    DutyFreeProductDataModel dutyFreeProductDataModel,
    increment,
  ) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if ((dutyFreeState.dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) &&
        dutyFreeProductDataModel.storeType.isNotEmpty &&
        ((widget.dealProductModel.airportCode?.isEmpty ?? true) &&
            (dutyFreeState.dutyFreeCartResponse?.airportCode !=
                    selectedAirportsData?.airportCode ||
                dutyFreeState.dutyFreeCartResponse?.itemDetails.first.storeType
                        .toLowerCase() !=
                    dutyFreeProductDataModel.storeType))) {
      Utils.clearDutyFreeCartDialog(context, (dialogContext) {
        Navigator.of(dialogContext).pop();
        final DutyFreeRepository dutyFreeRepository = DutyFreeRepository();
        dutyFreeRepository.removeDutyFreeCart().then((value) {
          if (value.viewStatus == Status.complete) {
            (dutyFreeState
                        .addedItemMap[dutyFreeState.terminalModel.value.code] ??
                    {})
                .clear();
            // try {
            //   dutyFreeState.dashboardItemNotifier?.value =
            //       !(dutyFreeState.dashboardItemNotifier?.value ?? false);
            // } catch (e) {
            //   adLog(e.toString());
            // }
            if (dutyFreeState.terminalList.isEmpty) {
              dutyFreeState.getDutyFreeTerminalList().then((value) {
                //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
                dutyFreeState.terminalModel.value =
                    dutyFreeState.terminalList.firstWhere(
                  (element) =>
                      element.code.toLowerCase() ==
                      dutyFreeProductDataModel.storeType.trim().toLowerCase(),
                );
              });
            } else {
              //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
              dutyFreeState.terminalModel.value =
                  dutyFreeState.terminalList.firstWhere(
                (element) =>
                    element.code.toLowerCase() ==
                    dutyFreeProductDataModel.storeType.trim().toLowerCase(),
              );
            }
            dutyFreeState
              ..clearCart(context.read<AppSessionState>())
              ..updateCart(
                context: context,
                dutyFreeProductDataModel: dutyFreeProductDataModel,
                increment: increment,
                fromCartPage: false,
              );
          } else {
            getView(
              context: context,
              dialogEnm: DialogTypeEnm.snackBar,
              message: value.message ?? 'Something went wrong',
            );
          }
        });
      });
    } else {
      dutyFreeState.updateCart(
        context: context,
        dutyFreeProductDataModel: dutyFreeProductDataModel,
        increment: increment,
        fromCartPage: false,
      );
    }
  }
}
