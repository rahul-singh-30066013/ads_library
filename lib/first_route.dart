import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/loyalty_dialog/ads_dialog_screen.dart';
import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'viewModel/ads_view_model.dart';

class FirstRoute extends StatefulWidget {

  FirstRoute({Key? key, required this.type}) : super(key: key);
  final AdsType type;
  final AdsViewModel viewModel = AdsViewModel();

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final DialogBanner dialogBanner = widget.viewModel.adResponseState.data as DialogBanner;
              return Center(
                child: ElevatedButton(
                    child:  Text(dialogBanner.fields?.first.title ?? 'Open Dialog'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () => AdsDialogScreen().showBigBanner(context)),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("No data");
            }
            return const SizedBox.shrink();
          },
        );
  }


  Future<DataSnapshot> getData() async {
    await Firebase.initializeApp();
    return  widget.viewModel.fetchDataFromFirebase(widget.type);
  }
}