
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_porter_quantity_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_porter_quantity_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SelectPorterQuantityWidgetView extends WidgetView<
    SelectPorterQuantityScreen,SelectPorterQuantityController> {

  const SelectPorterQuantityWidgetView(
      SelectPorterQuantityController state, {
        Key? key,
      }) : super(
    state,
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    final double confirmButtonWidth = 172.sp;
    final double confirmButtonHeight = 52.sp;
    final double circleWidthHeight = 50.sp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // One porter can carry
        if(widget.subtitleText!=null) Text(
          widget.subtitleText ?? '',
          style: ADTextStyle400.size14.copyWith(color: context.adColors.greyTextColor),
        ).paddingBySide(left: context.k_20,bottom: context.k_10),
        ValueListenableBuilder(
          valueListenable: widget.selectedIndexNotifier,
          builder: (_, value, __) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  widget.startFromZero ?widget.itemCounts + 1 :widget.itemCounts,
                      (index) => InkWell(
                    borderRadius:
                    BorderRadius.all(Radius.circular(circleWidthHeight)),
                        onTap: () => {
                      // widget.adGenericCallback(index+1),
                      widget.selectedIndexNotifier.value =
                          widget.startFromZero ? index : index + 1,
                    },
                    child: Container(
                      height: circleWidthHeight,
                      width: circleWidthHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ((widget.startFromZero
                                      ? widget.selectedIndexNotifier.value
                                      : widget.selectedIndexNotifier.value -
                                          1) ==
                                  index)
                              ? context.adColors.blackColor
                              : context.adColors.addButtonBorderColor,
                          width: ((widget.startFromZero
                                      ? widget.selectedIndexNotifier.value
                                      : widget.selectedIndexNotifier.value -
                                          1) ==
                                  index)
                              ? context.k_2
                              : 1,
                        ),
                      ),
                      //padding: EdgeInsets.all(context.k_4),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            widget.startFromZero?'$index':'${index + 1}',
                            style: ((widget.selectedIndexNotifier.value - 1) ==
                                index)
                                ? ADTextStyle700.size18.setTextColor(
                              context.adColors.blackTextColor,
                            )
                                : ADTextStyle500.size18.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).paddingBySide(
                    left: index == 0 ? context.k_16 : context.k_8,
                    right: index == (widget.startFromZero?widget.itemCounts:widget.itemCounts - 1) ? context.k_16 : 0,
                  ),
                ),
              ).paddingBySide(top: context.k_10),
            );
            //   ListView.builder(itemBuilder: (context,index){
            //   return InkWell(
            //     borderRadius: const BorderRadius.all(Radius.circular(60)),
            //     onTap: ()=>{
            //       // widget.adGenericCallback(index+1),
            //       widget.selectedIndexNotifier.value = index+1,
            //     },
            //     child: Container(
            //       height: context.k_60,
            //       width: context.k_60,
            //       decoration:  BoxDecoration(
            //         shape: BoxShape.circle,
            //           border: Border.all(
            //             color: ((widget.selectedIndexNotifier.value - 1) ==
            //                     index)
            //                 ? context.adColors.blackColor
            //                 : context.adColors.addButtonBorderColor,
            //             width: context.k_2,),
            //         ),
            //       padding: EdgeInsets.all(context.k_16),
            //       child: Center(child: Text('${index+1}',
            //           style:((widget.selectedIndexNotifier.value - 1) ==
            //               index) ?
            //           ADTextStyle700.size18.setTextColor(
            //         context.adColors.blackTextColor,
            //       ):ADTextStyle500.size18.setTextColor(
            //             context.adColors.blackTextColor,
            //           ),),),
            //     ).paddingBySide(left: context.k_16,),
            //   );
            // },itemCount: widget.itemCounts,
            // scrollDirection: Axis.horizontal,shrinkWrap: true,);
          },
        ),
        SizedBox(
          height: context.k_30,
        ),
        Center(
          child: ADSizedBox(
            width: confirmButtonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), backgroundColor: context.adColors.blackTextColor,
                minimumSize: Size(
                  confirmButtonWidth,
                  confirmButtonHeight,
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: context.k_20,
                  vertical: context.k_16,
                ),
              ),
              onPressed: () =>
                  widget.adGenericCallback(widget.selectedIndexNotifier.value),
              child: Text(
                'done'.localize(context),
                style: ADTextStyle700.size16.setTextColor(
                  context.adColors.whiteTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}