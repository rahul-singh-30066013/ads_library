import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle view of different type of pranaam screen.

const String howToConvert = 'howToConvert';
const String table = 'table';
const String tableTitle = 'tableTitle';
const String loyaltyBanner = 'banner';
double lineSpacing = 1.5;

class CurrencyExchangeBankBuilder extends StatelessWidget {
  CurrencyExchangeBankBuilder({
    Key? key,
    required this.title,
    required this.dashBoardItem,
  }) : super(key: key);

  final String title;
  final Fields dashBoardItem;

  WidgetTypeEnum getWidgetType(String value) {
    switch (value) {
      case loyaltyBanner:
        return WidgetTypeEnum.banner;
      case howToConvert:
        return WidgetTypeEnum.howToConvert;
      case tableTitle:
        return WidgetTypeEnum.tableTitle;
      case table:
        return WidgetTypeEnum.table;

      default:
        return WidgetTypeEnum.notAvailable;
    }
  }

  final double stackHeight = 430.sp;
  final double opacityValue = 0.3;
  final double listHeight = 506.sp;
  final double dutyFreeListHeight = 530.sp;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final widgetType = getWidgetType(title);
    switch (widgetType) {
      case WidgetTypeEnum.banner:
        return BannerView(dashBoardItem: dashBoardItem);
      case WidgetTypeEnum.howToConvert:

      case WidgetTypeEnum.tableTitle:
        return BannerTitle(dashBoardItem: dashBoardItem);
      case WidgetTypeEnum.table:
        return TableView(dashBoardItem: dashBoardItem);
      default:
        return Column(
          children: [
            ADSizedBox(
              height: context.k_48,
            ),
            Text(
              dashBoardItem.contentList.first.title,
              style: ADTextStyle700.size20
                  .setTextColor(context.adColors.blackTextColor),
            ),
            ADSizedBox(
              height: context.k_32,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: dashBoardItem.contentList.first.lines.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u25CF',
                      style: ADTextStyle700.size12
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(right: context.k_8, top: context.k_4),
                    Expanded(
                      child: Text(
                        dashBoardItem.contentList.first.lines[index].line,
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.black)
                            .copyWith(height: lineSpacing),
                      ),
                    ),
                  ],
                ).paddingBySide(
                  bottom: context.k_10,
                );
              },
            ).paddingBySide(bottom: context.k_20),
          ],
        );
    }
  }
}

class BannerView extends StatelessWidget {
  final Fields dashBoardItem;

  const BannerView({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      dashBoardItem.widget.widgetItems.first.imageSrc,
      fit: BoxFit.fill,
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}

class BannerTitle extends StatelessWidget {
  final Fields dashBoardItem;

  const BannerTitle({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADSizedBox(
          height: context.k_20,
        ),
        Text(
          dashBoardItem.widget.widgetItems.first.title,
          style: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor)
              .copyWith(height: lineSpacing),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          dashBoardItem.widget.widgetItems.first.description,
          style: ADTextStyle400.size14
              .setTextColor(context.adColors.blackTextColor)
              .copyWith(height: lineSpacing),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
      ],
    );
  }
}

class TableView extends StatelessWidget {
  final Fields dashBoardItem;

  const TableView({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tableList = dashBoardItem.widget.widgetItems.first.tableData;
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(4.2),
        1: FlexColumnWidth(2.9),
        2: FlexColumnWidth(2.9),
      },
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(context.k_6),
        color: const Color(0xffcacaca),
      ),
      children: tableList
          .map(
            (element) => TableRow(
              decoration: const BoxDecoration(
                color: Color(0xfff6f1ff),
              ),
              children: [
                Column(
                  children: [
                    Text(
                      element.rowTitle,
                      style: ADTextStyle700.size14
                          .setTextColor(context.adColors.blackTextColor),
                      textAlign: TextAlign.center,
                    ).paddingBySide(
                      top: context.k_20,
                      bottom: context.k_20,
                    ),
                  ],
                ),
                Column(
                  children: element.column.columnValue
                      .map(
                        (value) => Text(
                          value,
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor)
                              .copyWith(height: lineSpacing),
                        ).paddingAllSide(context.k_20),
                      )
                      .toList(),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
