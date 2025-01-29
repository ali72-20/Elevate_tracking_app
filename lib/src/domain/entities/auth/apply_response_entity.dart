import 'dart:io';

import 'package:json_annotation/json_annotation.dart';




class ApplyResponseEntity {
  final String? message;
  final DriveEntity? driver;

  ApplyResponseEntity ({
    this.message,
    this.driver,
  });
}


class DriveEntity {

  final String? country;

  final String? firstName;

  final String? lastName;

  final String? vehicleType;

  final String? vehicleNumber;


  final String? NID;


  final String? email;

  final String? gender;

  final String? phone;

  final String? photo;

  final String? Id;

  final String? createdAt;

  DriveEntity ({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.NID,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.Id,
    this.createdAt,
  });

}


