/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/network/constants/api_base_urls.dart';

/// abstract class for initialize config as per the flavour
abstract class BaseConfig {
  String get apiBaseUrl;
  String get cmsBaseUrl;
  String get cmsImageBaseUrl;
  String get webBaseUrl;
  String get appName;
  String get mixpanelToken;
  String get appsflyerToken;
  AppFlavor get appFlavor;
  String get chatBotId;
  String get chatBotPwaUrl;
}

class DevConfig implements BaseConfig {
  @override
  String get appName => 'Adani One@dev';

  @override
  AppFlavor get appFlavor => AppFlavor.dev;

  @override
  String get apiBaseUrl => ApiBaseUrls.devBaseUrl;

  @override
  String get cmsBaseUrl => ApiBaseUrls.cmsDevBaseUrl;

  @override
  String get webBaseUrl => ApiBaseUrls.webDevBaseUrl;

  @override
  String get mixpanelToken => ApiBaseUrls.mixpanelDevToken;

  @override
  String get appsflyerToken => ApiBaseUrls.appsFlyerUniversalToken;

  @override
  String get chatBotId => ApiBaseUrls.chatBotIdForDev;

  @override
  String get chatBotPwaUrl => ApiBaseUrls.chatBotUniversalPwaUrl;

  @override
  String get cmsImageBaseUrl => ApiBaseUrls.cmsDevImageBaseUrl;
}

class StagingConfig implements BaseConfig {
  @override
  String get appName => 'Adani One@qa';

  @override
  String get apiBaseUrl => ApiBaseUrls.stagingBaseUrl;

  @override
  String get cmsBaseUrl => ApiBaseUrls.cmsStagingBaseUrl;

  @override
  String get webBaseUrl => ApiBaseUrls.webStagingBaseUrl;

  @override
  AppFlavor get appFlavor => AppFlavor.staging;

  @override
  String get mixpanelToken => ApiBaseUrls.mixpanelDevToken;

  @override
  String get appsflyerToken => ApiBaseUrls.appsFlyerUniversalToken;

  @override
  String get chatBotId => ApiBaseUrls.chatBotIdForStaging;

  @override
  String get chatBotPwaUrl => ApiBaseUrls.chatBotUniversalPwaUrl;

  @override
  String get cmsImageBaseUrl => ApiBaseUrls.cmsStagingImageBaseUrl;
}

class UatConfig implements BaseConfig {
  @override
  String get appName => 'Adani One@uat';

  @override
  AppFlavor get appFlavor => AppFlavor.uat;

  @override
  String get apiBaseUrl => ApiBaseUrls.prodAksBaseUrl;

  @override
  String get cmsBaseUrl => ApiBaseUrls.cmsProdAksBaseUrl;

  @override
  String get webBaseUrl => ApiBaseUrls.webProdAksBaseUrl;

  @override
  String get mixpanelToken => ApiBaseUrls.mixpanelDevToken;

  @override
  String get appsflyerToken => ApiBaseUrls.appsFlyerUniversalToken;

  @override
  String get chatBotId => ApiBaseUrls.chatBotIdForUat;

  @override
  String get chatBotPwaUrl => ApiBaseUrls.chatBotUniversalPwaUrl;

  @override
  String get cmsImageBaseUrl => ApiBaseUrls.cmsProdImageBaseUrl;
}

class ProdConfig implements BaseConfig {
  @override
  String get appName => 'Adani One';

  @override
  AppFlavor get appFlavor => AppFlavor.prod;

  @override
  String get apiBaseUrl => ApiBaseUrls.prodBaseUrl;

  @override
  String get cmsBaseUrl => ApiBaseUrls.cmsProdBaseUrl;

  @override
  String get webBaseUrl => ApiBaseUrls.webProdBaseUrl;

  @override
  String get mixpanelToken => ApiBaseUrls.mixpanelProdToken;

  @override
  String get appsflyerToken => ApiBaseUrls.appsFlyerUniversalToken;

  @override
  String get chatBotId => ApiBaseUrls.chatBotIdForProd;

  @override
  String get chatBotPwaUrl => ApiBaseUrls.chatBotUniversalPwaUrl;

  @override
  String get cmsImageBaseUrl => ApiBaseUrls.cmsProdImageBaseUrl;
}

/// Enum for app flavour

enum AppFlavor { dev, staging, uat, prod }
