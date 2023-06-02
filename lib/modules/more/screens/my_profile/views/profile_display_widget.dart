/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/image_picker_dialog.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/image_picker_handler.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ProfileDisplayWidget extends StatefulWidget {
  const ProfileDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDisplayWidget> createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  UpdateProfileState? updateProfileState;

  AppSessionState? appSessionState;

  @override
  void initState() {
    super.initState();
    updateProfileState = context.read<UpdateProfileState>();
    appSessionState = context.read<AppSessionState>();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AppSessionState, File?>(
      selector: (context, state) => state.profileImageFile,
      builder: (context, imageFile, child) => ValueListenableBuilder<bool>(
        valueListenable:
            updateProfileState?.loadingProfileImage ?? ValueNotifier(false),
        builder: (context, loadingImage, _) => Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _ProfileImageBoundary(
                  child: GestureDetector(
                    onTap: _openAvatarBottomSheet,
                    child: imageFile != null
                        ? _CropImageBoundary(
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                            ),
                          )
                        : _CropImageBoundary(
                            child: Image.asset(
                              'lib/assets/images/airports/avtar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                if (loadingImage)
                  Positioned.fill(
                    child: _ProfileImageBoundary(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.adColors.paleGrey.withOpacity(
                            _ProfileDisplayWidgetConstants.loaderOpacity,
                          ),
                        ),
                        child: const ADDotProgressView(),
                      ),
                    ),
                  ), // Rectangle
                Positioned(
                  child: GestureDetector(
                    onTap: loadingImage ? null : _openAvatarBottomSheet,
                    child: Container(
                      alignment: Alignment.center,
                      width: _ProfileDisplayWidgetConstants.editButtonWidth.sp,
                      height: context.k_24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            context.k_4,
                          ),
                        ),
                        border: Border.all(
                          color: _ProfileDisplayWidgetConstants.pinkishGrey,
                        ),
                        color: context.adColors.whiteTextColor,
                      ),
                      child: Text(
                        'edit_'.localize(context),
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.black,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Selector<UpdateProfileState, PersonInfo>(
              selector: (_, state) =>
                  state.profileModel.personInfo ?? const PersonInfo(),
              builder: (context, personInfo, child) => Column(
                children: [
                  if (!personInfo.firstName.isNullOrEmpty ||
                      !personInfo.lastName.isNullOrEmpty)
                    Text(
                      '${personInfo.firstName ?? ''} ${personInfo.lastName ?? ''}',
                      style: ADTextStyle700.size22.setTextColor(
                        context.adColors.black,
                      ),
                      maxLines: 1,
                    ).paddingBySide(
                      top: context.k_15,
                    ),
                  if (!personInfo.joiningDate.isNullOrEmpty)
                    Text(
                      '${'joined_in'.localize(context)} ${personInfo.joiningDate}',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.black,
                      ),
                    ).paddingBySide(
                      top: context.k_6,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openAvatarBottomSheet() {
    final profileImageFileName = appSessionState?.profileImageFile?.path
        .split('/')
        .last
        .split('.')
        .first;
    adShowBottomSheet(
      context: context,
      headerTitle: 'uploadAPhoto'.localize(context),
      isPaddingRequired: false,
      childWidget: ImagePickerDialog(
        avatarsList: context
                .read<SiteCoreStateManagement>()
                .avatars
                ?.result
                .where((avatar) => avatar.avatarInclude)
                .toList() ??
            [],
        onUpdateAvatar: _setAvatarImage,
        onUpdateProfileImage: _setProfilePicture,
        selectedAvatar: profileImageFileName,
        imagePickerHandler: ImagePickerHandler()..init(),
      ),
    );
  }

  void _setProfilePicture(File? file) {
    if (file != null) {
      updateProfileState?.loadingProfileImage.value = true;
      navigatorPopScreen(context);
      navigatorPopScreen(context);
      final updateProfileImageCall =
          updateProfileState?.sendProfileImageApi(file);
      if (updateProfileImageCall != null) {
        _processAfterUpdate(updateProfileImageCall, file);
      }
    }
  }

  Future<void> _setAvatarImage(String? selectedImage, String imageName) async {
    if (selectedImage != null) {
      updateProfileState?.loadingProfileImage.value = true;
      navigatorPopScreen(context);
      final imageUrl = selectedImage;
      final downloadedFileBytes = await MyProfileUtils.downloadFile(imageUrl);
      final fileToUpload = await MyProfileUtils.createFile(
        downloadedFileBytes,
        imageName,
      );
      final updateProfileCall =
          updateProfileState?.sendProfileImageApi(fileToUpload);
      if (updateProfileCall != null) {
        _processAfterUpdate(updateProfileCall, fileToUpload);
      }
    }
  }

  void _processAfterUpdate(
    Future<ADResponseState> updateProfileImageCall,
    File file,
  ) {
    updateProfileImageCall.then((state) {
      final status = state.viewStatus;
      if (status == Status.complete) {
        appSessionState?.updateProfileImage(file);
      } else {
        final String errorText =
            updateProfileState?.getProfile.message ?? 'ADLMS02';
        SnackBarUtil.showSnackBar(
          context,
          errorText.localize(context),
          _ProfileDisplayWidgetConstants.toastTime,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: _ProfileDisplayWidgetConstants.toastBottomMargin.sp,
          ),
        );
      }
    });
  }
}

class _ProfileDisplayWidgetConstants {
  static const double profileImageHeight = 140;
  static const double imageRadii = 65;
  static const double editButtonWidth = 45;
  static const double loaderOpacity = 0.5;
  static const double toastBottomMargin = 80;
  static const int toastTime = 1000;
  static const Color pinkishGrey = Color(0xffcccccc);
}

class _ProfileImageBoundary extends StatelessWidget {
  const _ProfileImageBoundary({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: _ProfileDisplayWidgetConstants.profileImageHeight.sp,
      height: _ProfileDisplayWidgetConstants.profileImageHeight.sp,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              _ProfileDisplayWidgetConstants.profileImageHeight.sp,
            ),
          ),
        ),
      ),
      child: child,
    ).paddingAllSide(
      context.k_10,
    );
  }
}

class _CropImageBoundary extends StatelessWidget {
  const _CropImageBoundary({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _ProfileDisplayWidgetConstants.imageRadii.sp,
      backgroundColor: _ProfileDisplayWidgetConstants.pinkishGrey,
      child: Padding(
        padding: const EdgeInsets.all(
          1,
        ),
        child: ClipOval(
          child: child,
        ),
      ),
    );
  }
}
