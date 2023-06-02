/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dialog_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/screen_helper/automation_keys/loyalty_automation_keys.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class is used to show loyalty dialog.

class DialogView extends StatefulWidget {
  const DialogView({
    Key? key,
    required this.buttonRequired,
    this.buildContext,
  }) : super(key: key);

  final bool buttonRequired;
  final BuildContext? buildContext;
  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> with TickerProviderStateMixin {
  ///local variables

  final double _k_96 = 96.sp;
  final double _k_104 = 104.sp;
  final double _k_164 = 164.sp;
  final double _k_122 = 122.sp;
  final double _k_220 = 220.sp;
  final double _dialogHeight = 552.sp;
  final double _dialogWidth = 324.sp;
  final double gifWidth = 206.sp;
  final double gifHeight = 196.sp;
  final double widgetHeight = 210.sp;
  final double _beginPosition = 150;
  final double _endPosition = 394;
  final int indexCount = 4;
  Animation<double>? mAnimation;
  AnimationController? mAnimationController;
  final LoyaltyStateManagement _dailogViewModel = LoyaltyStateManagement();
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    _dailogViewModel.fetchDialog();
    mAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 18));
    mAnimation =
        Tween<double>(begin: _beginPosition, end: _endPosition).animate(
      CurvedAnimation(
        parent: mAnimationController ?? AnimationController(vsync: this),
        curve: Curves.easeInOut,
      ),
    );
    mAnimationController
        ?.repeat(reverse: true)
        .then((value) => adLog('animation controller repeating'));

    PlaySound.playAudioSound('adani_point_rewards.mp3');
    super.initState();
  }

  @override
  void dispose() {
    mAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ADSelectorStateLessWidget<LoyaltyStateManagement>(
        viewModel: _dailogViewModel,
        child: Selector<LoyaltyStateManagement, ADResponseState>(
          selector: (context, viewModel) => viewModel.loyaltySiteCoreState,
          builder: (context, value, Widget? child) {
            switch (value.viewStatus) {
              case Status.loading:
                return const ADSizedBox.shrink();
              case Status.error:
                return Center(child: Text(value.message.toString()));
              case Status.complete:
                final List<LoyaltyDialogItems> dialogViewSiteCoreResponse =
                    value.data as List<LoyaltyDialogItems>;
                return Center(
                  child: Container(
                    height: _dialogHeight,
                    width: _dialogWidth,
                    decoration: ShapeDecoration(
                      //  color: context.adColors.whiteTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(context.k_16)),
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          'lib/assets/images/loyalty/popup_bg.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedBuilder(
                            builder: (context, child) {
                              return Positioned(
                                right: context.k_12,
                                top: mAnimation?.value,
                                child: Image.asset(
                                  'lib/assets/images/loyalty/popup_parashute.png',
                                  height: context.k_64,
                                  width: context.k_48,
                                ),
                              );
                            },
                            animation: mAnimationController?.view ??
                                AnimationController(vsync: this),
                          ),
                        ),
                        Positioned.fill(
                          child: Positioned(
                            right: context.k_4,
                            top: _k_220,
                            child: Image.asset(
                              'lib/assets/images/loyalty/popup_cloud.png',
                              height: context.k_64,
                              width: context.k_64,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Material(
                                color: context.adColors.transparentColor,
                                child: InkWell(
                                  key: const Key(
                                    LoyaltyAutomationKeys.dialogCloseKey,
                                  ),
                                  onTap: () => {
                                    gaEvents('cross'),
                                    Navigator.pop(context),
                                  },
                                  borderRadius: BorderRadius.circular(
                                    context.k_20,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgAssets.closeIcon,
                                    height: context.k_14,
                                    width: context.k_14,
                                    color: context.adColors.whiteTextColor,
                                  ).paddingBySide(
                                    left: context.k_16,
                                    top: context.k_16,
                                    right: context.k_16,
                                    bottom: context.k_16,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                ADSizedBox(
                                  height: _k_104,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        style: TextStyle(
                                          color:
                                              context.adColors.whiteTextColor,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.normal,
                                          fontSize: context.k_60,
                                        ),
                                        text: dialogViewSiteCoreResponse
                                            .first.widgetItems.first.subTitle
                                            .replaceAll(RegExp('[^0-9]'), ''),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: _k_122,
                                  width: double.infinity,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: AlignmentDirectional.topCenter,
                                    children: <Widget>[
                                      Positioned(
                                        top: context.k_30,
                                        right: context.k_60,
                                        left: context.k_60,
                                        child: Image.network(
                                          dialogViewSiteCoreResponse
                                              .first.widgetItems.first.imageSrc,
                                          height: _k_122,
                                          width: _k_104,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    ADSizedBox(
                                      height: context.k_30,
                                    ),
                                    ADSizedBox(
                                      height: _k_96,
                                    ),
                                    if (widget.buttonRequired)
                                      ADSizedBox(
                                        width: _k_164,
                                        height: context.k_48,
                                        child: ElevatedButton(
                                          key: const Key(
                                            LoyaltyAutomationKeys.knowMorekey,
                                          ),
                                          onPressed: () => {
                                            gaEvents('know_more'),
                                            navigateToScreen(),
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                context.adColors.whiteTextColor,
                                            shape: const StadiumBorder(),
                                            onSurface: context
                                                .adColors.lightGreyTextColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              dialogViewSiteCoreResponse.first
                                                  .widgetItems.first.ctaText,
                                              style: ADTextStyle600.size14
                                                  .setTextColor(
                                                context.adColors.blackColor,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ).paddingBySide(
                                            top: context.k_16,
                                            bottom: context.k_16,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                              //  top: context.k_14,
                              bottom: context.k_14,
                            ),
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
      ),
    );
  }

  /// GA event method
  void gaEvents(String type) {
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'referral',
      Parameters.label.name: '',
      Parameters.type.name: type == 'cross' ? 'cross' : 'know_more',
      Parameters.banner_category.name: 'popup',
    };
    ClickEvents.view_banner.logEvent(parameters: map);
  }

  void navigateToScreen() {
    Navigator.of(context).pop();
    if (widget.buildContext != null) {
      navigateToScreenUsingNamedRoute(
        widget.buildContext ?? context,
        loyaltyDashboard,
        rootNavigator: false,
      );
    } else {
      final CustomTabScaffold customTabScaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;
      final GlobalKey<NavigatorState> navigatorState =
          HomeBottomAssets.homeBottomPages.keys.toList()[4];
      customTabScaffold.controller?.index = indexCount;
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          navigatorState.currentState
              ?.pushNamedAndRemoveUntil(
                loyaltyDashboard,
                (route) => route.isFirst,
              )
              .then(
                (value) => adLog(
                  value?.toString(),
                ),
              );
        },
      );
    }
  }
}
