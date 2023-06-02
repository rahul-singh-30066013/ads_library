import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class SalutationFormRadio extends FormField<String> {
  final TextEditingController controller;
  final List<site_core.Salutation> salutations;
  SalutationFormRadio({
    Key? key,
    required this.controller,
    required this.salutations,
    FormFieldSetter<String>? onSaved,
    required FormFieldValidator<String> validator,
    AutovalidateMode? autovalidateMode,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: controller.text,
          autovalidateMode: autovalidateMode,
          builder: (state) {
            final height = state.context.k_20;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: salutations.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {
                        controller.text = salutations[index].label,
                        state.didChange(salutations[index].label),
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateProperty.all(
                              context.adColors.blackTextColor,
                            ),
                            value: salutations[index].label,
                            groupValue: state.value,
                            onChanged: (value) => {
                              controller.text = value ?? '',
                              state.didChange(value),
                            },
                          ).paddingBySide(right: context.k_8),
                          Text(
                            salutations[index].label,
                            style: salutations[index].label == controller.text
                                ? ADTextStyle500.size16
                                : ADTextStyle400.size16,
                          ).paddingBySide(right: context.k_30),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.hasError)
                  Text(
                    state.errorText ?? '',
                    style: ADTextStyle400.size12
                        .setTextColor(state.context.adColors.red900),
                  ).paddingBySide(top: state.context.k_10),
              ],
            );
          },
        );
}
