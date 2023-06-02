/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/duty_free_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

int selectedIndex = -1;
const double minScale = 0.1;
const double maxScale = 5;
const double k_2 = 2;
const double k_3 = 4;
double k_100 = 100.sp;

class DutyFreeViewProductImage extends StatefulWidget {
  const DutyFreeViewProductImage({Key? key, this.stories, required this.index})
      : super(key: key);
  final List<DutyStory>? stories;
  final int index;

  @override
  _DutyFreeViewProductImageState createState() =>
      _DutyFreeViewProductImageState();
}

class _DutyFreeViewProductImageState extends State<DutyFreeViewProductImage> {
  ValueNotifier<int> currentIndex = ValueNotifier(1);
  final _transformationController = TransformationController();
  TapDownDetails doubleTapDetails = TapDownDetails();
  PageController? pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transformationController.value = Matrix4.identity();
    currentIndex.value = widget.index + 1;
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        // backgroundColor: Co,
        appBar: AppBar(
          toolbarHeight: context.k_64,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: context.k_48,
          // leadingWidth: context.k_64,
          actions: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: context.k_16),
              child: ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (context, int value, child) => Text(
                  '${currentIndex.value}' '/' '${widget.stories?.length}',
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () => _willPopScope(),
            child: Container(
              color: context.adColors.transparentColor,
              padding: EdgeInsets.all(context.k_16),
              child: SvgPicture.asset(
                SvgAssets.closeIcon,
                color: context.adColors.black,
              ),
            ),
          ),

          foregroundColor: context.adColors.whiteTextColor,
        ),
        body: PageView.builder(
          controller: pageController,
          onPageChanged: (int? value) => pagerChange(value),
          itemCount: widget.stories?.length,
          itemBuilder: (BuildContext context, int index) {
            final String storyObjUrl = widget.stories?[index].url ?? '';

            return GestureDetector(
              onDoubleTapDown: _handleDoubleTapDown,
              onDoubleTap: () => _handleDoubleTap(index),
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: minScale,
                maxScale: maxScale,
                boundaryMargin: EdgeInsets.all(context.k_16),
                child: ADCachedImage(
                  imageUrl: storyObjUrl,
                  boxFit: BoxFit.contain,
                ).paddingBySide(
                  top: context.k_56,
                  bottom: context.k_56,
                  left: context.k_20,
                  right: context.k_20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void pagerChange(value) {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    }
    int index = value;
    currentIndex.value = ++index;
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    final detailsData = details;
    doubleTapDetails = detailsData;
  }

  void _handleDoubleTap(index) {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
      selectedIndex = -1;
    } else {
      final position = doubleTapDetails.localPosition;
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * k_2, -position.dy * k_2)
        ..scale(k_3);
      selectedIndex = index;
    }
  }

  Future<bool> _willPopScope() async {
    currentIndex.value = 1;
    Navigator.pop(context);
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    currentIndex.dispose();
    _transformationController.dispose();
  }
}
