/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/components/confirmation_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_order_confirmation_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_order_confirmation_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/cancellation_date_change_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/duty_free_allowances_section.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_help_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/order_confirmation_header.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/order_failed_header.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/order_pending_header.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/order_summary.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/other_services.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/thankyou_pickup_dutyfree_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// This class will used to show Duty Free Order Confirmation screen.
class DutyFreeOrderConfirmationScreen extends StatefulWidget {
  final CommonOrderDetailBaseResponse item;

  const DutyFreeOrderConfirmationScreen({Key? key, required this.item})
      : super(key: key);

  @override
  State<DutyFreeOrderConfirmationScreen> createState() =>
      _DutyFreeOrderConfirmationScreenState();
}

class _DutyFreeOrderConfirmationScreenState
    extends State<DutyFreeOrderConfirmationScreen> {
  final Color collectionPointContainerColor = const Color(0xfffbfbfb);
  AppSessionState? appSessionState;
  String? cityName;
  DutyFreeOrderState? dutyFreeOrderState;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => Utils.appReviewMethod(),
    );

    appSessionState = context.read<AppSessionState>();
    dutyFreeOrderState = context.read<DutyFreeOrderState>();
    cityName = Utils.getCityName(
      adaniAirportsList:
          context.read<SiteCoreStateManagement>().adaniAirportsList,
      airportCode:
          context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode ?? '',
    );
    dutyFreeOrderState?.getPotentialEarning(widget.item);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    );
    dutyFreeOrderState?.dutyFreeCancelOrderDetailsResponseModel = null;
  }

  @override
  Widget build(BuildContext context) {
    const aspectRatio = 0.66;
    final double refundWidth = 343.sp;
    final double refundHeight = 107.sp;
    const double containerOpacity = 0.1000000014901161;
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.k_48,
          elevation: 0,
          backgroundColor: widget.item.status?.toLowerCase() == 'pending'
              ? const Color(0xffeb9845).withOpacity(containerOpacity)
              : widget.item.status?.toLowerCase() == 'failed'
                  ? const Color(0xffdc464b)
                  : context.adColors.greenColor,
          leadingWidth: context.k_38,
          leading: GestureDetector(
            onTap: () => _startShoppingTap(context),
            child: SvgPicture.asset(
              SvgAssets.closeIcon,
              fit: BoxFit.fitWidth,
              color: widget.item.status?.toLowerCase() == 'pending'
                  ? context.adColors.darkGreyTextColor
                  : context.adColors.whiteTextColor,
            ).paddingBySide(
              left: context.k_20,
            ),
          ),
          foregroundColor: context.adColors.whiteTextColor,
        ),
        floatingActionButton: ConfirmationBottomBar(
          buttons: [
            ConfirmationBottomButtonModel(
              icon: SvgAssets.bottomBarHome,
              title: 'home'.localize(context),
              onTap: () => popToHome(),
            ),
            ConfirmationBottomButtonModel(
              icon: SvgAssets.bottomBarMyOrder,
              title: 'orders'.localize(context),
              onTap: () => _pushToOrdetailPage(),
            ),
            ConfirmationBottomButtonModel(
              icon: SvgAssets.help,
              title: 'help'.localize(context),
              onTap: () => helpBottomSheet(context),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (widget.item.status?.toLowerCase() == 'confirmed')
                  OrderConfirmationHeader(
                    item: widget.item,
                  ),
                if (widget.item.status?.toLowerCase() == 'pending')
                  OrderPendingHeader(
                    item: widget.item,
                  ),
                if (widget.item.status?.toLowerCase() == 'failed')
                  OrderFailedHeader(
                    item: widget.item,
                  ),
              ],
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            if (widget.item.status?.toLowerCase() == 'confirmed')
              Text(
                'qr_text_duty_free_thank_you'.localize(context),
                key: const Key(
                  DutyFreeOrderConfirmationAutomationKeys.showQrCodeText,
                ),
                style: ADTextStyle400.size14
                    .copyWith(color: context.adColors.blackTextColor),
                textAlign: TextAlign.center,
              ).paddingBySide(left: context.k_30, right: context.k_30),
            if (widget.item.status?.toLowerCase() == 'confirmed')
              Consumer<DutyFreeOrderState>(
                builder: (context, dutyFreeOrderState, child) {
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'reference_id'.localize(context)} -',
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                        WidgetSpan(
                          child: ADSizedBox(
                            width: context.k_4,
                          ),
                        ),
                        TextSpan(
                          text: dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.orderDetail
                              ?.bookingId,
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).paddingBySide(
                    top: context.k_16,
                  );
                },
              ),

            if (widget.item.status?.toLowerCase() == 'failed')
              Container(
                margin: EdgeInsets.only(
                  left: context.k_16,
                  right: context.k_16,
                ),
                height: refundHeight,
                width: refundWidth,
                color: const Color(0xfff4f9ff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'refund_information'.localize(context),
                      style: ADTextStyle700.size16
                          .copyWith(color: context.adColors.blackTextColor),
                    ).paddingBySide(
                      top: context.k_20,
                    ),
                    Text(
                      'order_failed_message'.localize(context),
                      style: ADTextStyle400.size12
                          .copyWith(color: context.adColors.blackTextColor),
                    ).paddingBySide(
                      top: context.k_12,
                    ),
                  ],
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_20,
                ),
              ),
            Selector<DutyFreeOrderState, bool>(
              selector: (context, viewModel) => viewModel.isEarnPointsLoading,
              builder: (context, isEarnPointsLoading, Widget? child) {
                return !(widget.item.status?.toLowerCase() == 'pending')
                    ? isEarnPointsLoading
                        ? ADShimmerWidget.shimmerShape(
                            rectanglePadding: EdgeInsets.zero,
                            type: ShimmerType.rectangleBox,
                            width: context.widthOfScreen,
                            height: context.k_48,
                          ).paddingBySide(
                            top: context.k_20,
                            left: context.k_16,
                            right: context.k_16,
                          )
                        : LoyaltyPointsComponent(
                            points: widget.item.earning?.total ?? 0,
                            routeThankYou: true,
                            loyaltyShowScreenType:
                                LoyaltyShowScreenType.dutyFree,
                          ).paddingBySide(
                            top: context.k_20,
                            left: context.k_16,
                            right: context.k_16,
                          )
                    : Container();
              },
            ),

            ///TODO need to fix
            // AddToAppleWalletWidget(
            //   id: widget.item.id,
            //   topPadding: context.k_10,
            // ),
            // if ((widget.item.loyaltyPoint?.pendingRewardPoints ?? 0) > 0)
            //   LoyaltyPointsComponent(
            //     points: widget.item.loyaltyPoint?.pendingRewardPoints ?? 0,
            //     routeThankYou: true,
            //     show2xIcon:
            //         _show2xRewardPointIcon(widget.item.orderDetail.skuDetail),
            //     loyaltyShowScreenType: LoyaltyShowScreenType.dutyFree,
            //   ).paddingBySide(
            //     left: context.k_16,
            //     right: context.k_16,
            //     top: context.k_36,
            //   ),
            // ADSizedBox(
            //   height: context.k_16,
            // ),

            ThankyouPickupDutyfreeView(item: widget.item).paddingBySide(
              left: context.k_16,
              right: context.k_16,
              top: context.k_26,
            ),
            // if ((widget.item.loyaltyPoint?.pendingRewardPoints ?? 0) > 0)
            // Container(
            //   padding: EdgeInsets.all(context.k_20),
            //   decoration: BoxDecoration(
            //     color: collectionPointContainerColor,
            //   ),
            //   child: Column(
            //     children: [
            //       ADRow(
            //         leftText: 'collectionPoint'.localize(context),
            //         rightText: 'paymentDetail'.localize(context),
            //         leftTextStyle: ADTextStyle400.size14.setTextColor(
            //           context.adColors.neutralInfoMsg,
            //         ),
            //         rightTextStyle: ADTextStyle400.size14.setTextColor(
            //           context.adColors.neutralInfoMsg,
            //         ),
            //       ),
            //       ADSizedBox(
            //         height: context.k_4,
            //       ),
            //       ADRow(
            //         leftText: 'Terminal 3 - Level 2',
            //         rightText: widget.item.paymentMode,
            //         leftTextStyle: ADTextStyle500.size16.setTextColor(
            //           context.adColors.blackTextColor,
            //         ),
            //         rightTextStyle: ADTextStyle500.size16.setTextColor(
            //           context.adColors.blackTextColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            if (AppConstants.showMap)
              //Remove image
              ClipRRect(
                borderRadius: BorderRadius.circular(context.k_8),
                //Remove image
                child: Container(),
              ).paddingAllSide(context.k_16),
            OrderSummary(
              item: widget.item,
            ),

            ADSizedBox(height: context.k_10),
            DutyfreeAllowancesSection(
              policiesList: context
                  .read<DutyFreeOrderState>()
                  .importantInformationPolicyList,
            ).paddingBySide(left: context.k_16, right: context.k_16),
            CancellationDateChangeView(
              policiesList:
                  context.read<DutyFreeOrderState>().cancellationPolicyList,
            ),

            ADSizedBox(
              height: context.k_18,
            ),
            FutureBuilder(
              future: context
                  .read<DutyFreeOrderState>()
                  .getDutyFreeOtherServices(cityName ?? ''),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? OtherServiceShimmerWidget()
                    : snapshot.hasData
                        ? snapshot.data != null &&
                                ((snapshot.data as DutyFreeDashboardItem)
                                        .widgetItems
                                        ?.isNotEmpty ??
                                    false)
                            ? OtherServices(
                                item: (snapshot.data as DutyFreeDashboardItem)
                                    .copyWith(aspectRatio: aspectRatio),
                              )
                            : const ADSizedBox.shrink()
                        : const ADSizedBox.shrink();
              },
            ),
            ADSizedBox(
              height: context.k_60,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _willPopScope() async {
    _startShoppingTap(context);
    return true;
  }

  void popToHome() {
    final CustomTabScaffold scaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;

    final GlobalKey<NavigatorState> navigatorState =
        HomeBottomAssets.homeBottomPages.keys.toList()[1];

    navigatorState.currentState?.popUntil((route) => route.isFirst);
    BottomBarState.currentIndex = 0;
    scaffold.controller?.index = 0;
    navigatorPopScreenUntil(
      context,
      (route) => route.settings.name == tabRoute,
    );
  }

  bool _show2xRewardPointIcon(List<ItemDetail> skuDetail) {
    for (final ItemDetail item in skuDetail) {
      if ((item.loyaltyOffer?.toLowerCase() ?? '').contains('2x')) {
        return true;
      }
    }
    return false;
  }

  void _pushToOrdetailPage() {
    final debugItem = Navigator.of(context).pushReplacementNamed(
      dutyFreeConfirmationOrder,
      // arguments: widget.item.id,
      arguments: widget.item.orderReferenceId,
    );
    // print('orderid ${widget.item.id}');
    adLog(debugItem.toString());
  }

  void helpBottomSheet(
    BuildContext context,
  ) {
    final String cityName = Utils.getCityName(
      adaniAirportsList:
          context.read<SiteCoreStateManagement>().adaniAirportsList,
      airportCode: context
              .read<DutyFreeOrderState>()
              .dutyFreeCancelOrderDetailsResponseModel
              ?.orderDetail
              ?.dutyfreeDetail
              ?.airportCode ??
          '',
    );
    context.read<SiteCoreStateManagement>().getDutyFreeTermsCondition(cityName);
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
        return DutyFreeHelpBottomSheet();
      },
    );
    adLog('$bottomSheet');
  }

  void _startShoppingTap(
    BuildContext context, {
    bool popScreen = true,
    int index = 1,
  }) {
    if (popScreen) {
      navigatorPopScreen(context);
    }
    switch (context.read<AppModelStateManagement>().homeIdentifier) {
      case HomeIdentifier.dutyFreeHome:
        final CustomTabScaffold scaffold =
            BottomBarState.key.currentWidget as CustomTabScaffold;
        scaffold.controller?.index = index;
        final NavigatorState selectedTabState =
            BottomTabNavKeys.businessTabItemKey.currentState ??
                NavigatorState();

        selectedTabState
            .popUntil((route) => route.settings.name == dutyFreeScreen);
        break;
      default:
        break;
    }

    // OrderAndBookingsScreen orderAndBookingsScreen = HomeBottomAssets
    //         .homeBottomPages[BottomTabNavKeys.ordersAndBookingsTabItemKey]
    //     as OrderAndBookingsScreen;
  }
}

extension Interpolation on String {
  static const needleRegex = '{#}';
  static const needle = '{#}';
  static final RegExp exp = RegExp(needleRegex);

  String interpolate(List l) {
    final Iterable<RegExpMatch> matches = exp.allMatches(this);

    assert(l.length == matches.length);

    var index = -1;
    return replaceAllMapped(exp, (match) {
      adLog(match.group(0));
      index = index + 1;
      return '${l[index]}';
    });
  }
}

/// Class is used to show Recommended Products list
// class _RecommendedList extends StatelessWidget {
//   final DutyConfirmation dutyConfirmationSnapshot;
//
//   const _RecommendedList({Key? key, required this.dutyConfirmationSnapshot})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<RecommendedList> recommendedList =
//         dutyConfirmationSnapshot.recommendedList ?? [];
//     return Container(
//       padding: EdgeInsets.all(context.k_20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'recommendedForYou'.localize(context),
//             style: ADTextStyle700.size22.copyWith(color: ADColors.black),
//           ),
//           ADSizedBox(height: context.k_10),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 for (int index = 0; index < recommendedList.length; index++)
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: context.k_10),
//                     child: ADProductCard(
//                       title: recommendedList[index]
//                           .title
//                           .validateWithDefaultValue(),
//                       image: recommendedList[index]
//                           .image
//                           .validateWithDefaultValue(),
//                       placeHolder: '',
//                       actualPrice: int.parse(
//                         recommendedList[index]
//                             .actualPrice
//                             .validateWithDefaultValue(),
//                       ),
//                       discountedPrice: int.parse(
//                         recommendedList[index]
//                             .discountedPrice
//                             .validateWithDefaultValue(),
//                       ),
//                       addText: 'Add',
//                       onTap: () => adLog('Tap'),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class OtherServiceShimmerWidget extends StatelessWidget {
  OtherServiceShimmerWidget({Key? key}) : super(key: key);

  final double titleHeight = 22.sp;
  final double titleWidth = 152.sp;
  final double imageHeight = 155.sp;
  final double imageWidth = 230.sp;
  final double subtitleHeight = 18.sp;
  final double subtitleWidth = 104.sp;
  final shimmerItemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleImageText,
          width: titleWidth,
          height: titleHeight,
        ),
        ADSizedBox(
          height: imageHeight + subtitleHeight + context.k_20,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.k_10),
            itemBuilder: (context, index) => ADSizedBox(
              width: imageWidth,
              height: imageHeight + subtitleHeight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: subtitleWidth,
                    height: subtitleHeight,
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => ADSizedBox(
              width: context.k_20,
            ),
            itemCount: shimmerItemCount,
          ),
        ),
      ],
    ).paddingBySide(bottom: context.k_20);
  }
}
