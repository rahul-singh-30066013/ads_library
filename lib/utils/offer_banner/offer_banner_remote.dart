import 'dart:convert';

import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote_model.dart';

/// this class is use for Remote app constants using firebase
class OfferBannerRemote {
  static final OfferBannerRemote _appConfig = OfferBannerRemote._internal();
  OfferBannerRemoteModel? offerBannerRemoteModel;

  factory OfferBannerRemote() {
    return _appConfig;
  }

  OfferBannerRemote._internal();

  Future<OfferBannerRemoteModel?> init() async {
    final jsonString =
        RemoteConfigService().getInstance().getString('offerBanner');

    if (jsonString.isNotEmpty) {
      offerBannerRemoteModel =
          OfferBannerRemoteModel.fromJson(json.decode(jsonString));
    }
    return offerBannerRemoteModel;
  }
}
