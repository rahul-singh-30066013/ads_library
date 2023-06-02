import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/option_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_service_list_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class ServiceTypeOptionPicker extends StatefulWidget {
  final bool hideTransit;
  final void Function(ServiceModel) callback;
  final String selectedTitle;

  const ServiceTypeOptionPicker({
    Key? key,
    required this.callback,
    this.hideTransit = true,
    required this.selectedTitle,
  }) : super(key: key);

  @override
  State<ServiceTypeOptionPicker> createState() =>
      _ServiceTypeOptionPickerState();
}

class _ServiceTypeOptionPickerState extends State<ServiceTypeOptionPicker>
    with AutomaticKeepAliveClientMixin {
  String? _selectedTitle;

  @override
  Widget build(BuildContext context) {
    _selectedTitle = widget.selectedTitle;
    final temp = super.build(context);
    adLog(temp.toStringShort());
    return OptionPicker(
      title: _selectedTitle ?? 'Departure',
      iconPath: _getServiceTypeIcon(),
      heightOfIcon: context.k_18,
      widthOfIcon: context.k_18,
      onTap: () => adShowBottomSheet(
        context: context,
        childWidget: StandAloneServiceListScreen(
          hideTransit: widget.hideTransit,
          selectedTitle: _selectedTitle ?? 'Departure',
          callback: (value) => handleTravelSectorTap(value),
        ),
        headerTitle: 'service_label'.localize(context),
      ),
    );
  }

  void handleTravelSectorTap(ServiceModel serviceModel) {
    _selectedTitle = serviceModel.serviceTitle;
    setState(() => {});
    widget.callback(serviceModel);
  }

  String _getServiceTypeIcon() {
    switch (_selectedTitle?.toLowerCase()) {
      case 'departure':
        return SvgAssets.departureIcon;
      case 'arrival':
        return SvgAssets.arrivalIcon;
      case 'round trip':
        return SvgAssets.roundTripIcon;
      default:
        return SvgAssets.departureIcon;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
