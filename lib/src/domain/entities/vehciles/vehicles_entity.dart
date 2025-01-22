import 'package:json_annotation/json_annotation.dart';
class VehiclesResponseEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<VehiclesEntity>? vehicles;

  VehiclesResponseEntity ({
    this.message,
    this.metadata,
    this.vehicles,
  });

}


class MetadataEntity {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  MetadataEntity ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

}


class VehiclesEntity {
  final String? Id;
  final String? type;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  VehiclesEntity ({
    this.Id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

}


