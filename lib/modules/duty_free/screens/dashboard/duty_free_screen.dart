/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/tap_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/terminal_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/custom_tool_tip_design_duty_free.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/terminal_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// This class will used to represent showDutyScreen.
DashBoardViewModel? dashBoardViewModel;

class DutyFreeScreen extends StatefulWidget {
  const DutyFreeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DutyFreeScreenState createState() => _DutyFreeScreenState();
}

class _DutyFreeScreenState extends State<DutyFreeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final percentageOfScrollScreen = 65.sp;
  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 120.sp;
  static const elevationHeight = 0.5;
  List<DutyFreeDashboardItem>? dashboardItems;
  DutyFreeState? dutyFreeState;
  AppModelStateManagement? _appModelStateManagement;

  @override
  void initState() {
    _appModelStateManagement = context.read<AppModelStateManagement>()
      ..homeIdentifier = HomeIdentifier.dutyFreeHome;
    _scrollController.addListener(_scrollListener);
    dutyFreeState = context.read<DutyFreeState>();
    dutyFreeState?.resetParams();
    ProfileSingleton.profileSingleton
        .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData)
        .then((value) {
      adLog(
        'ProfileSingleton.profileSingleton.userProfile... ${value.userId}',
        className: this,
      );
      ProfileSingleton.profileSingleton.userProfile = value;
    });
    super.initState();
    wait2SecandDismissToolTip(dutyFreeState);
    setFirstOpenDutyFree(true, dutyFreeState);
  }

  @override
  void dispose() {
    _appModelStateManagement?.homeIdentifier = HomeIdentifier.mainHome;
    dynamicTitle.dispose();
    _scrollController.dispose();
    // dutyFreeState?.terminalModel.value =
    //     dutyFreeState?.terminalList.first ?? const TerminalModel();
    super.dispose();
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;

    dynamicTitle.value = percentageOfScroll <= percentageOfScrollScreen
        ? '${selectedAirportsData?.city ?? ''} ${'dutyFree'.localize(context)}'
        : '';
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    Utils.scrollTabScreensToTop(scrollController: _scrollController);
  }

  @override
  Widget build(BuildContext parentContext) {
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        appBar: Utils.getGenericAppBar(context),
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
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
                  ),
                ),
                titleSpacing: context.k_10,
                leadingWidth: Platform.isIOS ? leadingWidth_42 : context.k_38,
                leading: const BackButton().paddingBySide(left: context.k_8),
                expandedHeight: expandedHeight,
                elevation: elevationHeight,
                flexibleSpace: _FlexibleSpaceBar(
                  parentContext,
                ),
                // actions: [
                //   IconButton(
                //     onPressed: () {
                //
                //     },
                //     icon: Icon(
                //       Icons.search,
                //       size: context.k_24,
                //     ),
                //     color: context.adColors.neutralInfoMsg,
                //   ),
                // ],
              ),
            ],
            body: Stack(
              children: [
                DutyFreeDashBoardScreen(
                  onTapHandler: (value) => _onTapHandler(value, parentContext),
                  shimmerWidget: _ShimmerWidget(),
                  updateDashboardBasedOnCallback: (value) =>
                      dashBoardViewModel = value,
                ).paddingBySide(top: parentContext.k_10),
                // ValueListenableBuilder(
                //   valueListenable: isFirstOpeDutyFreeScreen,
                //   child: Container(),
                //   builder: (context, bool value, child) {
                //     return value
                //         ? const SizedBox().paddingBySide(top: context.k_8)
                //         : CustomToolTipDesignDutyFree();
                //   },
                // ).paddingBySide(top: context.k_12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapHandler(dynamic tapDetail, BuildContext context) {
    if ((tapDetail as TapDetail).name == kGridScrollTile) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        dutyFreeCatalogScreen,
        rootNavigator: false,
        argumentObject: [tapDetail.code],
      );
    }
  }
}

void dismissDialogAndPush(
  BuildContext context,
  BuildContext dialogContext,
) {
  context
      .read<DutyFreeState>()
      .dutyFreeEventState
      .ageConfirmationEvent(isAgeAbove: true);
  navigatorPopScreen(dialogContext);
  Future.delayed(const Duration(milliseconds: 10), () {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      dutyFreeCatalogScreen,
      rootNavigator: false,
      argumentObject: 'Liquor',
    );
  });
}

void dismissDialog(
  BuildContext context,
  BuildContext dialogContext,
) {
  context
      .read<DutyFreeState>()
      .dutyFreeEventState
      .ageConfirmationEvent(isAgeAbove: false);
  navigatorPopScreen(dialogContext);
}

void ageConfirmation(
  BuildContext context,
) {
  final bottomSheet = showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: context.adColors.whiteTextColor,
    elevation: context.k_8,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(context.k_22),
      ),
    ),
    context: context,
    builder: (dialogContext) {
      return DutyFreeRemoveItem(
        detailString: 'age_confirmation_message'.localize(context).replaceAll(
              '#1',
              (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
            ),
        titleString: 'age_confirmation'.localize(context),
        yesCallBack: () => dismissDialogAndPush(context, dialogContext),
        noCallBack: () => dismissDialog(context, dialogContext),
      );
    },
  );
  adLog('$bottomSheet');
}

/// This class will used to represent _ShimmerWidget.
class _ShimmerWidget extends StatelessWidget {
  final double shimmerWidth_100 = 100.sp;
  final double shimmerWidth_230 = 230.sp;
  final double shimmerHeight_20 = 20.sp;
  final double shimmerWidth_500 = 500.sp;
  final double shimmerHeight_180 = 180.sp;
  final double shimmerWidth_80 = 80.sp;
  final double shimmerHeight_80 = 80.sp;
  final int gridRowCount_3 = 3;
  final int shimmerItemCount = 6;
  final double containerHorizontalMargin_25 = 25.sp;
  final double sizeBoxWidth_250 = 250.sp;
  final double sizeBoxHeight_300 = 300.sp;
  final double sizeBoxHeight_10 = 10.sp;
  final int sizeBoxCount = 6;

  _ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADShimmerBuilder(
              shimmerBuilderType: ShimmerBuilderType.grid,
              shimmerWidget: ADShimmerWidget.shimmerShape(
                type: ShimmerType.circleWithText,
                height: shimmerHeight_80,
                width: shimmerWidth_80,
                detailTextWidth: shimmerWidth_80,
                detailTextHeight: shimmerHeight_20,
              ),
              gridRowCount: gridRowCount_3,
              itemCount: shimmerItemCount,
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: shimmerWidth_230,
                  height: shimmerHeight_20,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: shimmerWidth_100,
                  height: shimmerHeight_20,
                ),
              ],
            ),
            SizedBox(
              height: sizeBoxHeight_300,
              child: ADShimmerBuilder(
                shimmerBuilderType: ShimmerBuilderType.listHorizontal,
                shimmerWidget: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: sizeBoxHeight_300,
                  width: sizeBoxWidth_250,
                ),
                itemCount: sizeBoxCount,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// This class will used to represent _FlexibleSpaceBar.
class _FlexibleSpaceBar extends StatelessWidget {
  final double flexableSpaceBar = 80.sp;
  final int maxLines_3 = 3;
  final double decorationThickness = 2.sp;
  final BuildContext context;
  static const interimHeight = 44.0;
  final double iconSize = 24;

  _FlexibleSpaceBar(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ADSizedBox(
                  height: flexableSpaceBar,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      child: Text(
                        // '${selectedAirportsData?.city ?? ''} ${'dutyFree'.localize(context)}',
                        '${selectedAirportsData?.city ?? ''} ${'dutyFree'.localize(context)}',
                        style: ADTextStyle700.size32.setTextColor(Colors.black),
                        maxLines: maxLines_3,
                        textAlign: TextAlign.left,
                      ).paddingBySide(
                        top: interimHeight,
                        left: context.k_14,
                      ),
                    ),
                  ),
                ).paddingBySide(right: context.k_16),
                ADSizedBox(
                  height: context.k_4,
                ),
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => adShowBottomSheet(
                          childWidget: TerminalBottomSheet(
                            onBottomSheetItemSelect: (value) =>
                                updateDashboard(value, this.context),
                            bottomSheetHeader:
                                'select_terminal'.localize(context),
                            selectedItem: context
                                .read<DutyFreeState>()
                                .terminalModel
                                .value,
                            bottomSheetList:
                                context.read<DutyFreeState>().terminalList,
                          ),
                          context: context,
                          headerTitle: 'select_terminal'.localize(context),
                        ),
                        child: ValueListenableBuilder(
                          valueListenable:
                              context.read<DutyFreeState>().terminalModel,
                          builder: (context, TerminalModel value, child) => Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${'pickup'.localize(context)}:',
                                    style: ADTextStyle400.size16
                                        .setTextColor(context.adColors.black),
                                  ).paddingBySide(
                                    left: context.k_16,
                                    // top: context.k_10,
                                  ),
                                  ADSizedBox(
                                    width: context.k_4,
                                  ),
                                  Text(
                                    value.title,
                                    style: ADTextStyle400.size16
                                        .setTextColor(context.adColors.black),
                                  ),
                                ],
                              ),
                              child ?? const SizedBox.shrink(),
                            ],
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: ADColors.black,
                          ),
                        ),
                      ),
                    ),
                    ADSizedBox(
                      width: context.k_6,
                    ),
                    Expanded(
                      child: Container(
                        height: context.k_30,
                        padding: EdgeInsets.only(right: context.k_16),
                        child: ValueListenableBuilder(
                          valueListenable: isFirstOpeDutyFreeScreen,
                          builder: (context, bool value, child) => value
                              ? CustomToolTipDesignDutyFree()
                              : const ADSizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateDashboard(dynamic value, BuildContext context) {
    try {
      final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
      final TerminalModel terminalModel = value;
      if (terminalModel.code != dutyFreeState.terminalModel.value.code) {
        dutyFreeState.terminalModel.value = value;
        if (dutyFreeState.dutyFreeCartResponse?.airportCode ==
            selectedAirportsData?.airportCode) {
          dutyFreeState.clearDutyFreeCartApi(context.read<AppSessionState>());
        }
        dashBoardViewModel?.dashBoardState = ADResponseState.loading();
        dashBoardViewModel?.notifyListeners();
        dashBoardViewModel?.getDutyFreeDashBoardData(
          isAgeAbove25: dutyFreeState.ageAbove25,
          storeType: dutyFreeState.terminalModel.value.code.toLowerCase(),
        );
      }
    } catch (e) {
      adLog(e.toString());
    }
  }
}
