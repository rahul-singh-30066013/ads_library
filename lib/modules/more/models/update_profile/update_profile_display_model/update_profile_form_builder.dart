/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_validations.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';

/// this class is use for create form of user profile
class UpdateProfileFormBuilder {
  UpdateProfileForm updateProfileForm;
  UserProfileImage userProfileImage;

  UpdateProfileFormBuilder({
    required this.updateProfileForm,
    required this.userProfileImage,
  });

  /// this factory method is use for create profile form
  factory UpdateProfileFormBuilder.fromProfileUserDetailResponse({
    required Function() onChange,
    required ProfileModel profileModel,
  }) {
    final _updateProfileForm = UpdateProfileForm.fromModel(
      onChange: onChange,
      profileModel: profileModel,
    );
    final _userProfileImage = UserProfileImage.fromModel(
      userImage: profileModel.personInfo?.profileImage ?? '',
    );

    return UpdateProfileFormBuilder(
      updateProfileForm: _updateProfileForm,
      userProfileImage: _userProfileImage,
    );
  }

  factory UpdateProfileFormBuilder.defaultValue() {
    return UpdateProfileFormBuilder(
      updateProfileForm: UpdateProfileForm.fromModel(
        onChange: () => {},
        profileModel: const ProfileModel(),
      ),
      userProfileImage: UserProfileImage(userImageProfile: ''),
    );
  }
}

/// this factory method is use for create profile image
class UserProfileImage {
  String userImageProfile;

  UserProfileImage({required this.userImageProfile});

  factory UserProfileImage.fromModel({required String userImage}) {
    return UserProfileImage(userImageProfile: userImage);
  }
}

///This is use to build the form component for the profile.
class UpdateProfileForm {
  final ADEditableTextModel title;
  final ADEditableTextModel firstName;
  final ADEditableTextModel lastName;
  final ADEditableTextModel dateOfBirth;
  final ADEditableTextModel countryCode;
  final ADEditableTextModel contactNumber;
  final ADEditableTextModel emailAddress;
  final ADEditableTextModel nationality;
  final ADEditableTextModel passportNumber;
  final ADEditableTextModel passportExpiryDate;
  final ADEditableTextModel maritalStatus;
  final ADEditableTextModel anniversary;
  final ADEditableTextModel pinCode;
  final ADEditableTextModel countryOfResidence;

  UpdateProfileForm({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.countryCode,
    required this.contactNumber,
    required this.emailAddress,
    required this.nationality,
    required this.passportNumber,
    required this.passportExpiryDate,
    required this.maritalStatus,
    required this.anniversary,
    required this.pinCode,
    required this.countryOfResidence,
  });

  static int maxLengthOfName = 27;
  static int maxPincodeLength = 16;
  static int maxPassportLength = 15;
  static int phoneNumberLength = 10;

  factory UpdateProfileForm.defaultValue() {
    return UpdateProfileForm(
      title: ADEditableTextModel.defaultValue(),
      firstName: ADEditableTextModel.defaultValue(),
      lastName: ADEditableTextModel.defaultValue(),
      dateOfBirth: ADEditableTextModel.defaultValue(),
      countryCode: ADEditableTextModel.defaultValue(),
      contactNumber: ADEditableTextModel.defaultValue(),
      emailAddress: ADEditableTextModel.defaultValue(),
      nationality: ADEditableTextModel.defaultValue(),
      passportNumber: ADEditableTextModel.defaultValue(),
      passportExpiryDate: ADEditableTextModel.defaultValue(),
      pinCode: ADEditableTextModel.defaultValue(),
      countryOfResidence: ADEditableTextModel.defaultValue(),
      maritalStatus: ADEditableTextModel.defaultValue(),
      anniversary: ADEditableTextModel.defaultValue(),
    );
  }

  factory UpdateProfileForm.fromModel({
    required Function() onChange,
    required ProfileModel profileModel,
  }) {
    return UpdateProfileForm(
      title: ADEditableTextModel(
        focusNode: FocusNode(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.title ?? '',
        placeHolder: 'title',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
      ),
      firstName: ADEditableTextModel(
        focusNode: FocusNode(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.firstName ?? '',
        placeHolder: 'firstName',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfName,
        validation: (String? value) =>
            MyProfileValidations.validateFirstName(value ?? ''),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z]'),
          ),
        ],
      ),
      lastName: ADEditableTextModel(
        focusNode: FocusNode(),
        controller: TextEditingController()
          ..text = profileModel.personInfo?.lastName ?? '',
        placeHolder: 'last_name',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfName,
        validation: (String? value) =>
            MyProfileValidations.validateLastName(value ?? ''),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z ]'),
          ),
        ],
      ),
      dateOfBirth: valueForDateOfBirth(onChange, profileModel),
      countryCode: ADEditableTextModel(
        controller: TextEditingController()
          ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
              ? profileModel.personInfo?.phones?.first.countryCode ?? ''
              : '',
        placeHolder: 'code',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        enable: false,
        type: ADEditableTextType.defaultTextField,
        keyBoardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
      ),
      contactNumber: valueForMobileNumber(onChange, profileModel),
      emailAddress: valueForEmailId(onChange, profileModel),
      nationality: valueForNationality(onChange, profileModel),
      passportNumber: valueForPassportNumber(onChange, profileModel),
      passportExpiryDate: valueForPassportExpiryDate(onChange, profileModel),
      maritalStatus: valueForMaritalStatus(onChange, profileModel),
      countryOfResidence: valueForCountryOfResidence(onChange, profileModel),
      pinCode: valueForPinCode(onChange, profileModel),
      anniversary: valueForAnniversary(onChange, profileModel),
    );
  }

  static ADEditableTextModel valueForMaritalStatus(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.maritalStatus ?? '',
      placeHolder: 'marital_status',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.trailingArrow,
    );
  }

  static ADEditableTextModel valueForDateOfBirth(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = MyProfileUtils.convertToDisplayDateFormat(
          profileModel.personInfo?.dob ?? '',
        ),
      placeHolder: 'date_of_birth',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.calenderIcon,
      validation: (value) => MyProfileValidations.validateDOB(value),
    );
  }

  static ADEditableTextModel valueForMobileNumber(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.phones?.isNotEmpty ?? false
            ? profileModel.personInfo?.phones
                    ?.firstWhere((phoneNumber) => phoneNumber.type == 'P')
                    .number ??
                ''
            : '',
      placeHolder: 'mobileNumber',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      enable: false,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      svgAssets: SvgAssets.rightEmptyClick,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      validation: (String? value) =>
          MyProfileValidations.validateMobile(value ?? ''),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[0-9]'),
        ),
      ],
    );
  }

  static ADEditableTextModel valueForEmailId(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.emails?.isNotEmpty ?? false
            ? profileModel.personInfo?.emails?.first.emailAddress ?? ''
            : '',
      placeHolder: 'emailID',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.emailAddress,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      validation: (String? value) =>
          emailEmptyOrNot(profileModel.personInfo?.emails, value ?? '')
              ? MyProfileValidations.validateEmailId(value ?? '')
              : null,
      verifyText: 'verify',
    );
  }

  static ADEditableTextModel valueForPassportNumber(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.passportNumber ?? '',
      placeHolder: 'passportNumber',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      type: ADEditableTextType.defaultTextField,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      length: maxPassportLength,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-9]'),
        ),
      ],
      validation: (value) => MyProfileValidations.validatePassport(value ?? ''),
    );
  }

  static ADEditableTextModel valueForPinCode(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    String pincode = '';
    final addresses = profileModel.personInfo?.addresses;
    if (addresses != null && addresses.isNotEmpty) {
      final homeAddress = addresses.firstWhereOrNull(
        (address) => address.type?.toLowerCase() == AddressType.home.name,
      );
      pincode = homeAddress?.pinCode ?? '';
    }
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()..text = pincode,
      placeHolder: 'pincode',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: false,
      type: ADEditableTextType.defaultTextField,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      length: maxPincodeLength,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[ a-zA-Z0-9-]'),
        ),
      ],
      validation: (String? value) =>
          MyProfileValidations.validatePincode(value ?? ''),
    );
  }

  static ADEditableTextModel valueForPassportExpiryDate(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = MyProfileUtils.convertToDisplayDateFormat(
          profileModel.personInfo?.passportExpiryDate ?? '',
        ),
      placeHolder: 'passport_expiry_date',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.calenderIcon,
    );
  }

  static ADEditableTextModel valueForNationality(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = profileModel.personInfo?.nationality ?? '',
      placeHolder: 'nationality',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      icon: Icons.keyboard_arrow_down_outlined,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.trailingArrow,
    );
  }

  static bool emailEmptyOrNot(
    List<Emails>? emails,
    String value,
  ) {
    //condition added for first time user input/fresh user
    if (value.isNotEmpty) {
      return value.isNotEmpty;
    } else if (emails?.isNotEmpty ?? false) {
      return emails?.first.emailAddress?.isNotEmpty ?? false;
    }
    return false;
  }

  static ADEditableTextModel valueForCountryOfResidence(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    String country = '';
    final addresses = profileModel.personInfo?.addresses;
    if (addresses != null && addresses.isNotEmpty) {
      final homeAddress = addresses.firstWhereOrNull(
        (address) => address.type?.toLowerCase() == AddressType.home.name,
      );
      country = homeAddress?.country ?? '';
    }
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()..text = country,
      placeHolder: 'country_of_residence',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      icon: Icons.keyboard_arrow_down_outlined,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.trailingArrow,
    );
  }

  static ADEditableTextModel valueForAnniversary(
    Function() onChange,
    ProfileModel profileModel,
  ) {
    return ADEditableTextModel(
      focusNode: FocusNode(),
      controller: TextEditingController()
        ..text = MyProfileUtils.convertToDisplayDateFormat(
          profileModel.personInfo?.anniversary ?? '',
        ),
      placeHolder: 'anniversary',
      onChange: onChange,
      onClearTextAction: () {
        //TODO
      },
      readonly: true,
      type: ADEditableTextType.defaultTextField,
      keyBoardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      errorMessageColor: ADColors.red.shade900,
      textInputAction: TextInputAction.next,
      svgAssets: SvgAssets.calenderIcon,
    );
  }
}
