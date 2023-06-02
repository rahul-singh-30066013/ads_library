
import 'package:adani_airport_mobile/modules/common_order_detail/address.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/contact_number.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/email.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/person_name.dart';

class ContactDetail {
    PersonName? personName;
    List<ContactNumber>? contactNumber;
    List<Email>? email;
    List<Address>? address;

    ContactDetail({this.personName, this.contactNumber, this.email, this.address});

    ContactDetail.fromJson(Map<String, dynamic> json) {
        if(json['personName'] is Map) {
            personName = json['personName'] == null ? null : PersonName.fromJson(json['personName']);
        }
        if(json['contactNumber'] is List) {
            contactNumber = json['contactNumber'] == null ? null : (json['contactNumber'] as List).map((e) => ContactNumber.fromJson(e)).toList();
        }
        if(json['email'] is List) {
            email = json['email'] == null ? null : (json['email'] as List).map((e) => Email.fromJson(e)).toList();
        }
        if(json['address'] is List) {
            address = json['address'] == null ? null : (json['address'] as List).map((e) => Address.fromJson(e)).toList();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(personName != null) {
            _data['personName'] = personName?.toJson();
        }
        if(contactNumber != null) {
            _data['contactNumber'] = contactNumber?.map((e) => e.toJson()).toList();
        }
        if(email != null) {
            _data['email'] = email?.map((e) => e.toJson()).toList();
        }
        if(address != null) {
            _data['address'] = address?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}