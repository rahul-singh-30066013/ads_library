/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as important_information;
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ImportantInformation extends StatelessWidget {
  const ImportantInformation({Key? key, required this.infoList})
      : super(key: key);
  final List<important_information.ContentList> infoList;

  @override
  Widget build(BuildContext context) {
    const diviConst = 2;
    return infoList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoList.first.title == ''
                    ? 'importantInformation'.localize(context)
                    : infoList.first.title,
                style: ADTextStyle700.size22.copyWith(
                  color: context.adColors.black,
                ),
                textAlign: TextAlign.left,
              ).paddingBySide(bottom: context.k_20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: infoList.first.lines.length,
                itemBuilder: (context, index) {
                  final line = infoList.first.lines[index].line;
                  final lineText = line.split(r'$');
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: context.k_6,
                          right: context.k_12,
                        ),
                        width: context.k_6,
                        height: context.k_6,
                        decoration: BoxDecoration(
                          color: context.adColors.darkGreyTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              for (int len = 0; len < lineText.length; len++)
                                TextSpan(
                                  text: '${lineText[len]} ',
                                  style: ADTextStyle400.size16
                                      .setTextColor(
                                        context.adColors.blackTextColor,
                                      )
                                      .copyWith(
                                        decoration: len % diviConst == 1
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      if (len % diviConst == 1) {
                                        openWebView(
                                          title: 'importantInformation'
                                              .localize(context),
                                          url: getUrlFromLineText(
                                            lineText[len],
                                            index,
                                          ),
                                          context: context,
                                        );
                                      }
                                    },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).paddingBySide(bottom: context.k_20);
                },
              ),
            ],
          ).paddingBySide(left: context.k_20, right: context.k_20)
        : const ADSizedBox();
  }

  String getUrlFromLineText(
    String findText,
    int index,
  ) {
    var link = '';
    link = infoList.first.lines[index].links
        .firstWhere((element) => element.linkText == findText)
        .linkURL;
    return '$link?isapp=true';
  }
}
