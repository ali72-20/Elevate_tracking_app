import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';

part 'app_user_response_model.g.dart';

@JsonSerializable()
class AppUserResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "driver")
  final Driver? driver;

  AppUserResponseModel ({
    this.message,
    this.driver,
  });

  factory AppUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AppUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AppUserResponseModelToJson(this);
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

  Driver ({
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
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return _$DriverFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverToJson(this);
  }


  AppUserEntity toDomain(){
    return AppUserEntity(
      id: Id,
      firstName: firstName,
      lastName:lastName ,
      email: email,
      phone: phone,
      gender: gender,
      photo: phone
    );
  }
}


