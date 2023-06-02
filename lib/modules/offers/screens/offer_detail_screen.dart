/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_detail.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

final double shimmerHeight_70 = 56.sp;
final double shimmerHeight_350 = 350.sp;
final double shimmerHeight_120 = 120.sp;
final double containerHorizontalMargin_12 = 12.sp;
final double shimmerHeight_196 = 196.sp;

class OfferDetailScreen extends StatefulWidget {
  const OfferDetailScreen({
    Key? key,
    required this.offerUniqueID,
    required this.offerTitle,
    this.isComingFromSheet = false,
    this.showBookNowButton = true,
    this.fetchDataFromPromoCode = false,
    this.airportPrefixName,
  }) : super(key: key);
  final String offerUniqueID;
  final String offerTitle;
  final bool isComingFromSheet;
  final bool showBookNowButton;
  final bool fetchDataFromPromoCode;
  final String? airportPrefixName;

  @override
  State<OfferDetailScreen> createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends State<OfferDetailScreen> {
  final OffersStateManagement _offersStateManagement = OffersStateManagement();

  @override
  void initState() {
    _offersStateManagement.getOfferDetail(
      widget.offerUniqueID,
      isUnlockOffer: widget.isComingFromSheet,
      fetchDataFromPromoCode: widget.fetchDataFromPromoCode,
      airportPrefixNameValue: widget.airportPrefixName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.isComingFromSheet
          ? AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: Text(
                widget.offerTitle,
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.blackTextColor),
              ),
              backgroundColor: Colors.transparent,
              leading: const BackButton(),
              elevation: 0,
            )
          : null,
      body: ADSelectorStateLessWidget<OffersStateManagement>(
        key: const Key('Detail'),
        viewModel: _offersStateManagement,
        child: Selector<OffersStateManagement, ADResponseState>(
          selector: (context, viewModel) => viewModel.offersDetailState,
          builder: (context, value, Widget? child) {
            switch (value.viewStatus) {
              case Status.loading:
                return const Center(
                  child: OfferDetailShimmer(),
                );
              case Status.error:
                return Center(child: Text(value.message.toString()));
              case Status.complete:
                if ((value.data as OfferItems).result.isNotEmpty) {
                  final widgetItem = (value.data as OfferItems).result.first;
                  return OfferDetail(
                    item: widgetItem,
                    isComingFromSheet: widget.isComingFromSheet,
                    showBookNowButton: widget.showBookNowButton,
                    fetchDataFromPromoCode: widget.fetchDataFromPromoCode,
                  );
                } else {
                  return const Center(child: Text('No Offer Available'));
                }
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}

class OfferDetailShimmer extends StatelessWidget {
  const OfferDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.whiteTextColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            width: context.widthOfScreen,
            height: shimmerHeight_120,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_30,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            width: context.widthOfScreen,
            height: shimmerHeight_350,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
        ],
      ),
    );
  }
}
