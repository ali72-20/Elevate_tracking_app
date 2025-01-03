import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/auth/log_out_entity.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogOutResponseModel {
  @JsonKey(name: "message")
  final String? message;

  LogOutResponseModel ({
    this.message,
  });

  factory LogOutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LogOutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogOutResponseModelToJson(this);
  }
  LogOutEntity toDomainDto(){
    return LogOutEntity(
      message: message,
    );
  }
}


