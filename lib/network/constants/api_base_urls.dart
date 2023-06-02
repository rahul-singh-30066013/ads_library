/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class ApiBaseUrls {
  ///API Base Url for dev, uat[not in use], stage, prod
  // static const devBaseUrl = 'https://api-dev.adanidigitallabs.com/';
  static const devBaseUrl = 'https://aksdev.adanione.cloud/';
  static const uatBaseUrl = 'https://api-uat.adanidigitallabs.com/';

  /// TODO Need to change to AKS UAT
  // static const stagingBaseUrl = 'https://www.uat.adanione.com/api/';
  static const stagingBaseUrl = 'https://www.uat.adanione.com/';

  /// TODO Need to change to AKS Staging
  static const prodAksBaseUrl = 'https://aks.adanione.com/';
  static const prodBaseUrl = 'https://www.adanione.com/api/';

  ///Sitecore Base Url for dev, uat[not in use], stage, prod
  static const cmsDevBaseUrl = 'https://www.adanione.cloud/';
//  static const cmsDevBaseUrl = 'https://cms-dev.adanidigitallabs.com/';
  static const cmsUatBaseUrl = 'https://cms-uat.adanidigitallabs.com/';
  // static const cmsStagingBaseUrl = 'https://www.uat.adanione.com/';
  static const cmsStagingBaseUrl = 'https://www.uat.adanione.com/';

  static const cmsProdAksBaseUrl = 'https://aks.adanione.com/';
  static const cmsProdBaseUrl = 'https://www.adanione.com/';

  ///Sitecore Image Base Url for dev, uat[not in use], stage, prod
  static const cmsDevImageBaseUrl = 'https://sa.adanione.cloud/';
  static const cmsUatImageBaseUrl = 'https://cms-uat.adanidigitallabs.com/';
  static const cmsStagingImageBaseUrl = 'https://sa.uat.adanione.com/';
  static const cmsProdImageBaseUrl = 'https://sa.adanione.com/';

  ///Website Url for dev, uat[not in use], stage, prod
  static const webDevBaseUrl = 'https://www.adanione.cloud/';
  static const webUatBaseUrl = 'https://web-uat.adanidigitallabs.com/';
  static const webStagingBaseUrl = 'https://www.uat.adanione.com/';
  static const webProdAksBaseUrl = 'https://aks.adanione.com/';
  static const webProdBaseUrl = 'https://www.adanione.com/';

  ///ChatBot id Url for dev, uat[same as stage], stage, prod
  static const chatBotIdForDev = 'x1664456336567';
  static const chatBotIdForUat = 'x1667369723247';
  static const chatBotIdForStaging = 'x1667369723247';
  static const chatBotIdForProd = 'x1668493790804';

  ///TODO: Add Prod Token
  static const mixpanelProdToken = '2c754fbe4ebda7fee6ecea390e0a83b2';

  static const appsFlyerDevToken = 'FqvVsYAbZamKzfwWMELBKg';

  static const chatBotUniversalPwaUrl = 'https://cloud.yellow.ai/pwa/v2/live';

  static const mixpanelDevToken = 'bfaa09c90a69006410efe3327efff423';

  static const appsFlyerUniversalToken = 'FqvVsYAbZamKzfwWMELBKg';

  ///GoogleAPIKey TODO: Google module Need to move in separate repo
  static const googleAPIKey = 'AIzaSyBcPiqvEhslInbiCU1Q7taHzqbEn70k_Ko';
  static const googleMapBaseURL = 'https://maps.googleapis.com/maps/api/place';
  static const autoCompleteAPIEndPoint = '/autocomplete/json?';
  static const placeDetailAPIEndPoint = '/details/json?';
  static const geoCodeEndPoint = 'geocode/json?';
}
