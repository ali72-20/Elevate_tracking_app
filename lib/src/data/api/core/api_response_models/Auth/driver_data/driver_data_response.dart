import 'package:json_annotation/json_annotation.dart';

import '../../../../../../domain/entities/DriverData.dart';

part 'driver_data_response.g.dart';

@JsonSerializable()
class DriverDataResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "driver")
  final Driver? driver;

  DriverDataResponse({
    this.message,
    this.driver,
  });

  factory DriverDataResponse.fromJson(Map<String, dynamic> json) {
    return _$DriverDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverDataResponseToJson(this);
  }

  DriverEntity toDomainEntity() {
    return DriverEntity(
      id: driver?.Id,
      country: driver?.country,
      firstName: driver?.firstName,
      lastName: driver?.lastName,
      vehicleType: driver?.vehicleType,
      vehicleNumber: driver?.vehicleNumber,
      vehicleLicense: driver?.vehicleLicense,
      nid: driver?.NID,
      nIDImg: driver?.NIDImg,
      email: driver?.email,
      phone: driver?.phone,
      gender: driver?.gender,
      photo: driver?.photo,
      createdAt: driver?.createdAt,
      passwordChangedAt: driver?.passwordChangedAt,
    );
  }
}

@JsonSerializable()
class Driver {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "vehicleType")
  final String? vehicleType;
  @JsonKey(name: "vehicleNumber")
  final String? vehicleNumber;
  @JsonKey(name: "vehicleLicense")
  final String? vehicleLicense;
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "NIDImg")
  final String? NIDImg;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  Driver({
    this.Id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.NID,
    this.NIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return _$DriverFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverToJson(this);
  }
}
