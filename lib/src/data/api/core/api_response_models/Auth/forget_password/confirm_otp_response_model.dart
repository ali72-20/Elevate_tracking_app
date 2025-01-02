import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';

part 'confirm_otp_response_model.g.dart';

@JsonSerializable()
class ConfirmOtpResponseModel {
  @JsonKey(name: "status")
  final String? status;

  ConfirmOtpResponseModel({
    this.status,
  });

  factory ConfirmOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ConfirmOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmOtpResponseModelToJson(this);
  }

  ConfirmOtpEntity toDomainDto() {
    return ConfirmOtpEntity(
      statue: status,
    );
  }
}
