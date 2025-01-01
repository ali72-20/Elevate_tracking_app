import 'package:json_annotation/json_annotation.dart';

part 'vehicles_response_model.g.dart';

@JsonSerializable()
class VehiclesResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "vehicles")
  final List<Vehicles>? vehicles;

  VehiclesResponseModel ({
    this.message,
    this.metadata,
    this.vehicles,
  });

  factory VehiclesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VehiclesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehiclesResponseModelToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Vehicles {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Vehicles ({
    this.Id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return _$VehiclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehiclesToJson(this);
  }
}


