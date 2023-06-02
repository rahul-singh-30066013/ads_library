import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_add_on/add_cart_add_on_request_model/add_cart_add_on_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_add_on_quantity_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class AddStandAloneQuantityButton extends StatelessWidget {
  const AddStandAloneQuantityButton({
    Key? key,
    required this.quantity,
    required this.cartResponse,
  }) : super(key: key);
  final int quantity;
  final CartResponse cartResponse;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> showLoader = ValueNotifier<bool>(false);
    final double buttonWidth = 95.sp;
    final double buttonHeight = 42.sp;
    return ElevatedButton(
      onPressed: () => {
        if (!showLoader.value)
          {
            selectAddOnsQuantity(context, showLoader),
          },
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, backgroundColor: context.adColors.whiteTextColor,
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
      child: ValueListenableBuilder<bool>(
        builder: (BuildContext context, value, Widget? child) {
          return value
              ? ADDotProgressView(
                  size: context.k_8,
                  color: context.adColors.blackTextColor,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            text: ' $quantity',
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
                      ),
                    ),
                  ],
                );
        },
        valueListenable: showLoader,
      ),
    );
  }

  void onQuantitySelect({
    required int quantity,
    required BuildContext context,
    required ValueNotifier<bool> showLoader,
  }) {
    // GaEvent.getInstance().bookPranaamAddOnEvent();
    ClickEvents? eventName;
    if (quantity >
        (context
                .read<PranaamAppDataStateManagement>()
                .cartDataResponse
                ?.standaloneProductDetails
                .itemCount ??
            0)) {
      eventName = ClickEvents.add_to_cart;
    } else if (quantity <
        (context
                .read<PranaamAppDataStateManagement>()
                .cartDataResponse
                ?.standaloneProductDetails
                .itemCount ??
            0)) {
      eventName = ClickEvents.remove_from_cart;
    }
    // ClickEvents.book_pranaam_add_on
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
    // context.read<AppSessionState>().updatePranaamCart(
    //       getAddonAddedByUserCount(cartResponse),
    //     );

    ///increase counter on add on button
    selectOnQuantity(
      quantity,
      context,
      showLoader,
      eventName,
    );
  }

  void selectAddOnsQuantity(
    BuildContext context,
    ValueNotifier<bool> showLoader,
  ) {
    const nine = 9;
    adShowBottomSheet(
      context: context,
      childWidget: SelectAddOnQuantityScreen(
        itemCounts: nine,
        selectedIndexNotifier: ValueNotifier<int>(quantity),
        adGenericCallback: (value) => {
          Navigator.pop(context),
          onQuantitySelect(
            showLoader: showLoader,
            quantity: value,
            context: context,
          ),
        },
      ),
      headerTitle: 'Select_Quantity'.localize(context),
    );
  }

  void selectOnQuantity(
    int quantity,
    BuildContext context,
    ValueNotifier<bool> showLoader,
    ClickEvents? eventName,
  ) {
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    showLoader.value = true;
    pranaamAppDataStateManagement
        .cartAddOnItem(
      getAddCartAddOnRequest(cartResponse, quantity).toJson(),
      context.read<AppSessionState>(),
    )
        .then(
      (value) {
        if (eventName != null) {
          StandAloneGaAnalytics().addToCartEvent(
            context,
            eventName,
            quantity,
          );
        }
        closeProgressAndValidate(
          value,
          context,
          showLoader,
        );
      },
    );
  }

  void closeProgressAndValidate(
    ADResponseState state,
    BuildContext context,
    ValueNotifier<bool> showLoader,
  ) {
    if (state.viewStatus == Status.complete ||
        state.viewStatus == Status.error) {
      showLoader.value = false;
      ProcessDialog.closeLoadingDialog(context);
    }
  }

  AddCartAddOnRequestModel getAddCartAddOnRequest(
    CartResponse cartResponse,
    int quantity,
  ) {
    return AddCartAddOnRequestModel(
      packageId: null,
      serviceName: cartResponse.standaloneProductDetails.name,
      serviceDescription: cartResponse.standaloneProductDetails.description,
      price: 0,
      quantity: quantity,
      addOnServiceId: cartResponse.standaloneProductDetails.id,
    );
  }
}
