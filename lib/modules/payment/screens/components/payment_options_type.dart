/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/ad_payment_option_tile.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/all_banks_list.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/credit_or_debit_card_view.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/payment_options_cell.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/cell_type.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_type_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class PaymentOptionsType extends StatefulWidget {
  const PaymentOptionsType({
    Key? key,
    required this.totalAmount,
    required this.keyForUpi,
    required this.keyForCreditCard,
    this.controllerAll,
    this.globalKeyForFocus,
    this.globalKeyForUpiFocus,
  }) : super(key: key);

  @override
  State<PaymentOptionsType> createState() => _PaymentOptionsState();
  final String totalAmount;
  final GlobalKey<FormState> keyForCreditCard;
  final GlobalKey<FormState> keyForUpi;
  final ScrollController? controllerAll;
  final GlobalKey? globalKeyForFocus;
  final GlobalKey? globalKeyForUpiFocus;
}

class _PaymentOptionsState extends State<PaymentOptionsType> {
  PaymentMethodState? _paymentMethodViewModel;
  static const double standardBorderRadius = 8;
  static const viewOtherBankHeight = 60.0;
  final double animateValueOfCreditCard = 220.sp; //Need to be dynamic
  final double animateValueOfUpi = 230.sp; //Need to be dynamic
  final double animateValueOfWallet = 410.sp; //Need to be dynamic
  final double animateValueOfNetBanking = 380.sp; //Need to be dynamic
  int paymentCellLength = 0;

  @override
  void initState() {
    _paymentMethodViewModel = context.read<PaymentMethodState>();
    paymentCellLength =
        (_paymentMethodViewModel?.paymentTypeList.length ?? 0) - 1;
    super.initState();
  }

  bool isPaymentRestricted(ActiveRule? activeRule, String? paymentType) {
    final limit = double.parse(activeRule?.amountlimit ?? '0');
    return activeRule != null &&
        limit > 0 &&
        double.parse(widget.totalAmount) > limit &&
        (paymentType == 'UPI' || paymentType == 'Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: context.k_16,
            bottom: context.k_8,
            top: context.k_30,
          ),
          child: Text(
            'payment_option'.localize(context),
            style: ADTextStyle700.size18,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _paymentMethodViewModel?.paymentTypeList.length ?? 0,
          itemBuilder: (context, index) {
            final PaymentTypeList? _paymentOption =
                _paymentMethodViewModel?.paymentTypeList[index];
            final List<Option> options = _paymentOption?.options ?? [];
            adLog(
              'Options paymentssss ${_paymentOption?.activeRule?.amountlimit}',
            );
            return options.isEmpty
                ? const SizedBox()
                : Column(
                    children: [
                      Consumer<PaymentMethodState>(
                        builder: (context, value, child) => ADPaymentOptionTile(
                          index: index,
                          isExpanded: _paymentOption?.options?.first.mode ==
                                  _paymentMethodViewModel
                                      ?.expendedPaymentMode &&
                              !isPaymentRestricted(
                                _paymentOption?.activeRule,
                                _paymentOption?.options?.first.mode
                                    .toString()
                                    .split('.')
                                    .last
                                    .localize(context),
                              ),
                          icon: _paymentOption?.iconSmall,
                          paymentOptionType: _paymentOption?.options?.first.mode
                              .toString()
                              .split('.')
                              .last
                              .localize(context),
                          onExpandCallback: (value) => {
                            _paymentMethodViewModel
                                ?.updatePaymentOptionExpended(
                              _paymentOption?.options?.first.mode,
                            ),
                            setPaymentTypeOnTop(),
                          },
                          activeRule: _paymentOption?.activeRule,
                          totalAmount: widget.totalAmount,
                          expansionChildren: _paymentOption?.typeOfCell ==
                                  CellType.brick
                              ? <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: _paymentMethodViewModel
                                            ?.listOfPrimeBank
                                            .map(
                                              (brick) => Flexible(
                                                child: InkWell(
                                                  onTap: () =>
                                                      onButtonTap(brick),
                                                  child: PaymentOptionsCell(
                                                    radioButtonVisibility: true,
                                                    globalKey: widget.keyForUpi,
                                                    paymentMethodViewModel:
                                                        _paymentMethodViewModel ??
                                                            PaymentMethodState(),
                                                    typeOfCell: _paymentOption
                                                            ?.typeOfCell ??
                                                        CellType.brick,
                                                    title: brick.name ?? '',
                                                    iconPath:
                                                        brick.smallIcon ?? '',
                                                    isSelected:
                                                        (_paymentMethodViewModel
                                                                ?.selectedOption) ==
                                                            brick,
                                                    type: brick
                                                            .paymentOptionType ??
                                                        PaymentOptionType
                                                            .registered,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList() ??
                                        [],
                                  ).paddingBySide(
                                    top: context.k_4,
                                    bottom: context.k_10,
                                    left: context.k_16,
                                    right: context.k_16,
                                  ),
                                  InkWell(
                                    onTap: () => adShowAllBanksBottomSheet(
                                      context: context,
                                      childWidget: AllBanksList(
                                        globalKey: widget.keyForUpi,
                                        paymentMethodViewModel:
                                            _paymentMethodViewModel ??
                                                PaymentMethodState(),
                                        banksList: _paymentMethodViewModel
                                                ?.listOfAllBank ??
                                            [],
                                        amountPayable: '₹${widget.totalAmount}',
                                      ),
                                      headerTitle:
                                          'select_other_bank'.localize(context),
                                    ).then((value) {
                                      if (value != null) {
                                        setState(
                                          () {
                                            _paymentMethodViewModel
                                                ?.bankListViewModel
                                                ?.setSelectedBankTo(
                                              value,
                                            );
                                            _paymentMethodViewModel
                                                ?.updatePaymentOption(
                                              value,
                                            );
                                          },
                                        );
                                      }
                                    }),
                                    child: Container(
                                      height: viewOtherBankHeight,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            standardBorderRadius,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: _paymentMethodViewModel
                                                      ?.bankListViewModel
                                                      ?.selectedBank ==
                                                  null
                                              ? context.adColors.dividerColor
                                              : context.adColors.blackColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (_paymentMethodViewModel
                                                  ?.bankListViewModel
                                                  ?.selectedBank ==
                                              null)
                                            Row(
                                              children: [
                                                Text(
                                                  'view_other_banks'.localize(
                                                    context,
                                                  ),
                                                  style: ADTextStyle400.size16
                                                      .setTextColor(
                                                    context.adColors
                                                        .neutralInfoMsg,
                                                  ),
                                                ),
                                              ],
                                            ).paddingBySide(
                                              left: context.k_20,
                                            )
                                          else
                                            Row(
                                              children: [
                                                // if ((_paymentMethodViewModel
                                                //             ?.bankListViewModel
                                                //             ?.selectedBank
                                                //             ?.smallIcon ??
                                                //         '')
                                                //     .isNotEmpty)
                                                //   SvgPicture.network(
                                                //     _paymentMethodViewModel
                                                //             ?.bankListViewModel
                                                //             ?.selectedBank
                                                //             ?.smallIcon ??
                                                //         '',
                                                //     height: context.k_24,
                                                //     width: context.k_24,
                                                //   ),
                                                // if ((_paymentMethodViewModel
                                                //             ?.bankListViewModel
                                                //             ?.selectedBank
                                                //             ?.smallIcon ??
                                                //         '')
                                                //     .isNotEmpty)
                                                //   SizedBox(
                                                //     width: context.k_16,
                                                //   ),
                                                Text(
                                                  _paymentMethodViewModel
                                                          ?.bankListViewModel
                                                          ?.selectedBank
                                                          ?.name ??
                                                      '',
                                                  style: ADTextStyle500.size14
                                                      .setTextColor(
                                                    context.adColors
                                                        .neutralInfoMsg,
                                                  ),
                                                ),
                                              ],
                                            ).paddingBySide(
                                              left: context.k_20,
                                            ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'lib/assets/images/common/right-arrow.svg',
                                              ),
                                            ],
                                          ).paddingBySide(
                                            right: context.k_20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).paddingBySide(
                                    bottom: context.k_30,
                                    top: context.k_14,
                                    left: context.k_16,
                                    right: context.k_16,
                                  ),
                                ]
                              : _paymentOption?.typeOfCell == CellType.card
                                  ? <Widget>[
                                      CreditOrDebitCardView(
                                        paymentMethodViewModel:
                                            _paymentMethodViewModel ??
                                                PaymentMethodState(),
                                        cardOption:
                                            _paymentOption?.options?.first,
                                        globalKey: widget.keyForCreditCard,
                                        globalKeyForFocus:
                                            widget.globalKeyForFocus,
                                      ).paddingBySide(
                                        left: context.k_16,
                                        right: context.k_16,
                                      ),
                                    ]
                                  : <Widget>[
                                      ...options
                                          .map(
                                            (tile) => InkWell(
                                              highlightColor: tile
                                                          .paymentOptionType ==
                                                      PaymentOptionType.addNew
                                                  ? context
                                                      .adColors.transparentColor
                                                  : null,
                                              splashColor: tile
                                                          .paymentOptionType ==
                                                      PaymentOptionType.addNew
                                                  ? context
                                                      .adColors.transparentColor
                                                  : null,
                                              focusColor: context
                                                  .adColors.transparentColor,
                                              onTap: () =>
                                                  _paymentMethodViewModel
                                                      ?.updatePaymentOption(
                                                tile,
                                              ),
                                              child: Container(
                                                color: context
                                                    .adColors.transparentColor,
                                                child: PaymentOptionsCell(
                                                  radioButtonVisibility: true,
                                                  globalKey: widget.keyForUpi,
                                                  paymentMethodViewModel:
                                                      _paymentMethodViewModel ??
                                                          PaymentMethodState(),
                                                  typeOfCell: _paymentOption
                                                          ?.typeOfCell ??
                                                      CellType.card,
                                                  title: tile.name ?? '',
                                                  iconPath:
                                                      tile.smallIcon ?? '',
                                                  isSelected:
                                                      (_paymentMethodViewModel
                                                              ?.selectedOption) ==
                                                          tile,
                                                  type:
                                                      tile.paymentOptionType ??
                                                          PaymentOptionType
                                                              .registered,
                                                  globalKeyForUpiFocus: widget
                                                      .globalKeyForUpiFocus,
                                                ),
                                              ).paddingBySide(
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),
                                            ).paddingBySide(
                                              bottom: context.k_14,
                                            ),
                                          )
                                          .toList(),
                                    ],
                        ),
                      ),
                      if (index < paymentCellLength)
                        Container(
                          height: 1,
                          color: const Color(0xffE4E4E4),
                        )
                      else
                        const SizedBox(),
                    ],
                  ).paddingBySide(
                    // left: context.k_16,
                    // right: context.k_16,
                    );
          },
        ),
        // const OtherPaymentOptions(),
      ],
    );
  }

  /// this method is use for set animate position of payment cell
  void setPaymentTypeOnTop() {
    if (_paymentMethodViewModel?.expendedPaymentMode ==
        PaymentMode.creditordebitcard) {
      widget.controllerAll?.animateTo(
        animateValueOfCreditCard,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_paymentMethodViewModel?.expendedPaymentMode ==
        PaymentMode.upi) {
      widget.controllerAll?.animateTo(
        animateValueOfUpi,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_paymentMethodViewModel?.expendedPaymentMode ==
        PaymentMode.wallet) {
      widget.controllerAll?.animateTo(
        animateValueOfWallet,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_paymentMethodViewModel?.expendedPaymentMode ==
        PaymentMode.netbanking) {
      widget.controllerAll?.animateTo(
        animateValueOfNetBanking,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void onButtonTap(Option brick) {
    _paymentMethodViewModel?.updatePaymentOption(
      brick,
    );
    _paymentMethodViewModel?.bankListViewModel?.setSelectedBankTo(
      null,
    );
  }
}
