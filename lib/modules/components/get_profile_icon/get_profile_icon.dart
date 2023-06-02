/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class GetProfileIcon extends StatelessWidget {
  const GetProfileIcon({
    Key? key,
    required this.imageFile,
    required this.circleSize,
    required this.namePrefix,
    this.iconSize,
    this.backGroundColor,
    required this.isLoggedIn,
    required this.textStyle,
  }) : super(key: key);
  final File? imageFile;
  final double circleSize;
  final String namePrefix;
  final double? iconSize;
  final Color? backGroundColor;
  final bool isLoggedIn;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    // final kGradientBoxDecoration = BoxDecoration(
    //   gradient: adGradientColorType3,
    //   shape: BoxShape.circle,
    // );
    final kGuestBoxDecoration = BoxDecoration(
      color: context.adColors.darkGreyTextColor,
      shape: BoxShape.circle,
    );
    return Container(
      height: circleSize,
      width: circleSize,
      decoration: ProfileSingleton.profileSingleton.isLoggedIn
          ? null
          : kGuestBoxDecoration,
      child: isLoggedIn
          ? _GetProfileImageComponent(
              imageFile: imageFile,
              circleSize: circleSize,
            )
          : (isLoggedIn && namePrefix.isNotEmpty)
              ? _GetProfileNameComponent(
                  namePrefix: namePrefix,
                  circleSize: circleSize,
                  textStyle: textStyle,
                )
              : _GetProfileGuestUserIconComponent(
                  circleSize: circleSize,
                  iconSize:
                      iconSize != null ? iconSize ?? circleSize : circleSize,
                ),
    );
  }
}

class _GetProfileImageComponent extends StatelessWidget {
  const _GetProfileImageComponent({
    Key? key,
    required this.imageFile,
    required this.circleSize,
  }) : super(key: key);
  final File? imageFile;
  final double circleSize;

  @override
  Widget build(BuildContext context) {
    final imageProvider = (imageFile == null)
        ? const AssetImage('lib/assets/images/airports/avtar.png')
        : FileImage(imageFile ?? File(''));
    return Container(
      width: circleSize,
      height: circleSize,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.adColors.whiteTextColor,
        image: DecorationImage(
          image: imageProvider as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _GetProfileNameComponent extends StatelessWidget {
  const _GetProfileNameComponent({
    Key? key,
    required this.namePrefix,
    // this.textColor,
    // this.backGroundColor,
    required this.circleSize,
    required this.textStyle,
  }) : super(key: key);
  final String namePrefix;

  // final Color? textColor;
  // final Color? backGroundColor;
  final double circleSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: backGroundColor ?? context.adColors.whiteTextColor,
        color: context.adColors.whiteTextColor,
      ),
      child: Center(
        child: Text(
          namePrefix,
          style: textStyle,
        ),
      ),
    );
  }
}

class _GetProfileGuestUserIconComponent extends StatelessWidget {
  final double circleSize;
  final double iconSize;

  const _GetProfileGuestUserIconComponent({
    Key? key,
    required this.circleSize,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int divider = 2;
    return Container(
      decoration: BoxDecoration(
        color: context.adColors.whiteTextColor,
        shape: BoxShape.circle,
      ),
      width: circleSize,
      height: circleSize,
      child: Center(
        child: ADSizedBox(
          width: iconSize < circleSize ? iconSize : circleSize / divider,
          height: iconSize < circleSize ? iconSize : circleSize / divider,
          child: SvgPicture.asset(
            SvgAssets.profileIcon,
            color: context.adColors.darkGreyTextColor,
          ),
        ),
      ),
    );
  }
}
