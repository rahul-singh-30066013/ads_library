import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ContainerImageWidget extends StatefulWidget {
  const ContainerImageWidget({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);

  final DutyFreeDashboardItem dashBoardItem;

  @override
  State<ContainerImageWidget> createState() => _ContainerImageWidgetState();
}

class _ContainerImageWidgetState extends State<ContainerImageWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    adLog('build ${super.build(context)}');
    return (widget.dashBoardItem.widgetItems?.isNotEmpty ?? false)
        ? Container(
            padding: EdgeInsets.only(
              left: widget.dashBoardItem.itemMargin?.left.sp ?? 0,
              top: widget.dashBoardItem.itemMargin?.top.sp ?? 0,
              right: widget.dashBoardItem.itemMargin?.right.sp ?? 0,
              bottom: widget.dashBoardItem.itemMargin?.bottom.sp ?? 0,
            ),
            decoration: Utils.getGradientBoxDecoration(
              widget.dashBoardItem.gradientConfiguration,
              widget.dashBoardItem.backgroundColor,
              ADColors.white,
            ),
            child: ADCachedImage(
              width: context.widthOfScreen,
              height: context.widthOfScreen *
                  (widget.dashBoardItem.aspectRatio ?? 1),
              imageUrl: widget.dashBoardItem.widgetItems?.first.imageSrc ?? '',
            ),
          )
        : const ADSizedBox.shrink();
  }

  @override
  bool get wantKeepAlive => false;
}
