/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class WeatherUtils{
  static const dayMap= <int,String>{
    1:'MON',
    2:'TUE',
    3:'WED',
    4:'THU',
    5:'FRI',
    6:'SAT',
    7:'SUN',
  };

  static const String weatherImageUrlPath = '-/media/Project/WeatherIcons/MobileApp/';

  static const String siteCoreUniqueId='040';
}

extension AppendZeroIfRequired on int{
  String get appendZeroIfReq {
    const ten=10;
    if(this<ten){
      return '0$this';
    }
    return toString();
  }
}

extension RemoveTrailingZerosFromDecimalNum on double{
  String get removeTrailingZeros {
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    final returnValue = toString().replaceAll(regex, '');
    return returnValue;
  }
}
