/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/form_input_traveller.dart';
import 'package:flutter/material.dart';

/// this is use for create form for run time
class FormBuilderTravellerDetails {
  List<TextFieldObject>? formData;

  FormBuilderTravellerDetails() {
    formData = [
      TextFieldObject(
        controller: TextEditingController(),
        value: 'Hello',
        placeHolderValue: 'First Name',
      ),
      TextFieldObject(
        controller: TextEditingController(),
        value: '',
        placeHolderValue: 'Last Name',
      ),
      TextFieldObject(
        controller: TextEditingController(),
        value: '',
        placeHolderValue: 'Date Of Birth',
      ),
      TextFieldObject(
        controller: TextEditingController(),
        value: '',
        placeHolderValue: 'gender',
      ),
    ];
  }

  void validateAll() {
    final objects = formData ?? [];
    for (final object in objects) {
      object.validate();
    }
  }
}

class TravellerModel {
  int countOfAdult;
  int countOfChild;
  int countOfInfant;

  TravellerModel({
    required this.countOfAdult,
    required this.countOfChild,
    required this.countOfInfant,
  });

  /// this is an use for create list of passenger
  List<FormInputTraveller> getFormData() {
    final List<FormInputTraveller> list = [];

    for (int count = 1; count <= countOfAdult; count++) {
      list.add(
        FormInputTraveller(
          FormBuilderTravellerDetails(),
          'Adult $count',
        ),
      );
    }
    for (int count = 1; count <= countOfChild; count++) {
      list.add(
        FormInputTraveller(
          FormBuilderTravellerDetails(),
          'Child $count',
        ),
      );
    }
    for (int count = 1; count <= countOfInfant; count++) {
      {
        list.add(
          FormInputTraveller(
            FormBuilderTravellerDetails(),
            'Infant $count',
          ),
        );
      }
    }
    return list;
  }
}

/// this pojo class is use for performed operation
class TextFieldObject {
  String? value;
  String? placeHolderValue;
  InputBorder? inputBorder;
  TextInputType? textInputType;
  String? errorMessage;
  TextEditingController controller;

  TextFieldObject({
    this.value,
    this.placeHolderValue,
    this.inputBorder = const OutlineInputBorder(),
    this.textInputType = TextInputType.name,
    this.errorMessage,
    required this.controller,
  });

  /// it is use for validate all input of form
  void validate() {
    final _value = (value ?? '').trim();
    errorMessage =
        _value.isEmpty ? 'Please Enter Valid $placeHolderValue' : null;
  }
}
