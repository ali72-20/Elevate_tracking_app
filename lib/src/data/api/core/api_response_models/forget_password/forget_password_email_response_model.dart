import 'package:json_annotation/json_annotation.dart';

part 'forget_password_email_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordEmailResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgetPasswordEmailResponseModel ({
    this.message,
    this.info,
  });

  factory ForgetPasswordEmailResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordEmailResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordEmailResponseModelToJson(this);
  }
}


