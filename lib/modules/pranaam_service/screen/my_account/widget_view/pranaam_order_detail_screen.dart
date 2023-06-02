/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:flutter/cupertino.dart';

///This is account view screen.
///which will show the status of booking, service type, sector and flight selected.
///It will also show rewards on the order along with guest and price details.
///At last we will have the user's contact information
///
class PranaamOrderDetailScreen extends StatefulWidget {
  final String? bookingID;
  final bool isFromBottomSheet;
  final bool isRoundTrip;
  final bool isRoundTripDeparture;
  const PranaamOrderDetailScreen({
    Key? key,
    this.bookingID,
    this.isFromBottomSheet = false,
    this.isRoundTrip = false,
    this.isRoundTripDeparture = false,
  }) : super(key: key);
  @override
  PranaamOrderDetailController createState() => PranaamOrderDetailController();
}
