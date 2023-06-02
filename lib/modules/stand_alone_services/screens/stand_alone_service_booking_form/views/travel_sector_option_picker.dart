import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/option_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/travel_sector_list_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class TravelSectorOptionPicker extends StatefulWidget {
  final void Function(TravelSectorModel) callback;
  final String selectedTitle;
  const TravelSectorOptionPicker({
    Key? key,
    required this.callback,
    required this.selectedTitle,
  }) : super(key: key);

  @override
  State<TravelSectorOptionPicker> createState() =>
      _TravelSectorOptionPickerState();
}

class _TravelSectorOptionPickerState extends State<TravelSectorOptionPicker>
    with AutomaticKeepAliveClientMixin {
  String? selectedTitle;

  @override
  Widget build(BuildContext context) {
    selectedTitle = widget.selectedTitle;
    final temp = super.build(context);
    adLog('$temp');
    return OptionPicker(
      title: selectedTitle ?? 'domestic'.localize(context),
      iconPath: _getTravelSectorIcon(),
      heightOfIcon: context.k_18,
      widthOfIcon: context.k_18,
      onTap: () => adShowBottomSheet(
        context: context,
        childWidget: TravelSectorListView(
          selectedItem: selectedTitle ?? 'domestic'.localize(context),
          callback: (value) => handleTravelSectorTap(value),
        ),
        headerTitle: 'travel_sector_label'.localize(context),
      ),
    );
  }

  void handleTravelSectorTap(TravelSectorModel travelSector) {
    selectedTitle = travelSector.travelSectorTitle;
    setState(() => {});
    widget.callback(travelSector);
  }

  String _getTravelSectorIcon() {
    switch (selectedTitle?.toLowerCase()) {
      case 'domestic':
        return SvgAssets.domesticIcon;
      case 'international':
        return SvgAssets.internationalIcon;
      default:
        return SvgAssets.internationalIcon;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
