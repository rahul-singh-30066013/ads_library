import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/models/stand_alone_api_urls_model.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/network/stand_alone_api/stand_alone_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';

class StandAloneStateManagement extends BaseViewModel {
  StandAloneServiceType currentServiceType = StandAloneServiceType.porter;

  void updateService(StandAloneServiceType? newService) {
    adLog('newService $newService');
    currentServiceType = newService ?? StandAloneServiceType.porter;
  }

  StandAloneApiUrlsModel _getPorterEndpoint() {
    return StandAloneApiUrlsModel(
      dashboardApi: ApiPathQueryModel(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        queryParams: {
          itemKey:
              '${SiteCoreApiUrls.porterHome}${selectedAirportsData?.city ?? ''}-PorterHomePage-App',
          siteCoreLanguageKey: siteCoreDefaultLanguageValue,
          siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
          isCallFromAppKey: isCallNotFromAppValue,
        },
      ),
      getStandAlonPackagesApi: const ApiPathQueryModel(
        path: StandAloneApiUrls.getStandAlonePackages,
        queryParams: {},
      ),
      addCartApi: const ApiPathQueryModel(
        path: StandAloneApiUrls.getStandAloneAddCart,
        queryParams: {},
      ),
    );
  }

  StandAloneApiUrlsModel getApiModel() {
    switch (currentServiceType) {
      case StandAloneServiceType.porter:
        return _getPorterEndpoint();
      default:
        return _getPorterEndpoint();
    }
  }
}


enum StandAloneServiceType { porter, wheelchair }
