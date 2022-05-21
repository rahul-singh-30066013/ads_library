import 'dart:async';
import 'dart:io';

import 'package:ads_library/extension/size_config_extention.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ads_library/router_navigation/router.dart' as router;
import 'package:ads_library/router_navigation/routes_constants.dart' as routes;

void main() {
  init();
  runApp(
    LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ADSizeConfig.init(constraints);
        return const AdsMain();
      },
    ),
  );
}

void init() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      HttpOverrides.global = MyHttpOverrides();
    },
    (error, stack) {},
  );
}

/// Main App Screen which have all app level configuration like route,
/// localization, theme etc.
class AdsMain extends StatelessWidget {
  const AdsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.mainRoute,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
