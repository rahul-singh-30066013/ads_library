import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RescheduleBottomBar extends StatelessWidget {
  const RescheduleBottomBar({
    Key? key,
    required this.onTap,
    required this.reschedulePrice,
    this.isFreeReschedule = false,
    this.buttonString = 'Reschedule',
  }) : super(key: key);
  final double reschedulePrice;
  final ADTapCallback? onTap;
  final bool isFreeReschedule;
  final String buttonString;

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = 52.sp;
    final double buttonWidth = 172.sp;

    return SafeArea(
      child: Container(
        color: context.adColors.whiteTextColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1, thickness: 1),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.k_16,
                vertical: context.k_8,
              ),
              title: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (!isFreeReschedule)
                          Text(
                            FlightUtils.getAmountWithTwoDecimalPoint(
                              reschedulePrice,
                            ),
                            style: ADTextStyle700.size24,
                          )
                        else
                          Text(
                            'FREE',
                            style: ADTextStyle700.size24.copyWith(
                              color: context.adColors.successInfoMsg,
                            ),
                          ),
                        ADSizedBox(width: context.k_2),
                      ],
                    ),
                    ADSizedBox(height: context.k_2),
                  ],
                ),
              ),
              trailing:                   ADSizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), backgroundColor: context.adColors.blueColor,
                        minimumSize: Size(
                          buttonWidth,
                          buttonHeight,
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_20,
                          vertical: context.k_16,
                        ),
                      ),
                      onPressed: onTap,
                      child: Selector<PranaamRescheduleStateManagement,
                          ADResponseState>(
                        selector: (context, state) =>
                            state.resheduleBookingResponse,
                        builder: (context, value, _) {
                          return value.viewStatus == Status.loading
                              ? ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                  size: dotSize,
                                )
                              : Text(
                                  buttonString,
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.whiteTextColor,
                                  ),
                                );
                        },
                      ),
                    ),
                  ),              
            ),
          ],
        ),
      ),
    );
  }

  static const double dotSize = 8;
}
