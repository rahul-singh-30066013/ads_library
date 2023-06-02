import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class MyProfileRadioButtons extends StatefulWidget {
  const MyProfileRadioButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfileRadioButtons> createState() => _MyProfileRadioButtonsState();
}

class _MyProfileRadioButtonsState extends State<MyProfileRadioButtons> {
  UpdateProfileState? updateProfileState;

  @override
  void initState() {
    super.initState();
    updateProfileState = context.read<UpdateProfileState>();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<UpdateProfileState, TitleSalutation?>(
      selector: (context, state) =>
          MyProfileUtils.convertToTitleSalutation(
            state.updateProfileFormBuilder?.updateProfileForm.title.controller
                    .text ??
                '',
          ),
      builder: (context, titleSalutation, child) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.mister,
            onChanged: (value) => _onTitleRadioButtonSelect(
              updateProfileState
                  ?.updateProfileFormBuilder?.updateProfileForm.title.onChange,
              updateProfileState?.updateProfileFormBuilder?.updateProfileForm
                      .title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
          SizedBox(
            width: context.k_24,
          ),
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.miss,
            onChanged: (value) => _onTitleRadioButtonSelect(
              updateProfileState
                  ?.updateProfileFormBuilder?.updateProfileForm.title.onChange,
              updateProfileState?.updateProfileFormBuilder?.updateProfileForm
                      .title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
          SizedBox(
            width: context.k_24,
          ),
          _RadioButton(
            groupValue: titleSalutation,
            value: TitleSalutation.missus,
            onChanged: (value) => _onTitleRadioButtonSelect(
              updateProfileState
                  ?.updateProfileFormBuilder?.updateProfileForm.title.onChange,
              updateProfileState?.updateProfileFormBuilder?.updateProfileForm
                      .title.controller ??
                  TextEditingController(),
              value?.titleAbbr ?? '',
            ),
          ),
        ],
      ),
    );
  }

  /// this method gets triggered when one of the radio button is selected
  void _onTitleRadioButtonSelect(
    void Function()? onChange,
    TextEditingController controller,
    String value,
  ) {
    setState(() {
      controller.text = value;
      onChange?.call();
    });
  }
}

///Radio button used in My Profile
class _RadioButton extends StatelessWidget {
  const _RadioButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final TitleSalutation? groupValue;
  final TitleSalutation value;
  final void Function(TitleSalutation?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<TitleSalutation>(
          value: value,
          splashRadius: context.k_10,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: context.adColors.black,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () => onChanged(value),
          child: Text(
            value.titleAbbr,
            style: _getRadioButtonStyle(context, value),
          ),
        ),
      ],
    );
  }

  TextStyle _getRadioButtonStyle(
    BuildContext context,
    TitleSalutation titleSalutation,
  ) {
    return groupValue == titleSalutation
        ? ADTextStyle500.size16.setTextColor(
            context.adColors.black,
          )
        : ADTextStyle400.size16.setTextColor(
            context.adColors.greyTextColor,
          );
  }
}
