/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/more/models/customer_feedback/feedback_form_layout_models/feedback_form_layout_model_element.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for showing view for Airport Authorities Contact information
final double fifteenFontSize = 15.sp;
final double twoThirtySize = 230.sp;

class AuthoritiesContactInformation extends StatefulWidget {
  final AirportDetails? airportDetail;

  const AuthoritiesContactInformation({
    Key? key,
    required this.airportDetail,
  }) : super(key: key);

  @override
  State<AuthoritiesContactInformation> createState() =>
      _AuthoritiesContactInformationState();
}

class _AuthoritiesContactInformationState
    extends State<AuthoritiesContactInformation> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.airportDetail?.authoritiesContacts?.isNotEmpty ?? false)
          Container(
            width: context.widthOfScreen,
            color: context.adColors.lightBlue,
            padding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
              top: context.k_30,
              bottom: context.k_30,
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final List<String> contactsNumbers = widget
                        .airportDetail?.authoritiesContacts?[index].mobile
                        ?.split('|') ??
                    [];
                final List<String> emails = widget
                        .airportDetail?.authoritiesContacts?[index].email
                        ?.split('|') ??
                    [];
                return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: context.adColors.whiteTextColor,
                    borderRadius: BorderRadius.circular(
                      context.k_4,
                    ),
                  ),
                  width: context.widthOfScreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.airportDetail?.authoritiesContacts?[index]
                              .title?.isNotEmpty ??
                          false)
                        Text(
                          widget.airportDetail?.authoritiesContacts?[index]
                                  .title ??
                              '',
                          style: ADTextStyle700.size20.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                      if (widget.airportDetail?.authoritiesContacts?[index].name
                              ?.isNotEmpty ??
                          false)
                        Text(
                          widget.airportDetail?.authoritiesContacts?[index]
                                  .name ??
                              '',
                          style: ADTextStyle400.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ).paddingBySide(top: context.k_4),
                      if (widget.airportDetail?.authoritiesContacts?[index]
                              .mobile?.isNotEmpty ??
                          false)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.adColors.paleGrey,
                                ),
                              ),
                              width: context.k_48,
                              height: context.k_48,
                              padding: EdgeInsets.all(
                                context.k_14,
                              ),
                              child: SvgPicture.asset(
                                SvgAssets.dutyFreeCall,
                                color: context.adColors.greyTextColor,
                              ),
                            ),
                            ADSizedBox(
                              width: context.k_12,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'call_us'.localize(context),
                                          style: ADTextStyle400.size14
                                              .setTextColor(
                                                context.adColors.blackTextColor,
                                              )
                                              .copyWith(
                                                fontSize: fifteenFontSize,
                                              ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_6,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '',
                                                  children: List.generate(
                                                    contactsNumbers.length,
                                                    (index) => TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: contactsNumbers[
                                                              index],
                                                          style: ADTextStyle500
                                                              .size16
                                                              .setTextColor(
                                                                context.adColors
                                                                    .blackTextColor,
                                                              )
                                                              .copyWith(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontSize:
                                                                    fifteenFontSize,
                                                              ),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  Utils
                                                                      .redirectToPhoneEmail(
                                                                    contactsNumbers[
                                                                        index],
                                                                  );
                                                                },
                                                        ),
                                                        if (contactsNumbers
                                                                    .length >
                                                                1 &&
                                                            index !=
                                                                contactsNumbers
                                                                        .length -
                                                                    1)
                                                          TextSpan(
                                                            text: ' , ',
                                                            style: ADTextStyle500
                                                                .size16
                                                                .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .greyTextColor,
                                                                )
                                                                .copyWith(
                                                                  fontSize:
                                                                      fifteenFontSize,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).paddingBySide(top: context.k_30),
                      if (widget.airportDetail?.authoritiesContacts?[index]
                              .email?.isNotEmpty ??
                          false)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.adColors.paleGrey,
                                ),
                              ),
                              width: context.k_48,
                              height: context.k_48,
                              padding: EdgeInsets.all(
                                context.k_14,
                              ),
                              child: SvgPicture.asset(
                                SvgAssets.dutyFreeMail,
                                color: context.adColors.greyTextColor,
                              ),
                            ),
                            ADSizedBox(
                              width: context.k_12,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'email_us'.localize(context),
                                          style: ADTextStyle400.size14
                                              .setTextColor(
                                                context.adColors.blackTextColor,
                                              )
                                              .copyWith(
                                                fontSize: fifteenFontSize,
                                              ),
                                        ),
                                        ADSizedBox(
                                          height: context.k_6,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '',
                                                  children: List.generate(
                                                    emails.length,
                                                    (index) => TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: emails[index],
                                                          style: ADTextStyle500
                                                              .size16
                                                              .setTextColor(
                                                                context.adColors
                                                                    .blackTextColor,
                                                              )
                                                              .copyWith(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontSize:
                                                                    fifteenFontSize,
                                                              ),
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  Utils
                                                                      .redirectToPhoneEmail(
                                                                    emails[
                                                                        index],
                                                                  );
                                                                },
                                                        ),
                                                        if (emails.length > 1 &&
                                                            index !=
                                                                emails.length -
                                                                    1)
                                                          TextSpan(
                                                            text: ' , ',
                                                            style: ADTextStyle500
                                                                .size16
                                                                .setTextColor(
                                                                  context
                                                                      .adColors
                                                                      .greyTextColor,
                                                                )
                                                                .copyWith(
                                                                  fontSize:
                                                                      fifteenFontSize,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).paddingBySide(top: context.k_20),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_30,
                    bottom: context.k_30,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => ADSizedBox(
                height: context.k_20,
              ),
              itemCount: widget.airportDetail?.authoritiesContacts?.length ?? 0,
            ),
          ).paddingBySide(
            top: context.k_48,
          ),
        if (widget.airportDetail?.terminalContentMain?.isNotEmpty ?? false)
          Column(
            children: [
              if (widget.airportDetail?.terminalContentTitle?.isNotEmpty ??
                  false)
                Text(
                  widget.airportDetail?.terminalContentTitle ?? '',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              if (widget.airportDetail?.terminalContentMain?.isNotEmpty ??
                  false)
                Text(
                  widget.airportDetail?.terminalContentMain ?? '',
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ).paddingBySide(top: context.k_20),
            ],
          ).paddingBySide(
            top: context.k_48,
            left: context.k_16,
            right: context.k_16,
          ),
        if (widget.airportDetail?.terminalDetails?.isNotEmpty ?? false)
          DefaultTabController(
            length: widget.airportDetail?.terminalDetails?.length ?? 01,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  isScrollable: true,
                  tabs: widget.airportDetail?.terminalDetails
                          ?.map(
                            (e) => Tab(
                              text: e.terminalName,
                            ),
                          )
                          .toList() ??
                      [],
                  unselectedLabelStyle: ADTextStyle400.size16.copyWith(
                    color: context.adColors.greyTextColor,
                  ),
                  labelStyle: ADTextStyle500.size16.copyWith(
                    color: context.adColors.blackTextColor,
                  ),
                  indicatorColor: context.adColors.blackTextColor,
                  onTap: (index) => {
                    _selectedIndex.value = index,
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.adColors.dividerColor,
                ).paddingBySide(bottom: context.k_12),
              ],
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_48,
          ),
        if (widget.airportDetail?.terminalDetails?.isNotEmpty ?? false)
          ValueListenableBuilder(
            valueListenable: _selectedIndex,
            child: Container(),
            builder: (context, int index, child) {
              return TerminalContactDetail(
                terminalDetails: widget.airportDetail?.terminalDetails?[index],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              );
            },
          ),
        ImageWithTextFaq(airportDetail: widget.airportDetail).paddingBySide(
          top: context.k_48,
        ),
      ],
    );
  }
}

class TerminalContactDetail extends StatelessWidget {
  const TerminalContactDetail({
    Key? key,
    required this.terminalDetails,
  }) : super(key: key);
  final TerminalDetails? terminalDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.k_16,
        right: context.k_16,
        top: context.k_30,
        bottom: context.k_30,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.adColors.paleGrey,
        ),
        borderRadius: BorderRadius.circular(
          context.k_8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (terminalDetails?.contactList?.isNotEmpty ?? false)
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ContactDetailView(
                  contactList: terminalDetails?.contactList?[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => ADSizedBox(
                height: context.k_24,
              ),
              itemCount: terminalDetails?.contactList?.length ?? 0,
            ),
          if (terminalDetails?.immigration?.isNotEmpty ?? false)
            Container(
              height: 1,
              color: context.adColors.dividerColor,
            ).paddingBySide(
              top: context.k_30,
              bottom: context.k_30,
            ),
          if (terminalDetails?.immigration?.isNotEmpty ?? false)
            Text(
              terminalDetails?.immigrationTitle ?? '',
              style: ADTextStyle700.size18.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(bottom: context.k_20),
          if (terminalDetails?.immigration?.isNotEmpty ?? false)
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ContactDetailView(
                  contactList: terminalDetails?.immigration?[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => ADSizedBox(
                height: context.k_24,
              ),
              itemCount: terminalDetails?.immigration?.length ?? 0,
            ),
          if (terminalDetails?.ministryCivil?.isNotEmpty ?? false)
            Container(
              height: 1,
              color: context.adColors.dividerColor,
            ).paddingBySide(
              top: context.k_30,
              bottom: context.k_30,
            ),
          if (terminalDetails?.ministryCivil?.isNotEmpty ?? false)
            Text(
              terminalDetails?.ministryCivilTitle ?? '',
              style: ADTextStyle700.size18.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(bottom: context.k_20),
          if (terminalDetails?.ministryCivil?.isNotEmpty ?? false)
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ContactDetailView(
                  contactList: terminalDetails?.ministryCivil?[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => ADSizedBox(
                height: context.k_24,
              ),
              itemCount: terminalDetails?.ministryCivil?.length ?? 0,
            ),
        ],
      ),
    );
  }
}

class ContactDetailView extends StatelessWidget {
  const ContactDetailView({
    Key? key,
    required this.contactList,
  }) : super(key: key);
  final ContactList? contactList;

  @override
  Widget build(BuildContext context) {
    final List<String> contacts =
        contactList?.departureContactNo?.split('|') ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactList?.terminalContactName ?? '',
          style: ADTextStyle600.size16
              .setTextColor(
                context.adColors.blackTextColor,
              )
              .copyWith(fontSize: fifteenFontSize),
        ),
        ADSizedBox(
          height: context.k_6,
        ),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: RichText(
                text: TextSpan(
                  text: '',
                  children: List.generate(
                    contacts.length,
                    (index) => TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: contacts[index],
                          style: ADTextStyle400.size16
                              .setTextColor(
                                context.adColors.blackTextColor,
                              )
                              .copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: fifteenFontSize,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Utils.redirectToPhoneEmail(
                                contacts[index],
                              );
                            },
                        ),
                        if (contacts.length > 1 && index != contacts.length - 1)
                          TextSpan(
                            text: ' , ',
                            style: ADTextStyle400.size16
                                .setTextColor(
                                  context.adColors.greyTextColor,
                                )
                                .copyWith(
                                  fontSize: fifteenFontSize,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ImageWithTextFaq extends StatelessWidget {
  const ImageWithTextFaq({
    Key? key,
    required this.airportDetail,
  }) : super(key: key);
  final AirportDetails? airportDetail;

  @override
  Widget build(BuildContext context) {
    const lineHeight = 1.4;

    return TouchableOpacity(
      onTap: () => {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          webViewContainer,
          argumentObject: WebViewModel(
            title: 'faqs'.localize(context),
            url: (airportDetail?.faqLink?.contains('isapp=true') ?? false)
                ? airportDetail?.faqLink ?? ''
                : '${airportDetail?.faqLink}?isapp=true',
          ),
        ),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.k_4),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: airportDetail?.faqImage ?? '',
              filterQuality: FilterQuality.high,
              width: context.widthOfScreen,
              placeholder: (context, url) => Image.memory(
                kTransparentImage,
                fit: BoxFit.cover,
                height: twoThirtySize,
                width: context.widthOfScreen,
              ),
              errorWidget: (context, url, error) => Container(
                color: context.adColors.cardBgColor,
                alignment: Alignment.center,
                child: const SizedBox(),
              ),
            ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                airportDetail?.faqTitle ?? '',
                style: ADTextStyle700.size18.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
              ADSizedBox(height: context.k_10),
              Text(
                airportDetail?.faqContent ?? '',
                style: ADTextStyle400.size16.copyWith(
                  height: lineHeight,
                  color: context.adColors.blackTextColor,
                ),
              ),
              ADSizedBox(height: context.k_10),
              Text(
                airportDetail?.faqLinkText ?? '',
                style: ADTextStyle400.size16.copyWith(
                  color: context.adColors.blackTextColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
      ),
    );
  }
}
