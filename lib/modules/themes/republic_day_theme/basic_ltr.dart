import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/themes/republic_day_theme/drop_cap.dart';
import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const double dropSize = 10;
const double clearMinSpacing = 20;
const double maxWidthPercentage = 0.33;
const double clearMinSpacing2 = 220;
const double maxWidthPercentage2 = 0.25;
const color = 0xff9C5318;

class BasicLtr extends StatelessWidget {
  const BasicLtr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scale =
        (((MediaQuery.of(context).size.width / 600.0) - 1.0) * 0.6) + 1.0;

    return DefaultTextStyle(
      style: const TextStyle(fontSize: 18, color: Colors.black, height: 1.5),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FloatColumn(
            children: [
              Text.rich(_text(scale), textScaleFactor: scale),
            ],
          ),
        ),
      ),
    );
  }
}

class Img extends StatelessWidget {
  final String imageUrl;

  // final String? title;

  const Img({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: Image.network(imageUrl),
        ),
      ],
    );
  }
}

final textStyle = ADTextStyle400.size18
    .setTextColor(const Color(color))
    .copyWith(height: 1.7);

// cspell: disable

TextSpan _text(double textScaleFactor) => TextSpan(
      children: [
        TextSpan(
          text:
              "A constitution is not just a document of law to govern a nation. Its framework defines the country's way of life. It upholds the ideals of a nation. Its beliefs and ideas.",
          style: textStyle,
        ),
        WidgetSpan(
          child: Floatable(
            float: FCFloat.start,
            child: DropCap(
              text: '',
              size: dropSize,
              textScaleFactor: textScaleFactor,
            ),
          ),
        ),
        WidgetSpan(
          child: Floatable(
            float: FCFloat.end,
            clear: FCClear.both,
            maxWidthPercentage: maxWidthPercentage,
            padding: const EdgeInsetsDirectional.only(start: 15),
            child: Img(
              imageUrl:
                  '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/assets/republic_1.jpg',
            ),
          ),
        ),
        WidgetSpan(
          child: Floatable(
            float: FCFloat.start,
            clear: FCClear.start,
            clearMinSpacing: clearMinSpacing2,
            maxWidthPercentage: maxWidthPercentage2 / textScaleFactor,
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Img(
              imageUrl:
                  '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/assets/republic_2.jpg',
            ),
          ),
        ),
        WidgetSpan(
          child: Floatable(
            float: FCFloat.end,
            clear: FCClear.both,
            clearMinSpacing: clearMinSpacing,
            maxWidthPercentage: maxWidthPercentage,
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: Img(
              imageUrl:
                  '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/assets/republic_3.jpg',
            ),
          ),
        ),
        TextSpan(
          text:
              '\n\nOn 26th January 1950, the Indian Constitution came into effect. And the Dominion of India became the Republic of India. The constitution declares India a sovereign, socialist, secular, and democratic republic. It is a document of empowerment for every citizen of the nation. Defining, and over the years redefining, the ever-evolving needs of the country and its people.',
          style: textStyle,
        ),
        TextSpan(
          text:
              "\n\n\nRepublic Day is celebrated with great pomp at the Kartavya Path in New Delhi in the presence of the heads of state. March past and fly past by the Indian Armed Forces with clockwork precision, elaborately designed state tableaus and a show of the nation's firepower is on display.",
          style: textStyle,
        ),
        TextSpan(
          text:
              '\n\n So, on the auspicious occasion of the 74th Republic Day of India let us salute our great nation and all its brave martyrs. Let their inspiration drive us to achieve greater goals for the country and take India to greater heights with each passing day. Jai Hind!',
          style: textStyle,
        ),
      ],
    );
