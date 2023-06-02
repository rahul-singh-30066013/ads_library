/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/cvv_number_info_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/card_text_field.dart';
import 'package:adani_airport_mobile/modules/payment/state_management/credit_or_debit_card_view_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// View for entering credit/debit card details.
class CreditOrDebitCardView extends StatefulWidget {
  const CreditOrDebitCardView({
    required this.paymentMethodViewModel,
    required this.cardOption,
    required this.globalKey,
    this.globalKeyForFocus,
    Key? key,
  }) : super(key: key);

  final PaymentMethodState paymentMethodViewModel;
  final Option? cardOption;
  final GlobalKey<FormState> globalKey;
  final GlobalKey? globalKeyForFocus;

  @override
  State<StatefulWidget> createState() {
    return _CreditOrDebitCardViewState();
  }
}

class _CreditOrDebitCardViewState extends State<CreditOrDebitCardView> {
  // View-Model for credit card view.
  final CreditOrDebitCardViewModel _cardViewModel =
      CreditOrDebitCardViewModel();

  // Flex space for credit/debit card expiry date textfield.
  final int cardExpiryFlex = 6;
  final int cvvFlex = 4;

  // Length limits for textfields.
  final int cardNumberLength = 23;
  final int cardNumberCheck = 1;
  final int otherCVVLength = 3;
  final int cardExpiryLength = 5;
  final int cardHolderName = 0;
  final int cardHolderNameLength = 54;
  final int cardMinLength = 12;
  final int cardMaxLength = 19;

  int cardCvvLength = 3;
  String? errorValue;
  String? errorForExpiry;
  String? errorForCvv;
  String? errorCardHolderName;

  final int amxCardLength = 15;
  final int sixteenCardLength = 16;
  final int nineteenCardLength = 19;
  final int dinnerCardLength = 14;

  final FocusNode _cardNumberFocus = FocusNode();
  final FocusNode _expFocus = FocusNode();
  final FocusNode _cvvFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CreditOrDebitCardViewModel>(
      viewModel: _cardViewModel,
      child: Consumer<CreditOrDebitCardViewModel>(
        builder: (context, value, child) => Form(
          key: widget.globalKey,
          child: Column(
            key: widget.globalKeyForFocus,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AcceptedPayments(
                ccOptionsList: widget.paymentMethodViewModel.ccOptionsList,
              ),
              SizedBox(
                height: context.k_26,
              ),
              CardTextField(
                hintText: 'card_number'.localize(context),
                mask: false,
                textInputAction: TextInputAction.next,
                regex: visaCard,
                focusNode: _cardNumberFocus,
                suffixIcon: ADSizedBox(
                  height: context.k_24,
                  width: context.k_38,
                  child: SvgPicture.network(
                    widget.paymentMethodViewModel
                            .cardIcon[widget.paymentMethodViewModel.cardType] ??
                        'defaultCard',
                  ),
                ),
                controller: widget.paymentMethodViewModel.cardNumberController,
                onChangeImpl: (value) => cardTypeCheck(value),
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(cardNumberLength),
                ],
                errorText: errorValue,
                validation: (String? value) => validatedForCard(value),
              ),
              SizedBox(
                height: context.k_6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: cardExpiryFlex,
                    child: CardTextField(
                      mask: false,
                      textInputAction: TextInputAction.next,
                      regex: visaCard,
                      focusNode: _expFocus,
                      hintText: 'card_expiry'.localize(context),
                      controller: widget
                          .paymentMethodViewModel.cardExpiryMonthController,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(cardExpiryLength),
                      ],
                      onChangeImpl: (value) => expiryValidation(value),
                      errorText: errorForExpiry,
                      validation: (String? value) => validatedForExpiry(value),
                    ),
                  ),
                  SizedBox(
                    width: context.k_20,
                  ),
                  Expanded(
                    flex: cvvFlex,
                    child: CardTextField(
                      mask: true,
                      textInputAction: TextInputAction.next,
                      focusNode: _cvvFocus,
                      hintText: 'card_cvv'.localize(context),
                      suffixIcon: ADSizedBox(
                        height: context.k_24,
                        width: context.k_24,
                        child: IconButton(
                          padding: EdgeInsets.only(
                            top: context.k_2,
                            left: context.k_10,
                          ),
                          icon: SvgPicture.asset(
                            'lib/assets/images/svg/icons/shopping/i_common.svg',
                            height: context.k_14,
                            width: context.k_14,
                          ),
                          color: context.adColors.blackTextColor,
                          onPressed: () => {
                            if (widget.paymentMethodViewModel.paymentModule ==
                                PaymentModule.pranaam)
                              {
                                PranaamBookingGaAnalytics()
                                    .cvToolTipAnalyticsData(),
                              }
                            else
                              {
                                // GA event for cv tool tip click
                                FlightBookingGaAnalytics()
                                    .cvToolTipAnalyticsData(),
                              },
                            adShowBottomSheetWithWrap(
                              context: context,
                              childWidget: CvvNumberInfoScreen(
                                promoCards: widget.paymentMethodViewModel
                                    .paymentFields?.promoCards,
                              ),
                              headerTitle: '',
                            ),
                          },
                        ),
                      ),
                      onChangeImpl: (value) => updateStateForCvv(value),
                      controller:
                          widget.paymentMethodViewModel.cardCvvController,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(cardCvvLength),
                      ],
                      // onSubmitted: (value) =>
                      //     FocusScope.of(context).nextFocus(),
                      errorText: errorForCvv,
                      regex: visaCard,
                      validation: (String? value) => validatedForCvv(value),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.k_6,
              ),
              CardTextField(
                mask: false,
                hintText: 'card_owner_name'.localize(context),
                textInputAction: TextInputAction.done,
                focusNode: _nameFocus,
                textInputType: TextInputType.name,
                controller:
                    widget.paymentMethodViewModel.cardOwnerNameController,
                onChangeImpl: (value) => updateStateForName(value),
                inputFormatter: [
                  UpperCaseTextFormatter(),
                  LengthLimitingTextInputFormatter(cardHolderNameLength),
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-z A-Z]'),
                  ),
                ],
                errorText: errorCardHolderName,
                regex: userNameRegex,
                validation: (String? value) =>
                    validatedForCardHolderName(value),
              ),
              // SizedBox(
              //   height: context.k_26,
              // ),
              // Row(
              //   children: [
              //     // checkbox
              //     SizedBox(
              //       height: context.k_20,
              //       width: context.k_20,
              //       child: Checkbox(
              //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //         value: _cardViewModel.cardSaved,
              //         checkColor: context.adColors.whiteTextColor,
              //         fillColor: MaterialStateProperty.resolveWith(
              //           getColor,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(context.k_2),
              //         ),
              //         side: BorderSide(
              //           color: context.adColors.greyTextColor,
              //         ),
              //         onChanged: (bool? value) => _cardViewModel
              //             .triggerSaveSelection(value: value ?? true),
              //       ),
              //     ).paddingBySide(right: context.k_16),
              //     Text(
              //       'save_card_prompt_message'.localize(context),
              //       style: ADTextStyle400.size14.setTextColor(
              //         context.adColors.greyTextColor,
              //       ),
              //     ),
              //   ],
              // ).onTap(
              //   () => _cardViewModel.triggerSaveSelection(
              //     value: !_cardViewModel.cardSaved,
              //   ),
              // ),
            ],
          ).paddingBySide(
            top: context.k_12,
            bottom: context.k_14,
          ),
        ),
      ),
    );
  }

  String? validatedForCard(String? value) {
    if (value.isNullOrEmpty) {
      return 'please_enter_valid_card'.localize(context);
    } else if (value?.isNotEmpty ?? false) {
      return returnCardTypeCheck(value ?? '');
    } else {
      return 'please_enter_valid_card'.localize(context);
    }
    // return value.isNullOrEmpty
    //     ? 'please_enter_valid_card'.localize(context)
    //     : null;
  }

  String? validatedForCvv(String? value) {
    return value.isNullOrEmpty
        ? 'please_enter_valid_cvv'.localize(context)
        : returnUpdateStateForCvv(value ?? '');
  }

  String? validatedForExpiry(String? value) {
    return value.isNullOrEmpty
        ? 'please_enter_valid_exp_date'.localize(context)
        : returnExpiryValidation(value ?? '');
  }

  String? validatedForCardHolderName(String? value) {
    return value.isNullOrEmpty
        ? 'please_enter_card_name'.localize(context)
        : returnUpdateStateForName(value ?? '');
  }

  /// this method is use for set colour with check
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.black;
  }

  void cardTypeCheck(String value) {
    final trimmedValue = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    setState(() {
      if (trimmedValue.length > cardNumberCheck) {
        if (RegExp(visaCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Visa';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Visa'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else if (RegExp(masterCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Master';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Master'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else if (RegExp(amexCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Amex';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Amex'] ?? '4');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else if (RegExp(maestroCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Maestro';
          cardCvvLength = int.parse(
            widget.paymentMethodViewModel.cardCVV['Maestro'] ?? '3',
          );
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else if (RegExp(rupayCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Rupay';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Rupay'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else if (RegExp(dinnerCard).firstMatch(trimmedValue) != null) {
          widget.paymentMethodViewModel.cardType = 'Diner';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Rupay'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          callSetState(null);
        } else {
          widget.paymentMethodViewModel.cardType = 'defaultCard';
          cardCvvLength = otherCVVLength;
          widget.paymentMethodViewModel.cardCvvController.text = '';
          widget.paymentMethodViewModel.cardNumberValidate = false;

          callSetState('please_enter_valid_card'.localize(context));
        }
      } else {
        widget.paymentMethodViewModel.cardType = 'defaultCard';
        widget.paymentMethodViewModel.cardCvvController.text = '';
        cardCvvLength = otherCVVLength;
        widget.paymentMethodViewModel.cardNumberValidate = false;
        callSetState('please_enter_valid_card'.localize(context));
      }
    });
    updateState(value);
  }

  String? returnCardTypeCheck(String value) {
    String? returnValue;
    final trimmedValue = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    setState(() {
      if (trimmedValue.length > cardNumberCheck) {
        if (RegExp(visaCard).firstMatch(trimmedValue) != null) {
          if ('Visa' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Visa';

          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Visa'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;
          returnValue = null;
        } else if (RegExp(masterCard).firstMatch(trimmedValue) != null) {
          if ('Master' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Master';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Master'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = null;
        } else if (RegExp(amexCard).firstMatch(trimmedValue) != null) {
          if ('Amex' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Amex';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Amex'] ?? '4');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = null;
        } else if (RegExp(maestroCard).firstMatch(trimmedValue) != null) {
          if ('Maestro' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Maestro';
          cardCvvLength = int.parse(
            widget.paymentMethodViewModel.cardCVV['Maestro'] ?? '3',
          );
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = null;
        } else if (RegExp(rupayCard).firstMatch(trimmedValue) != null) {
          if ('Rupay' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Rupay';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Rupay'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = null;
        } else if (RegExp(dinnerCard).firstMatch(trimmedValue) != null) {
          if ('Diner' != widget.paymentMethodViewModel.cardType) {
            widget.paymentMethodViewModel.cardCvvController.text = '';
          }
          widget.paymentMethodViewModel.cardType = 'Diner';
          cardCvvLength =
              int.parse(widget.paymentMethodViewModel.cardCVV['Rupay'] ?? '3');
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = null;
        } else {
          widget.paymentMethodViewModel.cardType = 'defaultCard';
          cardCvvLength = otherCVVLength;
          // widget.paymentMethodViewModel.cardCvvController.text = '';
          widget.paymentMethodViewModel.cardNumberValidate = true;

          returnValue = 'please_enter_valid_card'.localize(context);
        }
      } else {
        widget.paymentMethodViewModel.cardType = 'defaultCard';
        widget.paymentMethodViewModel.cardCvvController.text = '';
        cardCvvLength = otherCVVLength;
        widget.paymentMethodViewModel.cardNumberValidate = false;
        returnValue = 'please_enter_valid_card'.localize(context);
      }
    });

    updateState(value);
    // if (value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length >= 12 &&
    //     value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length <= 19) {
    //   returnValue = null;
    // }
    //
    if (widget.paymentMethodViewModel.cardType == 'Amex' &&
        value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length == amxCardLength) {
      // final value = FocusScope.of(context).nextFocus();
      // debugPrint(value.toString());
      returnValue = null;
    } else if (widget.paymentMethodViewModel.cardType == 'Diner' &&
        value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length ==
            dinnerCardLength) {
      // final value = FocusScope.of(context).nextFocus();
      // debugPrint(value.toString());
      returnValue = null;
    } else if (widget.paymentMethodViewModel.cardType == 'defaultCard' &&
        value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length >= cardMinLength &&
        value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length <= cardMaxLength) {
      returnValue = null;
    } else if (widget.paymentMethodViewModel.cardType != 'Amex' &&
            widget.paymentMethodViewModel.cardType != 'defaultCard' &&
            widget.paymentMethodViewModel.cardType != 'Diner' &&
            value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length ==
                sixteenCardLength ||
        value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length ==
            nineteenCardLength) {
      // final value = FocusScope.of(context).nextFocus();
      // debugPrint(value.toString());
      returnValue = null;
    } else {
      returnValue = 'please_enter_valid_card'.localize(context);
    }
    return returnValue;
  }

  void callSetExpiry(String? value) {
    setState(() {
      errorForExpiry = value;
    });
  }

  void callSetForName(String? value) {
    setState(() {
      errorCardHolderName = value;
    });
  }

  void callSetCvv(String? value) {
    setState(() {
      errorForCvv = value;
    });
  }

  void callSetState(String? value) {
    setState(() {
      errorValue = value;
    });
  }

  void expiryValidation(String value) {
    const int maxMonth = 12;
    const int yearCurrent = 2;
    final now = DateTime.now();
    final int currentMonth = now.month;
    final int currentYear = now.year;
    final String currentSubYear = currentYear.toString().substring(2, 4);
    final String cardExp =
        widget.paymentMethodViewModel.cardExpiryMonthController.text.toString();

    final int length = cardExp.length;
    if (length > 0) {
      if (length >= cardExpiryLength) {
        callSetExpiry(null);
      } else {
        widget.paymentMethodViewModel.cardExpValidate = false;
        callSetExpiry('invalid_exp_month'.localize(context));
      }
      setState(() {
        if (!cardExp.contains('/')) {
          if (int.parse(cardExp[0]) > 1) {
            widget.paymentMethodViewModel.cardExpiryMonthController.text =
                '0${cardExp[0]}/';
          } else {
            final exp = int.parse(cardExp);
            if (exp < 1 || exp > maxMonth) {
              widget.paymentMethodViewModel.cardExpiryMonthController.text =
                  cardExp[0];
              widget.paymentMethodViewModel.cardExpiryMonthController.text =
                  cardExp[0];
            }
          }
        } else {
          final expYear = cardExp.split('/');
          final String inputYear = expYear[1].toString();
          final String inputMonth = expYear.first.toString();
          final String tempYear1 = inputYear[0];

          if (int.parse(tempYear1) < yearCurrent) {
            widget.paymentMethodViewModel.cardExpValidate = false;

            callSetExpiry('invalid_exp_month'.localize(context));
          } else {
            if (int.parse(inputMonth) < currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              callSetExpiry('invalid_exp_month'.localize(context));
            } else if (int.parse(inputMonth) > currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              callSetExpiry('invalid_exp_month'.localize(context));
            } else if (int.parse(inputMonth) < currentMonth &&
                int.parse(inputYear) <= int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              callSetExpiry('invalid_exp_month'.localize(context));
            } else if (int.parse(inputMonth) == currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              callSetExpiry('invalid_exp_month'.localize(context));
            } else {
              widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
              widget.paymentMethodViewModel.cardExpValidate = true;
              callSetExpiry(null);
              // final value = FocusScope.of(context).nextFocus();
              // debugPrint(value.toString());
            }
          }
        }
      });
      updateState(value);
    }
  }

  String? returnExpiryValidation(String value) {
    const int maxMonth = 12;
    const int yearCurrent = 2;
    final now = DateTime.now();
    final int currentMonth = now.month;
    final int currentYear = now.year;
    final String currentSubYear = currentYear.toString().substring(2, 4);
    final String cardExp =
        widget.paymentMethodViewModel.cardExpiryMonthController.text.toString();

    String? returnValue;

    final int length = cardExp.length;
    if (length > 0) {
      if (length >= cardExpiryLength) {
        callSetExpiry(null);
      } else {
        widget.paymentMethodViewModel.cardExpValidate = false;
        returnValue = 'please_enter_valid_exp_date'.localize(context);
      }
      setState(() {
        if (!cardExp.contains('/')) {
          if (int.parse(cardExp[0]) > 1) {
            widget.paymentMethodViewModel.cardExpiryMonthController.text =
                '0${cardExp[0]}/';
          } else {
            final exp = int.parse(cardExp);
            if (exp < 1 || exp > maxMonth) {
              widget.paymentMethodViewModel.cardExpiryMonthController.text =
                  cardExp[0];
              widget.paymentMethodViewModel.cardExpiryMonthController.text =
                  cardExp[0];
            }
          }
        } else {
          final expYear = cardExp.split('/');
          final String inputYear = expYear[1].toString();
          final String inputMonth = expYear.first.toString();
          final String tempYear1 = inputYear[0];
          final expMonth = int.parse(inputMonth);

          if (int.parse(tempYear1) < yearCurrent) {
            widget.paymentMethodViewModel.cardExpValidate = false;

            returnValue = 'please_enter_valid_exp_date'.localize(context);
          } else {
            if (int.parse(inputMonth) < currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              returnValue = 'please_enter_valid_exp_date'.localize(context);
            } else if (int.parse(inputMonth) > currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              returnValue = 'please_enter_valid_exp_date'.localize(context);
            } else if (int.parse(inputMonth) < currentMonth &&
                int.parse(inputYear) <= int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              returnValue = 'please_enter_valid_exp_date'.localize(context);
            } else if (int.parse(inputMonth) == currentMonth &&
                int.parse(inputYear) < int.parse(currentSubYear)) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              returnValue = 'please_enter_valid_exp_date'.localize(context);
            } else if (expMonth < 1 || expMonth > maxMonth) {
              widget.paymentMethodViewModel.cardExpValidate = false;
              returnValue = 'please_enter_valid_exp_date'.localize(context);
            } else {
              widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
              widget.paymentMethodViewModel.cardExpValidate = true;
              // final value = FocusScope.of(context).nextFocus();
              // debugPrint(value.toString());
              returnValue = null;
            }
          }
        }
      });
      updateState(value);
    }
    return returnValue;
  }

  void updateStateForName(String value) {
    if (value.trim().isEmpty) {
      widget.paymentMethodViewModel.cardOwnerNameController.text = value.trim();
    }
    if (value.isNotEmpty && value.trim().length > cardHolderName) {
      if (RegExp(cardNameValidator).firstMatch(value) != null) {
        widget.paymentMethodViewModel.isSelectedPayment = false;
        widget.paymentMethodViewModel.cardNameValidate = false;
        callSetForName('please_enter_valid_name'.localize(context));
      } else {
        widget.paymentMethodViewModel.isSelectedPayment = true;

        widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
        widget.paymentMethodViewModel.cardNameValidate = true;

        callSetForName(null);
      }
    } else if (RegExp(cardNameValidator).firstMatch(value) != null) {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardNameValidate = false;

      callSetForName('please_enter_valid_name'.localize(context));
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardNameValidate = false;

      callSetForName('please_enter_valid_name'.localize(context));
    }
    updateState(value);
  }

  String? returnUpdateStateForName(String value) {
    String? returnValue;

    if (value.trim().isEmpty) {
      widget.paymentMethodViewModel.cardOwnerNameController.text = value.trim();
    }
    if (value.isNotEmpty && value.trim().length > cardHolderName) {
      if (RegExp(cardNameValidator).firstMatch(value) != null) {
        widget.paymentMethodViewModel.isSelectedPayment = false;
        widget.paymentMethodViewModel.cardNameValidate = false;
        returnValue = 'please_enter_card_name'.localize(context);
      } else {
        widget.paymentMethodViewModel.isSelectedPayment = true;
        widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
        widget.paymentMethodViewModel.cardNameValidate = true;
        returnValue = null;
      }
    } else if (RegExp(cardNameValidator).firstMatch(value) != null) {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardNameValidate = false;
      returnValue = 'please_enter_card_name'.localize(context);
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardNameValidate = false;
      returnValue = 'please_enter_card_name'.localize(context);
    }
    updateState(value);
    return returnValue;
  }

  void updateState(String value) {
    widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
    if (value.isNotEmpty) {
      widget.paymentMethodViewModel.isSelectedPayment = true;
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;
    }
  }

  void updateStateForCvv(String value) {
    widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
    if (value.isNotEmpty && value.length == cardCvvLength) {
      widget.paymentMethodViewModel.cardCvvValidate = true;

      widget.paymentMethodViewModel.isSelectedPayment = true;
      callSetCvv(null);
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardCvvValidate = false;

      callSetCvv('please_enter_valid_cvv'.localize(context));
    }
    updateState(value);
  }

  String? returnUpdateStateForCvv(String value) {
    String? returnValue;
    widget.paymentMethodViewModel.cardOptionUpdate(widget.cardOption);
    if (value.isNotEmpty && value.length == cardCvvLength) {
      widget.paymentMethodViewModel.cardCvvValidate = true;
      widget.paymentMethodViewModel.isSelectedPayment = true;
      // if (widget.paymentMethodViewModel.cardOwnerNameController.text.isEmpty) {
      //   FocusScope.of(context).requestFocus(_nameFocus);
      // }
      returnValue = null;
    } else {
      widget.paymentMethodViewModel.isSelectedPayment = false;
      widget.paymentMethodViewModel.cardCvvValidate = false;

      returnValue = 'please_enter_valid_cvv'.localize(context);
    }
    updateState(value);
    return returnValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

// List of accpeted payment services, to be shown when adding a credit/debit card.
class AcceptedPayments extends StatelessWidget {
  final List<String> ccOptionsList;

  const AcceptedPayments({
    Key? key,
    required this.ccOptionsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ccOptionsList
          .map(
            (url) => SvgPicture.network(
              url,
              height: context.k_12,
            ).paddingBySide(
              right: context.k_12,
            ),
          )
          .toList(),
    );
  }
}
