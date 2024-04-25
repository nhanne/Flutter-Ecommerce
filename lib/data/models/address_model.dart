

import 'package:clothes/util/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel{
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String country;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.country,
    this.selectedAddress = true
  });

  String get formatPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(id: '', name: '', phoneNumber: '', street: '', city: '', country: '');

  Map<String, dynamic> toJson(){
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'Country': country,
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data){
    return AddressModel(
        id: data['Id'] as String,
        name: data['Name'] as String,
        phoneNumber: data['PhoneNumber'] as String,
        street: data['Street'] as String,
        city: data['City'] as String,
        country: data['Country'] as String,
        selectedAddress: data['SelectedAddress'] as bool,
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        street: data['Street'] ?? '',
        city: data['City'] ?? '',
        country: data['Country'] ?? '',
        selectedAddress: data['SelectedAddress'] as bool,
    );
  }


  @override
  String toString(){
    return '$street, $city, $country';
  }
}

