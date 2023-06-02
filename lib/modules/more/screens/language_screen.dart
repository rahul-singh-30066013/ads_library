/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/modules/more/models/language_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is used to choose a language for the application.
/// By default English language is selected.
/// User can choose any language from the list of given languages.
/// So far we have options only for 2 languages- English and Hindi

var selectedLanguageCode = '';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS
                ? Icons.arrow_back_ios_outlined
                : Icons.arrow_back_outlined,
          ),
          onPressed: () => navigatorPopScreen(context),
        ),
        title: Text(
          'languagePageTitle'.localize(context),
          style: ADTextStyle500.size22,
        ),
      ),
      body: Consumer<AppModelStateManagement>(
        builder: (context, model, child) {
          return BuildLanguagesList(
            model: model,
            languageList: model.languageList ?? [],
          );
        },
      ),
    );
  }
}

class BuildLanguagesList extends StatelessWidget {
  const BuildLanguagesList({
    Key? key,
    required this.model,
    required this.languageList,
  }) : super(key: key);

  final AppModelStateManagement model;
  final List<LanguageOptions> languageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: languageList.length,
            itemBuilder: (listContext, index) {
              return BuildLanguageItem(
                model: model,
                language: languageList[index],
                currentIndex: index,
                languageList: languageList,
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(context.k_16),
          child: ElevatedButton(
            child: SizedBox(
              width: context.widthOfScreen,
              height: context.k_40,
              child: Center(
                child: Text(
                  'continue'.localize(context),
                ),
              ),
            ),
            onPressed: () => onTapped(context),
          ),
        ),
      ],
    );
  }

  void onTapped(BuildContext context) {
    navigatorPopScreen(context);
  }
}

class BuildLanguageItem extends StatelessWidget {
  const BuildLanguageItem({
    Key? key,
    required this.model,
    required this.language,
    required this.currentIndex,
    required this.languageList,
  }) : super(key: key);

  final AppModelStateManagement model;
  final LanguageOptions language;
  final int currentIndex;
  final List<LanguageOptions> languageList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTapHandler(),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: language.languageTextEnglish.isEmpty
                          ? context.k_30
                          : context.k_20,
                    ),
                  ),
                  Text(
                    language.languageTextOriginal,
                    style: ADTextStyle600.size20,
                  ),
                  Text(
                    language.languageTextEnglish,
                    style: ADTextStyle400.size18
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                ],
              ),
              GetIcon(
                language: language,
                currentLanguage: model.retrievedLanguage,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.k_8,
            ),
            child: Divider(
              thickness: context.k_2,
            ),
          ),
        ],
      ),
    );
  }

  void onTapHandler() {
    model.updateSelectedLanguage(
      jsonEncode(languageList[currentIndex]),
      language.languageCode,
    );
  }
}

class GetIcon extends StatelessWidget {
  const GetIcon({
    Key? key,
    required this.language,
    required this.currentLanguage,
  }) : super(key: key);
  final LanguageOptions language;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return currentLanguage == language.languageCode
        ? Icon(
            Icons.check_circle_rounded,
            color: context.adColors.blueCardColor,
            size: context.k_28,
          )
        : Container();
  }
}
