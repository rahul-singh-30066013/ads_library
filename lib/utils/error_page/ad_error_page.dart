import 'package:adani_airport_mobile/constants/assets/gif_assets.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

/// * [errorIcon] is used to show the an image in the center of this page
/// although there is a default icon will show in the case the developer will not pass.
/// * [button] is used to show the a button on this page, as you will pass here,
/// although there is a default button with 'Retry' text will show in the case the developer will not pass.
/// * [message] is used to show a error message on this page,
/// although there is a default message with 'Oops! Somethings went wrong...'
/// text will show in the case the developer will not pass.
/// if you are using the default button you can manage the click of this button by using
/// * [onPress], although there is no use of this method when you are passing your own button.
/// if you are using the default button you can change button by using
/// * [buttonText], although there is no use of this method when you are passing your own button.

class ADErrorPage extends StatelessWidget {
  final Widget? errorIcon;
  final Widget? button;
  final String? buttonText;
  final String? message;
  final Function()? onPress;

  ///use this constructor when you want to use default retry button,
  /// and you can manage you click action by using onPress method.

  const ADErrorPage(
      {Key? key,
      this.errorIcon,
      this.message,
      this.onPress,
      this.buttonText,
      this.button,})
      : super(key: key);

  ///use this constructor when you want to pass your own button.

  const ADErrorPage.customButton(
      {Key? key,
      this.errorIcon,
      this.message,
      this.button,
      this.buttonText,
      this.onPress,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = context.widthOfScreen * 0.6;
    return Container(
      color: ADColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          errorIcon ??
              Image.asset(
                GifAssets.noResultFound,
                width: contentWidth,
              ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              message.validateWithDefaultValue(
                  defaultValue: 'Oops! Somethings went wrong...',),
              textAlign: TextAlign.center,
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          button?? _DefaultButton(textString: buttonText,onPress: onPress,),
        ],
      ),
    );
  }

}

class _DefaultButton extends StatelessWidget {
  final String? textString;
  final Function()? onPress;
  const _DefaultButton({this.textString,this.onPress,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      key: const Key('Retry'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),
        side: MaterialStateProperty.all(const BorderSide(
          color: Colors.blue,
        ),),
      ),
      label: Text(textString.validateWithDefaultValue(defaultValue: 'Retry')),
      icon: const Icon(Icons.refresh),
      onPressed: ()=> callback(),
    );
  }
  void callback(){
    if (onPress == null) {
      return;
    }
    final value=onPress?.call();
    adLog(value);
  }
}

