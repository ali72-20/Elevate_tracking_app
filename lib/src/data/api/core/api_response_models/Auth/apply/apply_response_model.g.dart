// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyResponseModel _$ApplyResponseModelFromJson(Map<String, dynamic> json) =>
    ApplyResponseModel(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ApplyResponseModelToJson(ApplyResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
      'token': instance.token,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
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
      Id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
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
      '_id': instance.Id,
      'createdAt': instance.createdAt,
    };
