import 'dart:io';

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/flexible_space_app_bar.dart';
import 'package:adani_airport_mobile/modules/republic_reward/republic_screen_dashboard_builder.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class RepublicMainScreen extends StatefulWidget {
  final bool isPaddingNeeded;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;

  /// this is used to handle shimmer widget
  final Widget? shimmerWidget;

  final String? postFix;

  const RepublicMainScreen({
    Key? key,
    this.onTapHandler,
    this.shimmerWidget,
    this.isPaddingNeeded = true,
    this.postFix,
  }) : super(key: key);

  @override
  State<RepublicMainScreen> createState() => _RepublicMainScreenState();
}

class _RepublicMainScreenState extends State<RepublicMainScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  FocusNode focusNode = FocusNode();
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();

  final DashBoardViewModel _dashBoardViewModel = DashBoardViewModel();

  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 90.sp;
  final percentageOfScrollScreen = 65.sp;
  final double k_25 = 0.2.sp;

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    _scrollController.dispose();
    dynamicTitle.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        globalKey.currentState?.innerController
            .jumpTo(MediaQuery.of(context).size.height * k_25);
      }
    });
    super.initState();

    _dashBoardViewModel.getRepublicDashBoardData(
      // selectedAirportNotifier.value,
      postFix: widget.postFix,
    );
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;

    dynamicTitle.value = percentageOfScroll <= percentageOfScrollScreen
        ? 'republic_of_rewards'.localize(context)
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: NestedScrollView(
          key: globalKey,
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
                ).paddingBySide(left: context.k_10),
              ),
              leadingWidth: Platform.isIOS ? leadingWidth_42 : context.k_38,
              leading: const BackButton().paddingBySide(left: context.k_10),
              expandedHeight: expandedHeight,
              flexibleSpace: FlexibleSpaceAppBar(
                context,
                title: 'republic_of_rewards'.localize(context),
                flexibleSpaceBar: expandedHeight,
                paddingLeft: context.k_20,
              ),
            ),
          ],
          body: ADSelectorStateLessWidget<DashBoardViewModel>(
            key: const Key('DashBoard'),
            viewModel: _dashBoardViewModel,
            child: Selector<DashBoardViewModel, ADResponseState>(
              selector: (context, viewModel) =>
                  viewModel.republicDashBoardState,
              builder: (context, value, Widget? child) {
                switch (value.viewStatus) {
                  case Status.loading:
                    return const RepublicRewardShimmer();
                  case Status.error:
                    return Center(child: Text(value.message.toString()));
                  case Status.complete:
                    return VerticalList(
                      data: value.data,
                      onTapHandler: widget.onTapHandler,
                      isPaddingNeeded: widget.isPaddingNeeded,
                      dashBoardViewModel: _dashBoardViewModel,
                    ).paddingBySide(
                      top: context.k_20,
                    );
                  default:
                    return Container();
                }
                // return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// this method is used to create verticalList of DashBoard page
class VerticalList extends StatefulWidget {
  final List<DutyFreeDashboardItem> data;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;
  final bool isPaddingNeeded;
  final DashBoardViewModel? dashBoardViewModel;

  const VerticalList({
    Key? key,
    required this.data,
    required this.onTapHandler,
    this.isPaddingNeeded = true,
    this.dashBoardViewModel,
  }) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.data.length,
      padding: widget.isPaddingNeeded
          ? EdgeInsets.only(bottom: context.k_60)
          : EdgeInsets.zero,
      itemBuilder: (context, index) => RepublicScreenDashboardBuilder(
        dashBoardViewModel: widget.dashBoardViewModel,
        onTapHandler: widget.onTapHandler,
        dashBoardItem: widget.data[index],
      ),
    );
  }
}

class RepublicRewardShimmer extends StatelessWidget {
  const RepublicRewardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double shimmerHeight_100 = 100.sp;
    final double shimmerHeight_160 = 160.sp;
    final double shimmerHeight_196 = 196.sp;
    final double shimmerWidth_120 = 120.sp;
    final double shimmerWidth_160 = 160.sp;
    final double shimmerWidth_140 = 140.sp;
    final double shimmerHeight_70 = 70.sp;

    return Container(
      color: context.adColors.whiteTextColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ADSizedBox(
            height: context.k_24,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            width: context.widthOfScreen,
            height: shimmerHeight_160,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            height: shimmerHeight_100,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_30,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            height: shimmerHeight_70,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      width: shimmerWidth_160,
                      height: shimmerHeight_196,
                    ).paddingBySide(right: context.k_8),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_120,
                    ),
                    ADSizedBox(
                      height: context.k_14,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_30,
                      width: shimmerWidth_160,
                    ),
                    ADSizedBox(
                      height: context.k_12,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_140,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      width: shimmerWidth_160,
                      height: shimmerHeight_196,
                    ).paddingBySide(left: context.k_8),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_120,
                    ),
                    ADSizedBox(
                      height: context.k_14,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_30,
                      width: shimmerWidth_120,
                    ),
                    ADSizedBox(
                      height: context.k_12,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_120,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingBySide(
            top: context.k_20,
          ),
        ],
      ),
    );
  }
}
