/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as sit_core_masters;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This class is for creating list of services in bottom sheet.
class ServiceListScreen extends StatefulWidget {
  ///This class is for creating list of services in bottom sheet.
  const ServiceListScreen({
    Key? key,
    required this.callback,
    required this.selectedTitle,
  }) : super(key: key);

  final ADGenericCallback callback;
  final String selectedTitle;

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();
  List<sit_core_masters.BookingStatus> serviceList = [];

  @override
  void initState() {
    super.initState();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    serviceList = _siteCoreStateManagement.serviceType;
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: serviceList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onItemClick(serviceList, context, index),
          child: Container(
            color: serviceList[index].label == widget.selectedTitle
                ? context.adColors.lightBlue
                : context.adColors.transparentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceList[index].label,
                  style: serviceList[index].label == widget.selectedTitle
                      ? ADTextStyle600.size16
                          .setTextColor(context.adColors.blackTextColor)
                      : ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                ),
                Icon(
                  serviceList[index].label == widget.selectedTitle
                      ? Icons.check
                      : null,
                  size: context.k_22,
                  color: context.adColors.filterBlackText,
                ),
              ],
            ).paddingBySide(
              top: context.k_14,
              bottom: context.k_14,
              right: context.k_16,
              left: context.k_16,
            ),
          ),
        );
      },
    );
  }

  ///need to implement click in listener
  void onItemClick(
    List<sit_core_masters.BookingStatus> serviceList,
    BuildContext context,
    int serviceIndex,
  ) {
    widget.callback(
      ServiceModel(
        serviceId: int.parse(serviceList[serviceIndex].id),
        serviceTitle: serviceList[serviceIndex].label,
      ),
    );
    navigatorPopScreen(context);
  }
}
