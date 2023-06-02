/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/profile/user_profile.dart';

class UserProfileUtils {
  /// Function is used to create guest user profile in preferences
  static Future<void> createGuestUserProfile() async {
    final String guestUserId =
        ProfileSingleton.profileSingleton.generateRandomGuestUserId();
    // now save guestUserId but login flag is false
    adLog('userprofile random  value : $guestUserId');
    final userProfile = UserProfile(
      userId: guestUserId,
    );
    ProfileSingleton.profileSingleton.userProfile = userProfile;
    await ProfileSingleton.profileSingleton
        .writeUserProfile(SharedPrefUtilsKeys.keyUserProfileData, userProfile);
  }
}
