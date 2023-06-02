/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/more/models/customer_feedback/feedback_form_layout_models/feedback_form_layout_model_element.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/contact_us_information.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/feedback_form_widget.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/flexible_space_app_bar.dart';
import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///this class is for customer feedback screen
class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomerFeedback();
  }
}

class _CustomerFeedback extends State<CustomerFeedback> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final ValueNotifier<String> titleNotifier = ValueNotifier<String>('');

  final no_100 = 100;
  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 120.sp;
  final percentageOfScrollScreen = 65.sp;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    dynamicTitle.dispose();
    titleNotifier.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;
    dynamicTitle.value = percentageOfScroll <= percentageOfScrollScreen
        ? titleNotifier.value
        : '';
  }

  void _updateTitle(String titleValue) {
    Future.delayed(
      Duration(milliseconds: no_100),
      () => {
        titleNotifier.value = titleValue,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            pinned: true,
            title: AnimatedBuilder(
              animation: Listenable.merge([dynamicTitle]),
              builder: (BuildContext context, _) => Text(
                dynamicTitle.value,
                style: ADTextStyle700.size22,
                maxLines: 1,
              ).paddingBySide(right: context.k_10),
            ),
            leadingWidth: Platform.isIOS ? leadingWidth_42 : context.k_38,
            leading: const BackButton(),
            expandedHeight: expandedHeight,
            flexibleSpace: ValueListenableBuilder(
              valueListenable: titleNotifier,
              builder: (context, String value, child) {
                return FlexibleSpaceAppBar(
                  context,
                  title: value,
                );
              },
            ),
          ),
        ],
        body: BuildFeedbackLayout(
          callback: (value) => _updateTitle(value),
        ),
      ),
    );
  }
}

class BuildFeedbackLayout extends StatefulWidget {
  const BuildFeedbackLayout({
    required this.callback,
    Key? key,
  }) : super(key: key);
  final ADTapCallbackWithValue callback;

  @override
  State<StatefulWidget> createState() {
    return _BuildFeedbackLayout();
  }
}

class _BuildFeedbackLayout extends State<BuildFeedbackLayout> {
  final _k_80 = 80.sp;
  FeedbackStateManagement feedbackStateManagement = FeedbackStateManagement();

  @override
  void dispose() {
    super.dispose();
    feedbackStateManagement.isAirportSelect.dispose();
    feedbackStateManagement.descriptionErrorMsg.dispose();
  }

  @override
  void initState() {
    feedbackStateManagement.getFeedbackLayoutData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<FeedbackStateManagement>(
      key: const Key('CustomerFeedback'),
      viewModel: feedbackStateManagement,
      child: Selector<FeedbackStateManagement, ADResponseState>(
        selector: (context, viewModel) => viewModel.feedbackState,
        builder: (context, value, Widget? child) {
          switch (value.viewStatus) {
            case Status.loading:
              return _ShimmerWidget();
            case Status.error:
              return Center(child: Text(value.message.toString()));
            case Status.complete:
              feedbackStateManagement.elementsField =
                  (value.data as FeedbackFormLayoutModelElement).fields;
              widget.callback.call(
                feedbackStateManagement.elementsField?.bannerTitle ?? '',
              );

              feedbackStateManagement.bottomSheetAirportList.clear();
              for (final AirportDetails element
                  in feedbackStateManagement.elementsField?.airportDetails ??
                      []) {
                if (element.airportCode?.contains('ONE') != true) {
                  final siteCore = context.read<SiteCoreStateManagement>();
                  final cityName =
                      siteCore.airportCityMap[element.airportCode]?.cityName;
                  feedbackStateManagement.bottomSheetAirportList.add(
                    BottomSheetRowModel(
                      text: element.airportName ?? '',
                      code: element.airportCode ?? '',
                      cityName: cityName ?? '',
                    ),
                  );
                }
              }
              feedbackStateManagement.bottomSheetPostList.clear();
              for (final IssueTypeList element
                  in feedbackStateManagement.elementsField?.issueTypeList ??
                      []) {
                feedbackStateManagement.bottomSheetPostList.add(
                  BottomSheetRowModel(
                    text: element.issueText ?? '',
                    code: element.issueValue ?? '',
                  ),
                );
              }
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  // keyboardDismissBehavior:
                  //     ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, context.k_8, 0, 0),
                        width: context.widthOfScreen,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          imageUrl: feedbackStateManagement
                                  .elementsField?.mobileBannerImage ??
                              '',
                          filterQuality: FilterQuality.high,
                          width: context.widthOfScreen,
                          placeholder: (context, url) => Image.memory(
                            kTransparentImage,
                            fit: BoxFit.cover,
                            height: _k_80,
                            width: context.widthOfScreen,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: context.adColors.cardBgColor,
                            alignment: Alignment.center,
                            child: const SizedBox(),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feedbackStateManagement.elementsField?.formTitle ??
                                '',
                            style: ADTextStyle700.size22.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                            top: context.k_20,
                          ),
                          Text(
                            feedbackStateManagement
                                    .elementsField?.formSubtitle ??
                                '',
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                            top: context.k_20,
                          ),
                          FeedbackFormWidget(
                            feedbackStateManagement: feedbackStateManagement,
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                          Text(
                            feedbackStateManagement
                                    .elementsField?.reachOutText ??
                                '',
                            style: ADTextStyle600.size22.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                            top: context.k_48,
                          ),
                          ContactUsInformation(
                            feedbackStateManagement: feedbackStateManagement,
                          ).paddingBySide(top: context.k_20),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}

class _ShimmerWidget extends StatelessWidget {
  final double aspectRatio = 1.33;
  final double aspectRatioHalf = 0.5;
  final double shimmer_8 = 8.sp;
  final double shimmer_60 = 60.sp;
  final double shimmer_90 = 90.sp;
  final double shimmer_100 = 100.sp;

  _ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_10,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.widthOfScreen * aspectRatioHalf,
            top: context.k_20,
          ),
          type: ShimmerType.rectangleBox,
          height: context.k_40,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_90,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_20,
          ),
        ),
      ],
    );
  }
}
