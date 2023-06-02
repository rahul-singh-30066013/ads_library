import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class ViewOfTripInsuranceCost extends StatelessWidget {
  final String? icon;
  final String? description;
  final String? title;

  const ViewOfTripInsuranceCost({
    this.icon,
    this.description,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: context.k_19,
        left: context.k_10,
        // top: context.k_18,
        // bottom: context.k_10,
      ),
      height: context.k_60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
        // border: Border.all(
        //   color: context.adColors.greyReviewShade,
        // ),
        color: context.adColors.containerGreyBg,

        ///TODO we will set colour
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: context.k_4,
            ),
            child: SvgPicture.network(
              icon ?? '',
              width: context.k_18,
              height: context.k_18,

              ///TODO we will set colour
              color: const Color(0xff666666),
            ),
          ),
          SizedBox(
            width: context.k_10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description ?? '',
                style:
                    ADTextStyle500.size14.setTextColor(context.adColors.black),
              ),
              Text(
                title ?? '',
                style:
                    ADTextStyle400.size14.setTextColor(context.adColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
