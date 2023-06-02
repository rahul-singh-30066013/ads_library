import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class StandAloneQuantityPicker extends StatelessWidget {
  const StandAloneQuantityPicker({
    Key? key,
    this.onPorterSelected,
    this.errorMsg,
    this.selectedPorters,
  }) : super(key: key);
  final void Function(int porters)? onPorterSelected;
  final int? selectedPorters;
  final ValueNotifier<String>? errorMsg;

  @override
  Widget build(BuildContext context) {
    final currentType =
        context.read<StandAloneStateManagement>().currentServiceType;
    String _getTitle(int count) {
      switch (currentType) {
        case StandAloneServiceType.porter:
          return count > 1
              ? 'porters'.localize(context)
              : 'porter_title'.localize(context);
        case StandAloneServiceType.wheelchair:
          return count > 1
              ? 'wheelchairs'.localize(context)
              : 'wheelchair_title'.localize(context);
        default:
          return 'porter_title'.localize(context);
      }
    }

    String _getType() {
      switch (currentType) {
        case StandAloneServiceType.porter:
          return 'number_of_porters'.localize(context);
        case StandAloneServiceType.wheelchair:
          return 'number_of_wheelchairs'.localize(context);
        default:
          return 'number_of_porters'.localize(context);
      }
    }

    final _internalController = TextEditingController();
    if (selectedPorters != null) {
      _internalController.text =
          '$selectedPorters ${_getTitle(selectedPorters ?? 0)}';
    }
    const numberOfPorters = 9;
    const _lightBlack = Color(0xff333333);
    return DropDownGeneric(
      needRightPadding: false,
      errorMsg: errorMsg,
      type: _getType(),
      onTap: () => adShowBottomSheet(
        context: context,
        childWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentType == StandAloneServiceType.porter)
              Text(
                'one_porter_can_carry_a_maximum_baggage_of_3'.localize(context),
                style: ADTextStyle400.size14
                    .copyWith(color: context.adColors.greyTextColor),
              ).paddingBySide(
                bottom: context.k_14,
                left: context.k_16,
                right: context.k_16,
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: numberOfPorters,
              itemBuilder: (context, index) {
                final value = index + 1;
                final bool isSelected =
                    _internalController.text.startsWith('$value');
                return InkWell(
                  child: Container(
                    color: isSelected
                        ? context.adColors.lightBlue
                        : context.adColors.transparentColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$value ${_getTitle(value)}',
                          style: ADTextStyle400.size16
                              .copyWith(color: context.adColors.blackTextColor),
                        ),
                        Icon(
                          isSelected ? Icons.check : null,
                          size: context.k_22,
                          color: _lightBlack,
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_14,
                      bottom: context.k_14,
                      right: context.k_16,
                      left: context.k_16,
                    ),
                  ),
                  onTap: () => {
                    onPorterSelected?.call(value),
                    Navigator.pop(context),
                    _internalController.text = '$value ${_getTitle(value)}',
                  },
                );
              },
            ),
          ],
        ),
        headerTitle: _getType(),
      ),
      controller: _internalController,
    );
  }
}
