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
    return FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return
                  Center(
                    child: Text(
                      "Name: ${snapshot.data}",
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("No data");
            }
            return const SizedBox(height : 50, width: 50 ,child: CircularProgressIndicator());
          },
        );
  }


  Future<DataSnapshot> getData() async {
    await Firebase.initializeApp();
    return await widget.viewModel.fetchData(widget.type);
  }
}