/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/material.dart';

class CarParkingViewModel extends BaseViewModel {
  CarParkingViewModel() {
    locationValue = locationDoamin.first;
    vehicleTypeValue = vehiclesDomain.first;
    entryDateValue = entryDateDomain.first;
    estimatedTimeValue = estimatedTimeDomain.first;
    durationAndPriceValue = durationAndPriceDomain.first;
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  bool isDataValidated = false;
  bool hasAgreedToTncs = true;

  List<String> locationDoamin = ['Terminal 1', 'Terminal 2'];
  List<String> vehiclesDomain = [
    'Car (4 Wheelers)',
    'Bike/Scooter (2 Wheelers)',
  ];
  List<String> entryDateDomain = [
    'Today, Thu 18 Nov',
    'Tomorrow, Fri 19 Nov',
    'Sat, 20 Nov',
    'Sun, 21 Nov',
    'Mon, 22 Nov',
  ];
  List<String> estimatedTimeDomain = [
    '06:30 am - 07:00 am',
    '07:00 am - 07:30 am',
    '07:30 am - 08:00 am',
    '08:00 am - 08:30 am',
    '08:30 am - 09:00 am',
    '09:00 am - 09:30 am',
    '09:30 am - 10:00 am',
    '10:00 am - 10:30 am',
    '10:30 am - 11:00 am',
    '11:00 am - 11:30 am',
    '11:30 am - 12:00 pm',
  ];
  List<String> durationAndPriceDomain = [
    '0-2 hrs at ₹120',
    '2-4 hrs at ₹500',
    '4-6 hrs at ₹500',
    '5-8 hrs at ₹750',
    '8-10 hrs at ₹1750',
  ];

  String? locationValue;
  String? vehicleTypeValue;
  String? entryDateValue;
  String? estimatedTimeValue;
  String? durationAndPriceValue;

  void triggerTncSelection() {
    hasAgreedToTncs = !hasAgreedToTncs;
    validator();
    // notifyListeners();
  }

  void validator() {
    isDataValidated = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        vehicleNumberController.text.isNotEmpty &&
        hasAgreedToTncs;
    notifyListeners();
  }

  void updateLocationWith({required String location}) {
    locationValue = location;
    notifyListeners();
  }

  void updateVehicleTypeWith({required String vehicleType}) {
    vehicleTypeValue = vehicleType;
    notifyListeners();
  }

  void updateEntryDateWith({required String entryDate}) {
    entryDateValue = entryDate;
    notifyListeners();
  }

  void updateEstimatedTimeWith({required String estimatedTime}) {
    estimatedTimeValue = estimatedTime;
    notifyListeners();
  }

  void updateDurationAndPriceWith({required String durationAndPrice}) {
    durationAndPriceValue = durationAndPrice;
    notifyListeners();
  }
}
