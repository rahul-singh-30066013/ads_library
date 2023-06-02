import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class CabTravellerDetailsNavigateModel {
  CabCartDetailResponseModel? cabCartDetailResponseModel;
  ADTapCallbackWithValue? adTapCallbackWithValue;

  CabTravellerDetailsNavigateModel({
    required this.cabCartDetailResponseModel,
    required this.adTapCallbackWithValue,
  });
}
