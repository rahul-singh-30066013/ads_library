import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/customer_information_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/traveller_detail_state.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TravellerTitleRadioButton extends StatefulWidget {
  final OneTravellerDetails? formData;
  const TravellerTitleRadioButton({Key? key, this.formData}) : super(key: key);

  @override
  _TravellerTitleRadioButtonState createState() =>
      _TravellerTitleRadioButtonState();
}

class _TravellerTitleRadioButtonState extends State<TravellerTitleRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Selector<TravellerDetailState, TitleSalutation?>(
      selector: (context, state) => MyProfileUtils.convertToTitleSalutation(
        widget.formData?.title.controller.text ?? '',
      ),
      builder: (context, titleSalutation, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.formData?.type == 'adult')
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RadioButton(
                  groupValue: titleSalutation,
                  value: TitleSalutation.mister,
                  onChanged: (value) => _onTitleRadioButtonSelect(
                    widget.formData?.title.onChange,
                    widget.formData?.title.controller ??
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
                    widget.formData?.title.onChange,
                    widget.formData?.title.controller ??
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
                    widget.formData?.title.onChange,
                    widget.formData?.title.controller ??
                        TextEditingController(),
                    value?.titleAbbr ?? '',
                  ),
                ),
              ],
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RadioButton(
                  groupValue: titleSalutation,
                  value: TitleSalutation.mstrChild,
                  onChanged: (value) => _onTitleRadioButtonSelect(
                    widget.formData?.title.onChange,
                    widget.formData?.title.controller ??
                        TextEditingController(),
                    value?.titleAbbr ?? '',
                  ),
                ),
                SizedBox(
                  width: context.k_24,
                ),
                _RadioButton(
                  groupValue: titleSalutation,
                  value: TitleSalutation.missChild,
                  onChanged: (value) => _onTitleRadioButtonSelect(
                    widget.formData?.title.onChange,
                    widget.formData?.title.controller ??
                        TextEditingController(),
                    value?.titleAbbr ?? '',
                  ),
                ),
              ],
            ),
          Visibility(
            visible: titleSalutation == TitleSalutation.clickButtonError,
            child: Text(
              'please_select_title'.localize(context),
              style: ADTextStyle400.size12.setTextColor(
                errorColor,
              ),
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

///Radio button used in traveller
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
