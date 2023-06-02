/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/form_builder_traveller_details.dart';

/// this is use for create list of adult, infant, child
class FormInputTraveller {
  /// this is use for create form of passenger
  FormBuilderTravellerDetails formBuilderTravellerDetails;

  /// this is use for showing types of passenger
  String typeOfPassenger;

  /// constructor for calling form input traveller
  FormInputTraveller(this.formBuilderTravellerDetails, this.typeOfPassenger);
}
