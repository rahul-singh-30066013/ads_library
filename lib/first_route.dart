import 'package:ads_library/router_navigation/routes_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'viewModel/ads_view_model.dart';

class FirstRoute extends StatefulWidget {

  FirstRoute({Key? key, required this.type}) : super(key: key);
  final AdsType type;
  AdsViewModel viewModel = AdsViewModel();

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
    return Scaffold(
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Container(
                    height: 27,
                    child: Text(
                      "Name: ${snapshot.data}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }
            return CircularProgressIndicator();
          },
        ));
  }


  Future<DataSnapshot> getData() async {
    await Firebase.initializeApp();
    return await widget.viewModel.fetchData(widget.type);
  }
}