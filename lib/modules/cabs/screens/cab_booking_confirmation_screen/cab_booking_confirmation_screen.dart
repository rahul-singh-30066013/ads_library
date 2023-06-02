/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_booking_confirmation_shimmer_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_status_complete_screen_views/cab_booking_confirmation_body_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_status_header_after_payment_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_status_header_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/modules/components/confirmation_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabBookingConfirmationScreen extends StatefulWidget {
  final ADResponseState? response;
  final String orderReferenceId;
  final bool isFromHomeView;

  const CabBookingConfirmationScreen({
    Key? key,
    this.response,
    required this.orderReferenceId,
    this.isFromHomeView = false,
  }) : super(key: key);

  @override
  State<CabBookingConfirmationScreen> createState() =>
      _CabBookingConfirmationScreenState();
}

class _CabBookingConfirmationScreenState
    extends State<CabBookingConfirmationScreen>
    with WidgetsBindingObserver, RouteAware {
  CabBookingConfirmationState cabBookingConfirmationState =
      CabBookingConfirmationState();

  @override
  void didPopNext() {
    cabBookingConfirmationState
      ..stopBookingStatusApiPolling = false
      ..initiateGetOrderDetailsInBackGround(
        context: context,
      );
    super.didPopNext();
  }

  @override
  void didPushNext() {
    cabBookingConfirmationState.stopBookingStatusApiPolling = true;

    super.didPushNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as ModalRoute<void>);
    debugPrint('didChangeDependencies');

    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        cabBookingConfirmationState.stopBookingStatusApiPolling = false;
        cabBookingConfirmationState.initiateGetOrderDetailsInBackGround(
          context: context,
        );
        break;
      case AppLifecycleState.inactive:
        cabBookingConfirmationState.stopBookingStatusApiPolling = true;
        break;
      case AppLifecycleState.paused:
        cabBookingConfirmationState.stopBookingStatusApiPolling = true;
        break;
      case AppLifecycleState.detached:
        cabBookingConfirmationState.stopBookingStatusApiPolling = true;
        break;
    }
  }

  @override
  void initState() {
    cabBookingConfirmationState
      ..isFromHomeView = widget.isFromHomeView
      ..isFromPayment = widget.response != null;
    if (cabBookingConfirmationState.isFromPayment) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () => Utils.appReviewMethod(),
      );
    }

    if (widget.response != null) {
      cabBookingConfirmationState.getCabBookingOrderDetails(
        context: context,
        response: widget.response,
      );
    } else {
      cabBookingConfirmationState
        ..orderReferenceId = widget.orderReferenceId
        ..getCabBookingOrderDetails(context: context);
    }
    if (cabBookingConfirmationState.isFromPayment) {
      CabGoogleAnalytics()
        ..sendGAParametersCabBookingSuccess(cabBookingConfirmationState)
        ..sendGAParametersBookingConfirmationPage(cabBookingConfirmationState)
        ..sendGAParametersPurchase(cabBookingConfirmationState);
    }
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    cabBookingConfirmationState.stopBookingStatusApiPolling = true;
    adLog(WidgetsBinding.instance.removeObserver(this).toString());
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  double _getExpandedHeight() {
    final baseExpandedHeight = 136.sp;
    switch (cabBookingConfirmationState.cabBookingOrderStatus) {
      case CabBookingOrderStatus.confirmed:
        return cabBookingConfirmationState.isFromPayment
            ? cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                    false
                ? baseExpandedHeight + context.k_64 + context.k_20
                : baseExpandedHeight + context.k_64 + context.k_40 + 1.sp
            : cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                    false
                ? baseExpandedHeight + context.k_64 + context.k_40 + context.k_2
                : baseExpandedHeight +
                    context.k_64 +
                    context.k_40 +
                    context.k_2;
        case CabBookingOrderStatus.scheduled:
          if (cabBookingConfirmationState.isFromPayment) {
            final height = baseExpandedHeight;
            return cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.otp?.isNotEmpty ??
                    false
                ? cabBookingConfirmationState
                            .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                        false
                    ? height + context.k_64 + context.k_20
                    : height + context.k_64 + context.k_40 + 1.sp
                : height + context.k_56 + context.k_2;
          } else {
            final height = baseExpandedHeight;
            return cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.otp?.isNotEmpty ??
                    false
                ? cabBookingConfirmationState
                            .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                        false
                    ? height + context.k_64 + context.k_64 + context.k_10
                    : height + context.k_64 + context.k_40 + 1.sp
                : height + context.k_40;
          }
        case CabBookingOrderStatus.cancelled:
          if (cabBookingConfirmationState.isFromPayment) {
            final height = baseExpandedHeight;
            return cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.isAutoCancelled ??
                    false
                ? height + context.k_40 + context.k_2
                : height;
          } else {
            final height = baseExpandedHeight + context.k_6;
            return cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.isAutoCancelled ??
                    false
                ? height + context.k_40 + context.k_12
                : height + context.k_8;
          }
        case CabBookingOrderStatus.ontheway:
          return baseExpandedHeight +
              context.k_60 +
              context.k_48 +
              context.k_4 +
              1.sp;
        case CabBookingOrderStatus.completed:
          return baseExpandedHeight + context.k_13;
        case CabBookingOrderStatus.pending:
          return baseExpandedHeight + context.k_13;
        case CabBookingOrderStatus.failed:
          return baseExpandedHeight + context.k_13;
      }
    }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CabBookingConfirmationState>(
      viewModel: cabBookingConfirmationState,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: cabBookingConfirmationState.isFromPayment &&
                (cabBookingConfirmationState.cabBookingOrderStatus !=
                    CabBookingOrderStatus.cancelled) &&
                (cabBookingConfirmationState.cabBookingOrderStatus !=
                    CabBookingOrderStatus.ontheway) &&
                (cabBookingConfirmationState.cabBookingOrderStatus !=
                    CabBookingOrderStatus.completed)
            ? ConfirmationBottomBar(
                buttons: [
                  ConfirmationBottomButtonModel(
                    icon: SvgAssets.bottomBarHome,
                    title: 'home'.localize(context),
                    onTap: () => {
                      CabGoogleAnalytics()
                          .sendGAParametersCabBookingBottomPanelSelect(
                        cabBookingConfirmationState,
                      ),
                      Navigator.pop(context),
                      (BottomBarState.key.currentWidget as CustomTabScaffold)
                          .controller
                          ?.index = 0,
                      BottomTabNavKeys.homeTabItemKey.currentState
                          ?.popUntil((route) => route.isFirst),
                    },
                  ),
                  ConfirmationBottomButtonModel(
                    icon: SvgAssets.confirmationBarModify,
                    title: 'modify'.localize(context),
                    onTap: () => {
                      CabGoogleAnalytics()
                          .sendGAParametersCabBookingBottomPanelSelect(
                        cabBookingConfirmationState,
                      ),
                      setState(() => ''),
                      CabGoogleAnalytics()
                          .sendGAParametersCabBookingModification(
                        cabBookingConfirmationState,
                      ),
                      cabBookingConfirmationState.isFromPayment = false,
                      cabBookingConfirmationState.getCabBookingOrderDetails(
                        context: context,
                      ),
                      (BottomBarState.key.currentWidget as CustomTabScaffold)
                          .controller
                          ?.index = int.parse('2'),
                    },
                  ),
                  ConfirmationBottomButtonModel(
                    icon: SvgAssets.help,
                    title: 'help'.localize(context),
                    onTap: () => {
                      CabGoogleAnalytics()
                          .sendGAParametersCabBookingBottomPanelSelect(
                        cabBookingConfirmationState,
                      ),
                      if (cabBookingConfirmationState
                              .filteredVendorDataResponseModel
                              ?.result
                              ?.contactDetail !=
                          null)
                        {
                          Utils.helpBottomSheet(
                            context,
                            cabBookingConfirmationState
                                .filteredVendorDataResponseModel
                                ?.result
                                ?.contactDetail,
                          ),
                        }
                      else
                        {
                          Utils.showContactDetailNotFoundSnackBar(context),
                        },
                    },
                  ),
                ],
              )
            : null,
        body: Consumer<CabBookingConfirmationState>(
          builder: (
            context,
            value,
            child,
          ) {
            switch (value.orderDetailState?.viewStatus) {
              case Status.complete:
                return SafeArea(
                  top: false,
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) =>
                            <Widget>[
                      SliverAppBar(
                        backgroundColor: getBackGroundColor(innerBoxIsScrolled),
                        expandedHeight: _getExpandedHeight(),
                        pinned: true,
                        floating: true,
                        systemOverlayStyle: innerBoxIsScrolled
                            ? SystemUiOverlayStyle.dark
                            : cabBookingConfirmationState.isFromPayment &&
                                    (cabBookingConfirmationState
                                            .cabBookingOrderStatus !=
                                        CabBookingOrderStatus.ontheway) &&
                                    (cabBookingConfirmationState
                                            .cabBookingOrderStatus !=
                                        CabBookingOrderStatus.completed)
                                ? (cabBookingConfirmationState
                                            .cabBookingOrderStatus ==
                                        CabBookingOrderStatus.pending)
                                    ? SystemUiOverlayStyle.dark
                                    : SystemUiOverlayStyle.light
                                : SystemUiOverlayStyle.dark,
                        leading: const SizedBox.shrink(),
                        actions: [
                          if ((!cabBookingConfirmationState.isFromPayment) ||
                              (cabBookingConfirmationState
                                      .cabBookingOrderStatus ==
                                  CabBookingOrderStatus.ontheway) ||
                              (cabBookingConfirmationState
                                      .cabBookingOrderStatus ==
                                  CabBookingOrderStatus.completed))
                            Flexible(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: context.k_2,
                                  ),
                                  InkWell(
                                    onTap: () => {
                                      Navigator.pop(context),
                                    },
                                    child: SizedBox(
                                      width: context.k_40,
                                      height: context.k_40,
                                      child: Icon(
                                        Platform.isIOS
                                            ? Icons.arrow_back_ios_outlined
                                            : Icons.arrow_back_outlined,
                                        color: context.adColors.blackTextColor,
                                        size: context.k_20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.k_2,
                                  ),
                                  Center(
                                    child: Text(
                                      'cab_booking'.localize(context),
                                      style: ADTextStyle700.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  TouchableOpacity(
                                    onTap: () => {
                                      if (cabBookingConfirmationState
                                              .filteredVendorDataResponseModel
                                              ?.result
                                              ?.contactDetail !=
                                          null)
                                        {
                                          Utils.helpBottomSheet(
                                            context,
                                            cabBookingConfirmationState
                                                .filteredVendorDataResponseModel
                                                ?.result
                                                ?.contactDetail,
                                          ),
                                        }
                                      else
                                        {
                                          Utils
                                              .showContactDetailNotFoundSnackBar(
                                            context,
                                          ),
                                        },
                                    },
                                    child: Center(
                                      child: Text(
                                        'help'.localize(context),
                                        style:
                                            ADTextStyle500.size14.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.k_16,
                                  ),
                                ],
                              ),
                            ),
                          if (cabBookingConfirmationState.isFromPayment &&
                              (cabBookingConfirmationState
                                      .cabBookingOrderStatus !=
                                  CabBookingOrderStatus.ontheway) &&
                              (cabBookingConfirmationState
                                      .cabBookingOrderStatus !=
                                  CabBookingOrderStatus.completed))
                            Flexible(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: context.k_6,
                                  ),
                                  IconButton(
                                    iconSize: context.k_40,
                                    visualDensity: VisualDensity.compact,
                                    splashRadius: context.k_20,
                                    padding: EdgeInsets.zero,
                                    onPressed: () => {Navigator.pop(context)},
                                    icon: SvgPicture.asset(
                                      SvgAssets.closeIcon,
                                      height: context.k_18,
                                      width: context.k_18,
                                      color: innerBoxIsScrolled
                                          ? context.adColors.blackTextColor
                                          : cabBookingConfirmationState
                                                      .cabBookingOrderStatus ==
                                                  CabBookingOrderStatus.pending
                                              ? context.adColors.blackTextColor
                                              : context.adColors.whiteTextColor,
                                    ),
                                  ),
                                  if (innerBoxIsScrolled)
                                    Row(
                                      children: [
                                        Center(
                                          child: Text(
                                            (cabBookingConfirmationState
                                                        .cabBookingOrderStatus ==
                                                    CabBookingOrderStatus
                                                        .confirmed)
                                                ? 'cab_booking_confirmed'
                                                    .localize(context)
                                                : (cabBookingConfirmationState
                                                            .cabBookingOrderStatus ==
                                                        CabBookingOrderStatus
                                                            .scheduled)
                                                    ? 'cab_booking_scheduled'
                                                        .localize(context)
                                                    : cabBookingConfirmationState
                                                                .cabBookingOrderStatus ==
                                                            CabBookingOrderStatus
                                                                .pending
                                                        ? 'cab_booking_pending'
                                                            .localize(context)
                                                        : cabBookingConfirmationState
                                                                    .cabBookingOrderStatus ==
                                                                CabBookingOrderStatus
                                                                    .failed
                                                            ? 'cab_booking_failed'
                                                            : 'cab_booking_cancelled'
                                                                .localize(
                                                                context,
                                                              ),
                                            style: ADTextStyle700.size16
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background:
                              cabBookingConfirmationState.isFromPayment &&
                                      (cabBookingConfirmationState
                                              .cabBookingOrderStatus !=
                                          CabBookingOrderStatus.ontheway) &&
                                      (cabBookingConfirmationState
                                              .cabBookingOrderStatus !=
                                          CabBookingOrderStatus.completed)
                                  ? CabStatusHeaderAfterPaymentView(
                                      otp: cabBookingConfirmationState
                                              .cabOrderDetailResponseModel
                                              ?.bookingInfo
                                              ?.otp ??
                                          '',
                                      isKiosk: cabBookingConfirmationState
                                              .cabOrderDetailResponseModel
                                              ?.cabInfo
                                              ?.isKiosk ??
                                          false,
                                    )
                                  : CabStatusHeaderView(
                                      otp: cabBookingConfirmationState
                                              .cabOrderDetailResponseModel
                                              ?.bookingInfo
                                              ?.otp ??
                                          '',
                                      isKiosk: cabBookingConfirmationState
                                              .cabOrderDetailResponseModel
                                              ?.cabInfo
                                              ?.isKiosk ??
                                          false,
                                    ),
                        ),
                      ),
                    ],
                    body: RefreshIndicator(
                      color: context.adColors.neutralInfoMsg,
                      onRefresh: () => refreshOrderDetailScreen(),
                      child: Builder(
                        builder: (context) {
                          return CabBookingConfirmationBodyView(
                            cabBookingConfirmationState:
                                cabBookingConfirmationState,
                            isFromPayment:
                                cabBookingConfirmationState.isFromPayment,
                          );
                        },
                      ),
                    ),
                  ),
                );
              case Status.loading:
                return const CabBookingConfirmationShimmerView();
              case Status.error:
                return ADErrorPage(
                  message: value.orderDetailState?.message,
                  onPress: () => cabBookingConfirmationState
                      .getCabBookingOrderDetails(context: context),
                );

              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Future<void> refreshOrderDetailScreen() async {
    await cabBookingConfirmationState.getCabBookingOrderDetails(
      context: context,
      needToShowLoading: false,
    );
  }

  Color getBackGroundColor(innerBoxIsScrolled) {
    const pendingHeaderOpacity = 0.1000000014901161;
    return innerBoxIsScrolled
        ? context.adColors.whiteTextColor
        : cabBookingConfirmationState.isFromPayment &&
                (cabBookingConfirmationState.cabBookingOrderStatus !=
                    CabBookingOrderStatus.ontheway) &&
                (cabBookingConfirmationState.cabBookingOrderStatus !=
                    CabBookingOrderStatus.completed)
            ? (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.cancelled) ||
                    (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.failed)
                ? const Color(0xffdc464b)
                : cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.pending
                    ? const Color(0xffeb9845).withOpacity(pendingHeaderOpacity)
                    : context.adColors.greenColor
            : context.adColors.whiteTextColor;
  }
}
