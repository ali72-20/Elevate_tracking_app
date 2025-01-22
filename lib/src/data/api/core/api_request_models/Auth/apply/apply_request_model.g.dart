// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyRequestModel _$ApplyRequestModelFromJson(Map<String, dynamic> json) =>
    ApplyRequestModel(
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      NID: json['NID'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ApplyRequestModelToJson(ApplyRequestModel instance) =>
    <String, dynamic>{
      'files': instance.files,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'NID': instance.NID,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'gender': instance.gender,
      'phone': instance.phone,
    };
