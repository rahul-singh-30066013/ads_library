import 'package:ads_library/assets/json/ads_big_banner.dart';
import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/assets/json/ads_single_banner.dart';
import 'package:ads_library/assets/json/ads_small_banner.dart';
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
          builder: (context, AsyncSnapshot<DataSnapshot?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final value = widget.viewModel;
              switch (widget.type) {
                case AdsType.dialog:
                  final DialogBanner? adsDialogBanner = value.adResponseState.data as DialogBanner?;
                  return Center(
                    child: ElevatedButton(
                        child:  Text(adsDialogBanner?.widgetType ?? 'Open Dialog'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => AdsDialogScreen().showBigBanner(context)),
                  );
                case AdsType.singleBanner:
                  final SingleBanner? singleBanner = value.adResponseState.data as SingleBanner?;
                  return Container(
                      margin: const EdgeInsets.all(8),
                      height: 54.0,
                      width: 220,
                      color: Colors.blue[100],
                      child: Image.network(singleBanner?.fields?.first.imageLink ?? '', fit: BoxFit.fill,));
                case AdsType.bigBanner:
                  final BigBanner? bigBanner = value.adResponseState.data as BigBanner?;
                  return SizedBox(
                    height: 240.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(bigBanner?.fields?.length ?? 5, (int index) {
                        return Container(
                          width: 220,
                          height: 240.0,
                          margin: const EdgeInsets.all(10.0),
                          child: ClipRect(
                            child: Banner(
                              message: "20% off !!",
                              location: BannerLocation.bottomStart,
                              color: Colors.red,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius:
                                    BorderRadius.circular(8)),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Image.network(bigBanner?.fields?[index].imageLink ?? ''),
                                    //Image.network
                                    Text(
                                      bigBanner?.fields?[index].title ?? '',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight:
                                          FontWeight.bold), //TextStyle
                                    ),
                                    //Text
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        child: const Text('Book Now'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () => AdsDialogScreen().showBigBanner(context))
                                    //RaisedButton
                                  ], //<Widget>[]
                                ), //Column
                              ), //Padding
                            ), //Container
                          ), //Banner
                        );
                      }),
                    ),
                  );
                case AdsType.smallBanner:
                  final SmallBanner? smallBanner = value.adResponseState.data as SmallBanner?;
                  return SizedBox(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(smallBanner?.fields?.length ?? 0, (int index) {
                        return Card(
                          color: Colors.blue[index * 100],
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: Image.network(smallBanner?.fields?[index].imageLink ?? ''),
                          ),
                        );
                      }),
                    ),
                  );
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("No data");
            }
            return const SizedBox.shrink();
          },
        );
  }

  Future<DataSnapshot?> getData() async {
    DataSnapshot? dataSnapshot;
    await Firebase.initializeApp().whenComplete(() async => {
          await widget.viewModel.fetchDataFromFirebase(widget.type).then((value) {
            dataSnapshot = value;
          })
        });
    return dataSnapshot;
  }
}