import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: "isoCode")
  final String? isoCode;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phoneCode")
  final String? phoneCode;
  @JsonKey(name: "flag")
  final String? flag;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "timezones")
  final List<Timezones>? timezones;

  CountryModel ({
    this.isoCode,
    this.name,
    this.phoneCode,
    this.flag,
    this.currency,
    this.latitude,
    this.longitude,
    this.timezones,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return _$CountryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CountryModelToJson(this);
  }
  CountryEntity toDomain(){
    return CountryEntity(
      isoCode: isoCode,
      name: name,
      phoneCode: phoneCode,
      flag: flag,
      currency: currency,
      latitude: latitude,
      longitude: longitude,
      timezones: timezones?.map((e) => e.toDomain()).toList(),
    );
  }
}

@JsonSerializable()
class Timezones {
  @JsonKey(name: "zoneName")
  final String? zoneName;
  @JsonKey(name: "gmtOffset")
  final int? gmtOffset;
  @JsonKey(name: "gmtOffsetName")
  final String? gmtOffsetName;
  @JsonKey(name: "abbreviation")
  final String? abbreviation;
  @JsonKey(name: "tzName")
  final String? tzName;

  Timezones ({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });

  factory Timezones.fromJson(Map<String, dynamic> json) {
    return _$TimezonesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TimezonesToJson(this);
  }
  TimezonesEntity toDomain() {
    return TimezonesEntity(
      zoneName: zoneName,
      gmtOffset: gmtOffset,
      gmtOffsetName: gmtOffsetName,
      abbreviation: abbreviation,
      tzName: tzName,
    );
  }
}


