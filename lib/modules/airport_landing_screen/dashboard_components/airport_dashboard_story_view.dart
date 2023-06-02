/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/story_view_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AirportDashboardStoryView extends StatelessWidget {
  final DutyFreeDashboardItem dashboardItem;
  final List<Story> stories = <Story>[
    /*const Story(
      url:
          'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg',
      mediaType: MediaType.image,
      duration: 5,
    ),
    */ /*const Story(
      url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      mediaType: MediaType.video,
      duration: 5,
    ),*/ /*
    const Story(
      url:
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
      mediaType: MediaType.image,
      duration: 5,
    ),
    const Story(
      url: 'https://picsum.photos/200/300?random=4',
      mediaType: MediaType.image,
      duration: 5,
    ),*/
  ];

  AirportDashboardStoryView({
    Key? key,
    required this.dashboardItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = context.widthOfScreen;
    const five = 5;
    for (final DutyFreeItem item in dashboardItem.widgetItems ?? []) {
      stories.add(
        Story(
          url: item.imageSrc,
          mediaType: MediaType.image,
          duration: five,
        ),
      );
    }

    return ADSizedBox(
      width: itemWidth,
      height: itemWidth * (dashboardItem.aspectRatio ?? 1.0),
      child: StoryViewScreen(
        key: const Key(
          'story_view',
        ),
        maxHeight: itemWidth * (dashboardItem.aspectRatio ?? 1.0),
        stories: stories,
        barFillColor: context.adColors.whiteTextColor,
        barColor: context.adColors.lightGreyTextColor,
      ),
    );
  }
}
