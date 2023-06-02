/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/payment_options_cell.dart';
import 'package:adani_airport_mobile/modules/payment/state_management/bank_list_view_model.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/cell_type.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class AllBanksList extends StatefulWidget {
  final List<Option> banksList;
  final String amountPayable;
  final PaymentMethodState paymentMethodViewModel;
  final GlobalKey<FormState> globalKey;

  const AllBanksList({
    Key? key,
    required this.banksList,
    required this.amountPayable,
    required this.paymentMethodViewModel,
    required this.globalKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AllBanksListState();
  }
}

class _AllBanksListState extends State<AllBanksList> {
  final BankListViewModel bankListViewModel = BankListViewModel();
  final double fontHeight = 1.4;

  @override
  void initState() {
    bankListViewModel.bankList = widget.banksList;
    super.initState();
    searchTextController.clear();
    bankListViewModel.filteredBanksList = widget.banksList;
  }

  final int hundred = 100;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget(
      viewModel: bankListViewModel,
      child: Consumer<BankListViewModel>(
        builder: (
          context,
          value,
          child,
        ) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: IconButton(
                  //     iconSize: context.k_48,
                  //     visualDensity: VisualDensity.compact,
                  //     splashRadius: context.k_20,
                  //     padding: EdgeInsets.zero,
                  //     onPressed: () => dragSheetTap(context),
                  //     icon: SvgPicture.asset(
                  //       SvgAssets.closeIcon,
                  //       height: context.k_14,
                  //       width: context.k_14,
                  //       color: closeIconColor,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: context.k_10,
                  // ),
                  // Text(
                  //   'select_other_bank'.localize(context),
                  //   style: ADTextStyle700.size22
                  //       .setTextColor(context.adColors.neutralInfoMsg),
                  // ).paddingBySide(
                  //   left: context.k_20,
                  // ),
                  // SizedBox(
                  //   height: context.k_30,
                  // ),

                  // SearchView(
                  //   hintText: 'search_banks'.localize(context),
                  //   onChanged: (value) =>
                  //       bankListViewModel.bankSearchList(value),
                  //   onFieldSubmitted: (value) =>
                  //       bankListViewModel.bankSearchList(value),
                  //   onIconButtonPressed: () => clearFocusText(context),
                  // ).paddingBySide(top: context.k_14, right: context.k_20),

                  SizedBox(
                    height: context.k_40,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: context.adColors.blackTextColor,
                      controller: textController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z. ]'),
                        ),
                        NoLeadingSpaceFormatter(),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff3f3f3),
                        hintText: 'search_banks'.localize(context),
                        hintStyle: ADTextStyle400.size16.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: getBorder(context),
                        focusedBorder: getBorder(context),
                        enabledBorder: getBorder(context),
                        prefixIcon: Icon(
                          Icons.search,
                          color: context.adColors.inactiveGreyColor,
                          size: context.k_24,
                        ).paddingBySide(left: context.k_4),
                        suffixIcon: textController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () => clearFocusText(context),
                                icon: Icon(
                                  Icons.clear,
                                  color: context.adColors.greyTextColor,
                                ),
                              )
                            : null,
                      ),
                      onChanged: (value) =>
                          bankListViewModel.bankSearchList(value),
                      onFieldSubmitted: (value) =>
                          bankListViewModel.bankSearchList(value),
                    ),
                  ).paddingBySide(
                    left: context.k_14,
                    right: context.k_20,
                  ),
                ],
              ).paddingBySide(
                top: context.k_20,
                bottom: context.k_8,
              ),
              Expanded(
                child: bankListViewModel.bankList.isNotEmpty
                    ? ListView.builder(
                        itemCount: bankListViewModel.bankList.length,
                        itemBuilder: (context, index) {
                          final Option optionDetail =
                              bankListViewModel.bankList[index];
                          return InkWell(
                            onTap: () => navigatorPopScreenWithData(
                              context,
                              optionDetail,
                            ),
                            child: Container(
                              color: context.adColors.transparentColor,
                              child: PaymentOptionsCell(
                                globalKey: widget.globalKey,
                                paymentMethodViewModel:
                                    widget.paymentMethodViewModel,
                                typeOfCell: CellType.tile,
                                title: optionDetail.name ?? '',
                                iconPath: optionDetail.smallIcon ?? '',
                                isSelected: widget.paymentMethodViewModel
                                        .selectedOption ==
                                    optionDetail,
                                type: PaymentOptionType.registered,
                                radioButtonVisibility: false,
                              ).paddingBySide(
                                top: context.k_8,
                                left: context.k_24,
                                right: context.k_24,
                                bottom: context.k_6,
                              ),
                            ),
                          );
                        },
                      )
                    : NoDataFoundErrorScreen(
                        paddingBetweenImageAndErrorTitle: context.k_20,
                        errorTitle: 'oops_no_results_found'.localize(context),
                        isCenter: false,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void clearFocusText(BuildContext context) {
    textController.clear();
    FocusScope.of(context).unfocus();
    bankListViewModel.bankSearchList('');
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }

  void dragSheetTap(BuildContext context) {
    navigatorPopScreen(context);
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}
