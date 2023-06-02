/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double expandedHeightValue = 92.h;
const double percentageOfScrollLimit = 89;
final double hPadding40 = 40.w;
final double hPadding4 = 4.w;
final double hPadding20 = 20.w;
final double hPadding10 = 10.w;
final double hPadding12 = 12.w;
final double hPadding14 = 14.sp;
final double vPadding10 = 10.sp;
final double vPadding14 = 14.h;
final double vPadding18 = 18.sp;
final double vPadding8 = 18.sp;
final double hPadding16 = 16.w;
final double vPadding19 = 19.h;
final double vPadding4 = 4.h;
final double vPadding40 = 40.h;
final double defaultStickyHeaderHeight = 70.sp;
final double vPadding6 = 6.h;
final double w_16 = 16.w;
final double vPadding16 = 16.sp;
const Color _closeIconColor = Color(0xff333333);

/// This is sliver app bar base class for normal screens and draggable bottom sheet
class SliverAppBarBottomSheet extends StatefulWidget {
  ///body of scaffold
  final Widget body;

  /// callback used to set title call back
  final GestureTapCallback? titleCallBack;

  /// this sets title text
  final String? title;

  /// this sets subtitle text
  final String? subTitle;

  /// list of actions for sliver app bar
  final List<Widget>? actions;

  /// used to set sticky widget min height value
  final double? stickyWidgetMinHeight;

  /// used to set sticky widget max height value
  final double? stickyWidgetMaxHeight;

  /// used to set padding from all side,symmetrically or by specific side.
  final EdgeInsets? searchBarPadding;

  /// used to set how much app bar can expand up to maximum height
  final double? expandedHeight;

  /// used to set search title for search bar
  final String? searchTitle;

  /// if non null then it overrides default title text style
  final TextStyle? titleTextStyle;

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

  /// used to set sticky widget in sticky header
  final Widget? stickyWidget;

  /// used to set scroll listener call back
  final void Function(ScrollController)? scrollListener;

  SliverAppBarBottomSheet({
    required this.title,
    required this.body,
    this.subTitle,
    this.titleCallBack,
    this.actions,
    this.stickyWidgetMinHeight,
    this.stickyWidgetMaxHeight,
    this.searchBarPadding,
    this.expandedHeight,
    this.searchTitle,
    this.titleTextStyle,
    this.leadingTitleTextStyle,
    this.flexibleTitleTopPadding,
    this.flexibleTitleBottomPadding,
    this.flexibleTitleLeftPadding,
    this.flexibleTitleRightPadding,
    this.stickyWidget,
    this.scrollListener,
    Key? key,
  }) : super(key: key);

  @override
  State<SliverAppBarBottomSheet> createState() =>
      _SliverAppBarBottomSheetState();
}

class _SliverAppBarBottomSheetState extends State<SliverAppBarBottomSheet> {
  final ScrollController _scrollController = ScrollController();
  ValueNotifier<String?> titleNotifier = ValueNotifier<String?>('');
  ValueNotifier<double> heightNotifier =
      ValueNotifier<double>(expandedHeightValue);

  @override
  void initState() {
    super.initState();
    adLog('initState');
    widget.scrollListener?.call(_scrollController);
    _scrollController.addListener(() {
      titleNotifier.value = _scrollController.hasClients &&
              _scrollController.offset > (heightNotifier.value - kToolbarHeight)
          ? widget.title ?? ''
          : '';
    });
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
              (Navigator.of(context).canPop() ? vPadding40 : 0);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            leadingWidth: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  iconSize: context.k_48,
                  visualDensity: VisualDensity.compact,
                  splashRadius: context.k_20,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    SvgAssets.closeIcon,
                    height: context.k_14,
                    width: context.k_14,
                    color: _closeIconColor,
                  ),
                ) /*.paddingBySide(right: hPadding16)*/,
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: titleNotifier,
                    builder:
                        (BuildContext context, String? value, Widget? child) {
                      return _GetSelectedState(
                        titleTextStyle: widget.leadingTitleTextStyle ??
                            widget.titleTextStyle,
                        title: _scrollController.hasClients &&
                                _scrollController.offset >
                                    (heightNotifier.value - kToolbarHeight)
                            ? widget.title.validateWithDefaultValue()
                            : value.validateWithDefaultValue(),
                      );
                    },
                  ),
                ),
              ],
            ).paddingBySide(left: context.k_2),
            flexibleSpace: _SetFlexibleSpaceBar(
              titleKey: widget.titleKey,
              subTitleKey: widget.subTitleKey,
              titleTextStyle: widget.titleTextStyle,
              title: widget.title,
              titleCallBack: widget.titleCallBack,
              flexibleTitleTopPadding: widget.flexibleTitleTopPadding,
              flexibleTitleBottomPadding: widget.flexibleTitleBottomPadding,
              flexibleTitleLeftPadding: widget.flexibleTitleLeftPadding,
              flexibleTitleRightPadding: widget.flexibleTitleRightPadding,
            ),
            expandedHeight: height,
            pinned: true,
            actions: widget.actions,
            backgroundColor: context.adColors.whiteTextColor,
          ),
        ),
        if (widget.stickyWidget != null)
          SliverPersistentHeader(
            delegate: _StickySearchBarDelegate(
              maxHeight: widget.stickyWidgetMaxHeight,
              minHeight: widget.stickyWidgetMinHeight,
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
  EdgeInsets? padding;
  final Widget? stickyWidget;

  _StickySearchBarDelegate({
    this.minHeight,
    this.maxHeight,
    this.padding,
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
    return Container(
      height: maxHeight ?? defaultStickyHeaderHeight,
      padding: padding ?? EdgeInsets.zero,
      alignment: Alignment.center,
      color: context.adColors.whiteTextColor,
      child: stickyWidget,
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
    this.titleCallBack,
    this.titleTextStyle,
    this.subTitleKey,
    this.titleKey,
    this.flexibleTitleTopPadding,
    this.flexibleTitleBottomPadding,
    this.flexibleTitleLeftPadding,
    this.flexibleTitleRightPadding,
  }) : super(key: key);

  final String? title;
  final GestureTapCallback? titleCallBack;
  final TextStyle? titleTextStyle;
  final GlobalKey? subTitleKey;
  final GlobalKey? titleKey;
  final double? flexibleTitleTopPadding;
  final double? flexibleTitleBottomPadding;
  final double? flexibleTitleLeftPadding;
  final double? flexibleTitleRightPadding;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (Navigator.of(context).canPop())
              ADSizedBox(
                height: vPadding40,
              ),
            Padding(
              key: titleKey,
              padding: EdgeInsets.only(
                bottom: flexibleTitleBottomPadding ?? 0,
                left: flexibleTitleLeftPadding ?? 0,
                right: flexibleTitleRightPadding ?? 0,
                top: flexibleTitleTopPadding ?? vPadding16,
              ),
              child: _GetSelectedState(
                gestureTapCallback: titleCallBack,
                titleTextStyle: titleTextStyle,
                title: title,
              ),
            ),
          ],
        ).paddingBySide(
          left: hPadding14,
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
  }) : super(key: key);

  final String? title;
  final GestureTapCallback? gestureTapCallback;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureTapCallback,
      child: Row(
        children: [
          Flexible(
            child: Text(
              title ?? '',
              style: titleTextStyle ??
                  ADTextStyle700.size22.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (gestureTapCallback != null)
            Icon(
              Icons.keyboard_arrow_down,
              size: context.k_28,
              color: context.adColors.blackTextColor,
            ).paddingBySide(right: hPadding40),
        ],
      ).paddingBySide(left: context.k_4),
    );
  }
}
