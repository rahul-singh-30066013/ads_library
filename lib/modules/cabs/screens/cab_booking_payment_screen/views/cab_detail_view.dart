/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const gerColorCode = Color(0xff444444);

class CabDetailView extends StatelessWidget {
  final CabCartDetailResponseModel? cabCartDetailResponseModel;

  /// on tap handler
  final ADTapCallback? onTapDetails;

  const CabDetailView({
    Key? key,
    required this.cabCartDetailResponseModel,
    this.onTapDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final millis =
        cabCartDetailResponseModel?.cartDetail?.pickup?.tripDateTime ?? 0;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(millis * 1000);
    final date = DateFormat('dd MMM yyyy').format(dateTime);
    final time = DateFormat('hh:mm a')
        .format(dateTime)
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF5FAFF),
        borderRadius: BorderRadius.circular(context.k_4),
      ),
      child: InkWell(
        onTap: onTapDetails,
        child: Container(
          padding: EdgeInsets.all(context.k_16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cabCartDetailResponseModel
                              ?.cartDetail?.vehicleDetails?.vehicleType ??
                          '',
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_6,
                    ),
                    Text(
                      '$date • ${(cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? false) ? 'ride_now'.localize(context) : time}',
                      style: ADTextStyle400.size14.setTextColor(
                        gerColorCode,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_4,
                    ),
                    Text(
                      'To ${cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ?? ''}',
                      maxLines: 1,
                      style: ADTextStyle400.size14
                          .setTextColor(
                            gerColorCode,
                          )
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                width: context.k_20,
              ),
              SvgPicture.asset(
                'lib/assets/images/svg/icons/shopping/i_common.svg',
                height: context.k_16,
                width: context.k_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
