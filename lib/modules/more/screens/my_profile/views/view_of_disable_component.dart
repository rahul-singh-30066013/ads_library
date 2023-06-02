import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ViewOfDisableComponent extends StatefulWidget {
  final ADTapCallback? onTapHandler;
  final String? emailValue;

  const ViewOfDisableComponent({
    this.onTapHandler,
    Key? key,
    this.emailValue,
  }) : super(key: key);

  @override
  State<ViewOfDisableComponent> createState() => _ViewOfDisableComponentState();
}

class _ViewOfDisableComponentState extends State<ViewOfDisableComponent> {
  final double prefixIconWidth = 30.sp;
  final double prefixIconHeight = 20.sp;
  String flag =
      '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7';
  ProfileModel? profileModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileModel = context.read<UpdateProfileState>().profileModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.k_60,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.adColors.greyReviewShade,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.k_18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'emailID'.localize(context),
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.darkGreyTextColor,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.emailValue ?? '',
                        style: ADTextStyle500.size16
                            .setTextColor(context.adColors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: context.k_4,
                    ),
                    SvgPicture.asset(
                      SvgAssets.rightEmptyClick,
                      color: context.adColors.greenTextColor,
                      width: context.k_19,
                      height: context.k_19,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.k_4,
          ),
          InkWell(
            onTap: () => widget.onTapHandler?.call(),
            child: Text(
              'change'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.black)
                  .copyWith(decoration: TextDecoration.underline),
            ).paddingBySide(right: context.k_10),
          ),
        ],
      ),
    );
  }
}
