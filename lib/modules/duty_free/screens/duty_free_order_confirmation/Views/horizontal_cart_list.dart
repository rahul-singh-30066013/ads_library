/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_cart_list_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Cart widget to display cart data horizontally
class HorizontalCartList extends StatefulWidget {
  // final bool showMoreButtonVisibility;
  const HorizontalCartList({Key? key}) : super(key: key);

  @override
  _HorizontalCartListState createState() => _HorizontalCartListState();
}

class _HorizontalCartListState extends State<HorizontalCartList> {
  ///
  // static const int indexValue = 2;
  /// initial item to display to show 4 items.
  // static const int initialItemToDisplay = 4;

  /// max line for title text
  static const int maxLine = 2;

  /// height of image
  static double heightOfIcon = 90.sp;

  /// width of image
  static double widthOfIcon = 76.sp;

  /// height of main container
  static double heightOfContainerSingleItem = 150.sp;
  static double heightOfContainerListItem = 170.sp;

  /// TODO add color to styleguide
  static const Color grayBackground = Color(0xfff5f5f5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // bool isShowEnabled = itemList.length > initialItemToDisplay;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        return Container(
          height: ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.orderDetail?.dutyfreeDetail?.itemDetails.length ??
                      0) ==
                  1)
              ? heightOfContainerSingleItem
              : heightOfContainerListItem,
          decoration: const BoxDecoration(color: grayBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ADSizedBox(
                height: context.k_24,
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: dutyFreeOrderState
                          .dutyFreeCancelOrderDetailsResponseModel
                          ?.orderDetail
                          ?.dutyfreeDetail
                          ?.itemDetails
                          .length ??
                      0,
                  itemBuilder: (context, index) {
                    return Container(
                      width: ((dutyFreeOrderState
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderDetail
                                      ?.dutyfreeDetail
                                      ?.itemDetails
                                      .length ??
                                  0) <=
                              1)
                          ? context.widthOfScreen
                          : null,
                      padding: EdgeInsets.only(
                        left: index == 0 ? context.k_16 : 0,
                        right: index ==
                                (dutyFreeOrderState
                                            .dutyFreeCancelOrderDetailsResponseModel
                                            ?.orderDetail
                                            ?.dutyfreeDetail
                                            ?.itemDetails
                                            .length ??
                                        0) -
                                    1
                            ? context.k_16
                            : 0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_4),
                              ),
                              color: context.adColors.whiteTextColor,
                            ),
                            alignment: Alignment.center,
                            height: heightOfIcon,
                            width: widthOfIcon,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_10,
                              vertical: context.k_12,
                            ),
                            child: FadeInImage.memoryNetwork(
                              image: (dutyFreeOrderState
                                          .dutyFreeCancelOrderDetailsResponseModel
                                          ?.orderDetail
                                          ?.dutyfreeDetail
                                          ?.itemDetails[index]
                                          .productImage
                                          ?.isNotEmpty ??
                                      false)
                                  ? Utils.validateAndAppendBaseUrl(
                                      dutyFreeOrderState
                                              .dutyFreeCancelOrderDetailsResponseModel
                                              ?.orderDetail
                                              ?.dutyfreeDetail
                                              ?.itemDetails[index]
                                              .productImage ??
                                          '',
                                    )
                                  : '',
                              width: widthOfIcon,
                              height: heightOfIcon,
                              fit: BoxFit.contain,
                              placeholder: kTransparentImage,
                              imageErrorBuilder: (
                                BuildContext context,
                                Object error,
                                StackTrace? stackTrace,
                              ) =>
                                  Container(
                                color: context.adColors.cardBgColor,
                                child: Icon(
                                  Icons.image_rounded,
                                  color: context.adColors
                                      .dividerColor, // Color(0xfff7f7f7),
                                  size: context.k_56,
                                ),
                              ),
                            ),
                          ),
                          if ((dutyFreeOrderState
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderDetail
                                      ?.dutyfreeDetail
                                      ?.itemDetails
                                      .length ??
                                  0) <=
                              1)
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dutyFreeOrderState
                                            .dutyFreeCancelOrderDetailsResponseModel
                                            ?.orderDetail
                                            ?.dutyfreeDetail
                                            ?.itemDetails[index]
                                            .skuName ??
                                        '',
                                    style: ADTextStyle600.size16.setTextColor(
                                      context.adColors.storyViewBarFillColor,
                                    ),
                                    maxLines: maxLine,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ADSizedBox(
                                    height: context.k_8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'qty'.localize(context),
                                        style:
                                            ADTextStyle400.size14.setTextColor(
                                          context
                                              .adColors.storyViewBarFillColor,
                                        ),
                                      ),
                                      ADSizedBox(
                                        width: context.k_4,
                                      ),
                                      Text(
                                        '${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails[index].quantity ?? 0}',
                                        style:
                                            ADTextStyle400.size14.setTextColor(
                                          context
                                              .adColors.storyViewBarFillColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ADSizedBox(
                                    height: context.k_8,
                                  ),
                                ],
                              ).paddingBySide(
                                left: context.k_20,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      ADSizedBox(
                    width: context.k_10,
                  ),
                ),
              ),
              if ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.orderDetail?.dutyfreeDetail?.itemDetails.length ??
                      0) >
                  1)
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        '${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails.length ?? 0} ${'items_in_this_order'.localize(context)}',
                        style: ADTextStyle500.size16
                            .setTextColor(context.adColors.blackTextColor)
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: context.k_12,
                      ),
                    ],
                  ),
                  onTap: () => cartListBottomsSheet(context),
                ).paddingBySide(
                  top: context.k_20,
                  left: context.k_16,
                  right: context.k_16,
                ),
              // ADSizedBox(
              //   height: context.k_36,
              // ),
            ],
          ),
        );
      },
    );
  }

  void cartListBottomsSheet(
    BuildContext context,
  ) =>
      BottomSheetUtils.showDraggableBottomSheetDialog(
        context,
        // ReschedulePage(),
        const DutyFreeCartListBottomSheet(
          isBottomSheet: true,
        ).paddingAllSide(context.k_16),
        'Items in your order (${context.read<DutyFreeOrderState>().dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails.length ?? 0})',
      );
}
