import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/auth/login_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  LoginResponseModel ({
    this.message,
    this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  LoginEntity toDomainDto(){
    return LoginEntity(massage: message);
  }
}


