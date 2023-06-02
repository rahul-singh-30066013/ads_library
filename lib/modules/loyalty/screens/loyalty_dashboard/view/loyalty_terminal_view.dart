/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to show loyalty offers
class LoyaltyTerminalView extends StatefulWidget {
  final WidgetItem? widgetItems;

  const LoyaltyTerminalView({
    Key? key,
    this.widgetItems,
  }) : super(key: key);

  @override
  State<LoyaltyTerminalView> createState() => _LoyaltyTerminalViewState();
}

String? terminalName;

class _LoyaltyTerminalViewState extends State<LoyaltyTerminalView> {
  LoyaltyStateManagement? loyaltyStateProvider;

  @override
  void initState() {
    super.initState();
    loyaltyStateProvider = context.read<LoyaltyStateManagement>();
    loyaltyStateProvider?.selectedTerminal =
        widget.widgetItems?.list.first ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Selector<LoyaltyStateManagement, String>(
      selector: (context, viewModel) => viewModel.selectedTerminal,
      builder: (
        context,
        value,
        Widget? child,
      ) {
        adLog(value);
        return widget.widgetItems != null
            ? InkWell(
                onTap: () => {
                  adShowBottomSheet(
                    context: context,
                    childWidget: LoyaltyTerminalScreen(
                      terminals: widget.widgetItems?.list ?? [],
                      selectedTerminal:
                          loyaltyStateProvider?.selectedTerminal ?? '',
                      terminalTap: (value) => terminalTap(value),
                      onBottomSheetItemSelect: (value) =>
                          updateDashboard(value, this.context),
                    ),
                    headerTitle: 'select_terminal'.localize(context),
                  ).then((value) => null),
                },
                child: Row(
                  children: [
                    Text(
                      '${widget.widgetItems?.airportName ?? ''}-$value',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ADSizedBox(
                      width: context.k_4,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: context.k_28,
                      color: context.adColors.blackTextColor,
                    ),
                    //  Icon
                  ],
                ),
              )
            : const ADSizedBox.shrink();
      },
    );
  }

  void updateDashboard(String value, BuildContext context) {
    try {
      if (value.toString() !=
          loyaltyStateProvider?.selectedTerminal.toString().toLowerCase()) {
        final DutyFreeState dutyFreeState = context.read<DutyFreeState>()
          ..clearDutyFreeCartApi(context.read<AppSessionState>());
        loyaltyStateProvider?.updateState(ADResponseState.loading());
        adLog(dutyFreeState.toString());
      }
    } catch (e) {
      adLog(e.toString());
    }
  }

  void terminalTap(String selectedTerminal) {
    if (selectedTerminal != loyaltyStateProvider?.selectedTerminal) {
      loyaltyStateProvider?.updateTerminal(selectedTerminal);
    }
  }
}

/// This Class is used to check and change terminals
class LoyaltyTerminalScreen extends StatelessWidget {
  final List<String> terminals;
  final String selectedTerminal;
  final ADTapCallbackWithValue terminalTap;
  final ADGenericCallback onBottomSheetItemSelect;
  const LoyaltyTerminalScreen({
    Key? key,
    required this.terminals,
    required this.selectedTerminal,
    required this.terminalTap,
    required this.onBottomSheetItemSelect,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: terminals.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => terminalTapCall(
          index: index,
          context: context,
        ),
        child: Container(
          color: selectedTerminal == terminals[index]
              ? context.adColors.lightBlue
              : Colors.transparent,
          child: Row(
            children: [
              Text(
                terminals[index],
                style: selectedTerminal == terminals[index]
                    ? ADTextStyle600.size16
                        .setTextColor(context.adColors.blackColor)
                    : ADTextStyle400.size16
                        .setTextColor(context.adColors.blackColor),
              ),
              Expanded(
                child: Visibility(
                  visible: selectedTerminal == terminals[index],
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ADSizedBox(
                      height: context.k_12,
                      width: context.k_14,
                      child: SvgPicture.asset(
                        SvgAssets.refundableCheck,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).paddingBySide(
            top: context.k_14,
            bottom: context.k_14,
            left: context.k_16,
            right: context.k_16,
          ),
        ),
      ),
    );
  }

  void selectItem(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    onBottomSheetItemSelect(terminalName ?? '');
  }

  void clearDutyFreeCartDialog(BuildContext context) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return DutyFreeRemoveItem(
          detailString: 'remove_cart_text_terminal_duty_free'.localize(context),
          titleString: 'cart_confirmation'.localize(context),
          yesCallBack: () => selectItem(context),
          noCallBack: () => navigatorPopScreen(dialogContext),
          cancelText: 'yes_i_am'.localize(context),
          confirmText: 'No_i_will_stay'.localize(context),
        );
      },
    );
    adLog(bottomSheet.toString());
  }

  void terminalTapCall({
    required int index,
    required BuildContext context,
  }) {
    if (terminals[index] == selectedTerminal) {
      terminalTap(
        terminals[index],
      );
      terminalName = selectedTerminal;
      Navigator.of(context).pop();
    } else {
      if (context.read<AppSessionState>().cartType != CartType.noDataInCart) {
        clearDutyFreeCartDialog(context);
        terminalTap(
          terminals[index],
        );
        // Navigator.of(context).pop();
      } else {
        //  onBottomSheetItemSelect(text);
        terminalTap(
          terminals[index],
        );
        Navigator.of(context).pop();
      }
    }

    //  navigatorPopScreen(context);
  }
}
