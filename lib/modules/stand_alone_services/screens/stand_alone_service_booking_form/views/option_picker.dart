import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class OptionPicker extends StatelessWidget {
  const OptionPicker({
    Key? key,
    required this.title,
    required this.onTap,
    required this.iconPath,
    this.widthOfIcon,
    this.heightOfIcon,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final ADTapCallback onTap;
  final double? widthOfIcon;
  final double? heightOfIcon;

  @override
  Widget build(BuildContext context) {
    final double _heightOfIcon = heightOfIcon ?? context.k_17;
    final double _widthOfIcon = widthOfIcon ?? context.k_12 + context.k_2;
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.k_4),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: _widthOfIcon,
                  height: _heightOfIcon,
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
                // Departure
                Text(
                  title,
                  style: ADTextStyle600.size16,
                ),
                ADSizedBox(
                  width: context.k_6,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: context.k_24,
                  color: context.adColors.blackTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
