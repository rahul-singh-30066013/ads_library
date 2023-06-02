/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/traveller_title_radio_button.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_country_code_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this is use for input field
/// which will be implement on run time
/// according to adult of number and child , infant
class InputControllerTravellerDetails extends StatefulWidget {
  final VoidCallback onPress;

  final OneTravellerDetails? data;

  const InputControllerTravellerDetails({
    Key? key,
    required this.onPress,
    this.data,
  }) : super(key: key);

  @override
  State<InputControllerTravellerDetails> createState() =>
      _InputControllerTravellerDetailsState();
}

class _InputControllerTravellerDetailsState
    extends State<InputControllerTravellerDetails> {
  final double titleDropDownWidth = 110.sp;
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: context.k_30,
        ),
        Text(
          '${(widget.data?.type ?? '').localize(context)} ${widget.data?.count}',
          style: ADTextStyle700.size16.setTextColor(context.adColors.black),
          key: widget.data?.title.globalKey,
        ),
        if (widget.data?.type == PaxType.infant.name)
          ADSizedBox(
            height: context.k_15,
          ),
        Visibility(
          visible: widget.data?.type == PaxType.infant.name,
          child: Text(
            'under_years'.localize(context),
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.darkGreyTextColor),
          ),
        ),
        TravellerTitleRadioButton(
          formData: widget.data,
        ).paddingBySide(
          top: context.k_15,
        ),
        ADSizedBox(
          height: context.k_14,
        ),

        /// this is use for create dropdown of title and first name
        ADDefaultEditableText(
          // prefixWidget: DropDownGeneric(
          //   widthOfDropDown: titleDropDownWidth,
          //   type: (widget.data?.title.placeHolder ?? '').localize(context),
          //   showDivider: true,
          //   onTap: () => adShowBottomSheet(
          //     childWidget: GenericBottomSheet(
          //       onBottomSheetItemSelect: (value) => onBottomSheetSelect(
          //         widget.data?.title,
          //         value,
          //       ),
          //       bottomSheetHeader:
          //           (widget.data?.title.placeHolder ?? '').localize(context),
          //       bottomSheetList: widget.data?.type == PaxType.adult.name
          //           ? bottomFlightSheetTitleList
          //           : bottomFlightSheetGenderList,
          //       screenType: GenericBottomSheetScreenType.flightTraveller,
          //       selectedItem: widget.data?.title.text,
          //     ),
          //     context: context,
          //     headerTitle:
          //         (widget.data?.title.placeHolder ?? '').localize(context),
          //   ),
          //   controller:
          //       widget.data?.title.controller ?? TextEditingController(),
          // ),
          componentData:
              widget.data?.firstName ?? ADEditableTextModel.defaultValue(),
          nextFocus: (value) => FocusScope.of(context)
              .requestFocus(widget.data?.lastName.focusNode),
          //enable it when require validation for first name with"please_select_salutation"
          // selectedTitle: (widget.data?.title.controller.text ?? '').isEmpty
          //     ? widget.data?.title.text
          //     : widget.data?.title.controller.text,
        ),
        ADSizedBox(
          height: context.k_20,
        ),

        /// this is use for create last name of passenger form
        ADDefaultEditableText(
          componentData:
              widget.data?.lastName ?? ADEditableTextModel.defaultValue(),
          nextFocus: (abc) => FocusScope.of(context).unfocus(),
        ),
        if (widget.data?.dateOfBirth != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.dateOfBirth != null)
          ADDefaultEditableText(
            iconHeight: context.k_8,
            iconWidth: context.k_8,
            componentData:
                widget.data?.dateOfBirth ?? ADEditableTextModel.defaultValue(),
            onTap: () => openDatePicker(),
          ),
        if (widget.data?.passport != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.passport != null)
          ADDefaultEditableText(
            componentData:
                widget.data?.passport ?? ADEditableTextModel.defaultValue(),
            nextFocus: (abc) => FocusScope.of(context).unfocus(),
          ),
        if (widget.data?.nationality != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.nationality != null)
          ADDefaultEditableText(
            iconHeight: context.k_20,
            iconWidth: context.k_20,
            componentData:
                widget.data?.nationality ?? ADEditableTextModel.defaultValue(),
            onTap: () => adShowBottomSheet(
              context: context,
              childWidget: ADCountryCodeBottomSheet(
                selectedCountry:
                    widget.data?.nationality?.controller.text ?? '',
                onTap: (value) => onCountryTap(
                  widget.data?.nationality?.controller ??
                      TextEditingController(),
                  value,
                ),
                countryListCodes: _siteCoreStateManagement.country,
              ),
              headerTitle: 'Country',
            ).then(
              (value) => {
                searchTextController.clear(),
                context
                    .read<PranaamAppDataStateManagement>()
                    .buildSearchCountryList(
                      '',
                      _siteCoreStateManagement.country,
                    ),
              },
            ),
          ),
        if (widget.data?.issuedCountryName != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.issuedCountryName != null)
          ADDefaultEditableText(
            iconHeight: context.k_20,
            iconWidth: context.k_20,
            componentData: widget.data?.issuedCountryName ??
                ADEditableTextModel.defaultValue(),
            onTap: () => adShowBottomSheet(
              context: context,
              childWidget: ADCountryCodeBottomSheet(
                selectedCountry:
                    widget.data?.issuedCountryName?.controller.text ?? '',
                onTap: (value) => onCountryTap(
                  widget.data?.issuedCountryName?.controller ??
                      TextEditingController(),
                  value,
                ),
                countryListCodes: _siteCoreStateManagement.country,
              ),
              headerTitle: 'Country',
            ).then(
              (value) => {
                searchTextController.clear(),
                context
                    .read<PranaamAppDataStateManagement>()
                    .buildSearchCountryList(
                      '',
                      _siteCoreStateManagement.country,
                    ),
              },
            ),
          ),
        if (widget.data?.issueDate != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.issueDate != null)
          ADDefaultEditableText(
            iconHeight: context.k_8,
            iconWidth: context.k_8,
            componentData:
                widget.data?.issueDate ?? ADEditableTextModel.defaultValue(),
            onTap: () => openDatePickerForIssue(),
          ),
        if (widget.data?.expiryDate != null)
          SizedBox(
            height: context.k_20,
          ),
        if (widget.data?.expiryDate != null)
          ADDefaultEditableText(
            iconHeight: context.k_8,
            iconWidth: context.k_8,
            componentData:
                widget.data?.expiryDate ?? ADEditableTextModel.defaultValue(),
            onTap: () => openDatePickerForExpiry(),
          ),
      ],
    );
  }

  /// this method is use for set country name
  void onCountryTap(
    TextEditingController controller,
    site_core.Country value,
  ) {
    setState(() {
      controller.text = value.countryName.validateWithDefaultValue();
    });
    //widget.flag.value = value.flag.validateWithDefaultValue();
  }

  /// this method is for open dropdown list of title
  void onBottomSheetSelect(
    ADEditableTextModel? title,
    String value,
  ) {
    setState(() {
      title?.controller.text = value.localize(context);
      title?.text = value;
      title?.onChange.call();
      title?.errorMessage = '';
      navigatorPopScreen(context);
    });
  }

  /// this is use for date of birth
  void openDatePicker() {
    _pickDateOfBirth().then((value) {
      if (value != null && value is String) {
        widget.data?.dateOfBirth?.controller.text = value;
      }
    });
  }

  /// this is use for date of expiry
  void openDatePickerForExpiry() {
    _pickDateOfExpiry().then((value) {
      if (value != null && value is String) {
        widget.data?.expiryDate?.controller.text = value;
      }
    });
  }

  /// this is use for date of issue
  void openDatePickerForIssue() {
    _pickDateOfIssue().then((value) {
      if (value != null && value is String) {
        widget.data?.issueDate?.controller.text = value;
      }
    });
  }

  /// its is use for pick date of issue
  Future _pickDateOfIssue() async {
    final selectedDate = await _selectDateOfIssue(context);
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      setState(() {
        final date = '$day-$month-${selectedDate.year}';
        widget.data?.issueDate?.controller.text = date;
        widget.data?.issueDate?.onChange.call();
      });
    }
  }

  /// its is use for pick date of Expiry
  Future _pickDateOfExpiry() async {
    final selectedDate = await _selectDateOfExpiry(context);
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      setState(() {
        final date = '$day-$month-${selectedDate.year}';
        widget.data?.expiryDate?.controller.text = date;
        widget.data?.expiryDate?.onChange.call();
      });
    }
  }

  /// it is use for select date , when user click on Issue date filed
  Future<DateTime?> _selectDateOfIssue(
    BuildContext context,
  ) =>
      showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: ADColors.black,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
            ),
            child: child ?? const Text(''),
          );
        },
        errorInvalidText: 'please_enter_valid_date'.localize(context),
        initialDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
      );

  /// it is use for select date , when user click on Expiry date filed
  Future<DateTime?> _selectDateOfExpiry(
    BuildContext context,
  ) =>
      showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: ADColors.black,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
            ),
            child: child ?? const Text(''),
          );
        },
        errorInvalidText: 'please_enter_valid_date'.localize(context),
        initialDate: DateTime(
          (widget.data?.journeyStartingDate ?? DateTime.now()).year,
          (widget.data?.journeyStartingDate ?? DateTime.now()).month,
          (widget.data?.journeyStartingDate ?? DateTime.now()).day,
        ),
        firstDate: DateTime(
          (widget.data?.journeyStartingDate ?? DateTime.now()).year,
          (widget.data?.journeyStartingDate ?? DateTime.now()).month,
          (widget.data?.journeyStartingDate ?? DateTime.now()).day,
        ),
        lastDate: DateTime(
          DateTime.now().year + 10,
          (widget.data?.journeyStartingDate ?? DateTime.now()).month,
          (widget.data?.journeyStartingDate ?? DateTime.now()).day,
        ),
      );

  /// its is use for pick date
  Future _pickDateOfBirth() async {
    final selectedDate = await _selectDate(context);
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      setState(() {
        final date = '$day/$month/${selectedDate.year}';
        widget.data?.dateOfBirth?.controller.text = date;
        widget.data?.dateOfBirth?.onChange.call();
      });
    }
  }

  /// it is use for select date , when user click on date filed
  Future<DateTime?> _selectDate(
    BuildContext context,
  ) =>
      showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: ADColors.black,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
            ),
            child: child ?? const Text(''),
          );
        },
        errorInvalidText: 'please_enter_valid_date'.localize(context),
        initialDate: FlightValidations.validInitialCalenderDate(
          paxType: widget.data?.type ?? '',
          journeyStartingDate:
              widget.data?.journeyStartingDate ?? DateTime.now(),
        ),
        firstDate: FlightValidations.validFirstCalenderDate(
          paxType: widget.data?.type ?? '',
          journeyStartingDate:
              widget.data?.journeyStartingDate ?? DateTime.now(),
        ),
        lastDate: FlightValidations.validLastCalenderDate(
          paxType: widget.data?.type ?? '',
          journeyStartingDate:
              widget.data?.journeyStartingDate ?? DateTime.now(),
        ),
      );
}
