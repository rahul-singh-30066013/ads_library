/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
// import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
// import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
// import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
// import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
// import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
// import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
// import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
// import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
// import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
// import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
// import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
//
// /// sliderContainerHeight is used for slider Container height
// var sliderContainerHeight = 70.0;
//
// /// leftViewArray used for menu list of left array
// /// To Do
// var _imageAirLineArray = [
//   'indigo.png',
//   'spice-jet.png',
//   'air-asia.png',
//   'vistra.png',
//   'go-first.png',
//   'air-india.png',
// ];
//
// /// This class is used to for create Right View Container
// ///[DutyFreeFilterRightViewContainer] is use for create Right sort, airline and departure view container
// ///[DutyFreeFilterPriceViewContainer] is use for create price view container
//
// class DutyFreeFilterRightViewContainer extends StatelessWidget {
//   const DutyFreeFilterRightViewContainer({
//     Key? key,
//     required this.rightTitleText,
//     required this.isSelected,
//     required this.descriptionText,
//     required this.descriptionVisibility,
//     required this.imageVisibility,
//     required this.index,
//     required this.checkBoxTap,
//   }) : super(key: key);
//   final String rightTitleText;
//   final String descriptionText;
//   final bool descriptionVisibility;
//   final bool imageVisibility;
//   final int index;
//   final bool isSelected;
//   final ADTapCallback checkBoxTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: checkBoxTap,
//         child: Container(
//           alignment: Alignment.centerLeft,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Visibility(
//                           visible: imageVisibility,
//                           child: Image.asset(
//                             'lib/assets/images/common/${_imageAirLineArray.first}',
//                             width: context.k_24,
//                             height: context.k_24,
//                             fit: BoxFit.cover,
//                           ).paddingBySide(right: context.k_12),
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               ///Set value in Left List Sheet
//                               rightTitleText,
//                               textAlign: TextAlign.left,
//                               style: isSelected
//                                   ? ADTextStyle500.size14.setTextColor(
//                                       context.adColors.blackTextColor,
//                                     )
//                                   : ADTextStyle400.size14.setTextColor(
//                                       context.adColors.blackTextColor,
//                                     ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Visibility(
//                         visible: descriptionVisibility,
//                         child: Text(
//                           ///Set value in Left List Sheet
//                           descriptionText,
//                           textAlign: TextAlign.right,
//                           style: ADTextStyle400.size10
//                               .setTextColor(context.adColors.greyTextColor),
//                         ),
//                       ),
//                       Checkbox(
//                         key: Key('${FlightAutomationKeys.checkBox}$index'),
//                         side: const BorderSide(color: Color(0xffb2b2b2)),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(context.k_4),
//                         ),
//                         checkColor: context.adColors.whiteTextColor,
//                         activeColor: context.adColors.black,
//                         value: isSelected,
//                         onChanged: (bool? value) => checkBoxTap(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ).paddingBySide(
//                 left: context.k_16,
//                 top: context.k_8,
//                 bottom: context.k_8,
//               ),
//               Divider(
//                 height: context.scaled(1),
//                 color: context.adColors.dividerColor,
//               ).paddingBySide(
//                 left: context.k_16,
//                 right: context.k_16,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// this class is used for manage for Price View Slider in Price Container View
// /// [DutyFreeFilterPriceViewContainer] class is used for manage for Price View Slider in Price Container View
// class DutyFreeFilterPriceViewContainer extends StatefulWidget {
//   const DutyFreeFilterPriceViewContainer({
//     Key? key,
//     required this.minValue,
//     required this.maxValue,
//     required this.isCheck,
//   }) : super(key: key);
//   final double minValue;
//   final double maxValue;
//   final bool isCheck;
//
//   @override
//   State<DutyFreeFilterPriceViewContainer> createState() =>
//       _DutyFreeFilterPriceViewContainerState();
// }
//
// class _DutyFreeFilterPriceViewContainerState
//     extends State<DutyFreeFilterPriceViewContainer> {
//   double sliderValue = 0;
//
//   bool isOpen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     sliderValue = widget.minValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
//     final sliderVal = FlightUtils.getPriceFormatWithSymbol(
//       price: sliderValue.toDouble().roundToDouble(),
//     );
//     if (!isOpen) {
//       dutyFreeState.priceSelectedValue = dutyFreeState.priceSelectedValueBackup;
//       if (dutyFreeState.priceSelectedValue == 0) {
//         dutyFreeState.priceSelectedValue = dutyFreeState.filterMaxPriceBackup;
//       }
//       isOpen = true;
//     }
//
//     return Container(
//       height: sliderContainerHeight,
//       child: Column(
//         children: [
//           Slider(
//             key: const Key('priceSlider'),
//             min: widget.minValue,
//             max: widget.maxValue,
//             value: dutyFreeState.priceSelectedValue.toDouble(),
//             thumbColor: context.adColors.black,
//             activeColor: context.adColors.black,
//             inactiveColor: context.adColors.greyCircleColor,
//             divisions: widget.maxValue.toInt(),
//             label: sliderVal,
//             onChanged: (double value) => setState(() {
//               sliderValue = value;
//               context.read<DutyFreeState>().filterMaxPrice =
//                   sliderValue.toInt();
//               context.read<DutyFreeState>().priceSelectedValue =
//                   sliderValue.toInt();
//             }),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   FlightUtils.getPriceFormatWithSymbol(
//                     price: widget.minValue.toDouble().roundToDouble(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   FlightUtils.getPriceFormatWithSymbol(
//                     price: widget.maxValue.toDouble().roundToDouble(),
//                   ),
//                   textAlign: TextAlign.right,
//                 ),
//               ),
//             ],
//           ).paddingBySide(left: context.k_22, right: context.k_22),
//         ],
//       ),
//     );
//   }
// }
//
// /// this class use for select Right view containers
// /// [SelectRightView] is used for manage different type of Right View Container
// class SelectRightView extends StatefulWidget {
//   const SelectRightView({Key? key, required this.dutyFreeState})
//       : super(key: key);
//   final DutyFreeState dutyFreeState;
//
//   @override
//   State<SelectRightView> createState() => _SelectRightViewState();
// }
//
// class _SelectRightViewState extends State<SelectRightView> {
//   DutyFreeState? dutyFreeState;
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     dutyFreeState = context.read<DutyFreeState>();
//     _scrollController.addListener(removeFocus);
//   }
//
//   void removeFocus() {
//     FocusManager.instance.primaryFocus?.unfocus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: const Key(FlightAutomationKeys.sortReturn),
//       color: context.adColors.whiteTextColor,
//       child: rightViewListCount(dutyFreeState) == 0
//           ? NoDataFoundErrorScreen(
//               paddingBetweenImageAndErrorTitle: context.k_20,
//               paddingBetweenErrorMessageAndRetry: context.k_30,
//               errorTitle: 'no_data_available'.localize(context),
//             )
//           : Column(
//               children: [
//                 if (widget.dutyFreeState.selectedIndex ==
//                     (dutyFreeState?.dutyFreeFilterBaseResponse?.result
//                             .categories.length ??
//                         0))
//                   SearchView(
//                     onChanged: (value) => searchBrand(
//                       value,
//                       dutyFreeState,
//                     ),
//                     onFieldSubmitted: (value) =>
//                         FocusScope.of(context).unfocus(),
//                     onIconButtonPressed: () => searchBrand(
//                       '',
//                       dutyFreeState,
//                     ),
//                     hintText: 'search_brands'.localize(context),
//                     textInputType: TextInputType.text,
//                   ).paddingAllSide(
//                     context.k_10,
//                   ),
//                 Expanded(
//                   child: Selector<DutyFreeState, int?>(
//                     selector: (context, model) => model
//                         .dutyFreeFilterBaseResponse
//                         ?.searchFilterBrandData
//                         .length,
//                     builder: (context, value, child) {
//                       final bool searchFound = (value ?? 0) > 0;
//                       return searchFound
//                           ? ListView.builder(
//                               controller: _scrollController,
//                               shrinkWrap: true,
//                               itemCount: widget.dutyFreeState.selectedIndex ==
//                                       (dutyFreeState?.dutyFreeFilterBaseResponse
//                                               ?.result.categories.length ??
//                                           0)
//                                   ? value ?? 0
//                                   : (widget.dutyFreeState.selectedIndex <
//                                           (dutyFreeState
//                                                   ?.dutyFreeFilterBaseResponse
//                                                   ?.result
//                                                   .categories
//                                                   .length ??
//                                               0)
//                                       ? dutyFreeState
//                                               ?.dutyFreeFilterBaseResponse
//                                               ?.result
//                                               .categories[widget
//                                                   .dutyFreeState.selectedIndex]
//                                               .filterData
//                                               .length ??
//                                           0
//                                       : 0),
//                               itemBuilder: (BuildContext context, int index) {
//                                 if (widget.dutyFreeState.selectedIndex ==
//                                     (dutyFreeState?.dutyFreeFilterBaseResponse
//                                             ?.result.categories.length ??
//                                         0)) {
//                                   return Selector<DutyFreeState, bool?>(
//                                     selector: (context, catalogListViewModel) =>
//                                         dutyFreeState
//                                             ?.dutyFreeFilterBaseResponse
//                                             ?.result
//                                             .brands
//                                             .filterData[index]
//                                             .filterSelected,
//                                     builder: (
//                                       BuildContext context,
//                                       state,
//                                       Widget? child,
//                                     ) {
//                                       bool isSelected = false;
//                                       final bool isCategoryExist = false;
//
//                                       if (isCategoryExist) {
//                                         final List<String>? list = [];
//                                         isSelected = list?.contains(
//                                               dutyFreeState
//                                                   ?.dutyFreeFilterBaseResponse
//                                                   ?.searchFilterBrandData[index]
//                                                   .code,
//                                             ) ??
//                                             false;
//                                       } else {
//                                         isSelected = false;
//                                       }
//
//                                       return DutyFreeFilterRightViewContainer(
//                                         rightTitleText: dutyFreeState
//                                                 ?.dutyFreeFilterBaseResponse
//                                                 ?.searchFilterBrandData[index]
//                                                 .title ??
//                                             '',
//                                         descriptionVisibility: true,
//                                         imageVisibility: false,
//                                         index: index,
//                                         descriptionText: '',
//                                         isSelected: isSelected,
//                                         checkBoxTap: () => dutyFreeState
//                                             ?.filterClickActionBrandNew(
//                                           index,
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 } else if (widget.dutyFreeState.selectedIndex <
//                                     (dutyFreeState?.dutyFreeFilterBaseResponse
//                                             ?.result.categories.length ??
//                                         0)) {
//                                   return Selector<DutyFreeState, bool?>(
//                                     selector: (context, catalogListViewModel) =>
//                                         dutyFreeState
//                                             ?.dutyFreeFilterBaseResponse
//                                             ?.result
//                                             .categories[widget
//                                                 .dutyFreeState.selectedIndex]
//                                             .filterData[index]
//                                             .filterSelected,
//                                     builder: (
//                                       BuildContext context,
//                                       state,
//                                       Widget? child,
//                                     ) {
//                                       bool isSelected = false;
//                                       final bool isCategoryExist = dutyFreeState
//                                               ?.addedCategoryMap
//                                               .containsKey(
//                                             dutyFreeState
//                                                 ?.dutyFreeFilterBaseResponse
//                                                 ?.result
//                                                 .categories[widget.dutyFreeState
//                                                     .selectedIndex]
//                                                 .filterCode,
//                                           ) ??
//                                           false;
//
//                                       if (isCategoryExist) {
//                                         final List<String>? list =
//                                             dutyFreeState?.addedCategoryMap[
//                                                 dutyFreeState
//                                                     ?.dutyFreeFilterBaseResponse
//                                                     ?.result
//                                                     .categories[widget
//                                                         .dutyFreeState
//                                                         .selectedIndex]
//                                                     .filterCode];
//                                         isSelected = list?.contains(
//                                               dutyFreeState
//                                                   ?.dutyFreeFilterBaseResponse
//                                                   ?.result
//                                                   .categories[widget
//                                                       .dutyFreeState
//                                                       .selectedIndex]
//                                                   .filterData[index]
//                                                   .code,
//                                             ) ??
//                                             false;
//                                       } else {
//                                         isSelected = false;
//                                       }
//
//                                       return DutyFreeFilterRightViewContainer(
//                                         rightTitleText: dutyFreeState
//                                                 ?.dutyFreeFilterBaseResponse
//                                                 ?.result
//                                                 .categories[widget.dutyFreeState
//                                                     .selectedIndex]
//                                                 .filterData[index]
//                                                 .title ??
//                                             '',
//                                         // isSelected: dutyFreeState
//                                         //     .dutyFreeAppliedFilterBaseResponse
//                                         //     ?.result
//                                         //     .categories[widget.dutyFreeState.selectedIndex]
//                                         //     .filterData[index]
//                                         //     .filterSelected ??
//                                         //     false,
//
//                                         isSelected: isSelected,
//                                         descriptionVisibility: true,
//                                         imageVisibility: false,
//                                         index: index,
//                                         descriptionText: '',
//                                         checkBoxTap: () => dutyFreeState
//                                             ?.filterClickActionCategory(
//                                           widget.dutyFreeState.selectedIndex,
//                                           index,
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 } else {
//                                   return const ADSizedBox.shrink();
//                                   // return Align(
//                                   //   alignment: Alignment.topCenter,
//                                   //   child: DutyFreeFilterPriceViewContainer(
//                                   //     key: const Key(FlightAutomationKeys.sortPrice),
//                                   //     isCheck: false,
//                                   //     maxValue: double.parse(
//                                   //       dutyFreeState
//                                   //               .dutyFreeFilterBaseResponse?.result.price.filterData
//                                   //               .singleWhere((element) => element.code == 'maxprice')
//                                   //               .filterValue ??
//                                   //           '0.0',
//                                   //     ),
//                                   //     minValue: double.parse(
//                                   //       dutyFreeState
//                                   //               .dutyFreeFilterBaseResponse?.result.price.filterData
//                                   //               .singleWhere((element) => element.code == 'minprice')
//                                   //               .filterValue ??
//                                   //           '0.0',
//                                   //     ),
//                                   //   ),
//                                   // );
//                                 }
//                               },
//                             )
//                           : NoDataFoundErrorScreen(
//                               paddingBetweenImageAndErrorTitle: context.k_20,
//                               paddingBetweenErrorMessageAndRetry: context.k_30,
//                               errorTitle: 'no_data_available'.localize(context),
//                             ).paddingBySide(bottom: context.k_60);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
//
//   void searchBrand(String value, DutyFreeState? dutyFreeState) {
//     dutyFreeState?.dutyFreeFilterBaseResponse =
//         dutyFreeState.dutyFreeFilterBaseResponse?.copyWith(
//       searchFilterBrandData: value.isNotEmpty
//           ? dutyFreeState.dutyFreeFilterBaseResponse?.result.brands.filterData
//                   .where(
//                     (element) => element.title
//                         .toLowerCase()
//                         .trim()
//                         .contains(value.toLowerCase().trim()),
//                   )
//                   .toList() ??
//               []
//           : dutyFreeState
//                   .dutyFreeFilterBaseResponse?.result.brands.filterData ??
//               [],
//     );
//     dutyFreeState?.notifyListeners();
//     if (_scrollController.hasClients) {
//       _scrollController.animateTo(
//         0,
//         duration: const Duration(milliseconds: 100),
//         curve: Curves.easeIn,
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     dutyFreeState?.dutyFreeFilterBaseResponse =
//         dutyFreeState?.dutyFreeFilterBaseResponse?.copyWith(
//       searchFilterBrandData:
//           dutyFreeState?.dutyFreeFilterBaseResponse?.result.brands.filterData ??
//               [],
//     );
//     _scrollController
//       ..removeListener(removeFocus)
//       ..dispose();
//   }
//
//   int rightViewListCount(DutyFreeState? dutyFreeState) {
//     return widget.dutyFreeState.selectedIndex ==
//             (dutyFreeState
//                     ?.dutyFreeFilterBaseResponse?.result.categories.length ??
//                 0)
//         ? dutyFreeState
//                 ?.dutyFreeFilterBaseResponse?.result.brands.filterData.length ??
//             0
//         : (widget.dutyFreeState.selectedIndex <
//                 (dutyFreeState?.dutyFreeFilterBaseResponse?.result.categories
//                         .length ??
//                     0)
//             ? dutyFreeState
//                     ?.dutyFreeFilterBaseResponse
//                     ?.result
//                     .categories[widget.dutyFreeState.selectedIndex]
//                     .filterData
//                     .length ??
//                 0
//             : 0);
//   }
// }
