import 'dart:math' as math;

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_default_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class TravelInformationUpdateProfile extends StatefulWidget {
  const TravelInformationUpdateProfile({
    Key? key,
    required this.onTapCallback,
  }) : super(key: key);
  final void Function() onTapCallback;

  @override
  State<TravelInformationUpdateProfile> createState() =>
      _TravelInformationUpdateProfileState();
}

class _TravelInformationUpdateProfileState
    extends State<TravelInformationUpdateProfile> {
  UpdateProfileState? updateProfileState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateProfileState = context.read<UpdateProfileState>();
  }

  void _onTap(bool value) {
    updateProfileState?.updateValueForTravel(
      value: !value,
    );
    if (!value) {
      widget.onTapCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    const int valueOfAngle = 180;
    return Selector<UpdateProfileState, bool>(
      selector: (context, model) => model.checkForTravel,
      builder: (context, value, child) => Column(
        children: [
          GestureDetector(
            onTap: () => _onTap(value),
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'travel_Information'.localize(context),
                  style: ADTextStyle700.size22.setTextColor(
                    context.adColors.black,
                  ),
                ),
                if (value)
                  Transform.rotate(
                    angle: math.pi * valueOfAngle / valueOfAngle,
                    child: SvgPicture.asset(
                      SvgAssets.trailingArrow,
                      height: context.k_26,
                      width: context.k_26,
                      color: context.adColors.darkGreyTextColor,
                    ),
                  )
                else
                  SvgPicture.asset(
                    SvgAssets.trailingArrow,
                    height: context.k_26,
                    width: context.k_26,
                    color: context.adColors.darkGreyTextColor,
                  ),
              ],
            ),
          ),
          if (value)
            SizedBox(
              height: context.k_22,
            ),
          Visibility(
            visible: value,
            maintainState: true,
            child: Column(
              children: [
                ADDefaultEditableText(
                  componentData: updateProfileState?.updateProfileFormBuilder
                          ?.updateProfileForm.passportNumber ??
                      ADEditableTextModel.defaultValue(),
                  nextFocus: (abc) => FocusScope.of(context).nextFocus(),
                ),
                SizedBox(
                  height: context.k_20,
                ),
                ADDefaultEditableText(
                  componentData: updateProfileState?.updateProfileFormBuilder
                          ?.updateProfileForm.passportExpiryDate ??
                      ADEditableTextModel.defaultValue(),
                  onTap: () => _pickDateOfBirth(
                    updateProfileState?.updateProfileFormBuilder
                        ?.updateProfileForm.passportExpiryDate.controller,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// its is use for pick date
  Future _pickDateOfBirth(TextEditingController? controller) async {
    final dateText = controller?.text;
    final initialDate = DateTime.tryParse(
      MyProfileUtils.convertToParsableDateFormat(dateText ?? ''),
    );
    final selectedDate = await _selectDate(context, initialDate: initialDate);
    if (selectedDate != null) {
      final String day = selectedDate.day.toString().length == 1
          ? '0${selectedDate.day}'
          : '${selectedDate.day}';
      final String month = selectedDate.month.toString().length == 1
          ? '0${selectedDate.month}'
          : '${selectedDate.month}';
      setState(() {
        final date = '$day/$month/${selectedDate.year}';
        controller?.text = date;
      });
    }
  }

  /// this is use for select date of calender
  Future<DateTime?> _selectDate(
    BuildContext context, {
    DateTime? initialDate,
  }) {
    final currentDate = DateTime.now();
    final displayDate = initialDate?.isAfter(currentDate) ?? false
        ? initialDate ?? currentDate
        : currentDate;
    return showDatePicker(
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
      initialDate: displayDate,
      firstDate: currentDate,
      lastDate: DateTime(
        currentDate.year+10,
        currentDate.month,
        currentDate.day,
        currentDate.hour,
        currentDate.minute,
        currentDate.second,
      ),
    );
  }
}
