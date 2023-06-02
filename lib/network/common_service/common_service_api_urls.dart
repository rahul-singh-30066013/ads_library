/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class CommonServiceApiUrls {
  static const _baseName = 'api/commonservicev2';

  static const String weatherApiUrlPath =
      '$_baseName/api/Home/GetWeatherForecast/';
  static const String deleteUserAccount =
      '$_baseName/api/Home/deleteUserAccount';
  static const String getUpsell = '$_baseName/api/Upsell';
  static const String postalCodeDataApi = '$_baseName/api/postalcode/';
}
