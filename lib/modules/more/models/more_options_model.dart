/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';

class MoreOptionsModel {
  List<MoreOptionsItemModel>? moreOptions;

  MoreOptionsModel({
    this.moreOptions,
  });

  factory MoreOptionsModel.predefinedValue({
    required bool isLoyalityActive,
    required bool isLoggedIn,
  }) {
    adLog(isLoyalityActive.toString());
    return MoreOptionsModel(
      moreOptions: [
        if (isLoggedIn)
          MoreOptionsItemModel(
            title: 'hello_user',
            type: MoreOptionsItemType.profile,
            subTitle: ProfileSingleton.profileSingleton.userID,
          ),
        if (!isLoggedIn)
          MoreOptionsItemModel(
            title: 'hello_user',
            type: MoreOptionsItemType.profile,
            subTitle: 'log_in',
            icon: 'lib/assets/images/common/adani.png',
          ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.orderAndBooking,
          title: 'orders_and_bookings',
          type: MoreOptionsItemType.main,
          subTitle: 'check_your_order_booking_status',
          icon: SvgAssets.bottomBarMyOrder,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.offersAndDiscount,
          title: 'offers_and_discounts',
          type: MoreOptionsItemType.main,
          subTitle: 'recharge_bill_payments_cashback_vouchers_others',
          icon: SvgAssets.offers,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.adaniRewards,
          title: 'adani_rewards',
          type: MoreOptionsItemType.loyalty,
          subTitle: 'an_experience_that_is_truly_rewarding',
          icon: SvgAssets.adaniLoyalty,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.currencyExchange,
          title: 'convert_reward_points',
          type: MoreOptionsItemType.main,
          subTitle: 'convert_reward_points_description',
          icon: SvgAssets.adaniLoyalty,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.savedFlights,
          title: 'saved_flights',
          type: MoreOptionsItemType.main,
          subTitle: 'get_latest_updates',
          icon: SvgAssets.addSavedFlights,
        ),

        // if (Environment.instance.configuration.appFlavor != AppFlavor.prod)
        //   MoreOptionsItemModel(
        //     actionType: MoreOptionsActionType.train,
        //     title: 'train_booking',
        //     type: MoreOptionsItemType.main,
        //     subTitle: 'train_booking',
        //     icon: 'lib/assets/images/svg/icons/train.svg',
        //   ),
        if (AppConstantRemote().appConstantRemoteModel?.isReferAndEarnEnabled ??
            false)
          MoreOptionsItemModel(
            actionType: MoreOptionsActionType.referAndEarn,
            title: 'refer_and_earn',
            type: MoreOptionsItemType.main,
            subTitle: 'you_get_rs_for_every_friend',
            icon: SvgAssets.referAndEarn,
          ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.helpAndSupport,
          title: 'help_and_support',
          type: MoreOptionsItemType.main,
          subTitle: 'customer_support_your_queries_faqs',
          icon: SvgAssets.help,
        ),
        //TODO comment as of now as its increases constructor lines by 5 derfault is 80, will change later : Chetan

        // MoreOptionsItemModel(
        //   title: 'Help & Support',
        //   type: MoreOptionsItemType.main,
        //   subTitle: 'Customer Support, Your Queries, F.A.Q’s',
        //   icon: 'lib/assets/images/svg/icons/more/HelpSupportCopy.svg',
        // ),
        // if (isLoyalityActive)
        //   MoreOptionsItemModel(
        //     title: 'Adani Loyalty',
        //     type: MoreOptionsItemType.main,
        //     subTitle: 'Redeem rewards using Adani coins',
        //     icon: 'lib/assets/images/svg/icons/more/adani_loyalty_copy.svg',
        //   ),

        // if (isLoggedIn)
        //   MoreOptionsItemModel(
        //     title: 'Profile Settings',
        //     type: MoreOptionsItemType.main,
        //     subTitle:
        //         'Profile, Addresses, Security & Privacy, Notification Language',
        //     icon: 'lib/assets/images/svg/icons/more/ProfileSettingCopy.svg',
        //   ),
        // MoreOptionsItemModel(
        //   title: 'Refer & Earn',
        //   type: MoreOptionsItemType.main,
        //   subTitle: 'You get ₹100 for every friend',
        //   icon: 'lib/assets/images/svg/icons/more/Profile Setting Copy.svg',
        // ),
        MoreOptionsItemModel(
          type: MoreOptionsItemType.otherHeader,
          title: 'others',
        ),
        // MoreOptionsItemModel(
        //   title: 'Business',
        //   type: MoreOptionsItemType.other,
        //   icon: 'lib/assets/images/svg/icons/more/business.svg',
        // ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.rateUs,
          title: 'rate_us',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.rateUs,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.faqs,
          title: 'faqs',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.faqs,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.sendFeedBack,
          title: 'send_feedback',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.feedback,
        ),

        /// this is use for chat with uno
        if (AppConstantRemote().appConstantRemoteModel?.isChatBotEnabled ??
            false)
          MoreOptionsItemModel(
            actionType: MoreOptionsActionType.chatWithUno,
            title: 'chat_with_uno',
            type: MoreOptionsItemType.other,
            icon: SvgAssets.chatSupport,
          ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.termsAndCondition,
          title: 'terms_and_condition',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.termsAndConditions,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.privacyPolicy,
          title: 'privacyPolicy',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.privacyPolicy,
        ),
        MoreOptionsItemModel(
          actionType: MoreOptionsActionType.share,
          title: 'share',
          type: MoreOptionsItemType.other,
          icon: SvgAssets.share,
        ),
        if (isLoggedIn &&
            Platform.isIOS &&
            (AppConstantRemote()
                    .appConstantRemoteModel
                    ?.deleteAccountRequired ??
                false))
          MoreOptionsItemModel(
            actionType: MoreOptionsActionType.deleteAccount,
            title: 'settings',
            type: MoreOptionsItemType.other,
            icon: SvgAssets.settingsIcon,
          ),
        if (isLoggedIn)
          MoreOptionsItemModel(
            actionType: MoreOptionsActionType.logout,
            title: 'logout',
            type: MoreOptionsItemType.other,
            icon: SvgAssets.logout,
          ),
        MoreOptionsItemModel(
          title: 'version',
          type: MoreOptionsItemType.version,
          icon: 'lib/assets/gif/lottie/adani_one_experience_goodness_new.svg',
        ),
      ],
    );
  }
}

enum MoreOptionsItemType {
  profile,
  main,
  loyalty,
  otherHeader,
  other,
  version,
  language,
}

class MoreOptionsItemModel {
  MoreOptionsActionType? actionType;
  String? icon;
  String? deeplink;
  String title;
  String? subTitle;
  MoreOptionsItemType type;
  bool? isActive;

  MoreOptionsItemModel({
    this.actionType,
    this.icon,
    this.deeplink,
    required this.title,
    this.subTitle,
    required this.type,
    this.isActive = true,
  });
}

enum MoreOptionsActionType {
  orderAndBooking,
  savedFlights,
  helpAndSupport,
  adaniRewards,
  offersAndDiscount,
  referAndEarn,
  rateUs,
  faqs,
  //TODO Need to remove
  train,
  sendFeedBack,
  termsAndCondition,
  privacyPolicy,
  share,
  logout,
  chatWithUno,
  deleteAccount,
  currencyExchange,
}
