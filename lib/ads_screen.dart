import 'package:ads_library/assets/json/ads_big_banner.dart';
import 'package:ads_library/assets/json/ads_dialog_banner.dart';
import 'package:ads_library/assets/json/ads_single_banner.dart';
import 'package:ads_library/assets/json/ads_small_banner.dart';
import 'package:ads_library/extension/color_scheme_extention.dart';
import 'package:ads_library/extension/widget_extention.dart';
import 'package:ads_library/loyalty_dialog/ads_dialog_screen.dart';
import 'package:ads_library/response/response_state.dart';
import 'package:ads_library/extension/size_config_extention.dart';
import 'package:ads_library/viewModel/ads_view_model.dart';
import 'package:ads_library/viewModel/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router_navigation/routes_constants.dart';

class AdsScreen extends StatefulWidget {
  final AdsType type;

  const AdsScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  AdsViewModel viewModel = AdsViewModel();

  @override
  void initState() {
    super.initState();
    //viewModel.fetchData(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ads app'),
      ),
      body: ADSelectorStateLessWidget(
        viewModel: viewModel,
        child: Consumer<AdsViewModel>(
          builder: (context, value, child) {
            switch (value.adResponseState.viewStatus) {
              case Status.complete:
                switch (widget.type) {
                  case AdsType.dialog:
                    final DialogBanner adsDialogBanner = value.adResponseState.data as DialogBanner;
                    return Center(
                      child: ElevatedButton(
                              child:  Text(adsDialogBanner.widgetType ?? 'Open Dialog'),
                              style: ElevatedButton.styleFrom(
                                primary: context.adColors.blueColor,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () => AdsDialogScreen().showDialogBanner(context, adsDialogBanner))
                          .paddingBySide(left: context.k_20, right: context.k_20),
                    );
                  case AdsType.singleBanner:
                    final SingleBanner singleBanner = value.adResponseState.data as SingleBanner;
                    return Container(
                        margin: EdgeInsets.all(context.k_8),
                        height: 54.0,
                        width: context.widthOfScreen - 20,
                        color: Colors.blue[100],
                        child: Image.network(singleBanner.fields?.first.imageLink ?? '', fit: BoxFit.fill,
                        ).paddingAllSide(1));
                  case AdsType.bigBanner:
                    final BigBanner bigBanner = value.adResponseState.data as BigBanner;
                    return SizedBox(
                      height: 240.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(bigBanner.fields?.length ?? 0, (int index) {
                          return Container(
                            width: context.widthOfScreen - 20,
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
                                          BorderRadius.circular(context.k_8)),
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Image.network(bigBanner.fields?[index].imageLink ?? '')
                                          .paddingAllSide(context.k_4),
                                      //Image.network
                                       Text(
                                        bigBanner.fields?[index].title ?? '',
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
                                            primary: context.adColors.blueColor,
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
                    final SmallBanner smallBanner = value.adResponseState.data as SmallBanner;
                    return SizedBox(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(smallBanner.fields?.length ?? 0, (int index) {
                          return Card(
                            color: Colors.blue[index * 100],
                            child: SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: Image.network(smallBanner.fields?[index].imageLink ?? ''),
                              ),
                          );
                        }),
                      ),
                    );
                }
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return const Text('Error');
              default:
                return const Text('Default!');
            }
          },
        ),
      ), //center
    );
  }
}
