import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CurrencyExchangeHomeBannerTile extends StatelessWidget {
  const CurrencyExchangeHomeBannerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 230;
    const double buttonHeight = 136;
    const double buttonWidth = 38;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Maximise Your Rewards',
          style:
              ADTextStyle700.size20.setTextColor(context.adColors.blackColor),
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          'Convert bank points for Adani One Reward Points.',
          style: ADTextStyle400.size14
              .setTextColor(context.adColors.neutralInfoMsg),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(context.k_8),
            ),
            border: Border.all(
              color: context.adColors.widgetDividerLine,
            ),
          ),
          child: Column(
            children: [
              ADSizedBox(
                height: context.k_30,
              ),
              Image.network(
                '',
                fit: BoxFit.fill,
              ),
              ADSizedBox(
                height: context.k_30,
              ),
              Text(
                'Utilise your IndusInd Bank Points to unlock new possibilities on Adani One.',
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
                textAlign: TextAlign.center,
              ).paddingBySide(
                left: context.k_30,
                right: context.k_30,
              ),
              ADSizedBox(
                height: context.k_30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {
                      navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        currencyExchangeDetails,
                      ),
                    },
                    child: Container(
                      width: buttonHeight,
                      height: buttonWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(19),
                        ),
                        border: Border.all(
                          color: const Color(0xff979797),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'View Details',
                          style: ADTextStyle600.size14.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_14,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      width: buttonHeight,
                      height: buttonWidth,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(19),
                        ),
                        color: Color(0xff0d67ca),
                      ),
                      child: Center(
                        child: Text(
                          'Convert Now',
                          style: ADTextStyle600.size14.setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ADSizedBox(
                height: context.k_30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
