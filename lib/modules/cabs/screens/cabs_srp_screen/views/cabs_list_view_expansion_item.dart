/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cabs_tile_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabsListViewExpansionItem extends StatelessWidget {
  const CabsListViewExpansionItem({
    Key? key,
    required this.cabSrpState,
    required this.selectedCabItinerary,
    required this.cabItinerariesIndex,
  }) : super(key: key);
  final CabsSrpState cabSrpState;
  final CabItinerary? selectedCabItinerary;
  final int cabItinerariesIndex;

  @override
  Widget build(BuildContext context) {
    cabSrpState.cabItineraries[cabItinerariesIndex].securityKey
        ?.adlProviderImage = (cabSrpState.cabItineraries[cabItinerariesIndex]
                .securityKey?.adlProviderImage
                ?.contains('png.png') ??
            false)
        ? cabSrpState
            .cabItineraries[cabItinerariesIndex].securityKey?.adlProviderImage
            ?.replaceAll('png.png', '.svg')
        : cabSrpState
            .cabItineraries[cabItinerariesIndex].securityKey?.adlProviderImage;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.network(
          cabSrpState.cabItineraries[cabItinerariesIndex].securityKey
                  ?.adlProviderImage ??
              '',
          height: context.k_22,
          fit: BoxFit.fitHeight,
        ).paddingBySide(
          bottom: context.k_14,
          left: context.k_16,
          right: context.k_16,
        ),
        ListView.builder(
          itemCount: cabSrpState
                  .cabItineraries[cabItinerariesIndex].cabItinerary?.length ??
              0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CabsTileWidget(
              expandedPosition: cabItinerariesIndex,
              cabSrpState: cabSrpState,
              selectedCabItinerary: selectedCabItinerary,
              selectedProviderInfo:
                  cabSrpState.cabItineraries[cabItinerariesIndex].securityKey,
              isInstantBooking: cabSrpState
                  .cabItineraries[cabItinerariesIndex].isInstantBooking,
              cabItinerary: cabSrpState.cabItineraries[cabItinerariesIndex]
                      .cabItinerary?[index] ??
                  CabItinerary(),
              bookTap: () => cabSrpState.createCart(context),
            );
          },
        ),
      ],
    );
  }
}
