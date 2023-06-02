/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/site_core/model/avatars/avatars_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/image_picker_handler.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ImagePickerDialog extends StatefulWidget {
  const ImagePickerDialog({
    Key? key,
    required this.avatarsList,
    required this.onUpdateAvatar,
    required this.selectedAvatar,
    required this.imagePickerHandler,
    required this.onUpdateProfileImage,
  }) : super(key: key);

  final List<Avatar> avatarsList;

  final String? selectedAvatar;

  final void Function(String?, String) onUpdateAvatar;

  final Function(File) onUpdateProfileImage;

  final ImagePickerHandler imagePickerHandler;

  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  final ValueNotifier<String?> _avatarImageSelected = ValueNotifier(null);

  bool loadingImageFile = false;

  @override
  void initState() {
    super.initState();
    _initIfAlreadySelectedAvatar();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.k_14,
                ),
                InkWell(
                  onTap: () => openGallery(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: context.k_20,
                              width: context.k_20,
                              child: SvgPicture.asset(
                                SvgAssets.gallery,
                                color: context.adColors.darkGreyTextColor,
                              ),
                            ),
                            SizedBox(
                              width: context.k_16,
                            ),
                            Text(
                              'choose_from_gallery'.localize(context),
                              style: ADTextStyle400.size16.setTextColor(
                                context.adColors.storyViewBarFillColor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: context.adColors.darkGreyTextColor,
                          size: context.k_14,
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ).paddingBySide(
                    top: context.k_16,
                    bottom: context.k_16,
                  ),
                ),
                InkWell(
                  onTap: () => openCamera(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: context.k_20,
                              width: context.k_20,
                              child: SvgPicture.asset(
                                SvgAssets.camera,
                                color: context.adColors.darkGreyTextColor,
                              ),
                            ),
                            SizedBox(
                              width: context.k_16,
                            ),
                            Text(
                              'take_a_photo'.localize(context),
                              style: ADTextStyle400.size16.setTextColor(
                                context.adColors.storyViewBarFillColor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: context.adColors.darkGreyTextColor,
                          size: context.k_14,
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ).paddingBySide(
                    top: context.k_16,
                    bottom: context.k_16,
                  ),
                ),
                SizedBox(
                  height: context.k_30,
                ),
                Text(
                  'choose_an_avatar'.localize(context),
                  style: ADTextStyle600.size18.setTextColor(
                    context.adColors.storyViewBarFillColor,
                  ),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
                SizedBox(
                  height: context.k_30,
                ),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount:
                      _ImagePickerDialogConstants.crossAxisAvatarCount,
                  crossAxisSpacing: context.scaled(context.k_6),
                  mainAxisSpacing: context.scaled(context.k_6),
                  shrinkWrap: true,
                  children: widget.avatarsList
                      .map(
                        (avatar) => ValueListenableBuilder<String?>(
                          valueListenable: _avatarImageSelected,
                          builder: (context, avatarIndex, _) => DecoratedBox(
                            decoration: BoxDecoration(
                              border: _showBorder(avatar)
                                  ? Border.all(
                                      color: context.adColors.black,
                                      width: context.k_2,
                                    )
                                  : null,
                              borderRadius: _showBorder(avatar)
                                  ? BorderRadius.circular(
                                      context.scaled(context.k_40),
                                    )
                                  : null,
                            ),
                            child: CircleAvatar(
                              backgroundColor: context.adColors.paleGrey,
                              child: GestureDetector(
                                onTap: () => _avatarImageSelected.value =
                                    avatar.avatarImage,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      context.scaled(context.k_38),
                                    ),
                                  ),
                                  child: Image.network(
                                    avatar.avatarImage,
                                  ),
                                ),
                              ),
                            ).paddingAllSide(
                              context.k_8,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.k_8,
        ),
        const Divider(height: 1, thickness: 1),
        SizedBox(
          height: context.k_20,
        ),
        ValueListenableBuilder<String?>(
          valueListenable: _avatarImageSelected,
          builder: (context, _, __) => ElevatedButton(
            onPressed: _isButtonDisabled()
                ? null
                : () => widget.onUpdateAvatar(
                      _avatarImageSelected.value,
                      _parseAvatar(_avatarImageSelected.value ?? ''),
                    ),
            style: ElevatedButton.styleFrom(
              shadowColor: context.adColors.transparentColor,
              primary: context.adColors.black,
              shape: const StadiumBorder(),
              disabledBackgroundColor: context.adColors.greyReviewShade,
            ),
            child: Container(
              height: context.k_48,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'forceUpgradeActionTitle'.localize(context),
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
      ],
    );
  }

  bool _isButtonDisabled() {
    final imageSelected = _avatarImageSelected.value;
    return (imageSelected == null) ||
        (_fileName(imageSelected) == widget.selectedAvatar);
  }

  ///To identify which of the avatar user has selected
  bool _showBorder(Avatar avatar) {
    if (_avatarImageSelected.value == null) {
      return false;
    }
    return avatar.avatarImage == _avatarImageSelected.value;
  }

  ///If user has already selected one of the avatar
  void _initIfAlreadySelectedAvatar() {
    final selectedAvatar = widget.avatarsList.firstWhereOrNull(
      (avatar) => _fileName(avatar.avatarImage) == widget.selectedAvatar,
    );
    if (selectedAvatar != null) {
      _avatarImageSelected.value = selectedAvatar.avatarImage;
    }
  }

  ///Returns last path segment of url
  String _parseAvatar(String avatarUrl) {
    if (avatarUrl.isNullOrEmpty) {
      return '';
    }
    return Uri.parse(avatarUrl).pathSegments.last;
  }

  ///Returns file name for downloaded avatar file
  String _fileName(String avatarUrl) {
    final String returnValue = _parseAvatar(avatarUrl);
    return returnValue.split('.').first;
  }

  Future<void> openGallery() async {
    toggleImageFileLoader();
    final imagePickStatus = await widget.imagePickerHandler.openGallery();
    await _processImagePickStatus(imagePickStatus);
  }

  Future<void> _openImageCropperScreen() async {
    final pickedImage = widget.imagePickerHandler.getImage;
    if (pickedImage != null) {
      final cropperScreenValue = await Navigator.of(context).pushNamed(
        imageCropperScreen,
        arguments: [
          File(pickedImage.path),
          widget.onUpdateProfileImage,
        ],
      );
      adLog(cropperScreenValue.toString());
    }
  }

  Future<void> openCamera() async {
    toggleImageFileLoader();
    final imagePickStatus = await widget.imagePickerHandler.openCamera();
    await _processImagePickStatus(imagePickStatus);
  }

  Future<void> _processImagePickStatus(ImagePickStatus imagePickStatus) async {
    switch (imagePickStatus) {
      case ImagePickStatus.picked:
        await _openImageCropperScreen();
        toggleImageFileLoader();
        return;
      case ImagePickStatus.permissionDenied:
        navigatorPopScreenUntil(
          context,
          ModalRoute.withName(updateProfile),
        );
        SnackBarUtil.showSnackBar(
          context,
          'permission_denied'.localize(context),
        );
        return;
      case ImagePickStatus.notPicked:
        toggleImageFileLoader();
        return;
      case ImagePickStatus.error:
        navigatorPopScreenUntil(
          context,
          ModalRoute.withName(updateProfile),
        );
        SnackBarUtil.showSnackBar(
          context,
          'ADLMS02'.localize(context),
        );
        return;
      default:
        return;
    }
  }

  void toggleImageFileLoader() {
    loadingImageFile = !loadingImageFile;
    if (loadingImageFile) {
      ProcessDialog.showLoadingDialog(context);
    } else {
      ProcessDialog.closeLoadingDialog(context);
    }
  }
}

class _ImagePickerDialogConstants {
  static const crossAxisAvatarCount = 4;
}
