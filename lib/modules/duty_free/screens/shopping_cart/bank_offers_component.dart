import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/show_available_offers.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class BankOffersComponent extends StatefulWidget {
  const BankOffersComponent({Key? key}) : super(key: key);

  @override
  State<BankOffersComponent> createState() => _BankOffersComponentState();
}

class _BankOffersComponentState extends State<BankOffersComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final value = super.build(context);
    adLog('value $value');
    return FutureBuilder(
      future: context.read<DutyFreeState>().getAllOffers(
        context,
            airportCode: context
                    .read<DutyFreeState>()
                    .dutyFreeCartResponse
                    ?.airportCode ??
                '',
          ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ADShimmerWidget.shimmerShape(
                    height: context.k_26,
                    type: ShimmerType.squareBox,
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ADShimmerWidget.shimmerShape(
                    height: context.k_56,
                    type: ShimmerType.squareBox,
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                top: context.k_16,
                right: context.k_16,
              )
            : snapshot.data != null
                ? ShowAvailableOffers(
                    offerList: snapshot.data,
                  ).paddingBySide(
                    left: context.k_16,
                    top: context.k_16,
                    right: context.k_16,
                  )
                : const ADSizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
