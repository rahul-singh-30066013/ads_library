/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/coupon_and_policy_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_add_on_quantity_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/add_ons_container_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/add_stand_alone_quantity_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_available_offers.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_info_card_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_item_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/express_price_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/remove_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/stand_alone_cart_item_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const Color dividerColor = Color(0xfff8f8f8);
final shakeKey = GlobalKey<ShakeWidgetState>();
double height = 308.sp;
const double yAxis = -16;

class CartScreenView extends StatelessWidget {
  CartScreenView({
    Key? key,
    required this.cartScreenController,
    this.cartResponse,
  })  : packageSelected = cartResponse?.packageDetail,
        availableAddOnList = cartResponse?.availiableAddOn ?? [],
        packageAddOnList = cartResponse?.packageAddOn ?? [],
        getCartDataList = cartScreenController.getCartAdded(),
        super(key: key);

  final CartScreenController cartScreenController;
  final CartResponse? cartResponse;

  final List<LocalCartModel> getCartDataList;
  final List<PackageAddOn> availableAddOnList;
  final List<PackageAddOn> packageAddOnList;
  final PackageDetail? packageSelected;

  @override
  Widget build(BuildContext context) {
    adLog('hello${isUpgradeBooking(cartResponse?.pranaamBookingType ?? '')}');
    // const int two = 2;
    final pricingInfo =
        isStandAloneService(cartResponse?.pranaamBookingType ?? '')
            ? cartResponse?.standaloneProductDetails.pricingInfo ??
                const PricingInfo()
            : packageSelected?.pricingInfo;
    final totalExpressFare =
        pricingInfo?.totalExpressFare ?? const TotalExpressFare();
    final couponDiscountAmount =
        pricingInfo?.discountCouponDetail.couponDiscountAmount ?? 0;
    final String serviceAirportName = getCityName(
      cartResponse?.tripDetail.serviceAirport ?? 'AMD',
      context.read<SiteCoreStateManagement>(),
    );
    final couponBoxHeight = 92.sp;
    return ListView(
      padding: EdgeInsets.only(top: context.k_40, bottom: context.k_26),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        if (selectedAirportNotifier.value != serviceAirportName &&
            (!isUpgradeBooking(cartResponse?.pranaamBookingType ?? '')))
          CartInfoCardView(
            serviceName: getBookingTitle(
              cartResponse?.pranaamBookingType ?? '',
              context,
            ),
            serviceAirPort: serviceAirportName,
          ),
        SizedBox(
          height: context.k_20,
        ),
        ValueListenableBuilder(
          valueListenable: cartScreenController.offersState,
          builder: (context, ADResponseState value, child) {
            switch (value.viewStatus) {
              case Status.complete:
                final offerData = (value.data as OfferItems).result;
                return CartAvailableOffers(offers: offerData);
              case Status.loading:
                return const ADSizedBox.shrink(); //todo offer shimmer
              default:
                return const ADSizedBox.shrink();
            }
          },
        ),
        if (isStandAloneService(cartResponse?.pranaamBookingType ?? ''))
          StandAloneCartItemView(
            imageUrl: cartResponse?.standaloneProductDetails.imageUrl,
            price: cartResponse?.standaloneProductDetails.pricingInfo
                    .totalBaseFare.amount ??
                0,
            quantitySectionWidget: AddStandAloneQuantityButton(
              quantity: cartResponse?.standaloneProductDetails.itemCount ?? 1,
              cartResponse:
                  cartResponse ?? const CartResponse(tripDetail: TripDetail()),
            ),
            serviceName: cartResponse?.standaloneProductDetails.name ?? '',
            removeButtonWidget: const RemoveButton(),
            tripDetail: cartResponse?.tripDetail ?? const TripDetail(),
            serviceAirportCityName: serviceAirportName,
          ).paddingBySide(left: context.k_16, right: context.k_16)
        else
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: context.k_16,
            ),
            shrinkWrap: true,
            itemCount: getCartDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable:
                        cartScreenController.localCartItemLoadings[index],
                    builder: (context, bool value, _) => CartItemView(
                      onTap: () => selectAddOnsQuantity(context, index),
                      isLoading: value,
                      cartItemModel: getCartDataList[index],
                      adTapCallback: () =>
                          cartScreenController.openDeleteCartScreen(
                        isAddonAdded: getCartDataList[index].isCartAddOn,
                        packageAddOn: getCartDataList[index].packageAddOn,
                        mainContext: context,
                        cartItemIndex: index,
                      ),
                      isRemoveLoading:
                          cartScreenController.cartItemLoadings[index],
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_10,
                  ),
                ],
              );
            },
          ),
        ADSizedBox(
          height: context.k_38,
        ),
        if (totalExpressFare.amount > 0) ExpressPriceView(),
        // if (availableAddOnList.isNotEmpty && getCartDataList.length < two)
        //   ADSizedBox(height: context.k_48,),
        if (availableAddOnList.isNotEmpty &&
            getCartDataList.length != availableAddOnList.length + 1)
          Text(
            'add_on_services'.localize(context),
            style: ADTextStyle700.size22.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingAllSide(context.k_20)
        else
          const ADSizedBox.shrink(),

        ///ADD-ONS

        // if (availableAddOnList.isNotEmpty && getCartDataList.length < two)
        if (availableAddOnList.isNotEmpty &&
            getCartDataList.length != availableAddOnList.length + 1)
          SizedBox(
            width: double.infinity,
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.only(left: context.k_10),
              itemCount: availableAddOnList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Selector<PranaamAppDataStateManagement, CartResponse?>(
                  selector: (context, viewModel) => viewModel.cartDataResponse,
                  builder: (context, value, child) {
                    final CartResponse? cartResponse = value;
                    adLog('Cart Response $cartResponse');
                    final List<PackageAddOn> availableAddOnList =
                        value?.availiableAddOn ?? [];
                    final List<PackageAddOn> packageAddOnList =
                        value?.packageAddOn ?? [];
                    return availableAddOnList.isNotEmpty
                        ? ValueListenableBuilder(
                            valueListenable:
                                cartScreenController.addonItemLoadings[index],
                            builder: (context, bool value, _) =>
                                AddOnsContainerView(
                              state: cartScreenController,
                              packageAddon:
                                  cartScreenController.getSelectedPackageAddOn(
                                packageAddOnList,
                                availableAddOnList[index],
                              ),
                              image: availableAddOnList[index].addOnImage ??
                                  'lib/assets/images/pranaam/porter1.png',
                              title: availableAddOnList[index].addOnServiceName,
                              actualPrice:
                                  availableAddOnList[index].price.toString(),
                              placeHolder: 'placeHolder'.localize(context),
                              discountedPrice:
                                  availableAddOnList[index].price.toString(),
                              addText: 'add'.localize(context),
                              isAdded:
                                  cartScreenController.isCartItemPresentInCart(
                                availableAddOnList[index],
                              ),
                              isLoading: value,
                              onTap: () => cartScreenController.onAddTap(
                                availableAddOnList[index],
                                quantity: 1,
                                context: context,
                                cartItemIndex: index,
                                addonIndex: index,
                              ),
                              // selectAddOnsQuantity(context,index)
                              index: index,
                              // height: addOnsInnerContainerHeight.h,
                            ),
                          )
                        : const ADSizedBox.shrink();
                  },
                );
              },
            ),
          ).paddingBySide(bottom: context.k_48, left: context.k_10)
        else
          const ADSizedBox.shrink(),

        ADSizedBox(
          height: context.k_4,
        ),
        if (!isUpgradeBooking(cartResponse?.pranaamBookingType ?? ''))
          Divider(
            thickness: context.k_8,
            height: context.k_10,
            color: dividerColor,
          ),

        if (isUpgradeBooking(cartResponse?.pranaamBookingType ?? '') ||
            isStandAloneService(cartResponse?.pranaamBookingType ?? ''))
          const SizedBox.shrink()
        else
          CouponAndPolicyView(
            icon: Icons.local_offer_outlined,
            title: couponDiscountAmount > 0
                ? "'${pricingInfo?.discountCouponDetail.couponCode}'"
                : 'apply_coupon_code'.localize(context),
            baseFareAmount: cartScreenController
                    .getCartResponse()
                    ?.packageDetail
                    .pricingInfo
                    .totalBaseFare
                    .amount ??
                0,
            adGenericCallback: (value) => {
              ClickEvents.book_pranaam_coupon.logEvent(
                parameters: GaEvent.getInstance().parameterMap,
              ),
              cartScreenController.pranaamAppDataStateManagement
                  .updateCartDataResponse(value),
            },
            couponApplied: couponDiscountAmount > 0 ? !isAdded : isAdded,
            subTitle: couponDiscountAmount > 0
                ? ' ${'you_have_saved'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                    price: couponDiscountAmount,
                  )}'
                : '',
            cartResponse: cartResponse,
            pranaamAppDataStateManagement:
                cartScreenController.pranaamAppDataStateManagement,
          ),

        if (!isStandAloneService(cartResponse?.pranaamBookingType ?? ''))
          Divider(
            thickness: context.k_8,
            height: context.k_10,
            color: dividerColor,
          ),
        if (!isUpgradeBooking(cartResponse?.pranaamBookingType ?? ''))
          ADSizedBox(
            height: context.k_22,
          )
        else
          ADSizedBox(
            height: context.k_10,
          ),
        PriceDetailsView(
          addOnsList: cartResponse?.packageAddOn ?? [],
          shakeKey: shakeKey,
          totalMRP: pricingInfo?.totalBaseFare.amount ?? 0,
          promoType: cartResponse
                  ?.packageDetail.pricingInfo.discountCouponDetail.promoType ??
              '',
          cGst: cartResponse?.totalTax.cgst ?? 0,
          sGst: cartResponse?.totalTax.sgst ?? 0,
          totalAmount:
              isStandAloneService(cartResponse?.pranaamBookingType ?? '')
                  ? cartResponse?.standaloneProductDetails.pricingInfo.totalFare
                          .amount ??
                      0
                  : getCartTotalPrice(
                      cartResponse,
                    ),
          expressFareAmount: pricingInfo?.totalExpressFare?.baseFare ?? 0,
          addOnsAmount: getAddonsTotalPrice(
            cartResponse,
          ),
          discountAmount:
              pricingInfo?.discountCouponDetail.couponDiscountAmount ?? 0,
          showApplyCoupon: true,
          packageName:
              isStandAloneService(cartResponse?.pranaamBookingType ?? '')
                  ? cartResponse?.standaloneProductDetails.name
                  : cartResponse?.packageDetail.name,
          adTapCallback: () => applyCouponClick(
            context,
            pricingInfo ?? const PricingInfo(),
          ),
          isForUpgrade:
              isUpgradeBooking(cartResponse?.pranaamBookingType ?? ''),
          newPackPrice: cartResponse
              ?.packageDetail.originalPricingInfo?.totalBaseFare.amount,
          oldPackPrice:
              cartResponse?.packageDetail.oldPricingInfo?.totalBaseFare.amount,
          differenceAmount: pricingInfo?.totalBaseFare.amount ?? 0,
        ),
        ADSizedBox(
          height: context.k_28,
        ),
        if ((cartScreenController.getCartResponse()?.potentialLoyaltyEarning ??
                0) >
            0)
          LoyaltyPointsComponent(
            points: cartScreenController
                    .getCartResponse()
                    ?.potentialLoyaltyEarning ??
                0,
            bottomMargin: context.k_30,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
      ],
    );
  }

  /// this method is used to open apply coupon page
  void applyCouponClick(BuildContext context, PricingInfo pricingInfo) {
    adShowBottomSheet(
      context: context,
      childWidget: ApplyCouponScreen(
        baseFareAmount: pricingInfo.totalBaseFare.amount,
        adGenericCallback: (value) => handleCallBack(value),
      ),
      headerTitle: 'applyCouponLabel'.localize(context),
    );
  }

  void handleCallBack(ADResponseState adResponseState) {
    cartScreenController.pranaamAppDataStateManagement
        .updateCartDataResponse(adResponseState);
  }

  void selectAddOnsQuantity(BuildContext context, int cartItemIndex) {
    adShowBottomSheet(
      context: context,
      childWidget: SelectAddOnQuantityScreen(
        selectedIndexNotifier: ValueNotifier<int>(
          getCartDataList[cartItemIndex].packageAddOn?.qty ?? 0,
        ),
        adGenericCallback: (value) => {
          Navigator.pop(context),
          cartScreenController.onQuantitySelect(
            getCartDataList[cartItemIndex].packageAddOn ?? const PackageAddOn(),
            quantity: value,
            context: context,
            cartItemIndex: cartItemIndex,
            addonIndex: cartItemIndex,
          ),
        },
      ),
      headerTitle: 'Select_Quantity'.localize(context),
    );
  }
}
