/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/models/update_profile/update_profile_display_model/update_profile_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';

class UpdateProfileRequestModel {
  ProfileModel createUpdateProfileModel(
    UpdateProfileFormBuilder? updateProfileFormBuilder,
    String userProfileImage,
    List<Addresses> addresses,
  ) {
    final PersonInfo personInfo = _getPersonInfo(
      updateProfileFormBuilder ?? UpdateProfileFormBuilder.defaultValue(),
      userProfileImage,
      addresses,
    );
    return ProfileModel(
      personInfo: personInfo,
    );
  }

  PersonInfo _getPersonInfo(
    UpdateProfileFormBuilder updateProfileFormBuilder,
    String userProfileImage,
    List<Addresses> addresses,
  ) {
    final pincode = updateProfileFormBuilder
        .updateProfileForm.pinCode.controller.text
        .trim();
    final country = updateProfileFormBuilder
        .updateProfileForm.countryOfResidence.controller.text
        .trim();
    if (pincode.isNotEmpty || (country.isNotEmpty)) {
      addresses
        ..removeWhere(
          (address) => address.type?.toLowerCase() == AddressType.home.name,
        )
        ..add(
          Addresses(
            pinCode: pincode,
            country: country,
          ),
        );
    }
    return PersonInfo(
      title: updateProfileFormBuilder.updateProfileForm.title.controller.text
              .trim()
              .isEmpty
          ? null
          : updateProfileFormBuilder.updateProfileForm.title.controller.text
              .trim(),
      firstName: updateProfileFormBuilder
              .updateProfileForm.firstName.controller.text
              .trim()
              .isEmpty
          ? null
          : updateProfileFormBuilder.updateProfileForm.firstName.controller.text
              .trim(),
      lastName: updateProfileFormBuilder
              .updateProfileForm.lastName.controller.text
              .trim()
              .isEmpty
          ? null
          : updateProfileFormBuilder.updateProfileForm.lastName.controller.text
              .trim(),
      dob: updateProfileFormBuilder
              .updateProfileForm.dateOfBirth.controller.text
              .trim()
              .isEmpty
          ? null
          : MyProfileUtils.convertToRequestDateFormat(
              updateProfileFormBuilder
                  .updateProfileForm.dateOfBirth.controller.text
                  .trim(),
            ),
      gender: updateProfileFormBuilder
              .updateProfileForm.title.controller.text.isEmpty
          ? null
          : updateProfileFormBuilder.updateProfileForm.title.controller.text
                  .contains('Mr.')
              ? 'Male'
              : 'Female',
      nationality: updateProfileFormBuilder
              .updateProfileForm.nationality.controller.text.isEmpty
          ? null
          : updateProfileFormBuilder
              .updateProfileForm.nationality.controller.text,
      phones: getPhoneDetails(updateProfileFormBuilder),
      emails: updateProfileFormBuilder
              .updateProfileForm.emailAddress.controller.text
              .trim()
              .isNotEmpty
          ? getEmailDetails(updateProfileFormBuilder)
          : [],
      profileImage: userProfileImage,
      passportNumber: updateProfileFormBuilder
              .updateProfileForm.passportNumber.controller.text.isEmpty
          ? null
          : updateProfileFormBuilder
              .updateProfileForm.passportNumber.controller.text,
      passportExpiryDate: updateProfileFormBuilder
              .updateProfileForm.passportExpiryDate.controller.text
              .trim()
              .isEmpty
          ? null
          : MyProfileUtils.convertToRequestDateFormat(
              updateProfileFormBuilder
                  .updateProfileForm.passportExpiryDate.controller.text
                  .trim(),
            ),
      maritalStatus: updateProfileFormBuilder
              .updateProfileForm.maritalStatus.controller.text
              .trim()
              .isEmpty
          ? null
          : updateProfileFormBuilder
              .updateProfileForm.maritalStatus.controller.text
              .trim(),
      addresses: addresses,
      anniversary: updateProfileFormBuilder
              .updateProfileForm.anniversary.controller.text
              .trim()
              .isEmpty
          ? null
          : MyProfileUtils.convertToRequestDateFormat(
              updateProfileFormBuilder
                  .updateProfileForm.anniversary.controller.text
                  .trim(),
            ),
    );
  }

  List<Phones> getPhoneDetails(
    UpdateProfileFormBuilder updateProfileFormBuilder,
  ) {
    final List<Phones> phoneData = [
      Phones(
        number: updateProfileFormBuilder
            .updateProfileForm.contactNumber.controller.text,
        countryCode: updateProfileFormBuilder
            .updateProfileForm.countryCode.controller.text,
        type: 'P',
      ),
    ];
    return phoneData;
  }

  List<Emails> getEmailDetails(
    UpdateProfileFormBuilder updateProfileFormBuilder,
  ) {
    final List<Emails> emailData = [
      Emails(
        emailAddress: updateProfileFormBuilder
            .updateProfileForm.emailAddress.controller.text,
        type: 'P',
      ),
    ];
    return emailData;
  }
}
