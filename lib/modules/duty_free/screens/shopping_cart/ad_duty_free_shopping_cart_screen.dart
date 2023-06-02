/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/components/no_record_found.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_cart_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/shopping_cart_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/coupon/duty_free_coupon_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/price_details_section_duty_free.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_review_order_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_dutyfree_shopping_cart_product_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_pdp_product_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/bank_offers_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/cart_remove_out_of_stock.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_applied_coupon.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_cart_shimmer.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_create_apply_coupon.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_create_cart_list_header.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_pre_order_price_info.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/terminal_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_info_card_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// lib/modules/loyalty/model/loyalty_dashboard_site_core_response.dart
/// to display pickup: Arrival Terminal 2 Banner
const showArrivalBanner = true;
const int dividerColor = 0xffd5d5d9;

///
/// This class will used to show Duty Free shopping cart screen,
/// in this screen, there will be sections like address,offer,cart item,price details
///

const int topHeight = 52;
const double opacity = 0.6;
const double k_180 = 180;
const double k_120 = 120;
const double k_550 = 550;

double imageHeight = 92.sp;
double imageWidth = 80.sp;
final listViewHeight = 318.sp;
const double textHeight = 50;
const int k_2 = 2;
const sliderRatio = 0.4489795;
const maxLines = 2;
const lineGap = 1.2;

class ADDutyFreeShoppingCartScreen extends StatefulWidget {
  const ADDutyFreeShoppingCartScreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  State<ADDutyFreeShoppingCartScreen> createState() =>
      _ADDutyFreeShoppingCartScreenState();
}

class _ADDutyFreeShoppingCartScreenState
    extends State<ADDutyFreeShoppingCartScreen> {
  /// Its just f reference of ViewModel Class to call the api on this object.

  final double elevatedButtonMinimumSize = 50.sp;

  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    super.initState();
    context.read<DutyFreeState>().cartError.value = '';
    context.read<DutyFreeState>().cartItemClick = Status.complete;
    // Hitting Api for Important Information
    // context.read<DutyFreeOrderState>().importantInfoApi(
    //       storeType: context.read<DutyFreeState>().terminalModel.value.code,
    //     );
    context.read<DutyFreeState>().cartDetailState = ADResponseState.loading();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final response = context.read<DutyFreeState>().getCartDetails(
            context,
            viewCartEvent: true,
            callYouMayAlsoLike: true,
          );
      adLog(response.toString());
    });
  }

  int cartValue = 0;
  AppSessionState appSessionState = AppSessionState();

  @override
  Widget build(BuildContext context) {
    appSessionState = context.read<AppSessionState>();
    adLog('Cart Build Called');
    // final List<ScreenStatus>? screenStatus = [
    //   ScreenStatus(
    //     'cart'.localize(context),
    //     '1',
    //     ADTimeLineState.progress,
    //   ),
    //   ScreenStatus(
    //     'review_and_details'.localize(context),
    //     '2',
    //     ADTimeLineState.initial,
    //   ),
    //   ScreenStatus(
    //     'payment'.localize(context),
    //     '3',
    //     ADTimeLineState.initial,
    //   ),
    // ];

    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: Selector<DutyFreeState, Status?>(
        selector: (
          context,
          state,
        ) =>
            state.cartDetailState.viewStatus,
        builder: (context, value, child) {
          return Status.complete == value
              ? Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Selector<DutyFreeState, Status?>(
                            selector: (
                              context,
                              state,
                            ) =>
                                state.cartItemClick,
                            builder: (
                              BuildContext context,
                              state,
                              Widget? child,
                            ) {
                              adLog('state.cartItemClick');
                              return AbsorbPointer(
                                absorbing: context
                                        .read<DutyFreeState>()
                                        .cartItemClick ==
                                    Status.loading,
                                child: SafeArea(
                                  top: false,
                                  bottom: false,
                                  child:
                                      Selector<AppSessionState, ProfileModel>(
                                    selector: (context, viewModel) =>
                                        viewModel.profileModel,
                                    builder: (context, profileModel, child) {
                                      adLog('state.profileModel');
                                      return Selector<AppSessionState, bool>(
                                        selector: (context, viewModel) =>
                                            viewModel.isLoggedIn,
                                        builder: (context, isLoggedIn, child) {
                                          return Selector<DutyFreeState,
                                              DutyFreeCartResponse?>(
                                            selector: (context, state) =>
                                                state.dutyFreeCartResponse,
                                            builder: (context, value, child) {
                                              {
                                                adLog('state.isLoggedIn');
                                                switch (context
                                                    .read<DutyFreeState>()
                                                    .cartDetailState
                                                    .viewStatus) {
                                                  case Status.complete:
                                                    final int length = (context
                                                                .read<
                                                                    DutyFreeState>()
                                                                .dutyFreeCartResponse
                                                                ?.itemDetails ??
                                                            [])
                                                        .length;
                                                    return length > 0
                                                        ? Stack(
                                                            children: [
                                                              NotificationListener<
                                                                  OverscrollIndicatorNotification>(
                                                                onNotification:
                                                                    (notification) =>
                                                                        handleScrollingGlow(
                                                                  notification,
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  child: Column(
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          ValueListenableBuilder(
                                                                            valueListenable:
                                                                                context.read<DutyFreeState>().cartError,
                                                                            builder: (
                                                                              context,
                                                                              String value,
                                                                              child,
                                                                            ) =>
                                                                                value.isEmpty
                                                                                    ? ADSizedBox(
                                                                                        height: context.k_2,
                                                                                      )
                                                                                    : const DutyFreeCreateCartListHeader().paddingBySide(
                                                                                        top: context.k_20,
                                                                                        bottom: context.k_20,
                                                                                      ),
                                                                          ),
                                                                          ADSizedBox(
                                                                            height:
                                                                                context.k_16,
                                                                          ),
                                                                          if (context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode !=
                                                                              selectedAirportsData?.airportCode)
                                                                            CartInfoCardView(
                                                                              serviceName: 'Duty Free',
                                                                              serviceAirPort: Utils.getCityName(adaniAirportsList: context.read<SiteCoreStateManagement>().adaniAirportsList, airportCode: context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode ?? ''),
                                                                            ),
                                                                          const TerminalView()
                                                                              .paddingBySide(
                                                                            top:
                                                                                context.k_16,
                                                                            left:
                                                                                context.k_16,
                                                                            right:
                                                                                context.k_16,
                                                                          ),
                                                                          const BankOffersComponent(),
                                                                          Selector<
                                                                              DutyFreeState,
                                                                              List<ShoppingCartContent>>(
                                                                            selector: (
                                                                              context,
                                                                              stateClass,
                                                                            ) =>
                                                                                context.read<DutyFreeState>().shoppingCartContent,
                                                                            builder:
                                                                                (
                                                                              BuildContext context,
                                                                              state,
                                                                              Widget? child,
                                                                            ) {
                                                                              adLog(
                                                                                'state.ShoppingCartContent',
                                                                              );
                                                                              return ADDutyFreeShoppingCartProductItem(
                                                                                productList: context.read<DutyFreeState>().dutyFreeCartResponse?.itemDetails ?? [],
                                                                              ).paddingBySide(
                                                                                left: context.k_16,
                                                                                right: context.k_16,
                                                                              );
                                                                            },
                                                                          ),
                                                                          Selector<
                                                                              DutyFreeState,
                                                                              CatalogListResponseModel?>(
                                                                            selector: (context, state) =>
                                                                                state.catalogListResponseModelCart,
                                                                            builder: (context, model, child) => (model?.result.isNotEmpty ?? false)
                                                                                ? Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        'you_may_also_like'.localize(context),
                                                                                        style: ADTextStyle700.size22,
                                                                                      ).paddingBySide(left: context.k_16, right: context.k_16),
                                                                                      SizedBox(
                                                                                        height: context.k_20,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: listViewHeight,
                                                                                        child: ListView.builder(
                                                                                          itemCount: model?.result.length,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
                                                                                            final listHeight = 318.sp;
                                                                                            final scaledImageHeight = 100.sp;

                                                                                            return Selector<DutyFreeState, int?>(
                                                                                              selector: (context, state) => state.catalogListResponseModelCart?.result[index].quantity,
                                                                                              builder: (
                                                                                                BuildContext context,
                                                                                                catalogListState1,
                                                                                                Widget? child,
                                                                                              ) {
                                                                                                final int? quantity = dutyFreeState.getSkuQty(
                                                                                                  model?.result[index].skuCode ?? '',
                                                                                                  storeType: model?.result[index].storeType ?? 'departure',
                                                                                                );

                                                                                                final DutyFreeProductDataModel? dataModel = model?.result[index].copyWith(quantity: quantity ?? 0);
                                                                                                model?.result[index] = dataModel ?? const DutyFreeProductDataModel();

                                                                                                if (model?.result[index].timeStamp.isEmpty == true) {
                                                                                                  model?.result[index] = model.result[index].copyWith(
                                                                                                    timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
                                                                                                  );
                                                                                                }

                                                                                                return TouchableOpacity(
                                                                                                  onTap: () => navigateToProductDetailPage(
                                                                                                    index,
                                                                                                    context,
                                                                                                  ),
                                                                                                  child: DutyFreePdpProductCard(
                                                                                                    // width:
                                                                                                    // (context.widthOfScreen - (context.k_16 * maxLines)) *
                                                                                                    //     sliderRatio,
                                                                                                    maxQuantity: min(model?.result[index].availableQuantity.toInt() ?? Utils.dutyFreeProductMaxQty, Utils.dutyFreeProductMaxQty),
                                                                                                    availability: model?.result[index].availability ?? true,
                                                                                                    timeStamp: model?.result[index].timeStamp ?? '',
                                                                                                    index: index,
                                                                                                    promotions: model?.result[index].promotions,
                                                                                                    skuCode: model?.result[index].skuCode ?? '',
                                                                                                    productCartQty: model?.result[index].quantity ?? 0,
                                                                                                    title: model?.result[index].skuName ?? '',
                                                                                                    imageScaledHeight: scaledImageHeight,
                                                                                                    height: listHeight,
                                                                                                    image: model?.result[index].productImages.isNotEmpty ?? false ? '${Environment.instance.configuration.cmsImageBaseUrl}${model?.result[index].productImages.first}' : '',
                                                                                                    placeHolder: 'lib/assets/images/duty_free/listing/absolut.png',
                                                                                                    actualPrice: model?.result[index].price.toString() ?? '',
                                                                                                    discountedPrice: model?.result[index].discountPrice.toString(),
                                                                                                    addText: 'add'.localize(context),
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    borderRadius: context.k_10,
                                                                                                    // isItemAvailable: model?.result[index].availability ?? false,
                                                                                                    bonusString: '',
                                                                                                    onDecrementTapHandler: (int value) => dutyFreeState.updateCart(
                                                                                                      context: context,
                                                                                                      increment: false,
                                                                                                      dutyFreeProductDataModel: (model?.result ?? [])[index],
                                                                                                      fromCartPage: true,
                                                                                                    ),
                                                                                                    onIncrementTapHandler: (int value) => dutyFreeState.updateCart(
                                                                                                      context: context,
                                                                                                      dutyFreeProductDataModel: (model?.result ?? [])[index],
                                                                                                      fromCartPage: true,
                                                                                                    ),
                                                                                                    onTap: () => dutyFreeState.updateCart(
                                                                                                      context: context,
                                                                                                      dutyFreeProductDataModel: (model?.result ?? [])[index],
                                                                                                      fromCartPage: true,
                                                                                                    ),
                                                                                                  ).paddingBySide(
                                                                                                    left: index == 0 ? context.k_16 : context.k_6,
                                                                                                    right: index == ((model?.result.length ?? 1) - 1) ? context.k_16 : context.k_6,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ).paddingBySide(
                                                                                    bottom: elevatedButtonMinimumSize,
                                                                                  )
                                                                                : const SizedBox.shrink(),
                                                                          ),

                                                                          Selector<
                                                                              DutyFreeState,
                                                                              double>(
                                                                            selector: (
                                                                              context,
                                                                              stateClass,
                                                                            ) =>
                                                                                stateClass.dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0,
                                                                            builder:
                                                                                (
                                                                              BuildContext context,
                                                                              value,
                                                                              Widget? child,
                                                                            ) {
                                                                              adLog(
                                                                                'state.ShoppingCartContent',
                                                                              );
                                                                              return value == 0
                                                                                  ? InkWell(
                                                                                      onTap: () => _callCouponScreenWidget(),
                                                                                      child: DutyFreeCreateApplyCoupon(
                                                                                        leftHeader: 'apply_coupon_code'.localize(context),
                                                                                      ),
                                                                                    )
                                                                                  : DutyFreeAppliedCoupon(
                                                                                      // amount: FlightUtils.getAmountWithTwoDecimalPoint(
                                                                                      //   context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0,
                                                                                      // ),
                                                                                      amount: FlightUtils.getPriceFormatWithSymbol(
                                                                                        price: context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0,
                                                                                      ),
                                                                                      couponCode: context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.promoCode ?? '',
                                                                                      onTap: () => context.read<DutyFreeState>().removeCoupon(context: context),
                                                                                    ).paddingBySide(
                                                                                      top: context.k_10,
                                                                                    );
                                                                            },
                                                                          ),

                                                                          // InkWell(
                                                                          //   onTap: () =>
                                                                          //       _callCouponScreenWidget(),
                                                                          //   child:
                                                                          //       DutyFreeCreateApplyCoupon(
                                                                          //     leftHeader:
                                                                          //         'apply_coupon_code'.localize(context),
                                                                          //   ),
                                                                          // ),
                                                                          // DutyFreeAppliedCoupon(
                                                                          //   // amount: FlightUtils.getAmountWithTwoDecimalPoint(
                                                                          //   //   context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ?? 0,
                                                                          //   // ),
                                                                          //   amount: FlightUtils
                                                                          //       .getAmountWithTwoDecimalPoint(
                                                                          //     context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.offerValue?.toDouble() ??
                                                                          //         0,
                                                                          //   ),
                                                                          //   couponCode: context
                                                                          //           .read<DutyFreeState>()
                                                                          //           .dutyFreeCartResponse
                                                                          //           ?.promoCoupon
                                                                          //           ?.promoCode ??
                                                                          //       '',
                                                                          //   onTap: () => context
                                                                          //       .read<
                                                                          //           DutyFreeState>()
                                                                          //       .removeCoupon(
                                                                          //         context:
                                                                          //             context,
                                                                          //       ),
                                                                          // ),

                                                                          Selector<
                                                                              DutyFreeState,
                                                                              num?>(
                                                                            selector: (
                                                                              context,
                                                                              stateClass,
                                                                            ) =>
                                                                                stateClass.dutyFreeCartResponse?.finalAmount?.amount,
                                                                            builder:
                                                                                (
                                                                              BuildContext context,
                                                                              state,
                                                                              Widget? child,
                                                                            ) {
                                                                              adLog(
                                                                                'state.ShoppingCartContent',
                                                                              );
                                                                              return PriceDetailsSectionDutyFree(
                                                                                shakeKey: shakeKey,
                                                                                totalPrice: (context.read<DutyFreeState>().dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0).toDouble(),
                                                                                discountPrice: (context.read<DutyFreeState>().dutyFreeCartResponse?.discountPrice?.amount ?? 0).toDouble(),
                                                                                preOrderDiscount: (context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscount?.amount ?? 0).toDouble(),
                                                                                totalAmount: (context.read<DutyFreeState>().dutyFreeCartResponse?.finalAmount?.amount ?? 0).toDouble(),
                                                                                couponDiscount: (context.read<DutyFreeState>().dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0).toDouble(),
                                                                                percentageDiscount: (context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscount?.percentageDiscount ?? 0).toInt(),
                                                                                showInfoIcon: (context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscountBreakup.length ?? 0) > 0,
                                                                                tapInfoIcon: () => adShowBottomSheet(
                                                                                  childWidget: DutyFreePreOrderPriceInfo(
                                                                                    preOrderDiscountBreakupList: context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscountBreakup ?? [],
                                                                                  ),
                                                                                  context: context,
                                                                                  headerTitle: 'pre_order_discount_breakup'.localize(context),
                                                                                ),
                                                                              ).paddingBySide(
                                                                                top: topHeight.sp,
                                                                                left: context.k_16,
                                                                                right: context.k_16,
                                                                              );
                                                                            },
                                                                          ),
                                                                          ADSizedBox(
                                                                            height:
                                                                                context.k_28,
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                context.k_48,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xfff2f3f4),
                                                                              borderRadius: BorderRadius.all(Radius.circular(4)),
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              horizontal: context.k_10,
                                                                              // vertical: context.k_10,
                                                                            ),
                                                                            margin:
                                                                                EdgeInsets.only(
                                                                              bottom: context.k_30,
                                                                              left: context.k_16,
                                                                              right: context.k_16,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: Alignment.centerLeft,
                                                                              child: RichText(
                                                                                text: TextSpan(
                                                                                  text: '',
                                                                                  style: ADTextStyle400.size14.copyWith(
                                                                                    height: lineGap,
                                                                                  ),
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'Note: ',
                                                                                      style: ADTextStyle600.size14,
                                                                                    ),
                                                                                    WidgetSpan(
                                                                                      child: ADSizedBox(
                                                                                        width: context.k_2,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: 'Pre-book',
                                                                                      style: ADTextStyle400.size14,
                                                                                    ),
                                                                                    WidgetSpan(
                                                                                      child: ADSizedBox(
                                                                                        width: context.k_2,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: '${context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscount?.preOrderDiscountTime}',
                                                                                      style: ADTextStyle600.size14,
                                                                                    ),
                                                                                    WidgetSpan(
                                                                                      child: ADSizedBox(
                                                                                        width: context.k_4,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: 'prior to delivery and get an',
                                                                                      style: ADTextStyle400.size14,
                                                                                    ),
                                                                                    WidgetSpan(
                                                                                      child: ADSizedBox(
                                                                                        width: context.k_4,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: 'additional ${(context.read<DutyFreeState>().dutyFreeCartResponse?.preOrderDiscount?.percentageDiscount ?? 0).toInt()}%',
                                                                                      style: ADTextStyle600.size14,
                                                                                    ),
                                                                                    WidgetSpan(
                                                                                      child: ADSizedBox(
                                                                                        width: context.k_4,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: 'discount.',
                                                                                      style: ADTextStyle400.size14,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child:
                                                                                LoyaltyPointsComponent(
                                                                              points: context.read<DutyFreeState>().dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0,
                                                                              bottomMargin: context.k_10,
                                                                            ),
                                                                          ).paddingBySide(
                                                                            bottom:
                                                                                context.k_30,
                                                                            left:
                                                                                context.k_16,
                                                                            right:
                                                                                context.k_16,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              // Align(
                                                              //   alignment:
                                                              //       Alignment.bottomCenter,
                                                              //   child: ElevatedButton(
                                                              //     // onPressed: () =>
                                                              //     //     cartListBottomsSheet(context),
                                                              //     onPressed:
                                                              //         _presentCustomerInformation,
                                                              //     style: ElevatedButton
                                                              //         .styleFrom(
                                                              //       primary: context
                                                              //           .adColors.blueColor,
                                                              //       minimumSize: Size(
                                                              //         double.infinity,
                                                              //         elevatedButtonMinimumSize,
                                                              //       ),
                                                              //       shape:
                                                              //           const StadiumBorder(),
                                                              //     ),
                                                              //     child: Text(
                                                              //       'place_order'.localize(
                                                              //         context,
                                                              //       ),
                                                              //       style: ADTextStyle700
                                                              //           .size18
                                                              //           .setTextColor(
                                                              //         context.adColors
                                                              //             .whiteTextColor,
                                                              //       ),
                                                              //     ),
                                                              //   ).paddingBySide(
                                                              //     bottom: context.k_20,
                                                              //     left: context.k_16,
                                                              //     right: context.k_16,
                                                              //   ),
                                                              // ),
                                                            ],
                                                          )
                                                        : NoRecordFound(
                                                            errorMessage:
                                                                'your_cart_looks_empty'
                                                                    .localize(
                                                              context,
                                                            ),
                                                            subTitleError:
                                                                'lets_fill_it_with_some_goodness'
                                                                    .localize(
                                                              context,
                                                            ),
                                                            buttonText:
                                                                'start_shopping'
                                                                    .localize(
                                                              context,
                                                            ),
                                                            imagePath:
                                                                'lib/assets/gif/empty_cart.gif',
                                                          );

                                                  case Status.loading:
                                                    adLog('loading');
                                                    return Center(
                                                      child: ADDotProgressView(
                                                        color: context
                                                            .adColors.black,
                                                      ),
                                                    );

                                                  case Status.error:
                                                    adLog('error');

                                                    return Center(
                                                      child: Text(
                                                        'unable_to_load_msg'
                                                            .localize(context),
                                                      ),
                                                    );

                                                  default:
                                                    return Center(
                                                      child: Text(
                                                        'Process'
                                                            .localize(context),
                                                      ),
                                                    );
                                                }
                                              }
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if ((context
                                    .read<DutyFreeState>()
                                    .dutyFreeCartResponse
                                    ?.itemDetails
                                    .isNotEmpty ??
                                false) &&
                            value == Status.complete)
                          Selector<DutyFreeState, DutyFreeCartResponse?>(
                            selector: (context, state) =>
                                state.dutyFreeCartResponse,
                            builder: (context, state, child) => (state
                                        ?.itemDetails.isNotEmpty ??
                                    false)
                                ? SafeArea(
                                    top: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Divider(height: 1, thickness: 1),
                                        Container(
                                          color:
                                              context.adColors.whiteTextColor,
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: context.k_16,
                                              vertical: context.k_8,
                                            ),
                                            title: GestureDetector(
                                              onTap: () =>
                                                  scrollToDown(shakeKey),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Consumer<DutyFreeState>(
                                                    builder: (
                                                      context,
                                                      value,
                                                      child,
                                                    ) =>
                                                        Text(
                                                      FlightUtils
                                                          .getPriceFormatWithSymbol(
                                                        price: context
                                                                .read<
                                                                    DutyFreeState>()
                                                                .dutyFreeCartResponse
                                                                ?.finalAmount
                                                                ?.amount
                                                                .toDouble() ??
                                                            0,
                                                      ),
                                                      style:
                                                          ADTextStyle700.size24,
                                                    ),
                                                  ),
                                                  ADSizedBox(
                                                    height: context.k_2,
                                                  ),
                                                  Text(
                                                    'viewDetails'
                                                        .localize(context),
                                                    style: ADTextStyle400.size12
                                                        .copyWith(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            trailing: ElevatedButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      context.k_28,
                                                    ),
                                                  ),
                                                ),
                                                side: MaterialStateProperty.all(
                                                  BorderSide.none,
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  context.adColors.blueColor,
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.symmetric(
                                                    horizontal: context.k_56,
                                                    vertical:
                                                        DeviceUtil.isTablet
                                                            ? context.k_10
                                                            : context.k_16,
                                                  ),
                                                ),
                                              ),
                                              // onPressed: () => navigateToTravellersDetailsScreen(
                                              //   context,
                                              //   flightObjForGA,
                                              // ),
                                              onPressed: _validateCart,

                                              child: Selector<DutyFreeState,
                                                  Status?>(
                                                selector: (
                                                  context,
                                                  state,
                                                ) =>
                                                    state.validateCartStatus,
                                                builder:
                                                    (context, value, child) {
                                                  return value ==
                                                          Status.complete
                                                      ? Text(
                                                          'continue'.localize(
                                                            context,
                                                          ),
                                                          style: ADTextStyle700
                                                              .size16
                                                              .copyWith(
                                                            color: context
                                                                .adColors
                                                                .whiteTextColor,
                                                          ),
                                                        )
                                                      : ADDotProgressView(
                                                          color: context
                                                              .adColors
                                                              .whiteTextColor,
                                                        );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const ADSizedBox.shrink(),
                          )
                        else
                          const ADSizedBox.shrink(),
                      ],
                    ),
                  ],
                )
              : const DutyFreeCartShimmer();
        },
      ),
    );
  }

  void scrollToDown(GlobalKey<ShakeWidgetState>? shakeKeyReview) {
    if (widget.controller?.position.pixels ==
        widget.controller?.position.maxScrollExtent) {
      shakeKeyReview?.currentState?.shake();
    } else {
      widget.controller?.animateTo(
        widget.controller?.position.maxScrollExtent ?? 0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  Future<void> _validateCart() async {
    // navigateToScreenUsingNamedRouteWithArguments(
    //   context,
    //   dutyFreeOrderConfirmation,
    //   argumentObject: DealProductModel(),
    // );
    context.read<DutyFreeState>().validateCartStatus = Status.loading;
    context.read<DutyFreeState>().notifyListeners();
    final response = await context.read<DutyFreeState>().validateCartApi();
    context.read<DutyFreeState>().validateCartStatus = Status.complete;
    context.read<DutyFreeState>().notifyListeners();
    if (response.viewStatus == Status.complete) {
      _presentCustomerInformation();
    } else {
      response.data = ((response.data as Map)['itemDetails'] as List)
          .map((e) => ItemDetailResponse.fromJson(e))
          .toList();
      _removeOutOfStockInCart(
        context,
        response,
      );
    }
  }

  void _removeOutOfStockInCart(
    BuildContext context,
    ADResponseState response,
  ) {
    adShowBottomSheetWithData(
      isHeaderRequired: false,
      context: context,
      childWidget: CartRemoveOutOfStock(response),
      headerTitle: '',
      isPaddingRequired: false,
    ).then((value) {
      if (value == Status.complete) {
        context.read<DutyFreeState>()
          ..cartDetailState = ADResponseState.loading()
          ..notifyListeners()
          ..getCartDetails(context).then((value) => adLog('cart removed'));
      }
    });
  }

  void _presentCustomerInformation() {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      if (!context.read<DutyFreeState>().isRemovedCouponClicked) {
        openTravellerScreen();
      }
    } else {
      //means guest user open Log In PopUp
      /*ProfileSingleton.profileSingleton
          .readUserProfile(keyUserProfileData)
          .then((userData) {
        adLog('userprofile getCart value : ${userData.userId}');
      });*/
      // adShowBottomSheet(
      //   context: context,
      //   childWidget: SignInScreen(
      //     signInStatusModel: SignInStatusModel(
      //       isLoginStatusTap: (value) => openTravellerScreen(),
      //       isNotFromSplash: true,
      //       currentRouteName: genericCartScreen,
      //     ),
      //   ),
      //   headerTitle: '',
      //   isHeaderRequired: false,
      // );
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) => value ? openTravellerScreen() : null,
          isNotFromSplash: true,
          currentRouteName: genericCartScreen,
        ),
      );
    }
  }

  void navigateToProductDetailPage(int index, BuildContext context) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      rootNavigator: false,
      argumentObject: DealProductModel(
        catalogType: context
            .read<DutyFreeState>()
            .catalogListResponseModelCart
            ?.result[index]
            .category,
        item: context
            .read<DutyFreeState>()
            .catalogListResponseModelCart
            ?.result[index],
        index: index,
        timeStamp: context
            .read<DutyFreeState>()
            .catalogListResponseModelCart
            ?.result[index]
            .timeStamp,
      ),
    );
  }

  void openTravellerScreen() {
    context.read<DutyFreeState>().dutyFreeEventState.checkoutEvent();
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      customerInformationScreen,
      // rootNavigator: false,
      argumentObject: CustomerInfoArguments(
        DealProductModel(),
        appSessionState.couponDiscount.toInt(),
      ),
    );
  }

  /*Future<void> getCart(
    dynamic value,
    String oldAgentId,
    BuildContext context,
  ) async {
    // if value is true means getCart with guestUserId & New mobile Number
    if (value) {
      final ADResponseState responseState =
          await context.read<DutyFreeState>().getCartDetails(
                context,
                oldAgentId: oldAgentId,
                guestLogIn: true,
              );
      if (responseState.viewStatus == Status.complete) {
        openTravellerScreen();
      }
    }
  }*/

  ///to call coupon list screen
  void _callCouponScreenWidget() {
    context.read<DutyFreeState>().cancelIconClick();
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      context.read<DutyFreeState>().applyCouponController.clear();
      context
          .read<DutyFreeState>()
          .dutyFreeEventState
          .applyCouponClick(loginStatus: 'login');
      adShowBottomSheet(
        context: context,
        childWidget: const DutyFreeCouponList(),
        headerTitle: 'applyCouponLabel'.localize(context),
        valueNotifier: context.read<DutyFreeState>().isCouponApplying,
      );
    } else {
      context.read<DutyFreeState>().dutyFreeEventState.couponListEvent();
      context
          .read<DutyFreeState>()
          .dutyFreeEventState
          .applyCouponClick(loginStatus: 'logout');
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          currentRouteName: genericCartScreen,
          isLoginStatusTap: (value) => value
              ? Future.delayed(
                  const Duration(milliseconds: 500),
                  () => _callCouponScreenWidget(),
                )
              : null,
          isNotFromSplash: true,
        ),
      );
    }
  }
}

bool handleScrollingGlow(OverscrollIndicatorNotification notification) {
  notification.disallowIndicator();
  return false;
}

/// this model class is used to pass product details and coupon value.
class CustomerInfoArguments {
  final DealProductModel item;
  final int couponValue;

  CustomerInfoArguments(this.item, this.couponValue);
}

void cartListBottomsSheet(
  BuildContext context,
) =>
    BottomSheetUtils.showDraggableBottomSheetDialog(
      context,
      // ReschedulePage(),
      const DutyFreeReviewOrderBottomSheet(),
      'order_review'.localize(context),
    );

class DeviceUtil {
  static String get _getDeviceType {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < k_550 ? 'phone' : 'tablet';
  }

  static bool get isTablet {
    return _getDeviceType == 'tablet';
  }
}
