/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This Class is used to check and change flight status terminals
class FlightAirportsScreen extends StatefulWidget {
  final AirportItemModel selectedAirport;
  final void Function(AirportItemModel value) airportTap;

  const FlightAirportsScreen({
    Key? key,
    required this.selectedAirport,
    required this.airportTap,
  }) : super(key: key);

  @override
  State<FlightAirportsScreen> createState() => _FlightAirportsScreenState();
}

class _FlightAirportsScreenState extends State<FlightAirportsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<AirportItemModel> adaniAirportsList = context
        .read<SiteCoreStateManagement>()
        .adaniAirportsList
        .where(
          (element) => element.isNonAdaniAirport == false,
        )
        .toList();

    void airportTap({
      required int index,
      required BuildContext context,
    }) {
      widget.airportTap(
        adaniAirportsList[index],
      );
      navigatorPopScreen(context);
    }

    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: adaniAirportsList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => airportTap(index: index, context: context),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_12,
          ),
          color: widget.selectedAirport.city == adaniAirportsList[index].city
              ? context.adColors.lightBlue
              : context.adColors.transparentColor,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    adaniAirportsList[index].city ?? '',
                    style: ADTextStyle600.size16
                        .setTextColor(context.adColors.blackTextColor),
                    textAlign: TextAlign.left,
                  ),
                  ADSizedBox(
                    height: context.k_4,
                  ),
                  Text(
                    adaniAirportsList[index].airportName ?? '',
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Expanded(
                child: Visibility(
                  visible: widget.selectedAirport.city ==
                      adaniAirportsList[index].city,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ADSizedBox(
                      height: context.k_12,
                      width: context.k_14,
                      child: SvgPicture.asset(
                        SvgAssets.refundableCheck,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
