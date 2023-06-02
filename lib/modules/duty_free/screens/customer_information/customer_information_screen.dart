/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/shopping_cart_data_to_pass_for_payment.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/flight_search_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/cancellation_date_change_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/cart_details_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/duty_free_allowances_section.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/price_details_section_duty_free.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_time_slot/duty_free_time_slot_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/ad_duty_free_shopping_cart_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_pre_order_price_info.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart'
    as flight_constant;
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const Color errorColor = Color(0xffef645a);

const maxCount = 30;

/// This class is used to represent CustomerInformation while checkout from cart
/// it will capture basic customer information related flight and passport
class CustomerInformationScreen extends StatefulWidget {
  //data that we need to show from duty free
  // final DealProductModel? item;

  //data that we need to show from shopping cart
  final ShoppingCartDataToPassForPayment? shoppingCartDataToPassForPayment;

  // coupon value if applied
  // final int? couponValue;

  //calling class type
  final InvokeClassType classType;

  final CustomerInfoArguments? aguments;
  static const int maxHour = 6;

  const CustomerInformationScreen({
    Key? key,
    // this.item,
    required this.aguments,
    // this.couponValue,
    required this.classType,
    this.shoppingCartDataToPassForPayment,
  }) : super(key: key);

  @override
  _CustomerInformationScreenState createState() =>
      _CustomerInformationScreenState();
}

class _CustomerInformationScreenState extends State<CustomerInformationScreen> {
  bool isCustomerInfoPageTermsAndConditionRead = false;

  String errorMessageForPassportName = '',
      errorMessageForPassportNumber = '',
      errorMessageForNationality = '',
      errorMessageForAssistanceCode = '',
      errorMessageForPhoneNumber = '',
      errorMessageForPassportExpiry = '',
      errorMessageForPickUpDateAndTime = '',
      errorMessageForPickUpTime = '',
      errorMessageForDateOfBirth = '',
      errorMessageForEmailId = '',
      errorMessageForCountryCodeNumber = '',
      errorMessageForFlightNumber = '';
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    ScreenEvents.customer_information_screen.log();
    super.initState();
    context.read<DutyFreeState>().resetCustomerInfo();
    flag.value = context.read<SiteCoreStateManagement>().getFlag();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isValidateAll();
    });
    context.read<DutyFreeState>().isCheckSelected = false;
    // this has to be removed before commit
  }

  @override
  void dispose() {
    super.dispose();
    updatingPassengerDetails.dispose();
  }

  // static const showSaveMyDetails = false;
  // static const showBuyingForMySelf = true;
  final double topPaddingOfCartDetailWidget = 52.sp;
  final double k_54 = 54.sp;
  final double dropDownWidth = 170.sp;

  // List<ScreenStatus> screenStatus = [];

  ///Vaibhav
  static const mobileTextLength = 15;
  static const emailAddressLength = 600;
  static const assistanceCodeMaxLength = 7;
  static const assistanceCodeMinLength = 3;
  static const passportTextLength = 54;
  static const passportNumberLength = 15;
  GlobalKey numberKey = GlobalKey();
  GlobalKey nameOnPassportKey = GlobalKey();
  GlobalKey birthDateKey = GlobalKey();
  GlobalKey passportNumberKey = GlobalKey();
  GlobalKey expiryDateKey = GlobalKey();
  GlobalKey emailIdKey = GlobalKey();
  GlobalKey assistanceKey = GlobalKey();
  GlobalKey pickUpDateKey = GlobalKey();
  GlobalKey pickUpTimeKey = GlobalKey();
  GlobalKey flightNumberKey = GlobalKey();
  GlobalKey nationalityKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  static const tcHeight = 59;
  static const colorTc = Color(0xfff2f3f4);
  static const buttonHeight = 120;

  final ValueNotifier<bool> _isSubmitButtonActive = ValueNotifier(false);
  ValueNotifier<String> flag = ValueNotifier(
    '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png',
  );
  ValueNotifier<bool> updatingPassengerDetails = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    // final double bottomNavigationBarHeight = 54.sp;
    // const int timelineLength = 3;
    // const mobileNumberLength = 10;
    // createStepperList();
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'details'.localize(context),
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.neutralInfoMsg),
            ),
            Text(
              'step_2/3'.localize(context).toUpperCase(),
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(right: context.k_16),
          ],
        ),
      ),

      /// this will be return stepper
      /// which location event will occur

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    controller: controller,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.k_20),
                            Text(
                              'please_fill_the_details_as_per_your_passport_message'
                                  .localize(context),
                              style: ADTextStyle400.size14.copyWith(
                                color: context.adColors.neutralInfoMsg,
                              ),
                            ),
                            SizedBox(height: context.k_30),
                            Text(
                              'personalInformation'.localize(context),
                              style: ADTextStyle700.size16.copyWith(
                                color: context.adColors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: context.k_20),
                            ValidatedTextField(
                              key: numberKey,
                              notifyParent: refreshAndValidate,
                              type: 'mobileNo'.localize(context),
                              controller: context
                                  .read<DutyFreeState>()
                                  .phoneNumberController,
                              textLength: mobileTextLength,
                              keyboardType: TextInputType.number,
                              validation: Validations.validateMobile,
                              // key: const Key(
                              //   LoginAutomationKeys.mobiledKey,
                              // ),
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              prefixWidget: DropDownGeneric(
                                //  widthOfDropDown: dropDownWidth,
                                type: 'countryCode'.localize(context),
                                isForCountyCode: true,
                                showDivider: true,
                                onTap: () => showBottomSheetDialog(
                                  BottomSheetType.fromCountryCode,
                                ),
                                controller: context
                                    .read<DutyFreeState>()
                                    .countryCodeController,
                                prefixIconUrl: flag,
                              ),
                            ),
                            ADSizedBox(height: context.k_18),
                            ValidatedTextField(
                              key: nameOnPassportKey,
                              notifyParent: refreshAndValidate,
                              type: 'name_on_passport'.localize(context),
                              controller: context
                                  .read<DutyFreeState>()
                                  .nameOnPassportController,
                              textInputAction: TextInputAction.done,
                              textLength: passportTextLength,
                              validation: Validations.validatePassportName,
                              formatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z ]*'),
                                ),
                              ],
                              // key: const Key(
                              //   LoginAutomationKeys.mobiledKey,
                              // ),
                            ),
                            ADSizedBox(height: context.k_18),
                            editFormOfDateOfBirth(),
                            ADSizedBox(height: context.k_18),
                            ValidatedTextField(
                              key: emailIdKey,
                              notifyParent: refreshAndValidate,
                              type: 'email_id_capital'.localize(context),
                              controller: context
                                  .read<DutyFreeState>()
                                  .emailIdController,
                              textLength: emailAddressLength,
                              maxLine: 1,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              validation: Validations.validateEmail,
                              // key: const Key(
                              //   LoginAutomationKeys.mobiledKey,
                              // ),
                            ),
                            ADSizedBox(height: context.k_18),
                            editFormOfNationality(),
                            ADSizedBox(height: context.k_18),
                            ValidatedTextField(
                              notifyParent: refreshAndValidate,
                              type: 'passportNumber'.localize(context),
                              textLength: passportNumberLength,
                              controller: context
                                  .read<DutyFreeState>()
                                  .passportNumberController,
                              validation: Validations.validatePassportNumber,
                              textInputAction: TextInputAction.done,
                              key: passportNumberKey,
                              formatters: [
                                FilteringTextInputFormatter.deny(
                                  RegExp('[^a-zA-Z0-9 ]*'),
                                ),
                              ],
                            ),
                            ADSizedBox(height: context.k_18),
                            passportExpireDate(),
                            ADSizedBox(height: context.k_40),
                            Text(
                              'travel_Information'.localize(context),
                              style: ADTextStyle700.size16.copyWith(
                                color: context.adColors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            // ADSizedBox(height: context.k_20),
                            SizedBox(height: context.k_20),
                            editFormOfPickUpDate(),
                            ADSizedBox(height: context.k_18),
                            editFormOfTime(),
                            ADSizedBox(height: context.k_18),
                            editFormOfFlightNumber(),
                            ADSizedBox(height: context.k_20),
                            Selector<DutyFreeState, bool>(
                              selector: (context, model) =>
                                  model.isCheckSelected,
                              builder: (context, value, child) => Row(
                                children: [
                                  ADSizedBox(
                                    width: context.k_20,
                                    height: context.k_20,
                                    child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      side: const BorderSide(
                                        color: Color(0xffb2b2b2),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(context.k_4),
                                      ),
                                      checkColor:
                                          context.adColors.whiteTextColor,
                                      activeColor: context.adColors.black,
                                      value: dutyFreeState.isCheckSelected,
                                      onChanged: (_) => {
                                        dutyFreeState.toggleIsSelected(),
                                      },
                                    ),
                                  ),
                                  ADSizedBox(
                                    width: context.k_8,
                                  ),
                                  Text(
                                    '${'got_assistance'.localize(context)}?',
                                    style: ADTextStyle400.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Selector<DutyFreeState, bool>(
                              selector: (context, model) =>
                                  model.isCheckSelected,
                              builder: (context, value, child) => dutyFreeState
                                      .isCheckSelected
                                  ? ValidatedTextField(
                                      key: assistanceKey,
                                      notifyParent: refreshAndValidate,
                                      type: 'assistance_code'.localize(context),
                                      controller: context
                                          .read<DutyFreeState>()
                                          .assistanceCodeController,
                                      textLength: assistanceCodeMaxLength,
                                      maxLine: 1,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.name,
                                      validation: (
                                        String? value,
                                        BuildContext context,
                                      ) =>
                                          Validations.validateAssistanceCode(
                                        value,
                                        context,
                                        context
                                            .read<DutyFreeState>()
                                            .assistanceCodeController,
                                      ),
                                      formatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]*'),
                                        ),
                                      ],
                                    ).paddingBySide(
                                      top: context.k_20,
                                    )
                                  : Container(),
                            ),
                            ADSizedBox(height: context.k_28),
                            Container(
                              padding: const EdgeInsets.symmetric(),
                              height: tcHeight.sp,
                              decoration: BoxDecoration(
                                color: colorTc,
                                borderRadius:
                                    BorderRadius.circular(context.k_8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'duty_free_tnc'.localize(context),
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    //onTap: (value) => termsConditionOnTap(value),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        navigateToScreenUsingNamedRouteWithArguments(
                                      context,
                                      webViewContainer,
                                      argumentObject: WebViewModel(
                                        title: 'terms_and_condition'
                                            .localize(context),
                                        url:
                                            '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsDutyfree}',
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      padding:
                                          EdgeInsets.only(left: context.k_2),
                                      // minimumSize: Size(50, 30),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'T_C'.localize(context),
                                          style: ADTextStyle600.size14
                                              .setTextColor(
                                                context.adColors.blackTextColor,
                                              )
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        Text(
                                          '.',
                                          style: ADTextStyle600.size14
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ).paddingBySide(
                                left: context.k_20,
                                right: context.k_20,
                              ),
                            ),
                            ADSizedBox(height: context.k_18),
                            DutyfreeAllowancesSection(
                              policiesList: context
                                  .read<DutyFreeOrderState>()
                                  .importantInformationPolicyList,
                            ),
                          ],
                        ).paddingBySide(
                          left: context.k_20,
                          right: context.k_20,
                          // bottom: context.k_14,
                        ),
                        CancellationDateChangeView(
                          policiesList: context
                              .read<DutyFreeOrderState>()
                              .cancellationPolicyList,
                        ),
                        // Container(
                        //   height: 69.sp,
                        //   decoration: BoxDecoration(
                        //     border: Border(
                        //       top: BorderSide(
                        //         width: context.k_8,
                        //         color: context.adColors.cardBackgroundColor,),
                        //       bottom: BorderSide(
                        //         width: context.k_8,
                        //         color: context.adColors.cardBackgroundColor,),
                        //     ),
                        //   ),
                        //   margin: EdgeInsets.only(bottom: context.k_34),
                        //   child: InkWell(
                        //     onTap: () => _cancellationAndDateChangePloicies(context),
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Text(
                        //             'Cancellation & Date Change Policy',
                        //             style: ADTextStyle600.size16.setTextColor(
                        //               context.adColors.neutralInfoMsg,
                        //             ),
                        //           ).paddingBySide(left: context.k_20),
                        //         ),
                        //         // Spacer(),
                        //         SvgPicture.asset(
                        //           SvgAssets.arrowRight,
                        //           width: context.k_14,
                        //           height: context.k_14,
                        //           color: context.adColors.greyTextColor,
                        //         ),
                        //         ADSizedBox(
                        //           width: context.k_20,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Column(
                          children: [
                            ADSizedBox(height: context.k_18),
                            const CartDetailsList(isBottomSheet: false),
                            ADSizedBox(height: context.k_48),
                            Selector<DutyFreeState, num?>(
                              selector: (p0, p1) => p1.dutyFreeCartResponse
                                  ?.preOrderDiscount?.amount,
                              builder: (context, value, child) =>
                                  PriceDetailsSectionDutyFree(
                                shakeKey: shakeKey,
                                totalPrice: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.unitPriceResponse
                                            ?.amount ??
                                        0)
                                    .toDouble(),
                                discountPrice: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.discountPrice
                                            ?.amount ??
                                        0)
                                    .toDouble(),
                                preOrderDiscount: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.preOrderDiscount
                                            ?.amount ??
                                        0)
                                    .toDouble(),
                                totalAmount: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.finalAmount
                                            ?.amount ??
                                        0)
                                    .toDouble(),
                                couponDiscount: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.promoCoupon
                                            ?.offerValue ??
                                        0)
                                    .toDouble(),
                                percentageDiscount: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.preOrderDiscount
                                            ?.percentageDiscount ??
                                        0)
                                    .toInt(),
                                showInfoIcon: (context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.preOrderDiscountBreakup
                                            .length ??
                                        0) >
                                    0,
                                tapInfoIcon: () => adShowBottomSheet(
                                  childWidget: DutyFreePreOrderPriceInfo(
                                    preOrderDiscountBreakupList: context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.preOrderDiscountBreakup ??
                                        [],
                                  ),
                                  context: context,
                                  headerTitle: 'pre_order_discount_breakup'
                                      .localize(context),
                                ),
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          left: context.k_20,
                          right: context.k_20,
                          bottom: context.k_14,
                        ),

                        LoyaltyPointsComponent(
                          points: context
                                  .read<DutyFreeState>()
                                  .dutyFreeCartResponse
                                  ?.loyaltyPotentialPoint ??
                              0,
                          bottomMargin: context.k_20,
                        ).paddingBySide(
                          left: context.k_20,
                          right: context.k_20,
                        ),
                        // Divider(
                        //   thickness: context.k_8,
                        //   color: context.adColors.containerGreyBg,
                        // ).paddingBySide(
                        //   top: context.k_20,
                        // ),
                        // Row(
                        //   children: [
                        //     // CheckBoxWidget(
                        //     //   label: 'terms_and_condition_content'.localize(context),
                        //     //   style: ADTextStyle400.size14
                        //     //       .setTextColor(context.adColors.blackTextColor),
                        //     //   onTap: (value) => termsConditionOnTap(value),
                        //     // ),
                        //     TextButton(
                        //       onPressed: () =>
                        //           navigateToScreenUsingNamedRouteWithArguments(
                        //         context,
                        //         webViewContainer,
                        //         argumentObject: WebViewModel(
                        //           title: 'terms_and_condition'.localize(context),
                        //           url:
                        //               '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsDutyfree}',
                        //         ),
                        //       ),
                        //       style: TextButton.styleFrom(
                        //         padding: EdgeInsets.only(left: context.k_2),
                        //         // minimumSize: Size(50, 30),
                        //         alignment: Alignment.centerLeft,
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Text(
                        //             'T_C'.localize(context),
                        //             style: ADTextStyle600.size14
                        //                 .setTextColor(
                        //                   context.adColors.blackTextColor,
                        //                 )
                        //                 .copyWith(
                        //                   decoration: TextDecoration.underline,
                        //                 ),
                        //           ),
                        //           Text(
                        //             '.',
                        //             style: ADTextStyle600.size14.setTextColor(
                        //               context.adColors.blackTextColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ).paddingBySide(
                        //   left: context.k_20,
                        //   right: context.k_20,
                        // ),
                        // ADSizedBox(height: context.k_20),
                        // ValueListenableBuilder(
                        //   valueListenable: _isSubmitButtonActive,
                        //   builder: (context, bool value, child) => ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       primary: context.adColors.blueColor,
                        //       minimumSize:
                        //           Size(double.infinity, bottomNavigationBarHeight),
                        //       shape: const StadiumBorder(),
                        //     ),
                        //     onPressed: () => _submit(),
                        //       child: ValueListenableBuilder(
                        //         builder: (
                        //           BuildContext context,
                        //           bool value,
                        //           Widget? child,
                        //         ) =>
                        //             value
                        //                 ? ADDotProgressView(
                        //                     color: context.adColors.whiteTextColor,
                        //                   )
                        //                 : Text(
                        //                     'saveAndContinue'.localize(context),
                        //                     style: ADTextStyle700.size18.setTextColor(
                        //                       context.adColors.whiteTextColor,
                        //                     ),
                        //                   ),
                        //         valueListenable: context
                        //             .read<DutyFreeState>()
                        //             .updatingPassengerDetails,
                        //       ),
                        //     ),
                        //   ).paddingBySide(
                        //     left: context.k_20,
                        //     right: context.k_20,
                        //   ),
                        //   ADSizedBox(height: context.k_20),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(height: 1, thickness: 1),
                    Container(
                      color: context.adColors.whiteTextColor,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: context.k_16,
                          vertical: context.k_8,
                        ),
                        title: GestureDetector(
                          onTap: () => scrollToDown(shakeKey),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer<DutyFreeState>(
                                builder: (context, value, child) => Text(
                                  FlightUtils.getPriceFormatWithSymbol(
                                    price: context
                                            .read<DutyFreeState>()
                                            .dutyFreeCartResponse
                                            ?.finalAmount
                                            ?.amount
                                            .toDouble() ??
                                        0,
                                  ),
                                  style: ADTextStyle700.size24,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_2,
                              ),
                              Text(
                                'viewDetails'.localize(context),
                                style: ADTextStyle400.size12.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  context.k_28,
                                ),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide.none,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              context.adColors.blueColor,
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: context.k_30,
                                vertical: context.k_16,
                              ),
                            ),
                          ),
                          // onPressed: () => navigateToTravellersDetailsScreen(
                          //   context,
                          //   flightObjForGA,
                          // ),
                          onPressed: () => updatingPassengerDetails.value
                              ? adLog('disabled')
                              : _submit(),
                          child: ValueListenableBuilder(
                            valueListenable: updatingPassengerDetails,
                            builder: (
                              BuildContext context,
                              bool value,
                              Widget? child,
                            ) =>
                                value
                                    ? Container(
                                        width: buttonHeight.sp,
                                        height: double.infinity,
                                        child: ADDotProgressView(
                                          color:
                                              context.adColors.whiteTextColor,
                                        ),
                                      )
                                    : (child ?? const ADSizedBox.shrink()),
                            child: Text(
                              'proceed_to_pay'.localize(context),
                              style: ADTextStyle700.size16.copyWith(
                                color: context.adColors.whiteTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: ElevatedButton(
      //   style: ElevatedButton.styleFrom(
      //     primary: context.adColors.blueColor,
      //     minimumSize: Size(double.infinity, bottomNavigationBarHeight),
      //     shape: const StadiumBorder(),
      //   ),
      //   onPressed: isValidateAll()
      //       ? () => {
      //             setState(() {
      //               _submit();
      //             }),
      //           }
      //       : null,
      //   child: Text(
      //     'saveAndContinue'.localize(context),
      //     style: ADTextStyle700.size18
      //         .setTextColor(context.adColors.whiteTextColor),
      //   ),
      // ).paddingBySide(
      //   top: context.k_20,
      //   bottom: context.k_20,
      //   left: context.k_16,
      //   right: context.k_16,
      // ),
    );
  }

  void scrollToDown(GlobalKey<ShakeWidgetState>? shakeKeyReview) {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      shakeKeyReview?.currentState?.shake();
    } else {
      controller.animateTo(
        controller.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  // /// this will be return widget of country list and country code list
  // void showBottomSheetDialogFlag(
  //     BottomSheetType type,
  //     ) {
  //   CountryCodeBottomSheet(
  //     context: context,
  //     type: type,
  //   ).openCountryCodeBottomSheet((value) {
  //     final CountryCodeData countryCodeData = value;
  //     context.read<DutyFreeState>().countryNameController.text =
  //         countryCodeData.name ?? '';
  //     context.read<DutyFreeState>().countryCodeController.text =
  //     type == BottomSheetType.fromCountryName
  //         ? countryCodeData.countryCode ?? ''
  //         : countryCodeData.callingCode ?? '';
  //   });
  // }

  void termsConditionOnTap(value) {
    isCustomerInfoPageTermsAndConditionRead = value;
    isValidateAll();
  }

  /// this will be return widget of country list and country code list
  void showBottomSheetDialog(
    BottomSheetType type,
  ) {
    // productTap(context);
    // return;

    CountryCodeBottomSheet(
      context: context,
      type: type,
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData, type);
    });

    /*  DutyFreeNationalityList(
      context: context,
      type: type,
    ).openCountryCodeBottomSheet((value) {
      final CountryCodeData countryCodeData = value;
      onTapCountryCodeBottomSheet(countryCodeData, type);
    });*/
  }

  void onTapCountryCodeBottomSheet(
    CountryCodeData value2,
    BottomSheetType type,
  ) {
    // CountryCodesList value2 = value;
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();

    if (type == BottomSheetType.fromCountryName) {
      dutyFreeState.countryNameController.text =
          value2.name.validateWithDefaultValue();
    } else {
      dutyFreeState.phoneNumberController.clear();
      _isSubmitButtonActive.value = false;
      dutyFreeState.countryCodeController.text =
          value2.callingCode?.validateWithDefaultValue() ?? '';
      dutyFreeState.countryCode =
          value2.countryCode.validateWithDefaultValue(defaultValue: 'IND');
      flag.value = value2.flag.validateWithDefaultValue();
    }
  }

  /// refresh and validting
  void refreshAndValidate(isValidate) {
    _isSubmitButtonActive.value = isValidate;
    isValidateAll();
  }

  void isValidateAll() {
    _isSubmitButtonActive.value = context
            .read<DutyFreeState>()
            .nameOnPassportController
            .text
            .isNotEmpty &&
        context.read<DutyFreeState>().countryCodeController.text.isNotEmpty &&
        context.read<DutyFreeState>().countryNameController.text.isNotEmpty &&
        context
            .read<DutyFreeState>()
            .passportNumberController
            .text
            .isNotEmpty &&
        context
            .read<DutyFreeState>()
            .passportExpiryController
            .text
            .isNotEmpty &&
        context.read<DutyFreeState>().phoneNumberController.text.isNotEmpty &&
        context.read<DutyFreeState>().flightNumberController.text.isNotEmpty &&
        context.read<DutyFreeState>().pickupTimeController.text.isNotEmpty &&
        context.read<DutyFreeState>().pickupDateController.text.isNotEmpty &&
        context.read<DutyFreeState>().dateOfBirthController.text.isNotEmpty &&
        context.read<DutyFreeState>().emailIdController.text.isNotEmpty &&
        validateMobile() &&
        validateEmailId() &&
        context.read<DutyFreeState>().assistanceCodeController.text.isNotEmpty;
    // print(
    //   isCustomerInfoPageTermsAndConditionRead,
    // );
  }

  Widget passportExpireDate() {
    return ADEditableText(
      key: expiryDateKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().passportExpiryController,
        type: ADEditableTextType.textButtonTextField,
        readonly: true,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        svgAssets: SvgAssets.calenderIcon,
        onTap: () => _passportExpireDate(context),
        onChange: () => isValidateAll(),
        placeHolder: 'passport_expiry_date'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPassportExpiry.isNotEmpty
            ? Text(
                errorMessageForPassportExpiry,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onClearTextAction: () => adLog('onClearTextAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFormOfPickUpDate() {
    return ADEditableText(
      key: pickUpDateKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().pickupDateController,
        type: ADEditableTextType.textButtonTextField,
        readonly: true,
        enable: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        svgAssets: SvgAssets.calenderIcon,
        onTap: () => _pickUpDate(context),
        onChange: () => isValidateAll(),
        placeHolder: 'pickup_date'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPickUpDateAndTime.isNotEmpty
            ? Text(
                errorMessageForPickUpDateAndTime,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onClearTextAction: () => adLog('onClearTextAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFormOfTime() {
    return ADEditableText(
      key: pickUpTimeKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().pickupTimeController,
        type: ADEditableTextType.textButtonTextField,
        readonly: true,
        enable: false,
        svgAssets: SvgAssets.clock,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        onTap: () => _pickUpTime(context),
        onChange: () => isValidateAll(),
        placeHolder: 'pickup_time'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPickUpTime.isNotEmpty
            ? Text(
                errorMessageForPickUpTime,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onClearTextAction: () => adLog('onClearTextAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFormOfDateOfBirth() {
    return ADEditableText(
      key: birthDateKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().dateOfBirthController,
        type: ADEditableTextType.textButtonTextField,
        svgAssets: SvgAssets.calenderIcon,
        readonly: true,
        enable: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        onTap: () => _pickDateOfBirth(context),
        onChange: () => isValidateAll(),
        placeHolder: 'date_of_birth'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForDateOfBirth.isNotEmpty
            ? Text(
                errorMessageForDateOfBirth,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onClearTextAction: () => adLog('onClearTextAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFormOfFlightNumber() {
    return ADEditableText(
      key: flightNumberKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().flightNumberController,
        type: ADEditableTextType.textButtonTextField,
        readonly: true,
        enable: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        icon: Icons.keyboard_arrow_down_outlined,
        onChange: () => isValidateAll(),
        onClearTextAction: () => isValidateAll(),
        placeHolder: 'select_flight'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForFlightNumber.isNotEmpty
            ? Text(
                errorMessageForFlightNumber,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => openFlightSelectionBottomSheet(),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  void openFlightSelectionBottomSheet() {
    if (context.read<DutyFreeState>().pickUpDate != null &&
        context.read<DutyFreeState>().pickupTimeController.text != '' &&
        context.read<DutyFreeState>().pickupTimeController.text.isNotEmpty) {
      final showBottomSheetDialog = BottomSheetUtils.showBottomSheetDialog(
        context,
        ADDraggableScrollableBottomSheet(
          initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
          childWidget: FlightSearchList(
            callback: (value) => {
              setState(() {
                errorMessageForFlightNumber = '';
                context.read<DutyFreeState>().flightStatusSegment = value;
                context.read<DutyFreeState>().flightNumberController.text =
                    context
                            .read<DutyFreeState>()
                            .flightStatusSegment
                            ?.flightnumber ??
                        '';
                isValidateAll();
              }),
            },
          ),
        ),
      );

      /// To avoid commit error
      adLog(showBottomSheetDialog.toString());
    } else {
      setState(() {
        if (context.read<DutyFreeState>().pickUpDate == null) {
          errorMessageForPickUpDateAndTime =
              'error_select_pick_up_date'.localize(context);
        } else {
          errorMessageForPickUpTime =
              'error_select_pick_up_time'.localize(context);
        }
      });
    }
  }

  Widget editFromOfPassportNumber() {
    return ADEditableText(
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().passportNumberController,
        type: ADEditableTextType.dutyFreeDefaultTextField,
        readonly: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        textInputAction: TextInputAction.next,
        onChange: () => isValidateAll(),
        onClearTextAction: () => isValidateAll(),
        placeHolder: 'passport_number'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPassportNumber.isNotEmpty
            ? Text(
                errorMessageForPassportNumber,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => adLog('onTap'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  /// this widget will return of Nationality
  /// where user set data for Nationality

  Widget editFormOfNationality() {
    return ADEditableText(
      key: nationalityKey,
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().countryNameController,
        type: ADEditableTextType.textButtonTextField,
        icon: Icons.keyboard_arrow_down_outlined,
        readonly: true,
        enable: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        onChange: () => isValidateAll(),
        onTap: () => adShowBottomSheet(
          context: context,
          childWidget: ADCountryCodeBottomSheet(
            selectedCountry:
                context.read<DutyFreeState>().countryNameController.text,
            onTap: (value) => setCountryName(value),
            countryListCodes: context.read<SiteCoreStateManagement>().country,
          ),
          headerTitle: 'nationality'.localize(context),
        ),
        placeHolder: 'nationality'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForNationality.isNotEmpty
            ? Text(
                errorMessageForNationality,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onClearTextAction: () => adLog('onClearTextAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  void setCountryName(site_core.Country country) {
    setState(() {
      errorMessageForNationality = '';
      context.read<DutyFreeState>().countryCode = country.isO2;
      context.read<DutyFreeState>().countryNameController.text =
          country.countryName;
    });
  }

  /// this widget will return of countryCode
  /// where user set data for countryCode

  Widget editFormOfPhoneNumber() {
    const mobileNumberLength = 10;
    return ADEditableText(
      componentData: ADEditableTextModel(
        controller: context.read<DutyFreeState>().phoneNumberController,
        type: ADEditableTextType.dutyFreeDefaultTextField,
        readonly: false,
        style:
            ADTextStyle500.size16.setTextColor(context.adColors.blackTextColor),
        keyBoardType: TextInputType.number,
        length: mobileNumberLength,
        onChange: () => isValidateAll(),
        onClearTextAction: () => isValidateAll(),
        placeHolder: 'mobileNumber'.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPhoneNumber.isNotEmpty
            ? Text(
                errorMessageForPhoneNumber,
                style: const TextStyle(color: errorColor),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => adLog('onTap'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  /// this method will be return of validation phoneNumber
  /// validate value according to regex

  /// this method will be return of validation passport
  /// validate value according to regex

  Future<void> _pickUpDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime todayDate = DateTime(
      now.year,
      now.month,
      now.day,
      now.minute > 0 ? now.hour : now.hour + 1,
      now.minute > 0 ? now.minute + 30 : 0,
    );
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final DateTime expiryDate =
        dutyFreeState.passportExpiryDate ?? DateTime.now();
    if (dutyFreeState.passportExpiryController.text.isEmpty) {
      setState(() {
        errorMessageForPassportExpiry =
            'please_select_passport_expiry_date'.localize(context);
      });
      return;
    } else if (expiryDate.isBefore(now)) {
      setState(() {
        errorMessageForPassportExpiry =
            'your_passport_date_is_expired'.localize(context);
      });
      return;
    }

    // final int differenceInYears =
    //     ((dutyFreeState.passportExpiryDate ?? DateTime.now())
    //                 .difference(DateTime.now())
    //                 .inDays /
    //             365)
    //         .floor();
    // // final int differenceInDays =
    // //     (dutyFreeState.passportExpiryDate ?? DateTime.now())
    // //         .difference(DateTime.now())
    // //         .inDays;

    // adLog('===============> $differenceInYears');
    final DateTime passportExpiryDate = dutyFreeState.passportExpiryDate ??
        DateTime(now.year, now.month, now.day + 1);
    final initialDate =
        (dutyFreeState.pickUpDate ?? todayDate).isBefore(todayDate)
            ? todayDate
            : (dutyFreeState.pickUpDate ?? todayDate);
    final selectedDate = await _selectDate(
      context,
      initialDate,
      todayDate,
      returnPickupDateBefore30DaysAfterAndPassportExpiry(
        passportExpiryDate,
      ),
    );

    // selectedDate = differenceInYears >= 1
    //     ? await _selectDate(
    //           context,
    //           dutyFreeState.pickUpDate ?? todayDate,
    //           todayDate,
    //           DateTime(now.year + 1, now.month, now.day),
    //         ) ??
    //         now
    //     : await _selectDate(
    //           context,
    //           dutyFreeState.pickUpDate ?? todayDate,
    //           todayDate,
    //           dutyFreeState.passportExpiryDate ??
    //               DateTime(now.year, now.month, now.day + 1),
    //         ) ??
    //         DateTime.now();

    if (selectedDate != null) {
      setState(() {
        context.read<DutyFreeState>().pickUpDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          DateTime.now().day == selectedDate.day
              ? DateTime.now().hour
              : selectedDate.hour,
          DateTime.now().day == selectedDate.day
              ? DateTime.now().minute
              : selectedDate.minute,
          selectedDate.second,
          selectedDate.millisecond,
          selectedDate.microsecond,
        );
        errorMessageForPickUpDateAndTime = '';
        errorMessageForPickUpTime = '';
        dutyFreeState.pickupDateController.text =
            DateFormat(flight_constant.Constant.dateFormat11)
                .format(selectedDate);
        dutyFreeState.pickupTimeController.clear();
        dutyFreeState.flightNumberController.clear();
      });
    }
  }

  DateTime returnPickupDateBefore30DaysAfterAndPassportExpiry(
    DateTime expiryDate,
  ) {
    const add30Days = 30;
    final tempDate = DateTime.now().add(const Duration(days: add30Days));
    return tempDate.isBefore(expiryDate) ? tempDate : expiryDate;
  }

  Future<void> _passportExpireDate(BuildContext context) async {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final currentDate = DateTime.now();
    final selectedDate = await _selectDate(
      context,
      dutyFreeState.passportExpiryDate ??
          currentDate.add(
            const Duration(days: 1),
          ),
      currentDate.add(
        const Duration(days: 1),
      ),
      DateTime(
        currentDate.year + 10,
        currentDate.month,
        currentDate.day,
        currentDate.hour,
        currentDate.minute,
        currentDate.second,
      ),
    );

    if (selectedDate != null) {
      setState(() {
        context.read<DutyFreeState>().pickupDateController.text = '';
        context.read<DutyFreeState>().passportExpiryDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          DateTime.now().day == selectedDate.day
              ? DateTime.now().hour
              : selectedDate.hour,
          DateTime.now().day == selectedDate.day
              ? DateTime.now().minute
              : selectedDate.minute,
          selectedDate.second,
          selectedDate.millisecond,
          selectedDate.microsecond,
        );
        errorMessageForPassportExpiry = '';
        context.read<DutyFreeState>().passportExpiryController.text =
            DateFormat(flight_constant.Constant.dateFormat11)
                .format(selectedDate);
      });
    }
    dutyFreeState.pickUpDate = null;
    dutyFreeState.pickupDateController.text = '';
    dutyFreeState.pickupTimeController.text = '';
    dutyFreeState.flightNumberController.text = '';
    errorMessageForPickUpDateAndTime = '';
    isValidateAll();
  }

  Future<void> _pickUpTime(BuildContext context) async {
    const int num23 = 23;
    const int num22 = 22;
    const int num30 = 30;
    setState(() {
      errorMessageForPickUpDateAndTime = '';
    });
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if (dutyFreeState.pickUpDate != null) {
      if (dutyFreeState.pickupDateController.text.isNotEmpty) {
        final DateTime now = DateTime.now();
        final DateTime todayDate = DateTime(
          now.year,
          now.month,
          now.day,
          now.minute > 0 ? now.hour : now.hour + 1,
          now.minute > 0 ? now.minute + 30 : 0,
        );
        final pickUpDate = DateTime(
          dutyFreeState.pickUpDate?.year ?? now.year,
          dutyFreeState.pickUpDate?.month ?? now.month,
          dutyFreeState.pickUpDate?.day ?? now.day,
        );
        if (pickUpDate.isAfter(todayDate)) {
          timeBottomSheet(context, pickUpDate);
        } else {
          if (pickUpDate.day > now.day) {
            timeBottomSheet(context, pickUpDate);
          } else if (todayDate.day == now.day &&
              todayDate.day == pickUpDate.day &&
              (todayDate.hour <= num22 ||
                  todayDate.hour == num23 && todayDate.minute <= num30)) {
            timeBottomSheet(context, todayDate);
          } else {
            setState(() {
              errorMessageForPickUpDateAndTime =
                  'error_select_valid_pick_up_date'.localize(context);
            });
          }
        }
      }
    } else {
      setState(() {
        errorMessageForPickUpDateAndTime =
            'error_select_pick_up_date'.localize(context);
      });
    }
    return;
    // if (dutyFreeState.pickUpDate != null) {
    //   final selectedTime = await _selectedTime(context);
    //   if (selectedTime != null) {
    //     final selectedDateTime = DateTime(
    //       dutyFreeState.pickUpDate?.year ?? 0,
    //       dutyFreeState.pickUpDate?.month ?? 0,
    //       dutyFreeState.pickUpDate?.day ?? 0,
    //       selectedTime.hour,
    //       selectedTime.minute,
    //       dutyFreeState.pickUpDate?.second ?? 0,
    //       dutyFreeState.pickUpDate?.millisecond ?? 0,
    //       dutyFreeState.pickUpDate?.microsecond ?? 0,
    //     );
    //
    //     final time = DateFormat('HH:mm').format(selectedDateTime);
    //     dutyFreeState.pickUpDate = selectedDateTime;
    //     setState(() {
    //       errorMessageForPickUpTime = '';
    //       final startTime = DateTime(
    //         DateTime.now().year,
    //         DateTime.now().month,
    //         DateTime.now().day,
    //         DateTime.now().hour,
    //         DateTime.now().minute,
    //       );
    //       final diffHour = selectedDateTime.difference(startTime).inHours;
    //       final diffDays = selectedDateTime.difference(startTime).inDays;
    //       adLog(diffHour.toString());
    //       adLog(diffDays.toString());
    //       if (diffHour >= CustomerInformationScreen.maxHour || diffDays > 0) {
    //         dutyFreeState.pickupTimeController.text = time;
    //       } else {
    //         setState(() {
    //           dutyFreeState.pickupTimeController.text = '';
    //           errorMessageForPickUpTime =
    //               'error_invalid_time'.localize(context);
    //         });
    //       }
    //       context.read<DutyFreeState>().flightNumberController.text = '';
    //     });
    //   }
    // } else {
    //   setState(() {
    //     dutyFreeState.pickupTimeController.text = '';
    //     errorMessageForPickUpDateAndTime =
    //         'error_select_pick_up_date'.localize(context);
    //   });
    // }
  }

  Future<void> _pickDateOfBirth(BuildContext context) async {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final DateTime now = DateTime.now();
    final int airportAge = Utils.getAirportAge(
      adaniAirportsList:
          context.read<SiteCoreStateManagement>().adaniAirportsList,
      airportCode:
          context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode ?? '',
    );

    final selectedDate = await _selectDate(
      context,
      dutyFreeState.dateOfBirth ??
          DateTime(now.year - airportAge, now.month, now.day),
      DateTime(1900),
      now,
    );
    if (selectedDate != null) {
      setState(() {
        if (Utils.isCartContainLiquorAndDobTessThan25(
          selectedDate,
          dutyFreeState,
          context.read<SiteCoreStateManagement>().adaniAirportsList,
        )) {
          dutyFreeState.dateOfBirthController.text = '';
          dutyFreeState.dateOfBirth = selectedDate;

          errorMessageForDateOfBirth = 'customer_page_below_25_years_error'
              .localize(context)
              .replaceAll('#1', airportAge.toString());
        } else {
          dutyFreeState.dateOfBirthController.text =
              DateFormat(flight_constant.Constant.dateFormat11)
                  .format(selectedDate);
          dutyFreeState.dateOfBirth = selectedDate;
          errorMessageForDateOfBirth = '';
        }
        isValidateAll();
        // dutyFreeState.dateOfBirthController.text = date;
        // dutyFreeState.dateOfBirth = selectedDate;
      });
    }
  }

  /// checking if cart contain liquor and selected age is below 25

  // Future<TimeOfDay?> _selectedTime(BuildContext context) {
  //   final now = DateTime.now();
  //   return showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  //   );
  // }
  /*
  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              secondary: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const ADSizedBox.shrink(),
        ),
      ),
    );
  }
*/
  // Future<DateTime?> _selectDate(
  //   BuildContext context,
  //   DateTime? initialDate,
  //   DateTime firstDate,
  //   DateTime lastDate,
  // ) =>
  //     showDatePicker(
  //       context: context,
  //       initialDate: initialDate ?? DateTime.now(),
  //       firstDate: firstDate,
  //       lastDate: lastDate,
  //     );
  Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime? initialDate,
    DateTime firstDate,
    DateTime lastDate,
  ) =>
      showDatePicker(
        context: context,
        builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              surface: Colors.black,
              secondary: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const ADSizedBox.shrink(),
        ),
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
      );

  /// this method will validate complete data
  /// set error data according to validate

  void validatePassport() {
    if (!validateRegex(
      passportPattern,
      context.read<DutyFreeState>().passportNumberController.text,
    )) {
      setState(() {
        errorMessageForPassportNumber =
            'enter_a_valid_passport'.localize(context);
      });
    } else {
      setState(() {
        errorMessageForPassportNumber = '';
      });
    }
  }

  bool validateMobile() {
    // if (!validateRegex(
    //   phoneNumberPattern2,
    //   context.read<DutyFreeState>().phoneNumberController.text,
    // )) {
    //   errorMessageForPhoneNumber = 'please_enter_valid_phone'.localize(context);
    //   return false;
    // } else {
    //   errorMessageForPhoneNumber = '';
    //   return true;
    // }

    return Validations.validateMobile(
          context.read<DutyFreeState>().phoneNumberController.text,
          context,
        )?.isEmpty ??
        true;
  }

  bool validateExpiryDate() {
    const passportExpiryCount = 5;
    if (context.read<DutyFreeState>().passportExpiryController.text.length <
        passportExpiryCount) {
      errorMessageForPassportExpiry =
          'enter_passport_expiry_date'.localize(context);
      return false;
    } else {
      errorMessageForPassportExpiry = '';
      return true;
    }
  }

  bool validateEmailId() {
    if (!validateRegex(
      Validations.emailRegex,
      context.read<DutyFreeState>().emailIdController.text,
    )) {
      errorMessageForEmailId = 'valid_email_id'.localize(context);
      return false;
    } else {
      errorMessageForEmailId = '';
      return true;
    }
  }

  ///Function to validate passport number
  bool validatePassportNumber() {
    if (!validateRegex(
      Validations.passportNumberRegex,
      context.read<DutyFreeState>().passportNumberController.text,
    )) {
      errorMessageForEmailId = 'enter_a_valid_passport'.localize(context);
      return false;
    } else {
      errorMessageForEmailId = '';
      return true;
    }
  }

  void timeBottomSheet(
    BuildContext context,
    DateTime startTime,
  ) {
    final bottomSheet = BottomSheetUtils.showDraggableBottomSheetDialog(
      context,
      // ReschedulePage(),
      DutyFreeTimeSlotBottomSheet(
        startTime: startTime,
        selectedTime: context.read<DutyFreeState>().pickupTimeController.text,
        gap: 30,
        onTap: (String displayTime) => onTapAction(displayTime),
      ).paddingAllSide(context.k_8),
      'Select Pickup Time',
    );
    adLog(bottomSheet.toString());
  }

  void onTapAction(String displayTime) {
    // adLog(DateFormat.Hm().format(time));
    context.read<DutyFreeState>().pickupTimeController.text =
        Utils.convertTimeToAmPm(displayTime);
    final List<String> initialTime = displayTime.split(' - ');
    context.read<DutyFreeState>().pickupTime = initialTime.first;
    setState(() {
      errorMessageForPickUpTime = '';
      context.read<DutyFreeState>().flightNumberController.clear();
      isValidateAll();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DutyFreeState>().validatePreOrderDiscount(context);
    });
  }

  void _submit() {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    // adLog((validateMobile()).toString());
    // validatePassport();
    // adLog((validateEmailId()).toString());
    setState(() {
      if (dutyFreeState.passportExpiryController.text.isEmpty) {
        errorMessageForPassportExpiry =
            'enter_passport_expiry_date'.localize(context);
      }
      if (dutyFreeState.dateOfBirthController.text.isEmpty) {
        errorMessageForDateOfBirth = 'enter_date_of_birth'.localize(context);
      }
      if (dutyFreeState.passportExpiryController.text.isEmpty) {
        errorMessageForPassportExpiry =
            'enter_passport_expiry_date'.localize(context);
      }
      if (dutyFreeState.pickupDateController.text.isEmpty) {
        errorMessageForPickUpDateAndTime =
            'error_select_pick_up_date'.localize(context);
      }
      if (dutyFreeState.pickupTimeController.text.isEmpty) {
        errorMessageForPickUpTime =
            'error_select_pick_up_time'.localize(context);
      }
      if (dutyFreeState.flightNumberController.text.isEmpty) {
        errorMessageForFlightNumber =
            'error_select_flight_number'.localize(context);
      }
      if (dutyFreeState.countryNameController.text.isEmpty) {
        errorMessageForNationality =
            'please_select_nationality'.localize(context);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      adLog(formKey.currentState?.validate().toString());
    });
    if (!validateMobile()) {
      _moveFocusToErrorField(numberKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.nameOnPassportController.text.isEmpty) {
      _moveFocusToErrorField(nameOnPassportKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.dateOfBirthController.text.isEmpty) {
      _moveFocusToErrorField(birthDateKey.currentContext ?? context);
      return;
    }
    if (!validateEmailId()) {
      _moveFocusToErrorField(emailIdKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.countryNameController.text.isEmpty) {
      _moveFocusToErrorField(nationalityKey.currentContext ?? context);
      return;
    }
    if ((dutyFreeState.isCheckSelected &&
            dutyFreeState.assistanceCodeController.text.isEmpty) ||
        (dutyFreeState.isCheckSelected &&
            dutyFreeState.assistanceCodeController.text.length <
                assistanceCodeMinLength)) {
      _moveFocusToErrorField(assistanceKey.currentContext ?? context);
      return;
    }
    if (!validatePassportNumber()) {
      _moveFocusToErrorField(passportNumberKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.passportExpiryController.text.isEmpty) {
      _moveFocusToErrorField(expiryDateKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.pickupDateController.text.isEmpty) {
      _moveFocusToErrorField(pickUpDateKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.pickupTimeController.text.isEmpty) {
      _moveFocusToErrorField(pickUpTimeKey.currentContext ?? context);
      return;
    }
    if (dutyFreeState.flightNumberController.text.isEmpty) {
      _moveFocusToErrorField(flightNumberKey.currentContext ?? context);
      return;
    }
    updatingPassengerDetails.value = true;
    dutyFreeState.dutyFreeEventState.addDetailsEvent();
    dutyFreeState.updatePassengerDetails().then((value) async {
      final ADResponseState responseState =
          await dutyFreeState.getCartDetails(context);
      //TODO handle response state and handle status of cart API as well
      adLog('responseState ${responseState.toString()}');
      updatingPassengerDetails.value = false;
      if (value.viewStatus == Status.complete) {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          genericPaymentScreen,
          argumentObject: PaymentModule.dutyFree,
        );
      } else {
        context.read<DutyFreeState>().dutyFreeEventState.checkoutFailed(value);
        SnackBarUtil.showSnackBar(
          context,
          value.message.validateWithDefaultValue(),
        );
      }
    }).onError((error, stackTrace) {
      updatingPassengerDetails.value = false;
    });
    // if (validateMobile() && validateEmailId()) {
    //
    // } else {
    //   log('Invalid parameter');
    //   return;
    // }
  }

  void _moveFocusToErrorField(BuildContext context) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

//prepare stepper item
//   void createStepperList() {
//     screenStatus = [
//       ScreenStatus(
//         'cart'.localize(context),
//         '1',
//         ADTimeLineState.done,
//       ),
//       ScreenStatus(
//         'review_details'.localize(context),
//         '2',
//         ADTimeLineState.progress,
//       ),
//       ScreenStatus(
//         'payment'.localize(context),
//         '3',
//         ADTimeLineState.initial,
//       ),
//     ];
//   }
}

//enum for class type, which we need to pass when call CustomerInformation()
enum InvokeClassType { shoppingCart, dutyFree, noStepper }
