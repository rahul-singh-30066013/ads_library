import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/policy_benefits_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/view_of_trip_insurance_cost.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/site_core_insurance_data_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/travel_insurance_field.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class is use for view of insurance
class InsuranceView extends StatefulWidget {
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;

  const InsuranceView({this.flightViewItineraryResponseModel, Key? key})
      : super(key: key);

  @override
  _InsuranceViewState createState() => _InsuranceViewState();
}

class _InsuranceViewState extends State<InsuranceView> {
  final double imageWidth = 93.sp;
  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  final double colourOpacity = 0.2;
  final double processingBarSize = 5.sp;
  final double travelLogoHeight = 48.sp;

  /// it is use for max height of list benefit of max height
  final maxHeightOfList = 60.sp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SiteCoreStateManagement, SiteCoreInsuranceDataResponse>(
      selector: (context, stateClass) =>
          stateClass.insuranceData ?? const SiteCoreInsuranceDataResponse(),
      builder: (BuildContext context, model, Widget? child) {
        final perPaxAmount =
            (widget.flightViewItineraryResponseModel?.insurance?.perPaxAmt ?? 0)
                .toDouble();
        final perPaxDiscountedAmount =
            (widget.flightViewItineraryResponseModel?.insurance?.perPaxDisAmt ??
                    0)
                .toDouble();
        final netPerPaxAmount = perPaxAmount - perPaxDiscountedAmount;
        final travelInsuranceField = model.fields?.travelInsuranceDetails;
        // final parts = model.fields?.disclaimer?.label?.split('__tnc__');
        final parts = travelInsuranceField?.disclaimer?.label?.split('__tnc__');
        return travelInsuranceField != null &&
                (travelInsuranceField.heading?.trim() ?? '').isNotEmpty
            ? Column(
                key: context.read<ReviewFlightDetailsState>().globalKey,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.k_40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/images/flight/travel_logo.png',
                        width: travelLogoHeight,
                        height: travelLogoHeight,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelInsuranceField.heading ?? '',
                            style: ADTextStyle700.size20.setTextColor(
                              context.adColors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                FlightUtils.getPriceFormatWithSymbol(
                                  price: netPerPaxAmount,
                                ),
                                style: ADTextStyle700.size24.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              SizedBox(
                                width: context.k_4,
                              ),
                              if (netPerPaxAmount > 0 &&
                                  netPerPaxAmount != perPaxAmount)
                                Text(
                                  FlightUtils.getPriceFormatWithSymbol(
                                    price:
                                        (widget.flightViewItineraryResponseModel
                                                    ?.insurance?.perPaxAmt ??
                                                0)
                                            .toDouble(),
                                  ),
                                  style: ADTextStyle500.size16
                                      .setTextColor(
                                        const Color(0xff8C8C8C),
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ).paddingBySide(right: context.k_4),
                              Text(
                                'per_traveller'.localize(context),
                                style: ADTextStyle400.size16.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            top: context.k_14,
                          ),
                        ],
                      ).paddingBySide(
                        left: context.k_12,
                        top: context.k_8,
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                  SizedBox(
                    height: context.k_28,
                  ),
                  Selector<ReviewFlightDetailsState, bool?>(
                    selector: (context, stateClass) => stateClass.result,
                    builder:
                        (BuildContext context, resultValue, Widget? child) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => widget.flightViewItineraryResponseModel
                                            ?.insurance?.insured ==
                                        false ||
                                    widget.flightViewItineraryResponseModel
                                            ?.insurance?.insured ==
                                        null
                                ? checkBoxAction(value: true)
                                : null,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.adColors.greyReviewShade,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    context.k_8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: context.k_8,
                                  bottom: context.k_8,
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: VisualDensity.compact,
                                          groupValue: resultValue,
                                          activeColor: context.adColors.black,
                                          value: true,
                                          onChanged: (value) => checkBoxAction(
                                            value: value as bool,
                                          ),
                                        ),
                                        Text(
                                          travelInsuranceField
                                                  .options?.first.label ??
                                              '',
                                          style: !(resultValue ?? false)
                                              ? ADTextStyle400.size16
                                                  .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                              : ADTextStyle500.size16
                                                  .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: context.k_10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(context.k_4),
                                        ),

                                        ///TODO we will set colour
                                        color: const Color(0xffeb9845),
                                      ),
                                      padding: EdgeInsets.all(context.k_4),
                                      child: Text(
                                        travelInsuranceField
                                                .options?.first.tag ??
                                            '',
                                        style: ADTextStyle700.size8

                                            ///TODO we will set colour
                                            .setTextColor(
                                          context.adColors.whiteTextColor,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: context.k_10,
                                    // ),
                                    // Selector<ReviewFlightDetailsState, bool?>(
                                    //   selector: (context, stateClass) =>
                                    //       stateClass.isInsuredLoading,
                                    //   builder: (
                                    //     BuildContext context,
                                    //     value,
                                    //     Widget? child,
                                    //   ) {
                                    //     return value == true
                                    //         ? Container(
                                    //             height: context.k_26,
                                    //             child: ADDotProgressView(
                                    //               color: context.adColors.blackColor,
                                    //               size: processingBarSize,
                                    //             ),
                                    //           )
                                    //         : ADSizedBox(
                                    //             width: context.k_30,
                                    //             height: context.k_26,
                                    //           );
                                    //   },
                                    // ),
                                  ],
                                ).paddingBySide(
                                  left: context.k_8,
                                ),
                              ),
                            ).paddingBySide(
                              left: context.k_16,
                              right: context.k_16,
                            ),
                          ),
                          SizedBox(
                            height: context.k_14,
                          ),
                          InkWell(
                            onTap: () => widget.flightViewItineraryResponseModel
                                            ?.insurance?.insured ==
                                        true ||
                                    widget.flightViewItineraryResponseModel
                                            ?.insurance?.insured ==
                                        null
                                ? checkBoxAction(value: false)
                                : null,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.adColors.greyReviewShade,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    context.k_8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: context.k_8,
                                  bottom: context.k_8,
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      activeColor: context.adColors.black,
                                      value: false,
                                      groupValue: resultValue,
                                      onChanged: (value) =>
                                          checkBoxAction(value: value as bool),
                                    ),
                                    Text(
                                      travelInsuranceField
                                              .options?.last.label ??
                                          '',
                                      style: resultValue ?? false
                                          ? ADTextStyle400.size16.setTextColor(
                                              context.adColors.blackTextColor,
                                            )
                                          : resultValue == null
                                              ? ADTextStyle400.size16
                                                  .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                              : ADTextStyle500.size16
                                                  .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                    ),
                                    // SizedBox(
                                    //   width: context.k_10,
                                    // ),
                                    // Selector<ReviewFlightDetailsState, bool?>(
                                    //   selector: (context, stateClass) =>
                                    //       stateClass.isInsuredFalseLoading,
                                    //   builder:
                                    //       (BuildContext context, value, Widget? child) {
                                    //     return value == true
                                    //         ? Container(
                                    //             height: context.k_26,
                                    //             child: ADDotProgressView(
                                    //               color: context.adColors.blackColor,
                                    //               size: processingBarSize,
                                    //             ),
                                    //           )
                                    //         : const ADSizedBox();
                                    //   },
                                    // ),
                                  ],
                                ).paddingBySide(
                                  left: context.k_8,
                                ),
                              ),
                            ),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_16,
                          ),
                        ],
                      );
                    },
                  ),
                  Selector<ReviewFlightDetailsState, bool?>(
                    selector: (context, stateClass) =>
                        stateClass.errorCodeVisible,
                    builder: (BuildContext context, value, Widget? child) {
                      return Visibility(
                        visible: value == true,
                        child: Container(
                          width: context.widthOfScreen,
                          padding: EdgeInsets.all(context.k_12),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(context.k_4)),

                            ///TODO we will set colour
                            color: const Color(0xfffcf2f2),
                          ),
                          child: Text(
                            travelInsuranceField.error ?? '',
                            style: ADTextStyle700.size12

                                ///TODO we will set colour
                                .setTextColor(const Color(0xffdc464b)),
                          ),
                        ).paddingBySide(
                          right: context.k_16,
                          left: context.k_16,
                          top: context.k_16,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: context.k_30,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeightOfList),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.k_14,
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: context.k_16),
                      itemCount: travelInsuranceField.benefits?.length ?? 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ViewOfTripInsuranceCost(
                              title:
                                  travelInsuranceField.benefits?[index].title ??
                                      '',
                              description: travelInsuranceField
                                      .benefits?[index].description ??
                                  '',
                              icon: travelInsuranceField
                                      .benefits?[index].iconUrl ??
                                  '',
                            ),
                            if (index ==
                                (travelInsuranceField.benefits?.length ?? 0) -
                                    1)
                              Material(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(context.k_8),
                                ),
                                color: context.adColors.containerGreyBg,
                                child: InkWell(
                                  onTap: () => adShowBottomSheet(
                                    context: context,
                                    headerTitle: '',
                                    childWidget: PolicyBenefitsView(
                                      data: travelInsuranceField.breakups ?? [],
                                      info: travelInsuranceField.info,
                                      insuranceProvider: travelInsuranceField
                                              .info?.placeholder?.tncApp ??
                                          '',
                                      brandLogo:
                                          travelInsuranceField.brandLogo ?? '',
                                      discountedAmount: netPerPaxAmount,
                                      modelTitle:
                                          travelInsuranceField.modelTitle,
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      right: context.k_19,
                                      left: context.k_10,
                                    ),
                                    height: context.k_60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(context.k_8),
                                      ),

                                      // border: Border.all(
                                      //   color: context.adColors.greyReviewShade,
                                      // ),

                                      ///TODO we will set colour
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          SvgAssets.moreBenefit,
                                          width: context.k_18,
                                          height: context.k_18,

                                          ///TODO we will set colour
                                          color: const Color(0xff666666),
                                        ),
                                        Text(
                                          'more_benefit'.localize(context),
                                          style: ADTextStyle500.size14
                                              .setTextColor(
                                            context.adColors.black,
                                          ),
                                        ).paddingBySide(
                                          left: context.k_10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).paddingBySide(
                                left: context.k_14,
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.k_30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: parts != null && parts.isNotEmpty
                                    ? parts.first
                                    : '',
                                style: ADTextStyle400.size12.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              TextSpan(
                                text: travelInsuranceField
                                    .disclaimer?.placeholder?.tnc,
                                style: ADTextStyle400.size12
                                    .setTextColor(
                                      context.adColors.black,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => _openPdf(travelInsuranceField),
                              ),
                              TextSpan(
                                text: parts != null && parts.length > 1
                                    ? parts[1]
                                    : '',
                                style: ADTextStyle400.size12.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// this icon is use for brand logo
                      Image.network(
                        travelInsuranceField.brandLogo ?? '',
                        width: imageWidth,
                        height: context.k_32,
                      ).paddingBySide(
                        left: context.k_4,
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                  SizedBox(
                    height: context.k_40,
                  ),
                  Divider(
                    height: context.k_8,
                    thickness: context.k_8,
                    color: context.adColors.containerGreyBg,
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  Future<void> _openPdf(TravelInsuranceField? travelInsuranceField) async {
    if (!(await FlightUtils.openPdf(
      travelInsuranceField?.disclaimer?.placeholder?.tncLink ?? '',
    ))) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: WebViewModel(
          title: 'terms_and_condition'.localize(
            context,
          ),
          url: travelInsuranceField?.disclaimer?.placeholder?.tncLink ?? '',
        ),
      );
    }
  }

  /// this is use for check uncheck button of insurance
  void checkBoxAction({required bool value}) {
    context.read<ReviewFlightDetailsState>().setValueForVisibilityForStrip(
          value: false,
        );
    context.read<ReviewFlightDetailsState>().viewItineraryDetails(
          context
                  .read<ReviewFlightDetailsState>()
                  .flightItineraryResponseModel
                  ?.itineraryId ??
              '',
          context.read<FlightCommonState>().reviewedUserID ?? '',
          requiredInsurance: true,
          isInsured: value,
        );
  }
}
