/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/terms_and_conditions/terms_and_conditions.dart'
    as terms;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/pranaam_help_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_sitecore_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

///this class is for buisness logic of pranaam order detail screen

class PranaamOrderDetailController extends State<PranaamOrderDetailScreen> {
  @override
  void dispose() {
    // getBookingDetailsState.bookingCancelledStatus.dispose();
    getBookingDetailsState.getBookingDetailsState = ADResponseState.loading();
    pranaamAppDataStateManagement
      ..oldBookingId = getBookingDetailsState
              .bookingDetailsResponse?.orderDetail?.pranaamDetail?.bookingId ??
          0
      ..oldBookingReferenceId =
          getBookingDetailsState.bookingDetailsResponse?.orderReferenceId ?? '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PranaamOrderDetailWidgetView(
      this,
    );
  }

  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  PranaamSitecoreStateManagement pranaamSitecoreStateManagement =
      PranaamSitecoreStateManagement();
  CreateBookingRequestModel? createBookingModel;
  BookingAndCancellationState getBookingDetailsState =
      BookingAndCancellationState();
  SiteCoreStateManagement siteCoreStateManagement = SiteCoreStateManagement();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    // pranaamAppDataStateManagement
    //   ..oldBookingId = double.parse(widget.bookingID ?? '0')
    //   ..oldBookingReferenceId = widget.bookingID ?? '';
    getBookingDetailsState = context.read<BookingAndCancellationState>();
    getBookingDetailsState.bookingId = widget.bookingID ?? '0';
    siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBookingDetailsState.updateButtonState(value: true);
    });

    final temp = getBookingDetailsState
        .getBookingDetails(
          orderId: widget.bookingID ?? '',
          fromInit: true,
        )
        .then(
          (value) => {
            getBookingDetailsState.getImportantInformation(
              infoType: 'BookingDetail',
            ),
            pranaamAppDataStateManagement
              ..oldBookingId = getBookingDetailsState.bookingDetailsResponse
                      ?.orderDetail?.pranaamDetail?.bookingId ??
                  0
              ..oldBookingReferenceId = getBookingDetailsState
                      .bookingDetailsResponse?.orderReferenceId ??
                  '',
          },
        );
    adLog('$temp');
  }

  Future<void> initHelpAPi(BuildContext context, String cityCode) async {
    final ADResponseState response =
        await SiteCoreStateManagement().fetchTermsAndConditionsFromSiteCore(
      cityCode,
    );
    switch (response.viewStatus) {
      case Status.complete:
        adLog(
          'initHelpAPi $cityCode',
        );
        if (response.data != null) {
          final terms.Element termsAndCondition = response.data;
          final contentItems = termsAndCondition.fields.contentItems;
          if (contentItems.isNotEmpty && contentItems.length > 1) {
            helpBottomSheet(context, response.data);
          } else {
            showSnackBar(context);
          }
        } else {
          showSnackBar(context);
        }
        break;
      case Status.error:
        showSnackBar(context);
        break;
      case Status.loading:
        ProcessDialog.showLoadingDialog(context);
        break;
      default:
        break;
    }
  }

  void showSnackBar(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'Something went wrong',
    );
  }

  bool getBookingStatus() {
    final num length =
        getBookingDetailsState.bookingDetailsResponse?.statusHistory?.length ??
            0;
    for (int index = 0; index < length; index++) {
      if (PranaamOrderStatus.getStatus(
                getBookingDetailsState
                    .bookingDetailsResponse?.statusHistory?[index].orderStatus,
              ) ==
              PranaamOrderStatus.CANCELLED ||
          PranaamOrderStatus.getStatus(
                getBookingDetailsState
                    .bookingDetailsResponse?.statusHistory?[index].orderStatus,
              ) ==
              PranaamOrderStatus.CANCELLATION_INITIATED) {
        getBookingDetailsState.cancelBookingStatus(value: true);
        return true;
      } else if (getBookingDetailsState.bookingDetailsResponse?.cancelType ==
          'Partial') {
        getBookingDetailsState.cancelBookingStatus(value: false);
        return true;
      }
    }
    getBookingDetailsState.cancelBookingStatus(value: false);
    return false;
  }

  void helpBottomSheet(
    BuildContext context,
    terms.Element termsAndCondition,
  ) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return PranaamHelpBottomSheet(
          termsAndCondition: termsAndCondition,
        );
      },
    );

    adLog('$bottomSheet');
  }

  Future<void> onBackTap() async {
    navigatorPopScreen(context);
  }
}
