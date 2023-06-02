/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ImageCropperScreen extends StatefulWidget {
  /// The aspect ratio to crop the image to. Defaults to an aspect ratio of 1.0
  final double aspectRatio;

  /// The image to crop.
  final File image;

  final void Function(File) saveImageCallback;

  const ImageCropperScreen({
    Key? key,
    this.aspectRatio = 1,
    required this.image,
    required this.saveImageCallback,
  }) : super(key: key);

  @override
  State<ImageCropperScreen> createState() => _ImageCropperScreenState();
}

class _ImageCropperScreenState extends State<ImageCropperScreen> {
  /// The cropper's key to reference when calling the crop function.
  final GlobalKey _cropperKey = GlobalKey();

  final TransformationController _transformationController =
      TransformationController();

  ValueNotifier<bool> imageAvailableToCrop = ValueNotifier(false);

  void _tryCroppingAndSavingImage() {
    ProcessDialog.showLoadingDialog(context);
    try {
      _crop();
    } catch (e) {
      adLog(e.toString());
      navigatorPopScreenUntil(
        context,
        ModalRoute.withName(updateProfile),
      );
      SnackBarUtil.showSnackBar(
        context,
        'ADLMS02'.localize(context),
      );
    }
  }

  /// Crops the image as displayed in the cropper widget, converts it to PNG format and returns it
  /// as [Uint8List]. The cropper widget should be referenced using its key.
  Future<void> _crop() async {
    // Get cropped image
    final renderObject = _cropperKey.currentContext?.findRenderObject();
    final boundary = renderObject as RenderRepaintBoundary;
    final originalImageFile = await boundary.toImage(
      pixelRatio: _ImageCropperScreenConstants.pixelRatio,
    );
    // Convert image to bytes in PNG format and return
    final byteData = await originalImageFile.toByteData(
      format: ImageByteFormat.png,
    );
    final pngBytes = byteData?.buffer.asUint8List();
    await saveAndSendImage(pngBytes ?? Uint8List(0));
  }

  // void _showImage(Uint8List? pngBytes) {
  //   if (pngBytes == null) {
  //     return;
  //   }
  //   adShowBottomSheet(
  //     headerTitle: 'Cropped Image',
  //     context: context,
  //     childWidget: CropImageBoundary(
  //       child: Image.memory(
  //         pngBytes,
  //       ),
  //     ),
  //   );
  // }

  ///save image file after selection and send in to backend with compression
  Future<void> saveAndSendImage(Uint8List byteData) async {
    final random = Random();
    final imageCount =
        random.nextInt(_ImageCropperScreenConstants.maxImageNumCount);
    final imageName = 'profileImage$imageCount.png';
    final createdFile = await MyProfileUtils.createFile(byteData, imageName);
    final createdFileSize =
        (createdFile.readAsBytesSync().lengthInBytes) / 1024;
    final compressedFile =
        await MyProfileUtils.compressFile(createdFileSize, createdFile);
    navigatorPopScreen(context);
    widget.saveImageCallback(compressedFile);
  }

  Future<Size> _calculateImageDimension(Image image) {
    final completer = Completer<Size>();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        //Ignoring as using external object inside callback
        //ignore: prefer-extracting-callbacks
        (ImageInfo image, bool synchronousCall) {
          final myImage = image.image;
          final Size size =
              Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
          imageAvailableToCrop.value = true;
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image.file(
      widget.image,
      fit: BoxFit.cover,
    );
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ClipRect(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal:
                          _ImageCropperScreenConstants.circleOverlayPadding,
                    ),
                    child: RepaintBoundary(
                      key: _cropperKey,
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio,
                        child: FutureBuilder<Size>(
                          future: _calculateImageDimension(imageWidget),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final imageSize = snapshot.data ?? Size.zero;
                              final screenWidth = context.widthOfScreen;
                              final allowedWidth = screenWidth -
                                  (_ImageCropperScreenConstants
                                          .circleOverlayPadding *
                                      _ImageCropperScreenConstants.two);
                              final allowedHeight = allowedWidth;
                              if (imageSize.height > allowedHeight) {
                                final sizeDiff =
                                    imageSize.height - allowedHeight;
                                _transformationController.value.setEntry(
                                  _ImageCropperScreenConstants.translateYColumn,
                                  _ImageCropperScreenConstants.translateRow,
                                  -(sizeDiff /
                                      _ImageCropperScreenConstants.two),
                                );
                              }
                              if (imageSize.width > allowedWidth) {
                                final sizeDiff = imageSize.width - allowedWidth;
                                _transformationController.value.setEntry(
                                  _ImageCropperScreenConstants.translateXColumn,
                                  _ImageCropperScreenConstants.translateRow,
                                  -(sizeDiff /
                                      _ImageCropperScreenConstants.two),
                                );
                              }
                              return InteractiveViewer(
                                transformationController:
                                    _transformationController,
                                clipBehavior: Clip.none,
                                constrained: false,
                                child: imageSize.width < allowedWidth &&
                                        imageSize.height < allowedHeight
                                    ? SizedBox(
                                        height: allowedHeight,
                                        width: allowedWidth,
                                        child: imageWidget,
                                      )
                                    : imageSize.width < allowedWidth
                                        ? SizedBox(
                                            width: allowedWidth,
                                            child: imageWidget,
                                          )
                                        : imageSize.height < allowedHeight
                                            ? SizedBox(
                                                height: allowedHeight,
                                                child: imageWidget,
                                              )
                                            : imageWidget,
                              );
                            }
                            return const ADDotProgressView();
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipPath(
                      clipper: _OverlayFrame(
                        aspectRatio: widget.aspectRatio,
                      ),
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.adColors.blackTextColor.withOpacity(
                              _ImageCropperScreenConstants.colorOpacity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: _ImageCropperScreenConstants.boxSize,
            color: context.adColors.boxShadowColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => navigatorPopScreen(context),
                  child: Text(
                    'cancel'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: imageAvailableToCrop,
                  builder: (context, imageAvailable, _) => TextButton(
                    onPressed:
                        imageAvailable ? _tryCroppingAndSavingImage : null,
                    child: Text(
                      'upload'.localize(context),
                      style: ADTextStyle500.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
              bottom: context.k_16,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCropperScreenConstants {
  static const double colorOpacity = 0.7;
  static const double pixelRatio = 3;
  static const double two = 2;
  static const int maxImageNumCount = 1000;
  static const double boxSize = 100;
  static const double circleOverlayPadding = 16;
  static const int translateXColumn = 0;
  static const int translateYColumn = 1;
  static const int translateRow = 3;
}

class _OverlayFrame extends CustomClipper<Path> {
  final double aspectRatio;

  _OverlayFrame({
    required this.aspectRatio,
  });

  @override
  Path getClip(Size size) {
    final double _height =
        aspectRatio >= 1 ? size.width / aspectRatio : size.height;
    final double _width =
        aspectRatio <= 1 ? size.height * aspectRatio : size.width;

    final opening = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(
            size.width / _ImageCropperScreenConstants.two,
            size.height / _ImageCropperScreenConstants.two,
          ),
          //subtracting padding
          radius: (min(_height, _width) / _ImageCropperScreenConstants.two) -
              _ImageCropperScreenConstants.circleOverlayPadding,
        ),
      );

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      opening..close(),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      aspectRatio != (oldClipper as _OverlayFrame).aspectRatio;
}
