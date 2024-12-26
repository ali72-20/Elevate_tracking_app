import 'package:json_annotation/json_annotation.dart';

part 'confirm_otp_request_model.g.dart';

@JsonSerializable()
class ConfirmOtpRequestModel {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  ConfirmOtpRequestModel ({
    this.resetCode,
  });

  factory ConfirmOtpRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ConfirmOtpRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmOtpRequestModelToJson(this);
  }
}


