/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/duty_free_linkify.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_promotion_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/product_detail_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/duty_free_story_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/similar_sold_product_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/build_button.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_bank_offer_section.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/product_detail/product_detail_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/json_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const double k_42 = 42;
const int k_52 = 52;
const double k_80 = 80;
const double k_131 = 131;
// const double k_314 = 314;
const duration = 6;
const radius = 75;
const singleImageHeight = 0.4;
const storyImageHeight = 0.7;
const specificationWeight = 2;
const lineHeight = 1.4;
const promotionType = 3;
const double topHeight = 74;
const double backgroundOpacity = 0.1000000014901161;

/// This class will used to represent ProductDetailDutyFreeScreen.
///Product detail screen for duty free items
class ProductDetailDutyFreeScreen extends StatefulWidget {
  /// this model use to show selected product data.
  final DealProductModel dealProductModel;

  const ProductDetailDutyFreeScreen({
    Key? key,
    required this.dealProductModel,
  }) : super(key: key);

  @override
  State<ProductDetailDutyFreeScreen> createState() =>
      _ProductDetailDutyFreeScreenState();
}

class _ProductDetailDutyFreeScreenState
    extends State<ProductDetailDutyFreeScreen> with TickerProviderStateMixin {
  /// *[controllers] is used to animate the ExpansionTile trailing icon
  List<AnimationController> controllers = [];

  CatalogListResponseModel? pdpPageResponse;

  List<Content> specificationList = [];
  List<Content> otherList = [];

  /// *[expansionTileSelectionCounter] used to manage the expand/collapse position on scroll of ExpansionTile.
  List<bool> expansionTileSelectionCounter = [];
  int selectedRadio = 0;
  ProductDetailState productDetailViewModel = ProductDetailState();

  /// scroll controller to track scroll position
  final ScrollController _scrollController = ScrollController();

// adding notifier to notify the change in header opacity
  ValueNotifier<bool> headerOpacity = ValueNotifier(true);

// app bar height
//   final double _appBarHeight = 50.sp;

// const value to compare opacity and change header opacity
//   final int _compareOffsetTo = 300;

  ValueNotifier<bool> fabIsVisible = ValueNotifier<bool>(true);
  List<DutyFreeProductPromotionModel> promotionData =
      List.empty(growable: true);
  final expansionTileLength = 4;
  var showAll = false;
  final length = 246;
  int descriptionMinLines = 6;
  int descriptionMaxLine = 100000;
  int pageIndex = 0;
  List<WidgetItem>? offers;
  bool offersLoading = true;

  void arrowRotation(int count) {
    // adLog(expansionTileSelectionCounter.first.toString());
    expansionTileSelectionCounter[count] =
        !expansionTileSelectionCounter[count];
    // adLog(expansionTileSelectionCounter.first.toString());
    final TickerFuture? ticker = expansionTileSelectionCounter[count]
        ? controllers[count].forward(from: 0)
        : controllers[count].reverse(from: 1);
    adLog(ticker.toString());
  }

  String loremIpsum =
      'a) In case, the buyer cancels the order online before the product has been shipped, the entire order amount will be refunded. \nb) In case the item ordered has been shipped but has not yet been delivered to the buyer, the order can still be cancelled online. Total order amount after deduction of shipment and handling charges will be refunded. The refund will be processed, once NDR receives the originally ordered item back intact from the courier.\nc) However, the order once delivered cannot be cancelled in any case.\nd) In case there is an option for online download of data than cancellation will not be possible.';

  @override
  void initState() {
    ScreenEvents.product_detail_screen.log();
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    context.read<DutyFreeState>().dealProductModel = widget.dealProductModel;
    final DutyFreeProductListRequest request = DutyFreeProductListRequest(
      airportCode: widget.dealProductModel.airportCode ??
          selectedAirportsData?.airportCode ??
          '',
      skuCode: [
        widget.dealProductModel.item?.skuCode ??
            widget.dealProductModel.skuCode ??
            '',
      ],
      // skuCode: ['02N03231'],
      materialGroup: widget.dealProductModel.item?.materialGroup ?? '',
      language: 'en',
      storeType: widget.dealProductModel.storeType ??
          ((widget.dealProductModel.item?.storeType.isEmpty ?? true)
              ? dutyFreeState.terminalModel.value.code
              : (widget.dealProductModel.item?.storeType ??
                  dutyFreeState.terminalModel.value.code)),
    );
    // final DutyFreeProductListRequest request =
    //     dutyFreeState.dutyFreeProductListRequest?.copyWith(
    //           skuCode: [],
    //         ) ??
    //         const DutyFreeProductListRequest();
    adLog('Cascade consecutive method invocations on the same reference.');
    dutyFreeState.pdpStatus = Status.loading;
    adLog('Cascade consecutive method invocations on the same reference.');
    getPdpResponse(
      context,
      request,
    );

    for (int counter = 0; counter < expansionTileLength; counter++) {
      expansionTileSelectionCounter.add(true);
      controllers.add(
        AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      );
    }

    productDetailViewModel.getProductDetails(JsonAssets.productDetailDutyFree);

    /// adding listener to scroll controller to track scroll position

    _scrollController.addListener(() {
      fabIsVisible.value = _scrollController.position.userScrollDirection ==
          ScrollDirection.forward;

      headerOpacity.value = _scrollController.position.pixels <
          (context.heightOfScreen * singleImageHeight);
    });

    otherList.add(
      Content(
        type: 'GSTIN',
        content: widget.dealProductModel.item?.gstin ?? '',
      ),
    );
    adLog('');
    otherList.add(
      Content(
        type: 'Barcode',
        content: widget.dealProductModel.item?.productBarcodeNumber ?? '',
      ),
    );
    adLog('');
    otherList.add(
      Content(
        type: 'Target Market',
        content: widget.dealProductModel.item?.targetMarket ?? '',
      ),
    );

    specificationList.add(
      Content(
        type: 'Brand',
        content: widget.dealProductModel.item?.brand ?? '',
      ),
    );
    adLog('');
    // specificationList.add(
    //   Content(
    //     type: 'Country Of Origin',
    //     content: widget.dealProductModel.item?.countryOfOrigin ?? '',
    //   ),
    // );
    adLog('');
    if ((num.tryParse(widget.dealProductModel.item?.skuSize ?? '0.00') ?? 0) >
        0) {
      specificationList.add(
        Content(
          type: 'Size',
          content: '${Utils.removeExtraZeros(
            widget.dealProductModel.item?.skuSize ?? '0.00',
          )} ${widget.dealProductModel.item?.skuUnit}'
              .trim(),
        ),
      );
    }
    adLog('');
    // if (widget.dealProductModel.catalogType == 'Liquor') {
    //   specificationList.add(
    //     Content(
    //       type: 'Alcohol',
    //       content: widget.dealProductModel.item?.productLiquorAlchohol ?? '',
    //     ),
    //   );
    // }
    final List<DutyFreeProductPromotionModel> promotions =
        widget.dealProductModel.item?.promotions ?? [];
    promotionData.addAll(promotions);

    if (widget.dealProductModel.skuCode?.isEmpty ?? true) {
      // dutyFreeState.repository
      //     .getDutyFreebankOffers(dutyFreeState)
      //     .then((List<DutyFreeProductPromotionModel> value) {
      //   promotionData.addAll(value);
      // });
      final List<String> productImages =
          widget.dealProductModel.item?.productImages ?? [];
      for (int count = 0; count < productImages.length; count++) {
        if (productImages[count].contains('Dutyfree')) {
          stories.add(
            DutyStory(
              url:
                  '${Environment.instance.configuration.cmsImageBaseUrl}${productImages[count]}',
              mediaType: DutyFreeStoryScreen.image,
              duration: duration,
              timeStamp: widget.dealProductModel.item?.timeStamp,
              headerOpacity: headerOpacity,
            ),
          );
        } else {
          stories.add(
            DutyStory(
              url: Environment.instance.configuration.cmsImageBaseUrl,
              mediaType: DutyFreeStoryScreen.image,
              duration: duration,
              timeStamp: widget.dealProductModel.item?.timeStamp,
              headerOpacity: headerOpacity,
            ),
          );
        }
      }
    }

    // ?placeholderName=main&item=/sitecore/content/AirportHome/DutyfreeHome/BankOffers&sc_lang=en&sc_apikey=%7BB5AC63B3-9934-4423-8FF9-F619303AC8DF%7D&isApp=false
    if (widget.dealProductModel.item != null) {
      dutyFreeState.dutyFreeEventState.viewItemEvent(
        widget.dealProductModel.item ?? const DutyFreeProductDataModel(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    fabIsVisible.dispose();
    headerOpacity.dispose();
  }

  final List<DutyStory> stories = [];

  @override
  Widget build(BuildContext context) {
    bool isExclusive = widget.dealProductModel.item?.isExclusive ?? false;
    bool isPromotionsNotEmpty =
        widget.dealProductModel.item?.promotions.isNotEmpty ?? false;
    adLog('isPromitions => $isPromotionsNotEmpty');
    adLog('isExclusive => $isExclusive');
    final RegExp regex = RegExp(r'([.]+0*)(?!.*\d)');
    // const double aspectRatio = 1.25;
    const double fixedContainerHeight = 338;
    return Consumer<DutyFreeState>(
      builder: (context, model, child) {
        final String productDescription =
            widget.dealProductModel.item?.skuDescription ?? '';
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              kToolbarHeight,
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: kToolbarHeight,
              leading: const BackButton(
                key: Key(
                  ProductDetailAutomationKeys.backKey,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: const [
                // IconButton(
                //   key: const Key(
                //     ProductDetailAutomationKeys.searchKey,
                //   ),
                //   onPressed: () => adLog('test'),
                //   icon: const Icon(
                //     Icons.search,
                //   ),
                // ),
                // IconButton(
                //   key: const Key(
                //     ProductDetailAutomationKeys.shareKey,
                //   ),
                //   onPressed: () => adLog('test'),
                //   icon: const Icon(
                //     Icons.share,
                //   ),
                // ),
              ],
            ),
          ),
          body: Stack(
            children: [
              ((widget.dealProductModel.skuCode?.isNotEmpty ?? false) &&
                      pdpPageResponse == null)
                  ? SafeArea(
                      bottom: false,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: context.k_16),
                          child: Column(
                            //
                            children: [
                              ADShimmerWidget.shimmerShape(
                                type: ShimmerType.rectangleBox,
                                rectanglePadding: EdgeInsets.zero,
                                width: context.widthOfScreen,
                                height:
                                    context.heightOfScreen * singleImageHeight,
                              ),
                              ADSizedBox(
                                height: context.k_40,
                              ),
                              ADShimmerWidget.shimmerShape(
                                type: ShimmerType.rectangleBox,
                                rectanglePadding: EdgeInsets.zero,
                                width: context.widthOfScreen,
                                height: context.k_26,
                              ),
                              ADSizedBox(
                                height: context.k_16,
                              ),
                              ADShimmerWidget.shimmerShape(
                                type: ShimmerType.rectangleBox,
                                rectanglePadding: EdgeInsets.zero,
                                width: context.widthOfScreen,
                                height: context.k_64,
                              ),
                              ADSizedBox(
                                height: context.k_16,
                              ),
                              ADShimmerWidget.shimmerShape(
                                type: ShimmerType.rectangleBox,
                                rectanglePadding: EdgeInsets.zero,
                                width: context.widthOfScreen,
                                height: context.k_26,
                              ),
                              ADSizedBox(
                                height: context.k_16,
                              ),
                              ADShimmerWidget.shimmerShape(
                                type: ShimmerType.rectangleBox,
                                rectanglePadding: EdgeInsets.zero,
                                width: context.widthOfScreen,
                                height: context.k_26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : ((widget.dealProductModel.skuCode?.isNotEmpty ?? false) &&
                          (pdpPageResponse?.result.isEmpty ?? true))
                      ? NoDataFoundErrorScreen(
                          errorTitle: 'no_product_found_msg'.localize(context),
                        )
                      : SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                // padding: EdgeInsets.symmetric(horizontal: context.k_16),
                                children: [
                                  if (stories.isEmpty)
                                    const SizedBox.shrink()
                                  else if (stories.length == 1 &&
                                      stories.first.mediaType ==
                                          DutyFreeStoryScreen.image)
                                    GestureDetector(
                                      onTap: () =>
                                          pushDutyFreeViewProductImage(),
                                      child: Container(
                                        height: fixedContainerHeight,
                                        // height:fixedContainerHeight,
                                        // height:
                                        //     context.heightOfScreen * singleImageHeight,
                                        child: stories.first.mediaType ==
                                                DutyFreeStoryScreen.image
                                            ? ValueListenableBuilder<bool>(
                                                valueListenable: headerOpacity,
                                                builder: (
                                                  BuildContext context,
                                                  value,
                                                  Widget? child,
                                                ) =>
                                                    HeroMode(
                                                  enabled: value,
                                                  child: child ??
                                                      Hero(
                                                        tag: widget
                                                                .dealProductModel
                                                                .timeStamp ??
                                                            '',
                                                        child: ADCachedImage(
                                                          height: context
                                                                  .heightOfScreen *
                                                              singleImageHeight,
                                                          width: context
                                                              .widthOfScreen,
                                                          imageUrl:
                                                              stories.first.url,
                                                          boxFit:
                                                              BoxFit.contain,
                                                        ),
                                                      ),
                                                ),
                                                child: Hero(
                                                  tag: widget.dealProductModel
                                                          .timeStamp ??
                                                      '',
                                                  child: ADCachedImage(
                                                    height:
                                                        context.heightOfScreen *
                                                            singleImageHeight,
                                                    width:
                                                        context.widthOfScreen,
                                                    imageUrl: stories.first.url,
                                                    boxFit: BoxFit.contain,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    )
                                  else
                                    Container(
                                      height: fixedContainerHeight,
                                      // height: context.heightOfScreen * storyImageHeight,
                                      child: GestureDetector(
                                        onTap: () =>
                                            pushDutyFreeViewProductImage(),
                                        child: DutyFreeStory(
                                          onPageChanged: (index) =>
                                              pageIndex = index,
                                          onImageTap: () =>
                                              pushDutyFreeViewProductImage(),
                                          key: const Key(
                                            ProductDetailAutomationKeys
                                                .storyViewKey,
                                          ),
                                          stories: stories,
                                          isContainType: true,
                                          barFillColor: context.adColors.black,
                                          barColor:
                                              context.adColors.greyReviewShade,
                                          headerOpacity: headerOpacity,
                                        ),
                                      ),
                                    ),
                                  ADSizedBox(
                                    height: context.k_40,
                                  ),
                                  if (isExclusive && !isPromotionsNotEmpty)
                                    // if ((widget
                                    //         .dealProductModel.item?.newArrival) ??
                                    //     false)
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Opacity(
                                          opacity: backgroundOpacity,
                                          child: Container(
                                            width: k_80,
                                            height: context.k_24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              color: context
                                                  .adColors.adLogoGradient4,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'exclusive'.localize(context),
                                          style: ADTextStyle700.size12.copyWith(
                                            color: context
                                                .adColors.adLogoGradient4,
                                          ),
                                        ),
                                      ],
                                    ).paddingBySide(
                                      bottom: isExclusive ? context.k_16 : 0,
                                    ),
                                  if (isPromotionsNotEmpty && isExclusive)
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Opacity(
                                          opacity: backgroundOpacity,
                                          child: Container(
                                            width: k_131,
                                            height: context.k_24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              color: context
                                                  .adColors.adLogoGradient4,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${'exclusive'.localize(context)} + ${'offer'.localize(context)}',
                                          style: ADTextStyle700.size12.copyWith(
                                            color: context
                                                .adColors.adLogoGradient4,
                                          ),
                                        ),
                                      ],
                                    ).paddingBySide(
                                      bottom: isExclusive ? context.k_16 : 0,
                                    ),
                                  Text(
                                    widget.dealProductModel.item?.skuName
                                            .validateWithDefaultValue() ??
                                        '',
                                    style: ADTextStyle700.size18.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_16,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: ADTextStyle700.size16,
                                      children: [
                                        TextSpan(
                                          text: FlightUtils
                                              .getPriceFormatWithSymbol(
                                            price: ((((widget.dealProductModel
                                                                            .item?.promotions.isNotEmpty ??
                                                                        false) &&
                                                                    widget
                                                                            .dealProductModel
                                                                            .item
                                                                            ?.promotions
                                                                            .first
                                                                            .type !=
                                                                        promotionType &&
                                                                    widget
                                                                            .dealProductModel
                                                                            .item
                                                                            ?.promotions
                                                                            .first
                                                                            .quantity ==
                                                                        1
                                                                ? widget
                                                                    .dealProductModel
                                                                    .item
                                                                    ?.promotions
                                                                    .first
                                                                    .discountPrice
                                                                : 0) ??
                                                            0) >
                                                        0
                                                    ? widget
                                                        .dealProductModel
                                                        .item
                                                        ?.promotions
                                                        .first
                                                        .discountPrice
                                                        .toDouble()
                                                    : widget.dealProductModel
                                                        .item?.price
                                                        .toDouble()) ??
                                                0,
                                          ),
                                          style: ADTextStyle700.size16
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                        if (widget.dealProductModel.item
                                                    ?.discountPrice !=
                                                0 &&
                                            widget.dealProductModel.item
                                                    ?.discountPrice !=
                                                widget.dealProductModel.item
                                                    ?.price)
                                          const TextSpan(
                                            text: '  ',
                                          ),
                                        if ((widget.dealProductModel.item?.promotions.isNotEmpty ??
                                                false) &&
                                            widget.dealProductModel.item
                                                    ?.promotions.first.quantity ==
                                                1 &&
                                            widget.dealProductModel.item
                                                    ?.promotions.first.type !=
                                                promotionType &&
                                            widget
                                                    .dealProductModel
                                                    .item
                                                    ?.promotions
                                                    .first
                                                    .discountPrice !=
                                                widget.dealProductModel.item
                                                    ?.price &&
                                            widget
                                                    .dealProductModel
                                                    .item
                                                    ?.promotions
                                                    .first
                                                    .discountPrice !=
                                                0)
                                          TextSpan(
                                            text: FlightUtils
                                                .getPriceFormatWithSymbol(
                                              price: widget.dealProductModel
                                                      .item?.price
                                                      .toDouble() ??
                                                  0,
                                            ),
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.greyTextColor,
                                                )
                                                .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                          ),
                                        if ((widget.dealProductModel.item
                                                        ?.promotions.length ??
                                                    0) ==
                                                1 &&
                                            widget
                                                    .dealProductModel
                                                    .item
                                                    ?.promotions
                                                    .first
                                                    .quantity ==
                                                1 &&
                                            widget.dealProductModel.item
                                                    ?.promotions.first.type ==
                                                1)
                                          const TextSpan(
                                            text: '',
                                          ),
                                        if ((widget.dealProductModel.item
                                                    ?.promotions.isNotEmpty ??
                                                false) &&
                                            widget
                                                    .dealProductModel
                                                    .item
                                                    ?.promotions
                                                    .first
                                                    .quantity ==
                                                1 &&
                                            widget.dealProductModel.item
                                                    ?.promotions.first.type ==
                                                1)
                                          TextSpan(
                                            text:
                                                '  ${(double.tryParse(widget.dealProductModel.item?.promotions.first.offer ?? '') ?? 0).toInt().toString().replaceAll(regex, '')}${'offLabel'.localize(context)}',
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                              context.adColors.priceOffGreen,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  pdpPageResponse != null
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              SvgAssets.cartLocationIcon,
                                              width: context.k_12,
                                              height: context.k_16,
                                              color: context
                                                  .adColors.greyTextColor,
                                            ).paddingBySide(top: context.k_10),
                                            ADSizedBox(
                                              width: context.k_12,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '${'pickup'.localize(context)} : ',
                                                          style: ADTextStyle400
                                                              .size14
                                                              .setTextColor(
                                                                context.adColors
                                                                    .blackTextColor,
                                                              )
                                                              .copyWith(
                                                                  height:
                                                                      context
                                                                          .k_2),
                                                        ),
                                                        TextSpan(
                                                          text: pdpPageResponse
                                                                  ?.store ??
                                                              '',
                                                          style: ADTextStyle500
                                                              .size14
                                                              .setTextColor(
                                                            context.adColors
                                                                .blackTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: context.k_4),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      context.k_8,
                                                      context.k_4,
                                                      context.k_8,
                                                      context.k_4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  context.k_4)),
                                                      color: const Color(
                                                          0xffffd866),
                                                    ),
                                                    child: Text(
                                                      pdpPageResponse
                                                              ?.collectionPoint ??
                                                          '',
                                                      style: ADTextStyle500
                                                          .size14
                                                          .setTextColor(
                                                        context.adColors
                                                            .blackTextColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(top: context.k_10)
                                      : ADSizedBox(
                                          height: 70.sp,
                                          child: ListView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            primary: false,
                                            shrinkWrap: true,
                                            children: [
                                              ADShimmerWidget.shimmerShape(
                                                height: context.k_26,
                                                width: double.infinity,
                                                type: ShimmerType.squareBox,
                                              ),
                                              ADSizedBox(
                                                height: context.k_4,
                                              ),
                                              ADShimmerWidget.shimmerShape(
                                                height: context.k_26,
                                                width: double.infinity,
                                                type: ShimmerType.squareBox,
                                              ),
                                            ],
                                          ),
                                        ).paddingBySide(
                                          top: context.k_20,
                                        ),
                                  LoyaltyPointsComponent(
                                    points: widget.dealProductModel.item
                                            ?.loyaltyPoints ??
                                        0,
                                  ).paddingBySide(top: context.k_20),

                                  if ((offers?.isEmpty ?? true) &&
                                      offersLoading)
                                    ListView(
                                      primary: false,
                                      shrinkWrap: true,
                                      children: [
                                        ADSizedBox(
                                          height: context.k_20,
                                        ),
                                        ADShimmerWidget.shimmerShape(
                                          height: context.k_26,
                                          type: ShimmerType.squareBox,
                                        ),
                                        ADSizedBox(
                                          height: context.k_20,
                                        ),
                                        ADShimmerWidget.shimmerShape(
                                          height: context.k_56,
                                          type: ShimmerType.squareBox,
                                        ),
                                      ],
                                    ),
                                  if (offers?.isNotEmpty ?? false)
                                    DutyFreeBankOfferSection(
                                      offerList: offers ?? [],
                                    ),

                                  //                     ValueListenableBuilder(
                                  //                       valueListenable: model.bankOfferStatus,
                                  //                       child: const SizedBox(),
                                  //                       builder: (
                                  //                         context,
                                  //                         Status status,
                                  //                         child,
                                  //                       ) =>
                                  //                           status == Status.loading
                                  //                               ? ListView(
                                  //                                   primary: false,
                                  //                                   shrinkWrap: true,
                                  //                                   children: [
                                  //                                     ADSizedBox(
                                  //                                       height: context.k_20,
                                  //                                     ),
                                  //                                     ADShimmerWidget.shimmerShape(
                                  //                                       height: context.k_26,
                                  //                                       type: ShimmerType.squareBox,
                                  //                                     ),
                                  //                                     ADSizedBox(
                                  //                                       height: context.k_20,
                                  //                                     ),
                                  //                                     ADShimmerWidget.shimmerShape(
                                  //                                       height: context.k_56,
                                  //                                       type: ShimmerType.squareBox,
                                  //                                     ),
                                  //                                   ],
                                  //                                 )
                                  //                               : promotionData.isNotEmpty
                                  //                                   ?const SizedBox()
                                  //                                   : const SizedBox(),
                                  //
                                  //
                                  // ),
                                  // if (promotionData.value.isNotEmpty)
                                  //   ,

                                  if (specificationList.isNotEmpty)
                                    Divider(
                                      color: context.adColors.dividerColor,
                                      thickness: 1,
                                    ).paddingBySide(
                                      top: context.k_20,
                                      bottom: context.k_30,
                                    ),
                                  // if (specificationList.isNotEmpty)
                                  if (widget.dealProductModel.item
                                          ?.specifications.isNotEmpty ??
                                      false) ...[
                                    Text(
                                      'specifications'.localize(context),
                                      style: ADTextStyle600.size18.setTextColor(
                                        context.adColors.storyViewBarFillColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    // if (specificationList.isNotEmpty)
                                    ADSizedBox(
                                      height: context.k_10,
                                    ),
                                    // if (!specificationList.isNotEmpty)
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.dealProductModel.item
                                              ?.specifications.length ??
                                          0,
                                      padding: EdgeInsets.only(
                                        top: context.k_10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget
                                                            .dealProductModel
                                                            .item
                                                            ?.specifications[
                                                                index]
                                                            .key ??
                                                        'no_Data'
                                                            .localize(context),
                                                    style: ADTextStyle600.size16
                                                      ..setTextColor(
                                                        context.adColors
                                                            .blackTextColor,
                                                      ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: specificationWeight,
                                                  child: Text(
                                                    widget
                                                            .dealProductModel
                                                            .item
                                                            ?.specifications[
                                                                index]
                                                            .value ??
                                                        '00',
                                                    style: ADTextStyle400.size16
                                                      ..setTextColor(
                                                        context.adColors
                                                            .blackTextColor,
                                                      ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                        height: context.k_16,
                                      ),
                                    ),
                                    if (widget.dealProductModel.item
                                            ?.skuDescription.isNotEmpty ??
                                        false)
                                      Divider(
                                        color: context.adColors.dividerColor,
                                        thickness: 1,
                                      ).paddingBySide(
                                        top: context.k_30,
                                        bottom: context.k_30,
                                      ),
                                  ],
                                  Text(
                                    'description'.localize(context),
                                    style: ADTextStyle600.size18.setTextColor(
                                      context.adColors.storyViewBarFillColor,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_20,
                                  ),
                                  StatefulBuilder(
                                    builder: (context, state) => RichText(
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: productDescription.length >
                                                        length &&
                                                    !showAll
                                                ? '${productDescription.substring(0, length)}...'
                                                : productDescription,
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                              context.adColors.neutralInfoMsg,
                                            ),
                                          ),
                                          if (productDescription.length >
                                              length)
                                            WidgetSpan(
                                              child: GestureDetector(
                                                onTap: () => state(
                                                    () => showAll = !showAll),
                                                child: Text(
                                                  showAll
                                                      ? ' read less'
                                                      : ' read more',
                                                  style: ADTextStyle400.size16
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            )
                                          else
                                            const TextSpan(),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ADSizedBox(
                                    height: context.k_20,
                                  ),
                                  if (widget.dealProductModel.item?.benefits
                                          ?.isNotEmpty ??
                                      false)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'benefits'.localize(context),
                                          style: ADTextStyle600.size16
                                              .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_10,
                                        ),
                                        ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: context.k_6,
                                            );
                                          },
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: widget.dealProductModel
                                                  .item?.benefits?.length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: context.k_6,
                                                  width: context.k_6,
                                                  margin: EdgeInsets.only(
                                                    left: context.k_4,
                                                    right: context.k_6,
                                                    top: context.k_6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: context.adColors
                                                        .darkGreyTextColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    (widget
                                                            .dealProductModel
                                                            .item
                                                            ?.benefits?[index] ??
                                                        ''),
                                                    style: ADTextStyle400.size16
                                                        .setTextColor(
                                                      context.adColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        ADSizedBox(
                                          height: context.k_20,
                                        ),
                                      ],
                                    ),

                                  if (widget.dealProductModel.item
                                          ?.productHighlights?.isNotEmpty ??
                                      false)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'product_highlights'
                                              .localize(context),
                                          style: ADTextStyle600.size16
                                              .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_10,
                                        ),
                                        ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: context.k_6,
                                            );
                                          },
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: widget
                                                  .dealProductModel
                                                  .item
                                                  ?.productHighlights
                                                  ?.length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: context.k_6,
                                                  width: context.k_6,
                                                  margin: EdgeInsets.only(
                                                    left: context.k_4,
                                                    right: context.k_6,
                                                    top: context.k_6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: context.adColors
                                                        .darkGreyTextColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    (widget.dealProductModel.item
                                                                ?.productHighlights?[
                                                            index] ??
                                                        ''),
                                                    style: ADTextStyle400.size16
                                                        .setTextColor(
                                                      context.adColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        ADSizedBox(
                                          height: context.k_20,
                                        ),
                                      ],
                                    ),

                                  if (widget.dealProductModel.item
                                          ?.keyIngredients?.isNotEmpty ??
                                      false)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'key_ingredients'.localize(context),
                                          style: ADTextStyle600.size16
                                              .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_10,
                                        ),
                                        ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: context.k_6,
                                            );
                                          },
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: widget
                                                  .dealProductModel
                                                  .item
                                                  ?.keyIngredients
                                                  ?.length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: context.k_6,
                                                  width: context.k_6,
                                                  margin: EdgeInsets.only(
                                                    left: context.k_4,
                                                    right: context.k_6,
                                                    top: context.k_6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: context.adColors
                                                        .darkGreyTextColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    (widget.dealProductModel.item
                                                                ?.keyIngredients?[
                                                            index] ??
                                                        ''),
                                                    style: ADTextStyle400.size16
                                                        .setTextColor(
                                                      context.adColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),

                                  if (widget.dealProductModel.item?.howToUse
                                          ?.isNotEmpty ??
                                      false)
                                    Divider(
                                      color: context.adColors.dividerColor,
                                      thickness: 1,
                                    ).paddingBySide(
                                      top: context.k_30,
                                      bottom: context.k_30,
                                    ),

                                  if (widget.dealProductModel.item?.howToUse
                                          ?.isNotEmpty ??
                                      false)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'how_to_use'.localize(context),
                                          style: ADTextStyle600.size18
                                              .setTextColor(
                                            context
                                                .adColors.storyViewBarFillColor,
                                          ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_20,
                                        ),
                                        if (widget.dealProductModel.item
                                                ?.howToUse?.isNotEmpty ??
                                            false)
                                          Text(
                                            widget.dealProductModel.item
                                                    ?.howToUse ??
                                                '',
                                            style: ADTextStyle400.size16,
                                          ),
                                        if (widget.dealProductModel.item
                                                ?.howToUse?.isNotEmpty ??
                                            false)
                                          ADSizedBox(
                                            height: context.k_10,
                                          ),
                                        ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: context.k_6,
                                            );
                                          },
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: widget.dealProductModel
                                                  .item?.safety?.length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: context.k_6,
                                                  width: context.k_6,
                                                  margin: EdgeInsets.only(
                                                    left: context.k_4,
                                                    right: context.k_6,
                                                    top: context.k_6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: context.adColors
                                                        .darkGreyTextColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    (widget
                                                            .dealProductModel
                                                            .item
                                                            ?.safety?[index] ??
                                                        ''),
                                                    style: ADTextStyle400.size16
                                                        .setTextColor(
                                                      context.adColors
                                                          .storyViewBarFillColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  if (widget.dealProductModel.item?.otherDetails
                                          .isNotEmpty ??
                                      false) ...[
                                    if (widget.dealProductModel.item
                                            ?.skuDescription.isNotEmpty ??
                                        false)
                                      Divider(
                                        color: context.adColors.dividerColor,
                                        thickness: 1,
                                      ).paddingBySide(
                                        top: context.k_30,
                                        bottom: context.k_30,
                                      ),
                                    Text(
                                      'other_details'.localize(context),
                                      style: ADTextStyle600.size18.setTextColor(
                                        context.adColors.storyViewBarFillColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    ADSizedBox(
                                      height: context.k_10,
                                    ),
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.dealProductModel.item
                                              ?.otherDetails.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            ADSizedBox(
                                              height: context.k_10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  widget
                                                          .dealProductModel
                                                          .item
                                                          ?.otherDetails[index]
                                                          .key ??
                                                      'Key',
                                                  style: ADTextStyle600.size16
                                                    ..setTextColor(
                                                      context.adColors.black,
                                                    ),
                                                ),
                                                Text(
                                                  widget
                                                          .dealProductModel
                                                          .item
                                                          ?.otherDetails[index]
                                                          .value ??
                                                      '00',
                                                  style: ADTextStyle400.size16
                                                    ..setTextColor(
                                                      context.adColors.black,
                                                    ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(),
                                    ),
                                  ],
                                  if (model.catalogListResponseModel?.policy
                                          ?.lines?.isNotEmpty ??
                                      pdpPageResponse
                                          ?.policy?.lines?.isNotEmpty ??
                                      false)
                                    Divider(
                                      color: context.adColors.dividerColor,
                                      thickness: 1,
                                    ).paddingBySide(
                                      top: context.k_30,
                                      bottom: context.k_30,
                                    ),
                                  Text(
                                    'cancellation_and_refund_policy'
                                        .localize(context),
                                    style: ADTextStyle600.size18.setTextColor(
                                      context.adColors.storyViewBarFillColor,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_20,
                                  ),
                                  CancellationPolicy(
                                    lines: model.catalogListResponseModel
                                            ?.policy?.lines ??
                                        pdpPageResponse?.policy?.lines ??
                                        [],
                                  ),
                                ],
                              ).paddingBySide(
                                left: context.k_16,
                                right: context.k_16,
                              ),
                              SimilarSoldProductList(
                                pdpPageResponse: pdpPageResponse ??
                                    CatalogListResponseModel(),
                              ),
                              ADSizedBox(
                                height: k_80.sp,
                              ),
                            ],
                          ),
                        ),
              if (((widget.dealProductModel.skuCode?.isNotEmpty ?? false) &&
                      (pdpPageResponse?.result.isNotEmpty ?? false)) ||
                  (widget.dealProductModel.skuCode?.isEmpty ?? true))
                ValueListenableBuilder(
                  valueListenable:
                      (BottomBarState.key.currentWidget as CustomTabScaffold)
                          .heightNotifier,
                  builder:
                      (BuildContext context, double value, Widget? child) =>
                          Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(
                        bottom: value == 0
                            ? 0
                            : MediaQuery.of(context).padding.bottom,
                      ),
                      child: (widget.dealProductModel.skuCode?.isNotEmpty ??
                                  false) &&
                              pdpPageResponse == null
                          ? ADShimmerWidget.shimmerShape(
                              type: ShimmerType.rectangleBox,
                              height: context.k_56,
                              rectanglePadding: EdgeInsets.symmetric(
                                horizontal: context.k_16,
                                vertical: context.k_16,
                              ),
                            )
                          : ValueListenableBuilder<bool>(
                              builder: (BuildContext context, value,
                                      Widget? child) =>
                                  Opacity(
                                opacity: value ? 1 : 0,
                                child: child,
                              ),
                              valueListenable: ValueNotifier(true),
                              // valueListenable: fabIsVisible,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: BuildButton(
                                  dealProductModel: widget.dealProductModel,
                                  key: const Key(
                                    ProductDetailAutomationKeys.addToCartKey,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void pushDutyFreeViewProductImage() {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      dutyFreeViewProductImageRoute,
      argumentObject: List.empty(growable: true)
        ..add(pageIndex)
        ..add(stories),
    );
  }

  void getPdpResponse(
    BuildContext context,
    DutyFreeProductListRequest request,
  ) {
    final DutyFreeRepository dutyFreeRepository = DutyFreeRepository();
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    dutyFreeRepository
        .getDutyFreeProducts(
      catalogRequest: request,
      cancelToken: CancelToken(),
    )
        .then(
      (value) async {
        pdpPageResponse = value.data != null
            ? CatalogListResponseModel.fromJson(value.data)
            : null;
        dutyFreeState
          ..setStoreType(request, pdpPageResponse?.result ?? [])
          ..setStoreType(request, pdpPageResponse?.similar ?? [])
          ..setStoreType(request, pdpPageResponse?.soldTogether ?? []);
        if ((widget.dealProductModel.skuCode?.isNotEmpty ?? false) &&
            (pdpPageResponse?.result.isNotEmpty ?? false)) {
          widget.dealProductModel.item =
              pdpPageResponse?.result.first ?? const DutyFreeProductDataModel();
          promotionData.clear();
          // final List<DutyFreeProductPromotionModel> promotions =
          //     widget.dealProductModel.item?.promotions ?? [];
          // promotionData
          //   ..addAll(promotions)
          //   ..addAll(
          //     await dutyFreeState.repository
          //         .getDutyFreebankOffers(dutyFreeState),
          //   );

          // ?placeholderName=main&item=/sitecore/content/AirportHome/DutyfreeHome/BankOffers&sc_lang=en&sc_apikey=%7BB5AC63B3-9934-4423-8FF9-F619303AC8DF%7D&isApp=false

          dutyFreeState.dutyFreeEventState.viewItemEvent(
            widget.dealProductModel.item ?? const DutyFreeProductDataModel(),
          );

          final List<String> productImages =
              widget.dealProductModel.item?.productImages ?? [];
          for (int count = 0; count < productImages.length; count++) {
            if (productImages[count].contains('Dutyfree')) {
              stories.add(
                DutyStory(
                  url:
                      '${Environment.instance.configuration.cmsImageBaseUrl}${productImages[count]}',
                  mediaType: DutyFreeStoryScreen.image,
                  duration: duration,
                  timeStamp: widget.dealProductModel.item?.timeStamp,
                  headerOpacity: headerOpacity,
                ),
              );
            } else {
              stories.add(
                DutyStory(
                  url: Environment.instance.configuration.cmsImageBaseUrl,
                  mediaType: DutyFreeStoryScreen.image,
                  duration: duration,
                  timeStamp: widget.dealProductModel.item?.timeStamp,
                  headerOpacity: headerOpacity,
                ),
              );
            }
          }
        }
        offers = await dutyFreeState.getAllOffers(context,
            airportCode: widget.dealProductModel.airportCode ??
                selectedAirportsData?.airportCode ??
                '');
        final List<DutyFreeProductPromotionModel> promotionsArray =
            widget.dealProductModel.item?.promotions ?? [];
        // offers?.insert(index, element) ;//add(WidgetItem());
        if (promotionsArray.isNotEmpty) {
          offers?.insertAll(
            0,
            promotionsArray
                .map(
                  (promotion) => WidgetItem(
                    bankOfferText: promotion.displayText,
                    termCondition:
                        promotion.tc.isNotEmpty ? [promotion.tc] : [],
                  ),
                )
                .toList(),
          );
        }
        offersLoading = false;
        if (!dutyFreeState.ageAbove25) {
          pdpPageResponse?.similar?.removeWhere(
            (element) => element.materialGroup.toLowerCase() == 'liquor',
          );
          pdpPageResponse?.soldTogether?.removeWhere(
            (element) => element.materialGroup.toLowerCase() == 'liquor',
          );
        }
        dutyFreeState.pdpStatus = Status.complete;
        adLog('');
        dutyFreeState.notifyListeners();
      },
    );
  }
// removeTag import 'package:html/parser.dart';
// static String? removeTag({htmlString}) {
//   return parse(parse(htmlString).body?.text).documentElement?.text;
// }
}

class CancellationPolicy extends StatelessWidget {
  final List<String> lines;

  const CancellationPolicy({
    Key? key,
    required this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: context.k_6,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: lines.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.k_6,
              width: context.k_6,
              margin: EdgeInsets.only(
                left: context.k_4,
                right: context.k_6,
                top: context.k_6,
              ),
              decoration: BoxDecoration(
                color: context.adColors.darkGreyTextColor,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: DutyFreeLinkify(
                onOpen: (email) => Utils.email(
                  email.text,
                  context,
                  isPopTrue: false,
                ),
                text: lines[index],
                style: ADTextStyle400.size16,
                linkStyle: TextStyle(
                  color: context.adColors.black,
                ),
              ),

              // Text(
              //   lines[index],
              //   style: ADTextStyle400.size16,
              // ),
            ),
          ],
        );
      },
    );
  }
}

class Content {
  String type;
  String content;

  Content({required this.type, required this.content});
}
