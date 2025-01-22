import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/auth/apply_request_entity.dart';

part 'apply_request_model.g.dart';

@JsonSerializable()
class ApplyRequestModel {
  @JsonKey(name: "files")
  final List<String>? files;
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
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;

  ApplyRequestModel ({
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

  factory ApplyRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ApplyRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplyRequestModelToJson(this);
  }
  factory ApplyRequestModel.fromDomainDto(ApplyRequestEntity applyRequestEntity){
    return ApplyRequestModel(
      files: applyRequestEntity.files,
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


