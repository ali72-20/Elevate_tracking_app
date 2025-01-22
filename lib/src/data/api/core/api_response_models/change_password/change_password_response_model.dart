import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/auth/change_password_entity.dart';

part 'change_password_response_model.g.dart';

@JsonSerializable()
class ChangePasswordResponesModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ChangePasswordResponesModel ({
    this.message,
    this.token,
  });

  factory ChangePasswordResponesModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordResponesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordResponesModelToJson(this);
  }

  ChangePasswordEntity toDomainDto() {
    return ChangePasswordEntity(
      message: message,
    );
  }
}


