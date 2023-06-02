import 'dart:io';

import 'package:adani_airport_mobile/modules/currency_exchange/currency_exchange_bank_builder.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/currency_exchange_bottom_view.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/state_management/currency_exchange_state_management.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/flexible_space_app_bar.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_dashboard_shimmer_widget.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CurrencyExchangeDetailScreen extends StatefulWidget {
  const CurrencyExchangeDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrencyExchangeDetailScreen> createState() =>
      _CurrencyExchangeDetailScreenState();
}

class _CurrencyExchangeDetailScreenState
    extends State<CurrencyExchangeDetailScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final CurrencyExchangeStateManagement _dashBoardViewModel =
      CurrencyExchangeStateManagement();
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();

  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 90.sp;
  final percentageOfScrollScreen = 65.sp;
  final double k_25 = 0.2.sp;
  final double stackHeight = 430.sp;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    dynamicTitle.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _dashBoardViewModel.fetchCurrencyExchangeBank();
    super.initState();
  }

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;

    dynamicTitle.value =
        percentageOfScroll <= percentageOfScrollScreen ? 'Induslnd Bank' : '';
  }

  void scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: expandedHeight.toInt()),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                key: globalKey,
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                  SliverAppBar(
                    pinned: true,
                    title: AnimatedBuilder(
                      animation: Listenable.merge([dynamicTitle]),
                      builder: (BuildContext context, _) => Text(
                        dynamicTitle.value,
                        style: ADTextStyle700.size22,
                        maxLines: 1,
                      ).paddingBySide(left: context.k_10),
                    ),
                    leadingWidth:
                        Platform.isIOS ? leadingWidth_42 : context.k_38,
                    leading:
                        const BackButton().paddingBySide(left: context.k_10),
                    expandedHeight: expandedHeight,
                    flexibleSpace: FlexibleSpaceAppBar(
                      context,
                      title: 'Induslnd Bank',
                      flexibleSpaceBar: expandedHeight,
                      paddingLeft: context.k_20,
                    ),
                  ),
                ],
                body:
                    ADSelectorStateLessWidget<CurrencyExchangeStateManagement>(
                  key: const Key('DashBoard'),
                  viewModel: _dashBoardViewModel,
                  child: Selector<CurrencyExchangeStateManagement,
                      ADResponseState>(
                    selector: (context, viewModel) =>
                        viewModel.currencyExchangeBankSiteCoreState,
                    builder: (context, value, Widget? child) {
                      switch (value.viewStatus) {
                        case Status.loading:
                          return Center(
                            child: OfferDashboardShimmerWidget(),
                          );
                        case Status.error:
                          return Center(child: Text(value.message.toString()));
                        case Status.complete:
                          final List<Elements> response =
                              value.data as List<Elements>;
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: response.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String title =
                                  response[index].fields.widget.widgetType;
                              return CurrencyExchangeBankBuilder(
                                dashBoardItem: response[index].fields,
                                title: title,
                              );
                            },
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CurrencyExchangeBottomView(),
            ),
          ],
        ),
      ),
    );
  }
}
