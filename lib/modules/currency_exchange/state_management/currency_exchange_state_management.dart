import 'package:adani_airport_mobile/modules/currency_exchange/state_management/currency_exchange_repo.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class CurrencyExchangeStateManagement extends ADBaseViewModel {
  final CurrencyExchangeRepo _currencyExchangeRepo = CurrencyExchangeRepo();
  ADResponseState currencyExchangeDashboardSiteCoreState =
      ADResponseState.loading();
  ADResponseState currencyExchangeBankSiteCoreState = ADResponseState.loading();

  bool _isAbsorbing = false;

  bool get isAbsorbing => _isAbsorbing;

  ///It will fetch loyalty dashboard UI
  Future<void> fetchCurrencyDashBoardHome() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.currencyExchangeHome,
      'sc_lang': 'en',
      'sc_type': '2',
      'sc_apptype': 'app',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'true',
    };

    _isAbsorbing = true;
    notifyListeners();
    final responseState = await _currencyExchangeRepo.fetchCurrencyExchangeHome(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorbing = false;
    if (responseState.viewStatus == Status.complete) {
      currencyExchangeDashboardSiteCoreState = responseState;
    } else if (responseState.viewStatus == Status.error) {
      currencyExchangeDashboardSiteCoreState = responseState;
    }
    notifyListeners();
  }

  ///It will fetch loyalty dashboard UI
  Future<void> fetchCurrencyExchangeBank() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.currencyExchangeBank,
      'sc_lang': 'en',
      'sc_type': '2',
      'sc_apptype': 'app',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'true',
    };

    _isAbsorbing = true;
    notifyListeners();
    final responseState = await _currencyExchangeRepo.fetchCurrencyExchangeHome(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorbing = false;
    if (responseState.viewStatus == Status.complete) {
      currencyExchangeBankSiteCoreState = responseState;
    } else if (responseState.viewStatus == Status.error) {
      currencyExchangeBankSiteCoreState = responseState;
    }
    notifyListeners();
  }
}
