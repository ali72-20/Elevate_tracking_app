import 'package:json_annotation/json_annotation.dart';


class ApplyRequestEntity{

  final List<String>? files;

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

  ApplyRequestEntity ({
    this.files,
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

}


