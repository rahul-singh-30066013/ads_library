/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_search.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double expandedHeightValue = 92.h;
const double percentageOfScrollLimit = 89;
final double hPadding40 = 40.sp;
const double vPadding12 = 12;
final double defaultStickyHeaderHeight = 70.sp;
final double vPadding6 = 6.sp;
final double w_16 = 16.sp;
const Color _closeIconColor = Color(0xff333333);

/// This is sliver app bar base class for normal screens and draggable bottom sheet
class SliverAppBarBaseComponent extends StatefulWidget {
  ///body of scaffold
  final Widget body;

  /// callback used to set title call back
  final GestureTapCallback? titleCallBack;

  /// callback for search action
  final GestureTapCallback? searchCallBack;

  /// this sets title text
  final String? title;

  /// Optional Title
  final String? optionTitle;

  /// Optional Title Font Style
  final TextStyle? optionTitleTextStyle;

  /// Optional Leading Title Font Style

  final TextStyle? optionalLeadingTitleTextStyle;

  /// this sets title text
  final String? collapsedTitle;

  /// this sets back button
  final bool isBack;

  /// this sets subtitle text
  final String? subTitle;

  /// list of actions for sliver app bar
  final List<Widget>? actions;

  /// widget to show when navigator can pop
  final Widget? closeScreenWidget;

  /// used to set search bar min height value
  final double? searchBarMinHeight;

  /// used to set search bar max height value
  final double? searchBarMaxHeight;

  /// used to set padding from all side,symmetrically or by specific side.
  final EdgeInsets? searchBarPadding;

  /// used to set how much app bar can expand up to maximum height
  final double? expandedHeight;

  /// used to set left side padding
  final double? appBarLeftPadding;

  /// used to set app bar right side padding
  final double? appBarRightPadding;

  /// used to set search title for search bar
  final String? searchTitle;

  /// if non null then it overrides default title text style
  final TextStyle? titleTextStyle;

  /// if non null then it overrides default sub title text style
  final TextStyle? subTitleTextStyle;

  /// used to set vertical spacing between close widget and title
  final double? closeWidgetBottomSpacing;

  /// used to set flexibleSpaceBarWidget in sliver app bar
  final Widget? flexibleSpaceBarWidget;

  ///TODO Avoid using global keys.
  /// used to find title widget from flexible space bar
  final GlobalKey titleKey = GlobalKey();

  /// used to find sub title widget from flexible space bar
  final GlobalKey subTitleKey = GlobalKey();

  /// used to set title text style which is in leading widget
  final TextStyle? leadingTitleTextStyle;

  /// used to set top padding for title widget in flexible space bar
  final double? flexibleTitleTopPadding;

  /// used to set bottom padding for title widget in flexible space bar
  final double? flexibleTitleBottomPadding;

  /// used to set left padding for title widget in flexible space bar
  final double? flexibleTitleLeftPadding;

  /// used to set right padding for title widget in flexible space bar
  final double? flexibleTitleRightPadding;

  /// used to set sticky widget instead of searchbar if not null
  final Widget? stickyWidget;

  /// used to set scroll listener call back
  final void Function(ScrollController)? scrollListener;

  final bool? isBackCross;

  /// used to set scroll listener call back
  final int selectedTab;

  SliverAppBarBaseComponent({
    required this.title,
    required this.body,
    this.isBack = true,
    this.subTitle,
    this.titleCallBack,
    this.searchCallBack,
    this.actions,
    this.closeScreenWidget,
    this.searchBarMinHeight,
    this.searchBarMaxHeight,
    this.searchBarPadding,
    this.expandedHeight,
    this.appBarLeftPadding,
    this.appBarRightPadding,
    this.searchTitle,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.closeWidgetBottomSpacing,
    this.flexibleSpaceBarWidget,
    this.leadingTitleTextStyle,
    this.flexibleTitleTopPadding,
    this.flexibleTitleBottomPadding,
    this.flexibleTitleLeftPadding,
    this.flexibleTitleRightPadding,
    this.isBackCross = true,
    this.stickyWidget,
    this.scrollListener,
    this.selectedTab = 0,
    this.collapsedTitle,
    this.optionTitle,
    this.optionTitleTextStyle,
    this.optionalLeadingTitleTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  State<SliverAppBarBaseComponent> createState() =>
      _SliverAppBarBaseComponentState();
}

class _SliverAppBarBaseComponentState extends State<SliverAppBarBaseComponent> {
  final ScrollController _scrollController = ScrollController();
  ValueNotifier<String?> titleNotifier = ValueNotifier<String?>('');
  ValueNotifier<double> heightNotifier =
      ValueNotifier<double>(expandedHeightValue);
  final double elevation = 0.5;

  @override
  void initState() {
    super.initState();
    adLog('initState');
    heightNotifier.value = (widget.expandedHeight ?? expandedHeightValue) +
        (widget.flexibleTitleTopPadding ?? 0) +
        (widget.flexibleTitleBottomPadding ?? 0);
    _scrollController.addListener(_titleScrollListener);
    if (widget.flexibleSpaceBarWidget == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        heightNotifier.value =
            (widget.titleKey.currentContext?.findRenderObject() as RenderBox)
                    .size
                    .height +
                (widget.subTitle != null
                    ? (widget.subTitleKey.currentContext?.findRenderObject()
                            as RenderBox)
                        .size
                        .height
                    : 0) +
                ((ModalRoute.of(context)?.canPop ?? false)
                    ? (widget.closeWidgetBottomSpacing ?? context.k_40)
                    : 0);
      });
    }
  }

  void _titleScrollListener() {
    titleNotifier.value = _scrollController.hasClients &&
            _scrollController.offset > (heightNotifier.value - kToolbarHeight)
        ? widget.title.validateWithDefaultValue()
        : '';
    widget.scrollListener?.call(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    adLog('sliver can pop ${ModalRoute.of(context)?.canPop ?? false}');
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        ValueListenableBuilder(
          valueListenable: heightNotifier,
          builder: (context, double height, child) => SliverAppBar(
            //manages horizontal spacing around title
            titleSpacing: 0,
            centerTitle: false,
            forceElevated: innerBoxIsScrolled,
            elevation: widget.closeScreenWidget != null ? 0 : elevation,
            leadingWidth: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                if (widget.isBack && (ModalRoute.of(context)?.canPop ?? false))
                  widget.closeScreenWidget ??
                      // GestureDetector(
                      //   behavior: HitTestBehavior.translucent,
                      //   onTap: () => Navigator.of(context).pop(),
                      //   child: Icon(
                      //     Platform.isIOS
                      //         ? Icons.arrow_back_ios
                      //         : Icons.arrow_back,
                      //     color: _closeIconColor,
                      //   ).paddingBySide(right: context.k_4),
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          key: const Key(FlightAutomationKeys.headerIconKey),
                          iconSize: context.k_48,
                          visualDensity: VisualDensity.compact,
                          splashRadius: context.k_20,
                          padding: EdgeInsets.zero,
                          onPressed: () => navigatorPopScreen(context),
                          icon: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: _closeIconColor,
                            size: context.k_24,
                          ),
                        ),
                      ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: titleNotifier,
                    builder: (
                      BuildContext context,
                      String? value,
                      Widget? child,
                    ) {
                      return _GetSelectedState(
                        titleTextStyle: widget.leadingTitleTextStyle ??
                            widget.titleTextStyle ??
                            ADTextStyle700.size22.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                        title: _scrollController.hasClients &&
                                _scrollController.offset >
                                    (heightNotifier.value - kToolbarHeight)
                            ? widget.collapsedTitle.validateWithDefaultValue(
                                defaultValue: widget.title ?? '',
                              )
                            : value.validateWithDefaultValue(),
                        optionTitle: _scrollController.hasClients &&
                                _scrollController.offset >
                                    (heightNotifier.value - kToolbarHeight)
                            ? widget.optionTitle
                            : '',
                        optionTitleTextStyle:
                            widget.optionalLeadingTitleTextStyle ??
                                ADTextStyle700.size22.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingBySide(
              left: widget.appBarLeftPadding ?? context.k_14,
              right: widget.appBarRightPadding ?? context.k_14,
            ),
            flexibleSpace: widget.flexibleSpaceBarWidget ??
                _SetFlexibleSpaceBar(
                  titleKey: widget.titleKey,
                  isBack: widget.isBack,
                  subTitleKey: widget.subTitleKey,
                  closeWidgetBottomSpacing: widget.closeWidgetBottomSpacing,
                  titleTextStyle: widget.titleTextStyle,
                  subTitleTextStyle: widget.subTitleTextStyle,
                  title: widget.title,
                  subTitle: widget.subTitle,
                  titleCallBack: widget.titleCallBack,
                  flexibleTitleTopPadding: widget.flexibleTitleTopPadding,
                  flexibleTitleBottomPadding: widget.flexibleTitleBottomPadding,
                  flexibleTitleLeftPadding: widget.flexibleTitleLeftPadding,
                  flexibleTitleRightPadding: widget.flexibleTitleRightPadding,
                  searchCallBack: widget.searchCallBack,
                  optionTitle: widget.optionTitle,
                  optionTitleTextStyle: widget.optionTitleTextStyle,
                ),
            expandedHeight: widget.flexibleSpaceBarWidget == null
                ? height
                : widget.expandedHeight,
            pinned: true,
            actions: widget.actions,
            backgroundColor: context.adColors.whiteTextColor,
          ),
        ),
        if (widget.searchCallBack != null || widget.stickyWidget != null)
          SliverPersistentHeader(
            delegate: _StickySearchBarDelegate(
              searchTitle: widget.searchTitle,
              searchCallBack: widget.searchCallBack,
              maxHeight: widget.searchBarMaxHeight,
              minHeight: widget.searchBarMinHeight,
              padding: widget.searchBarPadding,
              stickyWidget: widget.stickyWidget,
            ),
            pinned: true,
          ),
      ],
      body: widget.body,
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleNotifier.dispose();
    _scrollController.dispose();
    heightNotifier.dispose();
  }
}

class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double? minHeight;
  final double? maxHeight;
  final Widget? stickyWidget;
  EdgeInsets? padding;
  final GestureTapCallback? searchCallBack;
  final String? searchTitle;

  _StickySearchBarDelegate({
    this.minHeight,
    this.maxHeight,
    this.padding,
    this.searchCallBack,
    this.searchTitle,
    this.stickyWidget,
  });

  @override
  double get minExtent => minHeight ?? defaultStickyHeaderHeight;

  @override
  double get maxExtent => maxHeight ?? defaultStickyHeaderHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return GestureDetector(
      onTap: searchCallBack,
      child: Container(
        height: maxHeight ?? defaultStickyHeaderHeight,
        padding: padding ??
            EdgeInsets.only(
              right: context.k_14,
              left: context.k_14,
              top: context.k_10,
              bottom: context.k_10,
            ),
        alignment: Alignment.center,
        color: context.adColors.whiteTextColor,
        child: stickyWidget ??
            ADSearch(
              searchTitle: searchTitle ?? 'Search',
            ),
      ),
    );
  }

  @override
  bool shouldRebuild(_StickySearchBarDelegate oldDelegate) {
    return false;
  }
}

class _SetFlexibleSpaceBar extends StatelessWidget {
  const _SetFlexibleSpaceBar({
    Key? key,
    required this.title,
    this.isBack = true,
    this.subTitle,
    this.titleCallBack,
    this.searchCallBack,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.closeWidgetBottomSpacing,
    this.subTitleKey,
    this.titleKey,
    this.flexibleTitleTopPadding,
    this.flexibleTitleBottomPadding,
    this.flexibleTitleLeftPadding,
    this.flexibleTitleRightPadding,
    this.optionTitle,
    this.optionTitleTextStyle,
  }) : super(key: key);

  final String? title;
  final bool isBack;
  final String? subTitle;
  final GestureTapCallback? searchCallBack;
  final GestureTapCallback? titleCallBack;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final double? closeWidgetBottomSpacing;
  final GlobalKey? subTitleKey;
  final GlobalKey? titleKey;
  final double? flexibleTitleTopPadding;
  final double? flexibleTitleBottomPadding;
  final double? flexibleTitleLeftPadding;
  final double? flexibleTitleRightPadding;
  final String? optionTitle;
  final TextStyle? optionTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (isBack && (ModalRoute.of(context)?.canPop ?? false))
              ADSizedBox(
                height: closeWidgetBottomSpacing ?? context.k_40,
              ),
            if (subTitle != null)
              Container(
                key: subTitleKey,
                height: kToolbarHeight - vPadding12,
                alignment: Alignment.centerLeft,
                child: Text(
                  subTitle ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: subTitleTextStyle ??
                      ADTextStyle400.size14.setTextColor(
                        context.adColors.greyTextColor,
                      ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ).paddingBySide(
                  right: context.k_64,
                  top: vPadding12,
                ),
              ),
            Padding(
              key: titleKey,
              padding: EdgeInsets.only(
                bottom: flexibleTitleBottomPadding ?? 0,
                left: flexibleTitleLeftPadding ?? 0,
                right: flexibleTitleRightPadding ?? 0,
                top: flexibleTitleTopPadding ?? 0,
              ),
              child: _GetSelectedState(
                gestureTapCallback: titleCallBack,
                titleTextStyle: titleTextStyle ??
                    ADTextStyle700.size22
                        .setTextColor(context.adColors.blackTextColor),
                title: title,
                optionTitle: optionTitle,
                optionTitleTextStyle: optionTitleTextStyle,
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_14,
        ),
      ),
    );
  }
}

class _GetSelectedState extends StatelessWidget {
  const _GetSelectedState({
    Key? key,
    required this.title,
    this.gestureTapCallback,
    this.titleTextStyle,
    this.optionTitle,
    this.optionTitleTextStyle,
  }) : super(key: key);

  final String? title;
  final GestureTapCallback? gestureTapCallback;
  final TextStyle? titleTextStyle;
  final String? optionTitle;
  final TextStyle? optionTitleTextStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureTapCallback,
      child: Row(
        children: [
          Text(
            title ?? '',
            style: titleTextStyle ??
                ADTextStyle700.size32.setTextColor(
                  context.adColors.red900,
                ),
            overflow: TextOverflow.ellipsis,
          ).paddingBySide(
            right: gestureTapCallback == null ? context.k_4 : 0,
          ),
          if (optionTitle != null)
            Text(
              optionTitle ?? '',
              style: optionTitleTextStyle ??
                  ADTextStyle700.size32.setTextColor(
                    context.adColors.blackTextColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          if (gestureTapCallback != null)
            Icon(
              Icons.keyboard_arrow_down,
              size: context.k_28,
              color: context.adColors.blackTextColor,
            ).paddingBySide(right: context.k_40),
        ],
      ),
    );
  }
}
