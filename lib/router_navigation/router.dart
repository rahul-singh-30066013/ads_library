import 'package:ads_library/ads_screen.dart';
import 'package:ads_library/router_navigation/routes_constants.dart' as routes;
import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:flutter/material.dart';
///which we can pass the arguments from one widget to other.
///and we can get that argument back from *[RouteSettings] itself
///e.g. settings.arguments as String/bool/int/any model type
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.mainRoute:
      return getSplashRouteType(settings);
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return default navigation route in case of error or empty
MaterialPageRoute getRouteOnEmptyType(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      );
    },
  );
}

//to return splash navigation route
MaterialPageRoute getSplashRouteType(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) =>  const AdsScreen(type: routes.AdsType.bigBanner,),
  );
}
