import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CartRemoveOutOfStock extends StatefulWidget {
  const CartRemoveOutOfStock(this.validateCartResponse, {Key? key})
      : super(key: key);

  static const double buttonWidth = 166;
  static const double buttonHeight = 48;
  static const imageRatio = 3;
  static const detailRatio = 7;
  final ADResponseState validateCartResponse;

  @override
  State<CartRemoveOutOfStock> createState() => _CartRemoveOutOfStockState();
}

class _CartRemoveOutOfStockState extends State<CartRemoveOutOfStock> {
  ValueNotifier<bool> removeOutOfStockNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    const maxLines = 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ADDraggableSheetHeader(
          headerTitle: '',
          closeCallBack: (value) => navigatorPopScreen(context),
        ),
        Text(
          'remove_out_of_stock'.localize(context),
          style: ADTextStyle700.size22.copyWith(
            color: context.adColors.black,
          ),
          textAlign: TextAlign.left,
        ).paddingBySide(
          left: context.k_16,
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          widget.validateCartResponse.message ?? '',
          style: ADTextStyle400.size16.copyWith(
            color: context.adColors.black,
          ),
          textAlign: TextAlign.left,
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: context.k_40,
            left: context.k_16,
            right: context.k_16,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.validateCartResponse.data is List
              ? (widget.validateCartResponse.data as List<ItemDetailResponse>)
                  .length
              : 0,
          itemBuilder: (BuildContext context, int index) {
            final ItemDetailResponse itemDetailResponse = (widget
                .validateCartResponse.data as List<ItemDetailResponse>)[index];
            return Row(
              children: [
                ADCachedImage(
                  imageUrl: Utils.validateAndAppendBaseUrl(
                    itemDetailResponse.productImage,
                  ),
                  boxFit: BoxFit.contain,
                  width: context.k_48,
                  height: context.k_60,
                ),
                ADSizedBox(
                  width: context.k_18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (itemDetailResponse.skuName).validateWithDefaultValue(),
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.neutralInfoMsg),
                      ),
                      ADSizedBox(
                        height: context.k_8,
                      ),
                      Text(
                        '${'qty'.localize(context)} ${itemDetailResponse.overheadStock}',
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.neutralInfoMsg),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 1,
            color: context.adColors.dividerColor,
          ).paddingBySide(
            top: context.k_20,
            bottom: context.k_20,
          ),
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.adColors.whiteTextColor,
                  shadowColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(
                    CartRemoveOutOfStock.buttonHeight,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_28),
                    ),
                    side: BorderSide(
                      color: context.adColors.addButtonBorderColor,
                    ),
                  ),
                ),
                onPressed: () => navigatorPopScreen(context),
                child: Text(
                  'Cancel',
                  style: ADTextStyle400.size16.copyWith(
                    color: context.adColors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            ADSizedBox(
              width: context.k_10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.adColors.black,
                  shadowColor: Colors.transparent,
                  fixedSize: const Size.fromHeight(
                    CartRemoveOutOfStock.buttonHeight,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_28),
                    ),
                    side: BorderSide(
                      color: context.adColors.black,
                    ),
                  ),
                ),
                onPressed: () => removeOutOfStockItems(
                  context,
                  (widget.validateCartResponse.data as List<ItemDetailResponse>)
                      .map(
                        (e) => {
                          'skuCode': e.skuCode,
                          'quantity': e.overheadStock,
                        },
                      )
                      .toList(growable: false),
                ),
                child: ValueListenableBuilder(
                  valueListenable: removeOutOfStockNotifier,
                  builder: (BuildContext context, bool value, Widget? child) =>
                      value
                          ? ADDotProgressView(
                              color: context.adColors.whiteTextColor,
                            )
                          : Text(
                              'Remove',
                              style: ADTextStyle700.size16.copyWith(
                                color: context.adColors.whiteTextColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                ),
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    removeOutOfStockNotifier.dispose();
  }

  Future<void> removeOutOfStockItems(
    BuildContext context,
    List<Map> outOfStockItems,
  ) async {
    removeOutOfStockNotifier.value = true;
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final removeOutOfStockResponse =
        await dutyFreeState.removeOutOfStockItems(outOfStockItems);
    removeOutOfStockNotifier.value = false;
    if (removeOutOfStockResponse.viewStatus == Status.complete) {
      navigatorPopScreenWithData(context, Status.complete);
    } else {
      getView(
        context: context,
        dialogEnm: DialogTypeEnm.toast,
        message: removeOutOfStockResponse.message,
      );
    }
  }
}
