/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/traveller_and_class_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/traveller_type.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to select the travellers(adults,children and infants) in a flight
/// max adults can be selected 9 if children is 0
/// max children can be selected 9 if children is 0
/// max limit of adult and children is 9
/// max infants can be as equal or less than max adults
class ChooseTravellerScreen extends StatelessWidget {
  final Travellers? allTravellers;
  final Function(Travellers value) callBack;
  final bool? isPranaam;
  final FlightBookingModel? flightBookingModel;

  final TravellerAndClassState _travellerAndClassState;

  static const double headerPaddingLeft = 16;

  ChooseTravellerScreen({
    Key? key,
    this.allTravellers,
    required this.callBack,
    this.isPranaam = false,
    this.flightBookingModel,
  })  : _travellerAndClassState =
            TravellerAndClassState(isPranaam: isPranaam ?? false),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    _travellerAndClassState.populateTravellers(
      adults: allTravellers?.adults,
      children: allTravellers?.children,
      infants: allTravellers?.infants,
      travelClass: allTravellers?.travelClass,
    );
    final sectorID = (!(flightBookingModel?.isDomesticDepartureCity ?? false) ||
            !(flightBookingModel?.isDomesticArrivalCity ?? false))
        ? 'I'
        : 'D';
    final isDomestic = sectorID.toLowerCase() == 'd';
    return ADSelectorStateLessWidget<TravellerAndClassState>(
      viewModel: _travellerAndClassState,
      child: Consumer<TravellerAndClassState>(
        builder: (context, value, child) => ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
                if (isPranaam != true)
                  Text(
                    'Add Number of Travellers',
                    style: ADTextStyle700.size18,
                  ).paddingBySide(left: context.k_16, top: context.k_20),
              ] +
              _travellerAndClassState.travellersTally.keys.map(
                (passengerType) {
                  final int passengerCount = _travellerAndClassState
                      .currentCountForPassengerType(passengerType);
                  final String passengerKey =
                      passengerType.toString().split('.').last;
                  return TravellerDetails(
                    travellerType: passengerType,
                    travellerAge: isPranaam != null && isPranaam == true
                        ? '$passengerKey-ages_group'
                            .replaceFirst('-', '_')
                            .localize(context)
                        : '$passengerKey-age_group'
                            .replaceFirst('-', '_')
                            .localize(context),
                    travellerTypeCount: passengerCount,
                    travellerTypeName: passengerKey.localize(context),
                    isDecrementEnabled:
                        _travellerAndClassState.isDecrementEnabled(
                      passengerType,
                      passengerCount,
                    ),
                    isIncrementEnabled: _travellerAndClassState
                        .isIncrementEnabledFor(passengerType),
                    onDecrement: () =>
                        _travellerAndClassState.updateTravellerCount(
                      type: passengerType,
                      count: passengerCount - 1,
                    ),
                    onIncrement: () =>
                        _travellerAndClassState.updateTravellerCount(
                      type: passengerType,
                      count: passengerCount + 1,
                    ),
                  ).paddingBySide(top: context.k_20);
                },
              ).toList() +
              [
                ADSizedBox(height: context.k_36),
                if (!(isPranaam ?? false))
                  Text(
                    'Choose Travel Class',
                    style: ADTextStyle700.size18,
                  ).paddingBySide(left: context.k_16),
                ADSizedBox(height: context.k_20),
                if (!(isPranaam ?? false))
                  TravelClass(
                    isDomestic: isDomestic,
                  ),
                if (!(isPranaam ?? false)) ADSizedBox(height: context.k_40),
                Container(
                  child: ElevatedButton(
                    onPressed: () => {
                      callBack(
                        Travellers(
                          adults: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.adults,
                          ),
                          children: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.children,
                          ),
                          infants: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.infants,
                          ),
                          travelClass:
                              _travellerAndClassState.currentTravelClass,
                        ),
                      ),
                      navigatorPopScreenWithData(
                        context,
                        Travellers(
                          adults: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.adults,
                          ),
                          children: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.children,
                          ),
                          infants: _travellerAndClassState
                              .currentCountForPassengerType(
                            TravellerType.infants,
                          ),
                          travelClass:
                              _travellerAndClassState.currentTravelClass,
                        ),
                      ),
                    },
                    style: ElevatedButton.styleFrom(
                      primary: context.adColors.blackTextColor,
                      onPrimary: context.adColors.whiteTextColor,
                      minimumSize: Size(double.infinity, context.k_48),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(context.k_32)),
                      ),
                    ),
                    child: Text(
                      'done'.localize(context),
                      style: ADTextStyle700.size16
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
                  ).paddingBySide(left: context.k_16, right: context.k_16),
                ),
              ],
        ),
      ),
    );
  }
}

/// this class is used for selecting the travellers
class TravellerDetails extends StatefulWidget {
  final TravellerType travellerType;
  final String travellerTypeName;
  final String travellerAge;
  final int travellerTypeCount;
  final bool isDecrementEnabled;
  final bool isIncrementEnabled;
  final Function() onDecrement;
  final Function() onIncrement;

  const TravellerDetails({
    Key? key,
    required this.travellerType,
    required this.travellerAge,
    required this.travellerTypeCount,
    required this.travellerTypeName,
    required this.onDecrement,
    required this.onIncrement,
    required this.isDecrementEnabled,
    required this.isIncrementEnabled,
  }) : super(key: key);

  @override
  _TravellerDetailsState createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  static const double contentPaddingListTiles = 18;
  static const double contentVerticalPaddingListTiles = 5;
  static const double sizedBoxHeightListTiles = 4;
  static const Color selectedBorderColor = Color(0xffdddddd);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 2.5),
      contentPadding: EdgeInsets.only(
        left: contentPaddingListTiles.w,
        right: context.k_12,
        bottom: contentVerticalPaddingListTiles.w,
      ),
      key: const Key(FlightAutomationKeys.travellerTypeDetails),
      leading: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.travellerTypeName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            key: const Key(FlightAutomationKeys.travellerTypeGroup),
          ),
          ADSizedBox(height: sizedBoxHeightListTiles.h),
          Text(
            widget.travellerAge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            key: const Key(FlightAutomationKeys.travellerTypeAgeGroup),
          ),
        ],
      ),
      dense: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          OutlinedButton(
            key: const Key(FlightAutomationKeys.travellerDecrementButton),
            onPressed: () =>
                widget.isDecrementEnabled ? widget.onDecrement() : null,
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: Size(context.k_28, context.k_28),
              primary: context.adColors.black,
              side: BorderSide(
                color: widget.isDecrementEnabled
                    ? context.adColors.blackTextColor
                    : selectedBorderColor,
              ),
            ),
            child: Icon(
              Icons.remove,
              color: widget.isDecrementEnabled
                  ? context.adColors.blackTextColor
                  : selectedBorderColor,
              size: context.k_16,
            ),
          ),
          SizedBox(
            width: context.k_17,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.travellerTypeCount.toString(),
                key: const Key(FlightAutomationKeys.travellerCount),
                textAlign: TextAlign.center,
                style: ADTextStyle400.size16,
              ),
            ),
          ),
          OutlinedButton(
            key: const Key(FlightAutomationKeys.travellerIncrementButton),
            onPressed: () =>
                widget.isIncrementEnabled ? widget.onIncrement() : null,
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              primary: context.adColors.black,
              minimumSize: Size(context.k_28, context.k_28),
              side: BorderSide(
                color: widget.isIncrementEnabled
                    ? context.adColors.blackTextColor
                    : selectedBorderColor,
              ),
            ),
            child: Icon(
              Icons.add,
              color: widget.isIncrementEnabled
                  ? context.adColors.blackTextColor
                  : selectedBorderColor,
              size: context.k_16,
            ),
          ),
        ],
      ),
    );
  }
}

class TravelClass extends StatefulWidget {
  final bool? isDomestic;
  const TravelClass({Key? key, this.isDomestic = true}) : super(key: key);

  @override
  _TravelClassState createState() => _TravelClassState();
}

/// this class is used for selected the class
class _TravelClassState extends State<TravelClass> {
  @override
  Widget build(BuildContext context) {
    final TravellerAndClassState _travellerAndClassState =
        Provider.of<TravellerAndClassState>(context);
    return Consumer<TravellerAndClassState>(
      // key: const Key(FlightAutomationKeys.travellerClass),
      builder: (context, value, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: context.k_12,
            runSpacing: context.k_8,
            children: _travellerAndClassState
                .travelClassDomainWithType(
                  isDomestic: widget.isDomestic ?? false,
                )
                .map(
                  (travellerClass) => ChoiceChip(
                    labelPadding: EdgeInsets.all(context.k_2),
                    backgroundColor: context.adColors.lightGreyColor,
                    label: Text(
                      travellerClass
                          .toString()
                          .split('.')
                          .last
                          .localize(context),
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.neutralInfoMsg),
                    ),
                    selected: _travellerAndClassState.currentTravelClass ==
                        travellerClass,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: _travellerAndClassState.currentTravelClass ==
                                travellerClass
                            ? context.adColors.blackColor
                            : context.adColors.transparentColor,
                      ),
                    ),
                    selectedColor: _travellerAndClassState.currentTravelClass ==
                            travellerClass
                        ? context.adColors.whiteTextColor
                        : context.adColors.containerGreyBg,
                    onSelected: (value) => setState(
                      () {
                        _travellerAndClassState.currentTravelClass =
                            travellerClass;
                      },
                    ),
                    // backgroundColor:color,
                    padding: EdgeInsets.symmetric(horizontal: context.k_16),
                    pressElevation: 0,
                  ),
                )
                .toList(),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        );
      },
    );
  }
}
