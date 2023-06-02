import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandAloneGaName {
  final StandAloneServiceType _currentServiceType;
  StandAloneGaName(BuildContext context)
      : _currentServiceType =
            context.read<StandAloneStateManagement>().currentServiceType;
  ClickEvents bookNowName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_select;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_select;
    }
  }

  ClickEvents popUpDisplayName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.popup_display;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.popup_display;
    }
  }

  ClickEvents removeCartName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.porter_cart_clean;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.porter_cart_clean;
    }
  }

  ClickEvents bookServiceUnavailableName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_service_unavailable;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_service_unavailable;
    }
  }

  ClickEvents addGuestDetailName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_add_guest_detail;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_add_guest_detail;
    }
  }

  ClickEvents paymentSubmitName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_payment_submit;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_payment_submit;
    }
  }

  ClickEvents paymentRetryName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_payment_retry;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_payment_retry;
    }
  }

  ClickEvents paymentFailName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_payment_fail;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_payment_fail;
    }
  }

  ClickEvents paymentSuccessName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_payment_success;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_payment_success;
    }
  }

  ClickEvents bookSuccessName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_success;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_success;
    }
  }

  ClickEvents bookFailName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_fail;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_fail;
    }
  }

  ClickEvents paymentFailTryOtherName() {
    switch (_currentServiceType) {
      case StandAloneServiceType.porter:
        return ClickEvents.book_porter_payment_try_other;
      // case StandAloneServiceType.wheelchair:
      //   break;
      default:
        return ClickEvents.book_porter_payment_try_other;
    }
  }
}
