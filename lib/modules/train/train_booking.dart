import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/train/train_booking_sdk_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainman_booking_sdk/trainman_booking_sdk.dart';
import 'package:url_launcher/url_launcher_string.dart';

BuildContext _currentContext = BuildContext as BuildContext;

class TrainBooking extends StatefulWidget {
  const TrainBooking({
    Key? key,
    this.bookingID,
  }) : super(
          key: key,
        );

  final String? bookingID;

  @override
  State<TrainBooking> createState() => _TrainBookingState();
}

class _TrainBookingState extends State<TrainBooking> {
  TrainBookingSdkState trainBookingSdkState = TrainBookingSdkState();

  @override
  void initState() {
    if (Environment.instance.configuration.appFlavor == AppFlavor.prod) {
      adLog(Constants.setEnv(Env.production));
    } else if (Environment.instance.configuration.appFlavor == AppFlavor.uat) {
      adLog(Constants.setEnv(Env.productionAKs));
    } else {
      adLog(Constants.setEnv(Env.adl));
    }

    trainBookingSdkState
      ..fetchAccessTokenForTrainMan(false)
      ..bookingID = widget.bookingID;
    super.initState();
    // adLog('--------->>>');
    // adLog(widget.bookingID);
  }

  @override
  Widget build(BuildContext context) {
    _currentContext = context;
    return ADSelectorStateLessWidget<TrainBookingSdkState>(
      viewModel: trainBookingSdkState,
      child: Consumer<TrainBookingSdkState>(
        builder: (context, viewModel, child) {
          return trainBookingSdkState.isFetchAccessToken
              ? InitiateTmBookingSdk(
                  tmBookingInterface:
                      TrainBookingInterface(trainBookingSdkState),
                  data: trainBookingSdkState.sdkParamsBody,
                  source: widget.bookingID == null
                      ? Source.home
                      : Source.bookingDetails,
                  isLogsEnabled: Environment.instance.configuration.appFlavor !=
                      AppFlavor.prod,
                  userAgent: userAgent,
                )
              : const SizedBox();
        },
      ),
    );
  }
}

class TrainBookingInterface implements TmBookingInterface {
  TrainBookingSdkState? trainBookingSdkState;

  TrainBookingInterface(
    this.trainBookingSdkState,
  );

  @override
  void refreshToken(String? pastAuthToken, String source) {
    adLog('Refresh token');
  }

  @override
  void backPressed(BuildContext context) {
    Navigator.pop(_currentContext);
  }

  @override
  void openLoginPage(
    String message,
    String source,
  ) {
    if (!ProfileSingleton.profileSingleton.isLoggedIn) {
      navigateToScreenUsingNamedRouteWithArguments(
        _currentContext,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) =>
              value ? navigateWithLogin(_currentContext) : failedLogin(),
          isNotFromSplash: true,
          currentRouteName: trainBooking,
          lob: trainBooking,
        ),
      );
    }
  }

  void failedLogin() {
    InitiateTmBookingSdk.updateAccessToken('failed', 'refreshToken');
  }

  void navigateWithLogin(BuildContext context) {
    trainBookingSdkState?.fetchAccessTokenForTrainMan(true);
    adLog(context.toString());
  }

  @override
  void downloadTicketWithUrl(PdfDataModel? model, String source) {
    if (model?.requestType == 'POST') {
      trainBookingSdkState?.downloadTrainInvoice(
        model?.bodyMap?['tm_booking_id'],
        _currentContext,
      );
    } else if (model?.requestType == 'NONE') {
      _openPdf(model?.url);
    }

    // TODO: implement downloadTicketWithUrl
  }

  @override
  void openCallSupport(String? mobileNum, String source) {
    Utils.redirectToPhoneEmail(
      mobileNum,
    );
  }

  @override
  void openEmailSupport(String? emailId, String source) {
    Utils.redirectToPhoneEmail(
      emailId,
    );
  }

  @override
  void openUrlExternally(String? url, String source) {
    _openExternalUrl(url);
  }

  Future<void> _openExternalUrl(String? url) async {
    if (await canLaunchUrlString(url ?? '')) {
      await launchUrlString(url ?? '', mode: LaunchMode.externalApplication)
          .then((value) => null);
    }
  }

  Future<void> _openPdf(String? url) async {
    if (!(await FlightUtils.openPdf(
      url ?? '',
    ))) {
      navigateToScreenUsingNamedRouteWithArguments(
        _currentContext,
        webViewContainer,
        argumentObject: WebViewModel(
          title: 'cancellation_policy_trainman'.localize(
            _currentContext,
          ),
          url: url ?? '',
        ),
      );
    }
  }
}
