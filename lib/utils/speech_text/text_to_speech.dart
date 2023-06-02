import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_age_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/speech_text/avatar_glow.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double height = 320;

class TextToSpeech extends StatefulWidget {
  final bool openBottomSheet;
  final List<DutyFreeItem> servicesResult;
  final ADTapCallbackWithValue? onTapHandler;

  const TextToSpeech({
    Key? key,
    this.openBottomSheet = false,
    required this.servicesResult,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';
  final double endRadius = 65;
  bool _speechEnabled = true;
  Timer? myTimer;
  Timer? redirectionTimer;
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    _speechToText.stop();
    myTimer?.cancel();
    super.dispose();
  }

  /// This has to happen only once per app
  Future<void> _initSpeech() async {
    await _speechToText.initialize().then((value) => _startListening());
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    final result = await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: Platform.isIOS ? const Duration(seconds: 5) : null,
    );
    myTimer = Timer(
      const Duration(seconds: 5),
      () => {
        setState(() {
          _speechEnabled = false;
        }),
      },
    );
    adLog('$result');
  }

  bool findMatch(String s, List<String> strings) {
    return strings.any((element) => s.contains(element));
  }

  bool firstMatch(String s, String element) {
    return s.contains(element);
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      myTimer?.cancel();
    });

    String _speechText = _lastWords.toLowerCase();
    DutyFreeItem? item;
    if (_speechText.isNotEmpty) {
      if (redirectionTimer?.isActive ?? false) {
        redirectionTimer?.cancel();
      }
      if (_speechText.toLowerCase().contains('pranam')) {
        _speechText = 'pranaam';
      }

      redirectionTimer = Timer(
        const Duration(milliseconds: 600),
        () => {
          for (var element in widget.servicesResult)
            if (_speechText.toLowerCase() == element.title.toLowerCase())
              {
                item = element,
              },
          widget.servicesResult.firstWhere(
            (element) {
              return firstMatch(
                _speechText.toLowerCase(),
                element.title.toLowerCase().split(' ').first,
              );
            },
          ),
          if (item == null)
            {
              item = widget.servicesResult.firstWhere(
                (element) {
                  final firstWord = element.title.toLowerCase().split(' ');
                  return _speechText
                          .toLowerCase()
                          .contains(element.title.toLowerCase()) ||
                      element.title
                          .toLowerCase()
                          .contains(_speechText.toLowerCase()) ||
                      findMatch(_speechText.toLowerCase(), firstWord);
                },
              ),
            },
          if (item != null)
            {
              if (item?.uniqueId == '2')
                {
                  ageConfirmation(
                    context,
                    openFromBottomSheet: widget.openBottomSheet,
                  ),
                }
              else
                {
                  Navigator.pop(context),
                  widget.onTapHandler?.call(item),
                },
            },
        },
      );
    }
  }

  void ageConfirmation(
    BuildContext context, {
    bool openFromBottomSheet = false,
  }) {
    if (!context.read<DutyFreeState>().ageAbove25) {
      if ((selectedAirportsData?.dutyFreeAgeLimit ?? 0) > 0) {
        openAgeDialog(context, openFromBottomSheet: openFromBottomSheet);
      } else {
        navigateToDutyFreeScreen(
          context,
          openFromBottomSheet: openFromBottomSheet,
        );
      }
    } else {
      navigateToDutyFreeScreen(
        context,
        openFromBottomSheet: openFromBottomSheet,
      );
    }
  }

  void openAgeDialog(
    BuildContext context, {
    bool openFromBottomSheet = false,
  }) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return DutyFreeAgeConfirmation(
          detailString: 'age_confirmation_message'.localize(context).replaceAll(
                '#1',
                (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
              ),
          titleString: 'age_confirmation'.localize(context),
          yesCallBack: () => openDutyFreeScreen(
            context,
            dialogContext,
            isAgeAbove25: true,
            openFromBottomSheet: openFromBottomSheet,
          ),
          noCallBack: () => openDutyFreeScreen(
            context,
            dialogContext,
            isAgeAbove25: false,
            openFromBottomSheet: openFromBottomSheet,
          ),
        );
      },
    );
    adLog('$bottomSheet');
  }

  /// Function to pop dialog and push duty free screen
  void openDutyFreeScreen(
    BuildContext context,
    BuildContext dialogContext, {
    required bool isAgeAbove25,
    bool openFromBottomSheet = false,
  }) {
    context.read<DutyFreeState>().ageAbove25 = isAgeAbove25;
    context
        .read<DutyFreeState>()
        .dutyFreeEventState
        .ageConfirmationEvent(isAgeAbove: isAgeAbove25);
    navigatorPopScreen(dialogContext);
    navigateToDutyFreeScreen(context, openFromBottomSheet: openFromBottomSheet);
  }

  void navigateToDutyFreeScreen(
    BuildContext context, {
    bool openFromBottomSheet = false,
  }) {
    if (openFromBottomSheet) {
      navigatorPopScreen(context);
    }
    navigatorPopScreen(context);
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    final GlobalKey<NavigatorState> navigatorState =
        HomeBottomAssets.homeBottomPages.keys.toList()[1];
    BottomBarState.currentIndex = 1;
    customTabScaffold.controller?.index = 1;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigatorState.currentState
          ?.pushNamedAndRemoveUntil(
            dutyFreeScreen,
            (route) => route.isFirst,
          )
          .then((value) => adLog(value?.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ), //this right here
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Google',
              style: ADTextStyle500.size24.setTextColor(
                context.adColors.blackColor,
              ),
            ).paddingBySide(
              top: context.k_16,
            ),
            if (_speechEnabled)
              Column(
                children: [
                  AvatarGlow(
                    glowColor: Colors.blue,
                    endRadius: endRadius,
                    animate: _lastWords.isEmpty || _speechToText.isListening,
                    child: FloatingActionButton(
                      child: Icon(
                        (_lastWords.isEmpty || _speechToText.isListening)
                            ? Icons.mic
                            : Icons.mic_off,
                      ),
                      onPressed: () => {
                        setState(() {
                          _lastWords = '';
                          _speechEnabled = true;
                          _startListening();
                        }),
                      },
                    ),
                  ),
                  Text(
                    _lastWords.isNotEmpty ? _lastWords : 'Speak Now',
                    style: ADTextStyle400.size18.setTextColor(
                      context.adColors.blackShade500,
                    ),
                  ).paddingBySide(
                    left: context.k_8,
                    right: context.k_8,
                  ),
                ],
              ),
            if (!_speechEnabled)
              Column(
                children: [
                  InkWell(
                    onTap: () => {
                      setState(() {
                        _lastWords = '';
                        _speechEnabled = true;
                        _startListening();
                      }),
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: context.k_64,
                      height: context.k_64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: context.k_6,
                        ),
                      ),
                      child: const Icon(
                        Icons.mic,
                      ),
                    ),
                  ),
                  Text(
                    'Didn’t catch that. Try speaking\nagain.',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ).paddingBySide(top: context.k_20),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  InkWell(
                    onTap: () => {
                      setState(() {
                        _lastWords = '';
                        _speechEnabled = true;
                        _startListening();
                      }),
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(color: context.adColors.blue),
                        color: context.adColors.whiteTextColor,
                      ),
                      child: Text(
                        'Try again',
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            Text(
              'English (United States)',
              style: ADTextStyle400.size12.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(
              top: context.k_16,
              bottom: context.k_16,
            ),
          ],
        ),
      ),
    ).paddingAllSide(
      context.k_16,
    );
  }
}
