import 'dart:io';

import 'package:json_annotation/json_annotation.dart';


class ApplyRequestEntity{

  final String country;

  final String firstName;

  final String lastName;

  final String?vehicleType;

  final String vehicleNumber;

  final String NID;

  final String email;

  final String password;

  final String rePassword;

  final String gender;

  final String phone;
  final File? vehicleLicenseImage;
  final File? idImage;

  ApplyRequestEntity ({
    required this.idImage,
    required this.vehicleLicenseImage,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.NID,
    required  this.email,
    required this.password,
    required  this.rePassword,
    required  this.gender,
    required this.phone,
  });

}


