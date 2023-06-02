/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_search.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double expandedHeightValue = 92.h;
const double percentageOfScrollLimit = 89;
final double hPadding40 = 40.sp;
// const double vPadding12 = 12;
final double defaultStickyHeaderHeight = 70.sp;
final double vPadding6 = 6.sp;
final double w_16 = 16.sp;
final double w_132 = 132.sp;
// const Color _closeIconColor = Color(0xff333333);

/// This is sliver app bar base class for normal screens and draggable bottom sheet
class HomeSliverAppBarBaseComponent extends StatefulWidget {
  ///body of scaffold
  final Widget body;

  /// callback used to set title call back
  final GestureTapCallback? titleCallBack;

  /// callback for search action
  final GestureTapCallback? searchCallBack;

  /// this sets title text
  final String? title;

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

  final bool? pinnedVale;

  final Color? appBarBackgroundColor;

  final Color? stickyWidgetBackgroundColor;

  final ScrollPhysics? physics;

  HomeSliverAppBarBaseComponent({
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
    this.pinnedVale = false,
    Key? key,
    this.appBarBackgroundColor,
    this.stickyWidgetBackgroundColor,
    this.physics,
  }) : super(key: key);

  @override
  State<HomeSliverAppBarBaseComponent> createState() =>
      _HomeSliverAppBarBaseComponent();
}

class _HomeSliverAppBarBaseComponent
    extends State<HomeSliverAppBarBaseComponent> {
  final ScrollController _scrollController = ScrollController();
  ValueNotifier<String?> titleNotifier = ValueNotifier<String?>('');
  ValueNotifier<double> heightNotifier =
      ValueNotifier<double>(expandedHeightValue);

  // ValueNotifier<bool> appBarFloatingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    adLog('initState');

    heightNotifier.value = (widget.expandedHeight ?? expandedHeightValue) +
        ((widget.title?.isNotEmpty ?? false)
            ? widget.flexibleTitleTopPadding ?? 0
            : 0) +
        ((widget.title?.isNotEmpty ?? false)
            ? widget.flexibleTitleBottomPadding ?? 0
            : 0);
    _scrollController.addListener(_titleScrollListener);
    if (widget.flexibleSpaceBarWidget == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        heightNotifier.value =
            (widget.titleKey.currentContext?.findRenderObject() as RenderBox)
                    .size
                    .height +
                (widget.subTitle?.isNotEmpty ?? false
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

    // heightNotifier.value = ((widget.subTitleTextStyle ??
    //                 ADTextStyle400.size14.setTextColor(
    //                   context.adColors.greyTextColor,
    //                 ))
    //             .fontSize ??
    //         0) +
    //     ((widget.titleTextStyle ??
    //                 ADTextStyle600.size32.setTextColor(
    //                   context.adColors.blackTextColor,
    //                 ))
    //             .fontSize ??
    //         0) +
    //     (widget.flexibleTitleBottomPadding ?? 0) +
    //     (widget.flexibleTitleTopPadding ?? 0) +
    //     (widget.flexibleTitleLeftPadding ?? 0) +
    //     (widget.flexibleTitleRightPadding ?? 0);
  }

  void _titleScrollListener() {
    titleNotifier.value = '';
    widget.scrollListener?.call(_scrollController);
    // adLog(
    //     '_scrollController.hasClients ${_scrollController.position.pixels} ${_scrollController.position.maxScrollExtent}');
    // adLog(
    //     '_scrollController.offset > (heightNotifier.value - kToolbarHeight) ${_scrollController.position.pixels}');
    // appBarFloatingNotifier.value = _scrollController.position.pixels ==
    //     _scrollController.position.maxScrollExtent;
  }

  @override
  Widget build(BuildContext context) {
    const minScaleValue = 0.99;

    ///TODO need to optimize this
    if (widget.titleCallBack != null) {
      if (widget.flexibleSpaceBarWidget == null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          heightNotifier.value =
              (widget.titleKey.currentContext?.findRenderObject() as RenderBox)
                      .size
                      .height +
                  (widget.subTitle?.isNotEmpty ?? false
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
    adLog('sliver can pop ${ModalRoute.of(context)?.canPop ?? false}');
    return Stack(
      children: [
        // if (widget.appBarBackgroundColor != null)
        //   ValueListenableBuilder(
        //     valueListenable: heightNotifier,
        //     builder: (context, double height, child) {
        //       adLog(
        //           'Container App Bar Height ${MediaQuery.of(context).padding.top + height + (widget.searchBarPadding?.vertical ?? context.k_20) + (widget.searchBarMaxHeight ?? defaultStickyHeaderHeight)}');
        //       return ValueListenableBuilder(
        //         valueListenable: appBarFloatingNotifier,
        //         builder: (context, bool value, child) => Container(
        //           color: widget.appBarBackgroundColor,
        //           height: MediaQuery.of(context).padding.top +
        //               (value ? 0 : height) +
        //               (widget.searchBarPadding?.vertical ?? context.k_20) +
        //               (widget.searchBarMaxHeight ?? defaultStickyHeaderHeight) +
        //               context.k_10,
        //         ),
        //       );
        //     },
        //   ),
        NestedScrollView(
          controller: _scrollController,
          physics: widget.physics,
          clipBehavior: Clip.antiAlias,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            ValueListenableBuilder(
              valueListenable: heightNotifier,
              builder: (context, double height, child) {
                adLog('Sliver App Bar Height $height');
                return SliverAppBar(
                  //manages horizontal spacing around title
                  titleSpacing: 0,
                  centerTitle: false,
                  shape: widget.appBarBackgroundColor != null
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0,
                            color:
                                widget.appBarBackgroundColor ?? ADColors.white,
                          ),
                        )
                      : null,
                  forceElevated: innerBoxIsScrolled,
                  elevation: 0,
                  toolbarHeight: height + context.k_20,
                  leadingWidth: 0,
                  pinned: widget.pinnedVale ?? false,
                  systemOverlayStyle: widget.appBarBackgroundColor != null
                      ? SystemUiOverlayStyle.light
                      : SystemUiOverlayStyle.dark,
                  automaticallyImplyLeading: false,
                  title: Column(
                    children: [
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.isBack &&
                              (ModalRoute.of(context)?.canPop ?? false))
                            widget.closeScreenWidget ??
                                SizedBox(
                                  height: height,
                                  width: context.k_40,
                                  child: const BackButton(),
                                ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.isBack &&
                                    (ModalRoute.of(context)?.canPop ?? false))
                                  ADSizedBox(
                                    height: widget.closeWidgetBottomSpacing ??
                                        context.k_40,
                                  ),
                                Container(
                                  width: context.widthOfScreen,
                                  key: widget.titleKey,
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TouchableOpacity(
                                          scaleMinValue: minScaleValue,
                                          onTap: widget.titleCallBack,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: FittedBox(
                                                  alignment: Alignment.topLeft,
                                                  fit: BoxFit.scaleDown,
                                                  child: (widget.title
                                                              ?.contains(
                                                            'Other',
                                                          ) ??
                                                          false)
                                                      ? SizedBox(
                                                          height: context.k_40,
                                                          width: w_132,
                                                          child: SvgPicture
                                                              .network(
                                                            selectedAirportsData
                                                                    ?.airportIcon ??
                                                                '',
                                                          ),
                                                        )
                                                      : Text(
                                                          widget.title ?? '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: widget
                                                                  .titleTextStyle ??
                                                              ADTextStyle600
                                                                  .size32
                                                                  .setTextColor(
                                                                context.adColors
                                                                    .blackTextColor,
                                                              ),
                                                          maxLines: 1,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                ),
                                              ),
                                              if (widget.titleCallBack != null)
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: context.k_28,
                                                  color: widget.titleTextStyle
                                                          ?.color ??
                                                      context.adColors
                                                          .blackTextColor,
                                                ).paddingBySide(
                                                  left: context.k_4,
                                                ),
                                            ],
                                          ).paddingBySide(
                                            right: context.k_64,
                                          ),
                                        ),
                                      ),
                                      ADSizedBox(
                                        height: context.k_34,
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: widget.actions ?? [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (widget.subTitle?.isNotEmpty ?? false)
                                  Padding(
                                    key: widget.subTitleKey,
                                    padding: EdgeInsets.only(
                                      bottom:
                                          widget.flexibleTitleBottomPadding ??
                                              0,
                                      left:
                                          widget.flexibleTitleLeftPadding ?? 0,
                                      right:
                                          widget.flexibleTitleRightPadding ?? 0,
                                      top: widget.flexibleTitleTopPadding ?? 0,
                                    ),
                                    child: _GetSelectedState(
                                      gestureTapCallback: widget.titleCallBack,
                                      titleTextStyle: widget
                                              .subTitleTextStyle ??
                                          ADTextStyle400.size12.setTextColor(
                                            context.adColors.greyTextColor,
                                          ),
                                      title: widget.subTitle,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ).paddingBySide(
                        left: widget.appBarLeftPadding ?? context.k_14,
                        right: widget.appBarRightPadding ?? 0,
                      ),
                    ],
                  ),
                  // flexibleSpace: widget.flexibleSpaceBarWidget ??
                  //     _SetFlexibleSpaceBar(
                  //       titleKey: widget.titleKey,
                  //       isBack: widget.isBack,
                  //       subTitleKey: widget.subTitleKey,
                  //       closeWidgetBottomSpacing: widget.closeWidgetBottomSpacing,
                  //       titleTextStyle: widget.titleTextStyle,
                  //       subTitleTextStyle: widget.subTitleTextStyle,
                  //       title: widget.title,
                  //       subTitle: widget.subTitle,
                  //       titleCallBack: widget.titleCallBack,
                  //       flexibleTitleTopPadding: widget.flexibleTitleTopPadding,
                  //       flexibleTitleBottomPadding:
                  //           widget.flexibleTitleBottomPadding,
                  //       flexibleTitleLeftPadding: widget.flexibleTitleLeftPadding,
                  //       flexibleTitleRightPadding: widget.flexibleTitleRightPadding,
                  //       searchCallBack: widget.searchCallBack,
                  //     ),
                  // flexibleSpace: FlexibleSpaceBar(
                  //   background: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       FittedBox(
                  //         key: widget.subTitleKey,
                  //         fit: BoxFit.scaleDown,
                  //         child: Text(
                  //           widget.subTitle ?? '',
                  //           overflow: TextOverflow.ellipsis,
                  //           style: widget.subTitleTextStyle ??
                  //               ADTextStyle400.size14.setTextColor(
                  //                 context.adColors.greyTextColor,
                  //               ),
                  //           maxLines: 1,
                  //           textAlign: TextAlign.left,
                  //         ).paddingBySide(
                  //           right: context.k_64,
                  //         ),
                  //       ),
                  //     ],
                  //   ).paddingBySide(
                  //     right: context.k_64,
                  //   ),
                  // ).paddingBySide(
                  //   left: widget.appBarLeftPadding ?? context.k_14,
                  //   right: widget.appBarRightPadding ?? context.k_14,
                  // ),
                  floating: true,
                  backgroundColor:
                      widget.appBarBackgroundColor ?? ADColors.white,
                );
              },
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
                  backgroundColor: widget.stickyWidgetBackgroundColor,
                ),
                pinned: true,
              ),
          ],
          body: widget.body,
        ),
      ],
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
  final Color? backgroundColor;

  _StickySearchBarDelegate({
    this.minHeight,
    this.maxHeight,
    this.padding,
    this.searchCallBack,
    this.searchTitle,
    this.stickyWidget,
    this.backgroundColor,
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
        decoration: BoxDecoration(
          border: Border.all(
            width: 0,
            color: backgroundColor ?? ADColors.white,
          ),
          color: backgroundColor ?? ADColors.white,
        ),
        height: maxHeight ?? defaultStickyHeaderHeight,
        padding: padding ??
            EdgeInsets.only(
              right: context.k_14,
              left: context.k_14,
              top: context.k_10,
              bottom: context.k_10,
            ),
        alignment: Alignment.center,
        // color: backgroundColor ?? ADColors.white,
        child: stickyWidget ?? ADSearch(searchTitle: searchTitle ?? 'Search'),
      ),
    );
  }

  @override
  bool shouldRebuild(_StickySearchBarDelegate oldDelegate) {
    return true;
  }
}

// class _SetFlexibleSpaceBar extends StatelessWidget {
//   const _SetFlexibleSpaceBar({
//     Key? key,
//     required this.title,
//     this.isBack = true,
//     this.subTitle,
//     this.titleCallBack,
//     this.searchCallBack,
//     this.titleTextStyle,
//     this.subTitleTextStyle,
//     this.closeWidgetBottomSpacing,
//     this.subTitleKey,
//     this.titleKey,
//     this.flexibleTitleTopPadding,
//     this.flexibleTitleBottomPadding,
//     this.flexibleTitleLeftPadding,
//     this.flexibleTitleRightPadding,
//   }) : super(key: key);
//
//   final String? title;
//   final bool isBack;
//   final String? subTitle;
//   final GestureTapCallback? searchCallBack;
//   final GestureTapCallback? titleCallBack;
//   final TextStyle? titleTextStyle;
//   final TextStyle? subTitleTextStyle;
//   final double? closeWidgetBottomSpacing;
//   final GlobalKey? subTitleKey;
//   final GlobalKey? titleKey;
//   final double? flexibleTitleTopPadding;
//   final double? flexibleTitleBottomPadding;
//   final double? flexibleTitleLeftPadding;
//   final double? flexibleTitleRightPadding;
//
//   @override
//   Widget build(BuildContext context) {
//     return FlexibleSpaceBar(
//       background: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             if (isBack && (ModalRoute.of(context)?.canPop ?? false))
//               ADSizedBox(
//                 height: closeWidgetBottomSpacing ?? context.k_40,
//               ),
//             if (subTitle != null)
//               Container(
//                 key: subTitleKey,
//                 margin: const EdgeInsets.only(
//                   right: 80,
//                 ),
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   children: [
//                     ADSizedBox(
//                       height: context.k_10,
//                     ),
//                     FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         subTitle ?? '',
//                         overflow: TextOverflow.ellipsis,
//                         style: subTitleTextStyle ??
//                             ADTextStyle400.size14.setTextColor(
//                               context.adColors.greyTextColor,
//                             ),
//                         maxLines: 1,
//                         textAlign: TextAlign.left,
//                       ).paddingBySide(
//                         right: context.k_64,
//                         top: vPadding12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             Padding(
//               key: titleKey,
//               padding: EdgeInsets.only(
//                 bottom: flexibleTitleBottomPadding ?? 0,
//                 left: flexibleTitleLeftPadding ?? 0,
//                 right: flexibleTitleRightPadding ?? 0,
//                 top: flexibleTitleTopPadding ?? 0,
//               ),
//               child: _GetSelectedState(
//                 gestureTapCallback: titleCallBack,
//                 titleTextStyle: titleTextStyle ??
//                     ADTextStyle600.size32
//                         .setTextColor(context.adColors.blackTextColor),
//                 title: title,
//               ),
//             ),
//           ],
//         ).paddingBySide(
//           left: context.k_14,
//         ),
//       ),
//     );
//   }
// }

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
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title ?? '',
                style: titleTextStyle ??
                    ADTextStyle400.size12.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                overflow: TextOverflow.ellipsis,
              ).paddingBySide(
                right: gestureTapCallback == null ? context.k_48 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
