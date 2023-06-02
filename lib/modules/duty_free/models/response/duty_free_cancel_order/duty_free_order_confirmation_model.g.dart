// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_order_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeOrderConfirmationModel _$$_DutyFreeOrderConfirmationModelFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeOrderConfirmationModel(
      id: json['id'] as String?,
      orderReferenceId: json['orderReferenceId'] as String?,
      orderId: json['orderId'] as String?,
      transactionReferenceId: json['transactionReferenceId'] as String?,
      allTransactionReferenceIds:
          (json['allTransactionReferenceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      processedAs: json['processedAs'] as String?,
      customerId: json['customerId'] as String?,
      businessType: json['businessType'] as String?,
      businessSubType: json['businessSubType'] as String?,
      grossAmount: json['grossAmount'] as num?,
      totalAmount: json['totalAmount'] as num?,
      transactionHistory: (json['transactionHistory'] as List<dynamic>?)
          ?.map((e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      couponDetail: json['couponDetail'] as List<dynamic>?,
      status: json['status'] as String?,
      charges: json['charges'] == null
          ? null
          : Charges.fromJson(json['charges'] as Map<String, dynamic>),
      cancelType: json['cancelType'],
      orderDetail: json['orderDetail'] == null
          ? null
          : OrderDetail.fromJson(json['orderDetail'] as Map<String, dynamic>),
      statusHistory: (json['statusHistory'] as List<dynamic>?)
              ?.map((e) => DutyFreeStatusHistoryDetailsResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      earning: json['earning'],
      isFullfilled: json['isFullfilled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DutyFreeOrderConfirmationModelToJson(
        _$_DutyFreeOrderConfirmationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderReferenceId': instance.orderReferenceId,
      'orderId': instance.orderId,
      'transactionReferenceId': instance.transactionReferenceId,
      'allTransactionReferenceIds': instance.allTransactionReferenceIds,
      'processedAs': instance.processedAs,
      'customerId': instance.customerId,
      'businessType': instance.businessType,
      'businessSubType': instance.businessSubType,
      'grossAmount': instance.grossAmount,
      'totalAmount': instance.totalAmount,
      'transactionHistory': instance.transactionHistory,
      'couponDetail': instance.couponDetail,
      'status': instance.status,
      'charges': instance.charges,
      'cancelType': instance.cancelType,
      'orderDetail': instance.orderDetail,
      'statusHistory': instance.statusHistory,
      'createdOn': instance.createdOn?.toIso8601String(),
      'earning': instance.earning,
      'isFullfilled': instance.isFullfilled,
    };

_$_Charges _$$_ChargesFromJson(Map<String, dynamic> json) => _$_Charges(
      convenience: json['convenience'],
      cancellation: json['cancellation'],
      gst: json['gst'],
      totalTax: json['totalTax'] as num?,
    );

Map<String, dynamic> _$$_ChargesToJson(_$_Charges instance) =>
    <String, dynamic>{
      'convenience': instance.convenience,
      'cancellation': instance.cancellation,
      'gst': instance.gst,
      'totalTax': instance.totalTax,
    };

_$_OrderDetail _$$_OrderDetailFromJson(Map<String, dynamic> json) =>
    _$_OrderDetail(
      bookingId: json['bookingId'] as String?,
      itineraryId: json['itineraryId'] as String?,
      history: json['history'],
      pickupDate: json['pickupDate'],
      flightbookingDetail: json['flightbookingDetail'],
      dutyfreeDetail: json['dutyfreeDetail'] == null
          ? null
          : DutyfreeDetail.fromJson(
              json['dutyfreeDetail'] as Map<String, dynamic>),
      pranaamDetail: json['pranaamDetail'],
      cabDetail: json['cabDetail'],
      forexDetail: json['forexDetail'],
    );

Map<String, dynamic> _$$_OrderDetailToJson(_$_OrderDetail instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'itineraryId': instance.itineraryId,
      'history': instance.history,
      'pickupDate': instance.pickupDate,
      'flightbookingDetail': instance.flightbookingDetail,
      'dutyfreeDetail': instance.dutyfreeDetail,
      'pranaamDetail': instance.pranaamDetail,
      'cabDetail': instance.cabDetail,
      'forexDetail': instance.forexDetail,
    };

_$_DutyfreeDetail _$$_DutyfreeDetailFromJson(Map<String, dynamic> json) =>
    _$_DutyfreeDetail(
      id: json['id'] as String?,
      customerId: json['customerId'] as String?,
      airportCode: json['airportCode'] as String?,
      itemDetails: (json['itemDetails'] as List<dynamic>?)
              ?.map((e) => DutyFreeCancelOrderSKUDetails.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      passengerDetail: (json['passengerDetail'] as List<dynamic>?)
              ?.map((e) =>
                  PassengerDetailsResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoCoupon: json['promoCoupon'] == null
          ? const PromoCodeResponse()
          : PromoCodeResponse.fromJson(
              json['promoCoupon'] as Map<String, dynamic>),
      totalAmount: json['totalAmount'] == null
          ? null
          : DiscountPrice.fromJson(json['totalAmount'] as Map<String, dynamic>),
      finalAmount: json['finalAmount'] == null
          ? null
          : DiscountPrice.fromJson(json['finalAmount'] as Map<String, dynamic>),
      preOrderDiscount: json['preOrderDiscount'] == null
          ? null
          : PreOrderDiscount.fromJson(
              json['preOrderDiscount'] as Map<String, dynamic>),
      unitPriceResponse: json['unitPriceResponse'] == null
          ? null
          : DiscountPrice.fromJson(
              json['unitPriceResponse'] as Map<String, dynamic>),
      discountPrice: json['discountPrice'] == null
          ? null
          : DiscountPrice.fromJson(
              json['discountPrice'] as Map<String, dynamic>),
      preOrderDiscountBreakup:
          (json['preOrderDiscountBreakup'] as List<dynamic>?)
              ?.map((e) =>
                  PreOrderDiscountBreakup.fromJson(e as Map<String, dynamic>))
              .toList(),
      loyaltyPotentialPoint: json['loyaltyPotentialPoint'] as num?,
      collectionPoint: json['collectionPoint'] as String?,
      store: json['store'],
      isOrderPushed: json['isOrderPushed'] as bool?,
    );

Map<String, dynamic> _$$_DutyfreeDetailToJson(_$_DutyfreeDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'airportCode': instance.airportCode,
      'itemDetails': instance.itemDetails,
      'passengerDetail': instance.passengerDetail,
      'promoCoupon': instance.promoCoupon,
      'totalAmount': instance.totalAmount,
      'finalAmount': instance.finalAmount,
      'preOrderDiscount': instance.preOrderDiscount,
      'unitPriceResponse': instance.unitPriceResponse,
      'discountPrice': instance.discountPrice,
      'preOrderDiscountBreakup': instance.preOrderDiscountBreakup,
      'loyaltyPotentialPoint': instance.loyaltyPotentialPoint,
      'collectionPoint': instance.collectionPoint,
      'store': instance.store,
      'isOrderPushed': instance.isOrderPushed,
    };

_$_PreOrderDiscount _$$_PreOrderDiscountFromJson(Map<String, dynamic> json) =>
    _$_PreOrderDiscount(
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      percentageDiscount: json['percentageDiscount'] as int?,
    );

Map<String, dynamic> _$$_PreOrderDiscountToJson(_$_PreOrderDiscount instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'percentageDiscount': instance.percentageDiscount,
    };

_$_DiscountPrice _$$_DiscountPriceFromJson(Map<String, dynamic> json) =>
    _$_DiscountPrice(
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$_DiscountPriceToJson(_$_DiscountPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };

_$_ItemDetail _$$_ItemDetailFromJson(Map<String, dynamic> json) =>
    _$_ItemDetail(
      bookingId: json['bookingId'] as String?,
      storeType: json['storeType'] as String?,
      materialName: json['materialName'] as String?,
      categoryName: json['categoryName'] as String?,
      subCategoryName: json['subCategoryName'] as String?,
      brandName: json['brandName'] as String?,
      skuCode: json['skuCode'] as String?,
      skuName: json['skuName'] as String?,
      quantity: json['quantity'] as int?,
      unitPrice: json['unitPrice'] as num?,
      totalPrice: json['totalPrice'] as num?,
      discountedPrice: json['discountedPrice'] as num?,
      productImage: json['productImage'] as String?,
      promotion: json['promotion'] == null
          ? null
          : Promotion.fromJson(json['promotion'] as Map<String, dynamic>),
      skuSize: json['skuSize'] as String?,
      skuUnit: json['skuUnit'] as String?,
      skuStatus: json['skuStatus'],
      storeCode: json['storeCode'] as String?,
      loyaltyOffer: json['loyaltyOffer'],
      finalUnitPrice: json['finalUnitPrice'] as num?,
      totalDiscountedPrice: json['totalDiscountedPrice'] as num?,
      totalUnitPrice: json['totalUnitPrice'] as num?,
      preOrderDiscount: (json['preOrderDiscount'] as num?)?.toDouble(),
      inStock: json['inStock'] as bool?,
      overheadStock: json['overheadStock'] as int?,
      availableStock: json['availableStock'] as int?,
      potentialPromoText: json['potentialPromoText'],
    );

Map<String, dynamic> _$$_ItemDetailToJson(_$_ItemDetail instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'storeType': instance.storeType,
      'materialName': instance.materialName,
      'categoryName': instance.categoryName,
      'subCategoryName': instance.subCategoryName,
      'brandName': instance.brandName,
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'discountedPrice': instance.discountedPrice,
      'productImage': instance.productImage,
      'promotion': instance.promotion,
      'skuSize': instance.skuSize,
      'skuUnit': instance.skuUnit,
      'skuStatus': instance.skuStatus,
      'storeCode': instance.storeCode,
      'loyaltyOffer': instance.loyaltyOffer,
      'finalUnitPrice': instance.finalUnitPrice,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'totalUnitPrice': instance.totalUnitPrice,
      'preOrderDiscount': instance.preOrderDiscount,
      'inStock': instance.inStock,
      'overheadStock': instance.overheadStock,
      'availableStock': instance.availableStock,
      'potentialPromoText': instance.potentialPromoText,
    };

_$_Promotion _$$_PromotionFromJson(Map<String, dynamic> json) => _$_Promotion(
      promotionType: json['promotionType'] as int?,
      promotionQty: json['promotionQty'] as int?,
      promotionCode: json['promotionCode'] as String?,
      offer: json['offer'] as int?,
      offerText: json['offerText'],
    );

Map<String, dynamic> _$$_PromotionToJson(_$_Promotion instance) =>
    <String, dynamic>{
      'promotionType': instance.promotionType,
      'promotionQty': instance.promotionQty,
      'promotionCode': instance.promotionCode,
      'offer': instance.offer,
      'offerText': instance.offerText,
    };

_$_PassengerDetail _$$_PassengerDetailFromJson(Map<String, dynamic> json) =>
    _$_PassengerDetail(
      customerId: json['customerId'],
      customerName: json['customerName'] as String?,
      passportNumber: json['passportNumber'] as String?,
      customerPassportExpiry: json['customerPassportExpiry'] as String?,
      flightNo: json['flightNo'] as String?,
      flightTime: json['flightTime'] as String?,
      pickupDate: json['pickupDate'] as String?,
      pickupTime: json['pickupTime'] as String?,
      mobile: json['mobile'] as String?,
      emailId: json['emailId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      customerDob: json['customerDob'] as String?,
      countryDialCode: json['countryDialCode'] as String?,
      isPassenger: json['isPassenger'] as bool?,
    );

Map<String, dynamic> _$$_PassengerDetailToJson(_$_PassengerDetail instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'passportNumber': instance.passportNumber,
      'customerPassportExpiry': instance.customerPassportExpiry,
      'flightNo': instance.flightNo,
      'flightTime': instance.flightTime,
      'pickupDate': instance.pickupDate,
      'pickupTime': instance.pickupTime,
      'mobile': instance.mobile,
      'emailId': instance.emailId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'customerDob': instance.customerDob,
      'countryDialCode': instance.countryDialCode,
      'isPassenger': instance.isPassenger,
    };

_$_PromoCoupon _$$_PromoCouponFromJson(Map<String, dynamic> json) =>
    _$_PromoCoupon(
      promoCode: json['promoCode'] as String?,
      offerValue: json['offerValue'] as int?,
      promoValueType: json['promoValueType'] as String?,
      calculationBasedOnAmount: json['calculationBasedOnAmount'],
      fundingPartners: json['fundingPartners'] as List<dynamic>?,
      merchantFunded: json['merchantFunded'] as bool?,
      isInstantDiscount: json['isInstantDiscount'] as bool?,
    );

Map<String, dynamic> _$$_PromoCouponToJson(_$_PromoCoupon instance) =>
    <String, dynamic>{
      'promoCode': instance.promoCode,
      'offerValue': instance.offerValue,
      'promoValueType': instance.promoValueType,
      'calculationBasedOnAmount': instance.calculationBasedOnAmount,
      'fundingPartners': instance.fundingPartners,
      'merchantFunded': instance.merchantFunded,
      'isInstantDiscount': instance.isInstantDiscount,
    };

_$_DutyFreeCancelOrderDetailsStatusHistory
    _$$_DutyFreeCancelOrderDetailsStatusHistoryFromJson(
            Map<String, dynamic> json) =>
        _$_DutyFreeCancelOrderDetailsStatusHistory(
          status: json['status'] as String?,
          createdOn: json['createdOn'] == null
              ? null
              : DateTime.parse(json['createdOn'] as String),
        );

Map<String, dynamic> _$$_DutyFreeCancelOrderDetailsStatusHistoryToJson(
        _$_DutyFreeCancelOrderDetailsStatusHistory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'createdOn': instance.createdOn?.toIso8601String(),
    };

_$_TransactionHistory _$$_TransactionHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistory(
      transactionReferenceId: json['transactionReferenceId'] as String?,
      status: json['status'] as String?,
      paidBy: json['paidBy'] == null
          ? null
          : PaidBy.fromJson(json['paidBy'] as Map<String, dynamic>),
      transactionMode: json['transactionMode'] as String?,
    );

Map<String, dynamic> _$$_TransactionHistoryToJson(
        _$_TransactionHistory instance) =>
    <String, dynamic>{
      'transactionReferenceId': instance.transactionReferenceId,
      'status': instance.status,
      'paidBy': instance.paidBy,
      'transactionMode': instance.transactionMode,
    };

_$_PaidBy _$$_PaidByFromJson(Map<String, dynamic> json) => _$_PaidBy(
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      loyalty: json['loyalty'],
      promo: json['promo'],
    );

Map<String, dynamic> _$$_PaidByToJson(_$_PaidBy instance) => <String, dynamic>{
      'bank': instance.bank,
      'loyalty': instance.loyalty,
      'promo': instance.promo,
    };

_$_Bank _$$_BankFromJson(Map<String, dynamic> json) => _$_Bank(
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_BankToJson(_$_Bank instance) => <String, dynamic>{
      'amount': instance.amount,
    };
