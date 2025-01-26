import 'dart:io';


import 'package:tracking_app/src/domain/entities/auth/apply_request_entity.dart';
class ApplyRequestModel{

  final String? country;

  final String? firstName;

  final String? lastName;

  final String? vehicleType;

  final String? vehicleNumber;

  final String? NID;

  final String? email;

  final String? password;

  final String? rePassword;

  final String? gender;

  final String? phone;
  final File? vehicleLicenseImage;
  final File? idImage;

  ApplyRequestModel ({
    this.idImage,
    this.vehicleLicenseImage,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.NID,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.phone,
  });

  factory ApplyRequestModel.fromDomainDto(ApplyRequestEntity applyRequestEntity){
    return ApplyRequestModel(
      vehicleLicenseImage: applyRequestEntity.vehicleLicenseImage,
      idImage: applyRequestEntity.idImage,
      country: applyRequestEntity.country,
      firstName: applyRequestEntity.firstName,
      lastName: applyRequestEntity.lastName,
      vehicleType: applyRequestEntity.vehicleType,
      vehicleNumber: applyRequestEntity.vehicleNumber,
      NID: applyRequestEntity.NID,
      email: applyRequestEntity.email,
      password: applyRequestEntity.password,
      rePassword: applyRequestEntity.rePassword,
    );
  }

}


