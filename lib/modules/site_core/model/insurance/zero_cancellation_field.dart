import 'package:flutter/cupertino.dart';

@immutable
class ZeroCancellationField {
  final String? amountLabel;
  final String? icon;
  final String? zeroCancellationHeading;
  final String? error;
  final String? tnCLabel;
  final String? tnCLabelLink;
  final String? disclaimer;
  final Description? description;
  final ModelBox? modelBox;
  const ZeroCancellationField({
    this.amountLabel,
    this.icon,
    this.zeroCancellationHeading,
    this.error,
    this.tnCLabel,
    this.tnCLabelLink,
    this.disclaimer,
    this.description,
    this.modelBox,
  });

  factory ZeroCancellationField.fromJson(Map<String, dynamic> json) =>
      ZeroCancellationField(
        amountLabel: json['amountLabel'] as String?,
        icon: json['icon'] as String?,
        zeroCancellationHeading: json['zeroCancellationHeading'] as String?,
        error: json['error'] as String?,
        tnCLabel: json['tnCLabel'] as String?,
        tnCLabelLink: json['tnCLabelLink'] as String?,
        disclaimer: json['disclaimer'] as String?,
        description: json['description'] == null
            ? null
            : Description.fromJson(json['description'] as Map<String, dynamic>),
        modelBox: json['modelBox'] == null
            ? null
            : ModelBox.fromJson(json['modelBox'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'amountLabel': amountLabel,
        'icon': icon,
        'zeroCancellationHeading': zeroCancellationHeading,
        'error': error,
        'tnCLabel': tnCLabel,
        'tnCLabelLink': tnCLabelLink,
        'description': description?.toJson(),
        'disclaimer': disclaimer,
        'modelBox': modelBox?.toJson(),
      };

  ZeroCancellationField copyWith({
    final String? amountLabel,
    final String? icon,
    final String? zeroCancellationHeading,
    final String? error,
    final String? tnCLabel,
    final String? tnCLabelLink,
    final Description? description,
    final String? disclaimer,
    final ModelBox? modelBox,
  }) {
    return ZeroCancellationField(
      amountLabel: amountLabel ?? this.amountLabel,
      icon: icon ?? this.icon,
      zeroCancellationHeading:
          zeroCancellationHeading ?? this.zeroCancellationHeading,
      error: error ?? this.error,
      tnCLabel: tnCLabel ?? this.tnCLabel,
      disclaimer: disclaimer ?? this.disclaimer,
      description: description ?? this.description,
      modelBox: modelBox ?? this.modelBox,
      tnCLabelLink: tnCLabelLink ?? this.tnCLabelLink,
    );
  }
}

class Description {
  final String? label;
  final String? labelText;
  final PlaceHolder? placeholder;

  const Description({this.label, this.labelText, this.placeholder});

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        label: json['label'] as String?,
        labelText: json['labelText'] as String?,
        placeholder: json['placeholder'] == null
            ? null
            : PlaceHolder.fromJson(json['placeholder'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tnc': label,
        'labelText': labelText,
        'placeholder': placeholder?.toJson(),
      };

  Description copyWith({
    String? label,
    final String? labelText,
    final PlaceHolder? placeholder,
  }) {
    return Description(
      label: label ?? this.label,
      labelText: labelText ?? this.labelText,
      placeholder: placeholder ?? this.placeholder,
    );
  }
}

@immutable
class ModelBox {
  final String? additionalBenefit;
  final String? heading;
  final WithZeroBreakup? withZeroBreakup;
  final WithZeroBreakup? withoutZeroBreakup;
  final PleaseNote? pleaseNote;
  final PleaseNote? cancellationProcess;

  const ModelBox({
    this.additionalBenefit,
    this.heading,
    this.withZeroBreakup,
    this.withoutZeroBreakup,
    this.pleaseNote,
    this.cancellationProcess,
  });

  factory ModelBox.fromJson(Map<String, dynamic> json) => ModelBox(
        additionalBenefit: json['additionalBenefit'] as String?,
        heading: json['heading'] as String?,
        withZeroBreakup: json['withZeroBreakup'] != null
            ? WithZeroBreakup.fromJson(json['withZeroBreakup'])
            : null,
        withoutZeroBreakup: json['withoutZeroBreakup'] != null
            ? WithZeroBreakup.fromJson(json['withoutZeroBreakup'])
            : null,
        pleaseNote: json['pleaseNote'] != null
            ? PleaseNote.fromJson(json['pleaseNote'])
            : null,
        cancellationProcess: json['cancellationProcess'] != null
            ? PleaseNote.fromJson(json['cancellationProcess'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'additionalBenefit': additionalBenefit,
        'heading': heading,
        'withZeroBreakup': withZeroBreakup?.toJson(),
        'withoutZeroBreakup': withoutZeroBreakup?.toJson(),
        'pleaseNote': pleaseNote?.toJson(),
        'cancellationProcess': cancellationProcess?.toJson(),
      };

  ModelBox copyWith({
    String? additionalBenefit,
    String? heading,
    final WithZeroBreakup? withZeroBreakup,
    final WithZeroBreakup? withoutZeroBreakup,
    final PleaseNote? pleaseNote,
    final PleaseNote? cancellationProcess,
  }) {
    return ModelBox(
      additionalBenefit: additionalBenefit ?? this.additionalBenefit,
      heading: heading ?? this.heading,
      withZeroBreakup: withZeroBreakup ?? this.withZeroBreakup,
      withoutZeroBreakup: withoutZeroBreakup ?? this.withoutZeroBreakup,
      pleaseNote: pleaseNote ?? this.pleaseNote,
      cancellationProcess: cancellationProcess ?? this.cancellationProcess,
    );
  }
}

@immutable
class PlaceHolder {
  final String? tnc;
  final String? tncLink;
  final String? amount;
  final String? tncApp;
  final String? howToWork;
  final String? howToWorkLink;
  final String? vendor;
  final String? vendorLink;

  const PlaceHolder({
    this.tnc,
    this.tncLink,
    this.amount,
    this.tncApp,
    this.howToWork,
    this.howToWorkLink,
    this.vendor,
    this.vendorLink,
  });

  factory PlaceHolder.fromJson(Map<String, dynamic> json) => PlaceHolder(
        tnc: json['tnc'] as String?,
        tncLink: json['tncLink'] as String?,
        amount: json['amount'] as String?,
        tncApp: json['tncApp'] as String?,
        howToWork: json['howToWork'] as String?,
        howToWorkLink: json['howToWorkLink'] as String?,
        vendor: json['vendor'] as String?,
        vendorLink: json['vendorLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tnc': tnc,
        'tncLink': tncLink,
        'amount': amount,
        'tncApp': tncApp,
        'howToWork': howToWork,
        'howToWorkLink': howToWorkLink,
        'vendor': vendor,
        'vendorLink': vendorLink,
      };

  PlaceHolder copyWith({
    String? tnc,
    final String? tncLink,
    final String? amount,
    final String? tncApp,
    final String? howToWork,
    final String? howToWorkLink,
    final String? vendor,
    final String? vendorLink,
  }) {
    return PlaceHolder(
      tnc: tnc ?? this.tnc,
      tncLink: tncLink ?? this.tncLink,
      amount: amount ?? this.amount,
      tncApp: tncApp ?? this.tncApp,
      howToWork: howToWork ?? this.howToWork,
      howToWorkLink: howToWorkLink ?? this.howToWorkLink,
      vendor: vendor ?? this.vendor,
      vendorLink: vendorLink ?? this.vendorLink,
    );
  }
}

@immutable
class WithZeroBreakup {
  final String? heading;
  final String? icon;
  final List<Breakup>? breakup;

  const WithZeroBreakup({this.heading, this.icon, this.breakup});

  factory WithZeroBreakup.fromJson(Map<String, dynamic> json) =>
      WithZeroBreakup(
        heading: json['heading'] as String?,
        icon: json['icon'] as String?,
        breakup: (json['breakup'] as List<dynamic>?)
            ?.map((e) => Breakup.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'icon': icon,
        'breakup': breakup?.map((e) => e.toJson()).toList(),
      };
}

@immutable
class Breakup {
  final String? label;
  final String? code;
  final String? hint;
  const Breakup({
    this.label,
    this.code,
    this.hint,
  });

  factory Breakup.fromJson(Map<String, dynamic> json) => Breakup(
        label: json['label'] as String?,
        code: json['code'] as String?,
        hint: json['hint'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'code': code,
        'hint': hint,
      };
}

@immutable
class PleaseNote {
  final String? heading;
  final List<Description>? notes;

  const PleaseNote({this.heading, this.notes});

  factory PleaseNote.fromJson(Map<String, dynamic> json) => PleaseNote(
        heading: json['heading'] as String?,
        notes: (json['notes'] as List<dynamic>?)
            ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'notes': notes?.map((e) => e.toJson()).toList(),
      };
}
