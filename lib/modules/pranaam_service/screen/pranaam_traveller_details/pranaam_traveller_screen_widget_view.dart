/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/cancellation_policies/cancellation_policies_model.dart'
    as policies;
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/pranaam_cancellation_policies.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/adult_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/billing_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/contact_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/shopping_cart_list_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double cancelPadding = 32.sp;

class PranaamTravellerScreenWidgetView
    extends WidgetView<PranaamTravellerScreen, PranaamTravellerScreenState> {
  const PranaamTravellerScreenWidgetView(
    PranaamTravellerScreenState state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final double payButtonHeight = 52.sp;
    final double payButtonWidth = 172.sp;
    const Color dividerColor = Color(0xfff8f8f8);

    final bottomNavigationBarButton =
        Selector<PranaamAppDataStateManagement, CartResponse?>(
      selector: (context, viewModel) => viewModel.cartDataResponse,
      builder: (context, cartDataResponse, child) {
        return cartDataResponse != null
            ? SafeArea(
                child: StickyPriceBar(
                  price: FlightUtils.getPriceFormatWithSymbol(
                    price: getCartTotalPrice(
                      cartDataResponse,
                    ),
                  ),
                  customButton: ADSizedBox(
                    width: payButtonWidth,
                    child: ElevatedButton(
                      onPressed: () => state.navigateToPage(),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: context.adColors.blueColor,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_20,
                          vertical: context.k_16,
                        ),
                        shape: const StadiumBorder(),
                        minimumSize: Size(
                          payButtonWidth,
                          payButtonHeight,
                        ),
                      ),
                      child: Selector<PranaamAppDataStateManagement, bool>(
                        selector: (context, model) => model.isProceedToPayClick,
                        builder: (context, value, child) => value
                            ? ADSizedBox(
                                height: context.k_20,
                                child: ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                  size: dotSize,
                                ),
                              )
                            : Text(
                                'proceed_to_pay'.localize(context),
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                  onSubtitleTap: state.scrollDown,
                  subtitleText: 'viewDetails'.localize(context),
                ),
              )
            : const ADSizedBox();
      },
    );
    return GestureDetector(
      onTap: () => state.hideKeyBoard(),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBarButton,
        appBar: AppBar(
          title: Text(
            'guest_details'.localize(context),
            style: ADTextStyle700.size22,
          ),
          elevation: 0,
          actions: [
            Text(
              'step_2/3'.localize(context),
              style: ADTextStyle400.size14,
            ).paddingAllSide(context.k_16),
          ],
        ),
        body: Form(
          key: state.formGlobalKey,
          child: SingleChildScrollView(
            controller: state.myController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'enter_name_mention'.localize(context),
                  style: ADTextStyle400.size16
                      .setTextColor(const Color(0xff555555)),
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: getTotalPassengersByType(
                    state.pranaamAppDataStateManagement?.cartDataResponse,
                    adultPassengerCode,
                  ),
                  itemBuilder: (context, index) {
                    return AdultView(
                      state: state,
                      ageRegex: Validations.pranaamValidateAge,
                      adultHeading: getTotalPassengersByType(
                                state.pranaamAppDataStateManagement
                                    ?.cartDataResponse,
                                adultPassengerCode,
                              ) ==
                              1
                          ? 'Adult 1'
                          : '${'adult'.localize(context)} ${index + 1}',
                      lastNameController:
                          state.adultControllersList[index].lastNameController,
                      genderController:
                          state.adultControllersList[index].titleController,
                      firstNameController:
                          state.adultControllersList[index].firstNameController,
                      countryCodeController: state
                          .adultControllersList[index].countryCodeController,
                      countryController:
                          state.adultControllersList[index].countryController,
                      passportController: state
                          .adultControllersList[index].passportNoController,
                      classController:
                          state.adultControllersList[index].classController,
                      ageController:
                          state.adultControllersList[index].ageController,
                      baggageController: state
                          .adultControllersList[index].baggageCountController,
                      flag: state.adultControllersList[index].flag,
                      controllerIndex: index,
                      isPrimary: index == 0,
                    );
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.only(top: context.k_16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: getTotalPassengersByType(
                    state.pranaamAppDataStateManagement?.cartDataResponse,
                    childPassengerCode,
                  ),
                  itemBuilder: (context, index) {
                    return AdultView(
                      state: state,
                      ageRegex: Validations.validateChildAge,
                      adultHeading: getTotalPassengersByType(
                                state.pranaamAppDataStateManagement
                                    ?.cartDataResponse,
                                childPassengerCode,
                              ) ==
                              1
                          ? 'child'.localize(context)
                          : '${'child'.localize(context)} ${index + 1}',
                      lastNameController: state
                          .childrenControllersList[index].lastNameController,
                      genderController:
                          state.childrenControllersList[index].genderController,
                      firstNameController: state
                          .childrenControllersList[index].firstNameController,
                      ageController:
                          state.childrenControllersList[index].ageController,
                      controllerIndex: index,
                    );
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.only(top: context.k_16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: getTotalPassengersByType(
                    state.pranaamAppDataStateManagement?.cartDataResponse,
                    infantPassengerCode,
                  ),
                  itemBuilder: (context, index) {
                    return AdultView(
                      ageRegex: Validations.validateInfantAge,
                      adultHeading: getTotalPassengersByType(
                                state.pranaamAppDataStateManagement
                                    ?.cartDataResponse,
                                childPassengerCode,
                              ) ==
                              1
                          ? 'infant'.localize(context)
                          : '${'infant'.localize(context)} ${index + 1}',
                      lastNameController:
                          state.infantControllersList[index].lastNameController,
                      genderController:
                          state.infantControllersList[index].genderController,
                      firstNameController: state
                          .infantControllersList[index].firstNameController,
                      ageController:
                          state.infantControllersList[index].ageController,
                      controllerIndex: index,
                      state: state,
                    ).paddingBySide(
                      bottom: index ==
                              getTotalPassengersByType(
                                    state.pranaamAppDataStateManagement
                                        ?.cartDataResponse,
                                    infantPassengerCode,
                                  ) -
                                  1
                          ? context.k_34
                          : 0,
                    );
                  },
                ),
                Divider(
                  thickness: context.k_8,
                  color: dividerColor,
                ).paddingBySide(bottom: context.k_20),
                Text(
                  'contact_details'.localize(context),
                  style: ADTextStyle700.size22
                      .setTextColor(context.adColors.black),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                ContactDetailsView(
                  state: state,
                  gstNumberController: state.gstControllers.gstNumberController,
                  companyNameController:
                      state.gstControllers.companyNameController,
                  mobileController:
                      state.adultControllersList.first.mobileController,
                  addressController: state.billingControllers.addressController,
                  emailController:
                      state.adultControllersList.first.emailController,
                  countryCodeController:
                      state.adultControllersList.first.countryCodeController,
                  flag: state.adultControllersList.first.flag,
                ),
                ValueListenableBuilder(
                  valueListenable: state.useGSTNumber,
                  builder: (_, value, __) {
                    return !state.useGSTNumber.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: context.k_8,
                                color: dividerColor,
                              ).paddingBySide(top: context.k_36),
                              Text(
                                'billing_details'.localize(context),
                                style: ADTextStyle700.size22
                                    .setTextColor(context.adColors.black),
                              ).paddingBySide(
                                left: context.k_16,
                                right: context.k_16,
                                bottom: context.k_20,
                                top: context.k_20,
                              ),
                            ],
                          )
                        : const ADSizedBox.shrink();
                  },
                ),
                BillingDetailsView(
                  state: state,
                  countryController: state.billingControllers.countryController,
                  stateController: state.billingControllers.stateController,
                  cityController: state.billingControllers.cityController,
                  addressController: state.billingControllers.addressController,
                  pincodeController: state.billingControllers.pincodeController,
                ),
                ADSizedBox(
                  height: context.k_16,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(context.k_16),
                    margin: EdgeInsets.all(context.k_16),
                    decoration: BoxDecoration(
                      color: const Color(0xfff2f3f4),
                      borderRadius: BorderRadius.circular(context.k_8),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'pranaam_tnc'.localize(context),
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'termsOfUse'.localize(context),
                            style: ADTextStyle500.size14.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openWebView(
                                  title:
                                      'terms_and_condition'.localize(context),
                                  url:
                                      '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsPranaam}',
                                  context: context,
                                );
                              },
                          ),
                          TextSpan(
                            text: '',
                            style: ADTextStyle400.size14,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openWebView(
                                  title:
                                      'terms_and_condition'.localize(context),
                                  url:
                                      '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsPranaam}',
                                  context: context,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => {
                    openWebView(
                      title: 'terms_and_condition'.localize(context),
                      url:
                          '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditionsPranaam}',
                      context: context,
                    ),
                  },
                ),
                Divider(
                  thickness: context.k_8,
                  color: dividerColor,
                ).paddingBySide(top: context.k_20, bottom: context.k_28),
                const ShoppingCartListView(),
                ADSizedBox(
                  height: context.k_8,
                ),
                Divider(
                  thickness: context.k_8,
                  color: dividerColor,
                ).paddingBySide(top: context.k_20),
                InkWell(
                  onTap: () => {
                    if (!DeBounce.isRedundantClick())
                      {
                        initCancellationPoliciesApi(context),
                      },
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: context.k_20,
                      right: context.k_16,
                      top: context.k_16,
                      bottom: context.k_16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Cancellation Policy',
                          style: ADTextStyle700.size18,
                          overflow: TextOverflow.clip,
                        ),
                        //  const Spacer(),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: context.adColors.black,
                          size: context.k_30,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: context.k_8,
                  color: dividerColor,
                ),
                Selector<PranaamAppDataStateManagement, CartResponse?>(
                  selector: (context, viewModel) => viewModel.cartDataResponse,
                  builder: (context, cartDataResponse, child) {
                    return cartDataResponse != null
                        ? PriceDetailsView(
                            showApplyCoupon: true,
                            addOnsList: cartDataResponse.packageAddOn,
                            promoType: cartDataResponse.packageDetail
                                .pricingInfo.discountCouponDetail.promoType,
                            packageName: cartDataResponse.packageDetail.name,
                            totalMRP: cartDataResponse
                                .packageDetail.pricingInfo.totalBaseFare.amount,
                            cGst: cartDataResponse.totalTax.cgst,
                            sGst: cartDataResponse.totalTax.sgst,
                            totalAmount: getCartTotalPrice(
                              cartDataResponse,
                            ),
                            shakeKey: state.shakeKey,
                            expressFareAmount: cartDataResponse.packageDetail
                                    .pricingInfo.totalExpressFare?.baseFare ??
                                0,
                            addOnsAmount: getAddonsTotalPrice(
                              cartDataResponse,
                            ),
                            discountAmount: cartDataResponse
                                .packageDetail
                                .pricingInfo
                                .discountCouponDetail
                                .couponDiscountAmount,
                          )
                        : const ADSizedBox();
                  },
                ),
                ADSizedBox(
                  width: context.k_24,
                ),
                LoyaltyPointsComponent(
                  points: state.pranaamAppDataStateManagement?.cartDataResponse
                          ?.potentialLoyaltyEarning ??
                      0,
                  bottomMargin: context.k_30,
                  topMargin: context.k_30,
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> initCancellationPoliciesApi(BuildContext context) async {
  final ADResponseState response =
      await SiteCoreStateManagement().fetchCancellationPoliciesFromSiteCore();
  switch (response.viewStatus) {
    case Status.complete:
      //adLog('initCancellationPoliciesApi ${response.data}');
      if (response.data != null) {
        final policies.Element cancellationPolicies = response.data;
        final header = cancellationPolicies.fields.header;
        final rows = cancellationPolicies.fields.rows;
        if (header.isNotEmpty &&
            rows.isNotEmpty &&
            header.length > 1 &&
            rows.length > 1) {
          cancellationPoliciesBottomSheet(context, response.data);
        } else {
          showSnackBar(context);
        }
      } else {
        showSnackBar(context);
      }
      break;
    case Status.error:
      showSnackBar(context);
      break;
    case Status.loading:
      ProcessDialog.showLoadingDialog(context);
      break;
    default:
      break;
  }
}

void showSnackBar(BuildContext context) {
  SnackBarUtil.showSnackBar(
    context,
    'Something went wrong',
  );
}

void cancellationPoliciesBottomSheet(
  BuildContext context,
  policies.Element pranaamCancellationPolicies,
) {
  final bottomSheet = showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: context.adColors.whiteTextColor,
    elevation: context.k_8,
    isScrollControlled: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(context.k_22),
      ),
    ),
    context: context,
    builder: (dialogContext) {
      return PranaamCancellationPolicies(
        pranaamCancellationPolicies: pranaamCancellationPolicies,
      );
    },
  );

  adLog('$bottomSheet');
}
