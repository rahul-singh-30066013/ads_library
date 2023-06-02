import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AdaniRewardRepublicImageView extends StatelessWidget {
  const AdaniRewardRepublicImageView({
    Key? key,
    required this.item,
  }) : super(key: key);
  final DutyFreeDashboardItem item;

  void navigateToStaticSPage(
    BuildContext context,
    DutyFreeItem? item,
  ) {
    final WebViewModel model = WebViewModel(
      title: (item?.title.isNotEmpty ?? false) &&
              item?.widgetType != WidgetType.moreServices.name
          ? item?.title ?? ''
          : 'services'.localize(context),
      url:
          '${item?.ctaUrl ?? ''}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
    );
    if (model.url.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: model,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double zeroPoint54 = item.aspectRatio ?? 1;
    return TouchableOpacity(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            if (item.widgetItems?.first.uniqueId.isEmpty ?? false)
              {
                navigateToStaticSPage(
                  context,
                  item.widgetItems?.first,
                ),
              }
            else
              {
                navigateToScreenUsingNamedRoute(
                  context,
                  loyaltyDashboard,
                  rootNavigator: false,
                ),
              },
          },
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          context.scaled(
            context.k_12,
          ),
        ),
        child: Container(
          height: context.widthOfScreen * zeroPoint54,
          width: context.widthOfScreen,
          child: ADCachedImage(
            imageUrl: item.widgetItems?.first.mobileImage ?? '',
          ),
        ),
      ),
    );
  }
}
