/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_screen_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/pranaam_cart_empty.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_shimmers/cart_shimmer.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({Key? key, required this.state}) : super(key: key);
  final CartScreenController state;

  @override
  Widget build(BuildContext context) {
    return Selector<PranaamAppDataStateManagement, ADResponseState>(
      selector: (context, viewModel) => viewModel.responseState,
      builder: (context, value, child) {
        switch (value.viewStatus) {
          case Status.complete:
            final GetCartResponseModel? getCartResponseModel = value.data;
            final CartResponse? cartResponse =
                getCartResponseModel?.cartResponse;
            return getCartResponseModel == null
                ? const PranaamCartEmpty()
                : cartResponse?.pranaamBookingType.toLowerCase() ==
                        'reschedulebooking'
                    ? const PranaamCartEmpty()
                    : CartScreenView(
                        cartScreenController: state,
                        cartResponse: cartResponse,
                      );
          case Status.loading:
            return const CartShimmer();
          //   const Center(
          //   child: ADDotProgressView(),
          // );
          case Status.none:
            return const PranaamCartEmpty();
          default:
            return const PranaamCartEmpty();
        }
      },
    );
  }
}
