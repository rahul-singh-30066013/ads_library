class TravellerDetailNavigateModel {
  UpdateBillingModel? updateBillingModel;
  final void Function(UpdateBillingModel?) billingDetailForm;

  TravellerDetailNavigateModel(
    this.updateBillingModel,
    this.billingDetailForm,
  );
}

class UpdateBillingModel {
  final String address;
  final String country;
  final String pinCode;
  final String city;
  final String state;

  UpdateBillingModel(
    this.address,
    this.country,
    this.pinCode,
    this.city,
    this.state,
  );
}
