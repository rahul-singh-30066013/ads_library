import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/billing_detail_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

class BillingDetailBuilder {
  BillingDetailForm billingDetailForm;

  BillingDetailBuilder({
    required this.billingDetailForm,
  });

  /// this factory method is use for create billing form
  factory BillingDetailBuilder.fromBillingDetailResponse({
    required Function() onChange,
    required UpdateBillingModel updateBillingModel,
  }) {
    final _billingDetailForm = BillingDetailForm.fromModel(
      onChange: onChange,
      updateBillingModel: updateBillingModel,
    );

    return BillingDetailBuilder(
      billingDetailForm: _billingDetailForm,
    );
  }

  factory BillingDetailBuilder.defaultValue() {
    return BillingDetailBuilder(
      billingDetailForm: BillingDetailForm.fromModel(
        onChange: () => {},
        updateBillingModel: UpdateBillingModel('', '', '', '', ''),
      ),
    );
  }
}

class BillingDetailForm {
  final ADEditableTextModel address;
  final ADEditableTextModel pinCode;
  final ADEditableTextModel country;
  final ADEditableTextModel state;
  final ADEditableTextModel city;

  BillingDetailForm({
    required this.address,
    required this.pinCode,
    required this.country,
    required this.state,
    required this.city,
  });

  static int maxLengthOfCompanyAddress = 100;
  static int maxLengthOfCityAndState = 30;

  factory BillingDetailForm.defaultValue() {
    return BillingDetailForm(
      address: ADEditableTextModel.defaultValue(),
      pinCode: ADEditableTextModel.defaultValue(),
      country: ADEditableTextModel.defaultValue(),
      state: ADEditableTextModel.defaultValue(),
      city: ADEditableTextModel.defaultValue(),
    );
  }

  void setMaxLengthOfPin(String countryName) {
    const int lengthForIndia = 6;
    const int lengthForAnotherCountry = 30;
    if (countryName == 'India') {
      pinCode
        ..length = lengthForIndia
        ..keyBoardType = TextInputType.phone
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ];
    } else {
      pinCode
        ..length = lengthForAnotherCountry
        ..keyBoardType = TextInputType.text
        ..inputFormatters = <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp('[a-zA-Z0-9]'),
          ),
        ];
    }
  }

  factory BillingDetailForm.fromModel({
    required Function() onChange,
    required UpdateBillingModel updateBillingModel,
  }) {
    return BillingDetailForm(
      address: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = updateBillingModel.address,
        placeHolder: 'address',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCompanyAddress,
        validation: (String? value) =>
            BillingDetailValidation.isValidateForCompanyAddress(value ?? ''),
      ),
      country: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = updateBillingModel.country,
        placeHolder: 'country',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: true,
        style: ADTextStyle500.size16,
        svgAssets: SvgAssets.trailingArrow,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) =>
            BillingDetailValidation.validateCountryCode(value ?? ''),
      ),
      pinCode: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = updateBillingModel.pinCode,
        placeHolder: 'pin_code',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        // keyBoardType: TextInputType.phone,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        validation: (String? value) => BillingDetailValidation.validatePincode(
          value ?? '',
        ),
      ),
      state: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = updateBillingModel.state,
        placeHolder: 'state',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        validation: (String? value) =>
            BillingDetailValidation.validateState(value ?? ''),
      ),
      city: ADEditableTextModel(
        focusNode: FocusNode(),
        globalKey: GlobalKey(),
        controller: TextEditingController()..text = updateBillingModel.city,
        placeHolder: 'city',
        onChange: onChange,
        onClearTextAction: () {
          //TODO
        },
        readonly: false,
        style: ADTextStyle500.size16,
        type: ADEditableTextType.defaultTextField,
        errorMessageColor: ADColors.red.shade900,
        textInputAction: TextInputAction.next,
        length: maxLengthOfCityAndState,
        validation: (String? value) =>
            BillingDetailValidation.validateCity(value ?? ''),
      ),
    );
  }
}
