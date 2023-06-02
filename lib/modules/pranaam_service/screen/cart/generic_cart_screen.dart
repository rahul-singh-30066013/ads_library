/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/no_record_found.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/ad_duty_free_shopping_cart_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_cart_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_shimmers/cart_shimmer.dart';
import 'package:adani_airport_mobile/modules/session/models/active_cart/response/get_active_cart_response_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class GenericCartScreen extends StatefulWidget {
  const GenericCartScreen({Key? key, this.isFromUpgrade = false})
      : super(key: key);
  final bool isFromUpgrade;

  @override
  State<GenericCartScreen> createState() => _GenericCartScreenState();
}

class _GenericCartScreenState extends State<GenericCartScreen> {
  AppSessionState appSessionState = AppSessionState();
  ScrollController? scrollController;

  @override
  void initState() {
    ScreenEvents.cart_screen.log();
    // TODO: implement initState
    context.read<AppSessionState>().activeCartResponseState =
        ADResponseState.loading();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<AppSessionState>().getActiveGeneralCart();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color _closeIconColor = Color(0xff333333);

    return Scaffold(
      body: Selector<AppSessionState, int>(
        selector: (_, provider) => provider.cartCount,
        builder: (context, addItemListLength, child) {
          final int count = context.read<AppSessionState>().cartCount;
          return SliverAppBarBaseComponent(
            title: 'cart'.localize(context),
            actions: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: context.k_16),
                child: Text(
                  'step_1/3'.localize(context).toUpperCase(),
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            optionTitle: count > 0 ? '(${count.toString()})' : '',
            optionTitleTextStyle: ADTextStyle700.size32
                .setTextColor(context.adColors.blackTextColor),
            optionalLeadingTitleTextStyle: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
            appBarLeftPadding: context.k_4,
            flexibleTitleTopPadding: context.k_20,
            titleTextStyle: ADTextStyle700.size32
                .setTextColor(context.adColors.blackTextColor),
            leadingTitleTextStyle: ADTextStyle700.size22,
            closeScreenWidget: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.all(context.k_12),
                child: SvgPicture.asset(
                  SvgAssets.closeIcon,
                  height: context.k_14,
                  width: context.k_14,
                  color: _closeIconColor,
                ),
              ),
            ),
            body: Builder(
              builder: (BuildContext context) {
                scrollController ??= PrimaryScrollController.of(context);
                return RefreshIndicator(
                  color: context.adColors.blackColor,
                  onRefresh: () async =>
                      context.read<AppSessionState>().getActiveGeneralCart(),
                  child: Selector<AppSessionState, ADResponseState?>(
                    selector: (context, viewModel) =>
                        viewModel.activeCartResponseState,
                    builder: (context, activeCartResponse, child) {
                      switch (activeCartResponse?.viewStatus) {
                        case Status.complete:
                          final GetActiveCartResponseModel
                              activeCartResponseModel =
                              activeCartResponse?.data;
                          if (activeCartResponseModel.businessSubType ==
                                  'Pranaam' ||
                              activeCartResponseModel.businessSubType ==
                                  'pranaam') {
                            return CartScreen(
                              isFromUpgrade: widget.isFromUpgrade,
                              showTopBar: false,
                              scrollController: scrollController,
                            );
                          } else if (activeCartResponseModel.businessSubType ==
                                  'dutyFree' ||
                              activeCartResponseModel.businessSubType ==
                                  'Dutyfree') {
                            return ADDutyFreeShoppingCartScreen(
                              controller: scrollController,
                            );
                          } else {
                            return buildNoRecordFound();
                          }
                        case Status.loading:
                          return context.read<AppSessionState>().cartType ==
                                  CartType.dutyFree
                              ? const DutyFreeCartShimmer()
                              : const CartShimmer();
                        case Status.error:
                          return buildNoRecordFound();
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  NoRecordFound buildNoRecordFound() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<AppSessionState>().clearPranaamCartLocally();
        context.read<AppSessionState>().clearDutyFreeCartLocally(context);
      },
    );

    return NoRecordFound(
      errorMessage: 'your_cart_looks_empty'.localize(context),
      subTitleError: 'lets_fill_it_with_some_goodness'.localize(context),
      buttonText: 'start_shopping'.localize(context),
      imagePath: 'lib/assets/gif/empty_cart.gif',
    );
  }

  void showSnackBar(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'some_thing_went_wrong'.localize(context),
    );
  }
}
