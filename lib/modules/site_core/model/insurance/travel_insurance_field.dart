import 'package:flutter/cupertino.dart';

@immutable
class TravelInsuranceField {
  final String? modelTitle;
  final String? brandLogo;
  final String? heading;
  final String? error;
  final String? travelLogo;
  final Disclaimer? disclaimer;
  final Info? info;
  final List<Benefits>? benefits;
  final List<Breakups>? breakups;
  final List<Options>? options;
  const TravelInsuranceField({
    this.modelTitle,
    this.brandLogo,
    this.heading,
    this.error,
    this.travelLogo,
    this.disclaimer,
    this.info,
    this.benefits,
    this.breakups,
    this.options,
  });

  factory TravelInsuranceField.fromJson(Map<String, dynamic> json) =>
      TravelInsuranceField(
        modelTitle: json['modelTitle'] as String?,
        brandLogo: json['brandLogo'] as String?,
        heading: json['heading'] as String?,
        error: json['error'] as String?,
        travelLogo: json['travelLogo'] as String?,
        disclaimer: json['disclaimer'] == null
            ? null
            : Disclaimer.fromJson(json['disclaimer'] as Map<String, dynamic>),
        info: json['info'] == null
            ? null
            : Info.fromJson(json['info'] as Map<String, dynamic>),
        benefits: (json['benefits'] as List<dynamic>?)
            ?.map((e) => Benefits.fromJson(e as Map<String, dynamic>))
            .toList(),
        breakups: (json['breakups'] as List<dynamic>?)
            ?.map((e) => Breakups.fromJson(e as Map<String, dynamic>))
            .toList(),
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'modelTitle': modelTitle,
        'brandLogo': brandLogo,
        'heading': heading,
        'error': error,
        'travelLogo': travelLogo,
        'disclaimer': disclaimer?.toJson(),
        'info': info?.toJson(),
        'benefits': benefits?.map((e) => e.toJson()).toList(),
        'breakups': breakups?.map((e) => e.toJson()).toList(),
        'options': options?.map((e) => e.toJson()).toList(),
      };

  TravelInsuranceField copyWith({
    final String? modelTitle,
    final String? brandLogo,
    final String? heading,
    final String? error,
    final String? travelLogo,
    final Disclaimer? disclaimer,
    final Info? info,
    final List<Benefits>? benefits,
    final List<Breakups>? breakups,
    final List<Options>? options,
  }) {
    return TravelInsuranceField(
      modelTitle: modelTitle ?? this.modelTitle,
      brandLogo: brandLogo ?? this.brandLogo,
      heading: heading ?? this.heading,
      error: error ?? this.error,
      travelLogo: travelLogo ?? this.travelLogo,
      disclaimer: disclaimer ?? this.disclaimer,
      info: info ?? this.info,
      benefits: benefits ?? this.benefits,
      breakups: breakups ?? this.breakups,
      options: options ?? this.options,
    );
  }
}

class Disclaimer {
  final String? label;
  final PlaceHolder? placeholder;

  const Disclaimer({this.label, this.placeholder});

  factory Disclaimer.fromJson(Map<String, dynamic> json) => Disclaimer(
        label: json['label'] as String?,
        placeholder: json['placeholder'] == null
            ? null
            : PlaceHolder.fromJson(json['placeholder'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tnc': label,
        'placeholder': placeholder?.toJson(),
      };

  Disclaimer copyWith({
    String? label,
    final PlaceHolder? placeholder,
  }) {
    return Disclaimer(
      label: label ?? this.label,
      placeholder: placeholder ?? this.placeholder,
    );
  }
}

@immutable
class Info {
  final String? label;
  final PlaceHolder? placeholder;

  const Info({this.label, this.placeholder});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        label: json['label'] as String?,
        placeholder: json['placeholder'] == null
            ? null
            : PlaceHolder.fromJson(json['placeholder'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tnc': label,
        'placeholder': placeholder?.toJson(),
      };

  Info copyWith({
    String? label,
    final PlaceHolder? placeholder,
  }) {
    return Info(
      label: label ?? this.label,
      placeholder: placeholder ?? this.placeholder,
    );
  }
}

@immutable
class PlaceHolder {
  final String? tnc;
  final String? tncLink;
  final String? amount;
  final String? tncApp;

  const PlaceHolder({
    this.tnc,
    this.tncLink,
    this.amount,
    this.tncApp,
  });

  factory PlaceHolder.fromJson(Map<String, dynamic> json) => PlaceHolder(
        tnc: json['tnc'] as String?,
        tncLink: json['tncLink'] as String?,
        amount: json['amount'] as String?,
        tncApp: json['tncApp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tnc': tnc,
        'tncLink': tncLink,
        'amount': amount,
        'tncApp': tncApp,
      };

  PlaceHolder copyWith({
    String? tnc,
    final String? tncLink,
    final String? amount,
    final String? tncApp,
  }) {
    return PlaceHolder(
      tnc: tnc ?? this.tnc,
      tncLink: tncLink ?? this.tncLink,
      amount: amount ?? this.amount,
      tncApp: tncApp ?? this.tncApp,
    );
  }
}

@immutable
class Benefits {
  final String? icon;
  final String? description;
  final String? title;
  final String? iconUrl;
  const Benefits({
    this.icon,
    this.description,
    this.title,
    this.iconUrl,
  });

  factory Benefits.fromJson(Map<String, dynamic> json) => Benefits(
        icon: json['icon'] as String?,
        description: json['description'] as String?,
        title: json['title'] as String?,
        iconUrl: json['iconUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'description': description,
        'title': title,
        'iconUrl': iconUrl,
      };

  Benefits copyWith({
    String? icon,
    final String? description,
    final String? title,
    final String? iconUrl,
  }) {
    return Benefits(
      icon: icon ?? this.icon,
      description: description ?? this.description,
      title: title ?? this.title,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }
}

@immutable
class Breakups {
  final String? amount;
  final String? label;
  const Breakups({
    this.amount,
    this.label,
  });

  factory Breakups.fromJson(Map<String, dynamic> json) => Breakups(
        amount: json['amount'] as String?,
        label: json['label'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'label': label,
      };

  Breakups copyWith({
    String? amount,
    final String? label,
  }) {
    return Breakups(
      amount: amount ?? this.amount,
      label: label ?? this.label,
    );
  }
}

@immutable
class Options {
  final String? id;
  final String? tag;
  final String? label;
  const Options({
    this.id,
    this.tag,
    this.label,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        id: json['id'] as String?,
        tag: json['tag'] as String?,
        label: json['label'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tag': tag,
        'label': label,
      };

  Options copyWith({
    String? id,
    final String? tag,
    final String? label,
  }) {
    return Options(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      label: label ?? this.label,
    );
  }
}
