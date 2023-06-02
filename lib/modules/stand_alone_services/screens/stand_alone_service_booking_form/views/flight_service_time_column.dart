import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FlightServiceTimeColumn extends StatelessWidget {
  const FlightServiceTimeColumn({Key? key, required this.flightServiceDetails})
      : super(key: key);
  final FlightServiceWidgetDetails? flightServiceDetails;

  @override
  Widget build(BuildContext context) {
    return flightServiceDetails != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: ADTextStyle400.size16,
                      text: '${flightServiceDetails?.firstText}: ',
                    ),
                    TextSpan(
                      style: ADTextStyle700.size16,
                      text: flightServiceDetails?.firstTimeText,
                    ),
                  ],
                ),
              ),
              ADSizedBox(height: context.k_4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: ADTextStyle400.size16,
                      text: '${flightServiceDetails?.secondText}: ',
                    ),
                    TextSpan(
                      style: ADTextStyle700.size16,
                      text: flightServiceDetails?.secondTimeText ?? '',
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                height: context.k_20,
              ),
            ],
          )
        : const ADSizedBox();
  }
}

class FlightServiceWidgetDetails {
  final String firstText;
  final String firstTimeText;
  final String secondText;
  final String secondTimeText;

  FlightServiceWidgetDetails({
    required this.firstText,
    required this.firstTimeText,
    required this.secondText,
    required this.secondTimeText,
  });
}
