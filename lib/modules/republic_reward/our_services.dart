import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double imageHeight = 160;
const int flightBookingFlag = 0;
const int pranaamServiceId = 1;
const int dutyFree = 2;
const int cabBookingFlag = 8;

class OurServices extends StatefulWidget {
  const OurServices({
    Key? key,
    required this.item,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[shouldBeKeptAlive] this is used to maintain index of item while scrolling
  final DutyFreeDashboardItem item;
  final bool shouldBeKeptAlive;
  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final List<DutyFreeItem> itemData = [];
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    widget.item.widgetItems?.forEach((element) {
      if (element.title != 'Flight Status') {
        itemData.add(element);
      }
    });
    return CreateList(
      itemData: itemData,
      item: widget.item,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
  }) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.item.itemMargin?.top.sp ?? 0,
        ),
        if (widget.item.title?.isNotEmpty ?? false)
          Text(
            widget.item.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle700.size22,
            textAlign: TextAlign.left,
          ).paddingBySide(
            right: widget.item.itemMargin?.right.sp ?? 0,
          ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            mainAxisExtent: 254,
          ),
          padding: EdgeInsets.only(
            top: widget.item.subItemMargin?.top.sp ?? 0,
          ),
          // scrollDirection: Axis.horizontal,
          itemCount: widget.itemData?.length ?? 0,
          itemBuilder: (context, index) {
            return ImageWidget(
              itemData: widget.itemData?[index],
            );
          },
        ),
      ],
    ).paddingBySide(
      left: widget.item.itemMargin?.left.sp ?? 0,
      right: widget.item.itemMargin?.right.sp ?? 0,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final DutyFreeItem? itemData;

  const ImageWidget({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  ///Select airport fist in case of Adani one for dutyfree or pranaam flow
  void selectAirport(BuildContext context) {
    BottomSheetUtils.showBottomSheetDialog(
      context,
      ADDraggableScrollableBottomSheet(
        initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
        childWidget: SliverAppBarBottomSheet(
          body: AirportsListScreen(
            airportsData:
                context.read<AirportListStateManagement>().airportData,
          ),
          title: 'select_airport'.localize(context),
          flexibleTitleBottomPadding: context.k_2,
        ),
      ),
    ).then((value) {
      if (value != null) {
        final AirportItemModel selectedAirportsData = value;
        context
            .read<AirportListStateManagement>()
            .updateData(selectedAirportsData, context);
      }
    });
  }

  void navigateRouteBasedOnType(int? objectID, BuildContext context) {
    switch (objectID) {
      case flightBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          flightBooking,
        );
        break;
      case dutyFree:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(context);
        } else {
          navigateToScreenUsingNamedRoute(
            context,
            dutyFreeScreen,
            rootNavigator: false,
          );
        }
        break;
      case pranaamServiceId:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(context);
        } else {
          navigateToScreenUsingNamedRoute(
            context,
            pranaamService,
            rootNavigator: false,
          );
        }
        break;
      case cabBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          cabBookingHomeScreen,
          rootNavigator: false,
        );
        break;
    }
  }

  void navigateToStaticSPage(
    BuildContext context,
    DutyFreeItem? item,
  ) {
    final WebViewModel model = WebViewModel(
      title: (item?.title.isNotEmpty ?? false) &&
              item?.widgetType != WidgetType.moreServices.name
          ? item?.title ?? ''
          : 'services'.localize(context),
      url:
          '${item?.ctaUrl ?? ''}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
    );
    if (model.url.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: model,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const int titleMaxLine = 2;

    return TouchableOpacity(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            if (itemData?.uniqueId.isEmpty ?? false)
              {
                navigateToStaticSPage(
                  context,
                  itemData,
                ),
              }
            else
              {
                navigateRouteBasedOnType(
                  int.parse(itemData?.uniqueId ?? '0'),
                  context,
                ),
              },
          },
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              context.scaled(
                context.k_12,
              ),
            ),
            child: Container(
              height: imageHeight,
              color: context.adColors.containerGreyBg,
              child: ADCachedImage(
                imageUrl: itemData?.imageSrc ?? '',
              ),
            ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            itemData?.title ?? '',
            style: ADTextStyle700.size18.setTextColor(
              context.adColors.blackTextColor,
            ),
            maxLines: titleMaxLine,
            overflow: TextOverflow.ellipsis,
          ),
          ADSizedBox(height: context.k_10),
          Text(
            itemData?.subTitle ?? 'know_more'.localize(context),
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle400.size16.copyWith(
              color: context.adColors.blackTextColor,
              decoration: TextDecoration.underline,
              fontSize: fifteenFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
