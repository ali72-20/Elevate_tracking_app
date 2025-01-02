// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDataResponse _$DriverDataResponseFromJson(Map<String, dynamic> json) =>
    DriverDataResponse(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverDataResponseToJson(DriverDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      Id: json['_id'] as String?,
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      NID: json['NID'] as String?,
      NIDImg: json['NIDImg'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      createdAt: json['createdAt'] as String?,
      passwordChangedAt: json['passwordChangedAt'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      '_id': instance.Id,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.NID,
      'NIDImg': instance.NIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'createdAt': instance.createdAt,
      'passwordChangedAt': instance.passwordChangedAt,
    };
