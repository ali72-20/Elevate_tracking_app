// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclesResponseModel _$VehiclesResponseModelFromJson(
        Map<String, dynamic> json) =>
    VehiclesResponseModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => Vehicles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehiclesResponseModelToJson(
        VehiclesResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'vehicles': instance.vehicles,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

Vehicles _$VehiclesFromJson(Map<String, dynamic> json) => Vehicles(
      Id: json['_id'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$VehiclesToJson(Vehicles instance) => <String, dynamic>{
      '_id': instance.Id,
      'type': instance.type,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
