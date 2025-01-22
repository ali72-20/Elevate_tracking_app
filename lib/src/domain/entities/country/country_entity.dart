import 'package:json_annotation/json_annotation.dart';




class CountryEntity {

  final String? isoCode;

  final String? name;

  final String? phoneCode;

  final String? flag;

  final String? currency;

  final String? latitude;

  final String? longitude;

  final List<TimezonesEntity>? timezones;

  CountryEntity ({
    this.isoCode,
    this.name,
    this.phoneCode,
    this.flag,
    this.currency,
    this.latitude,
    this.longitude,
    this.timezones,
  });


}


class TimezonesEntity {

  final String? zoneName;

  final int? gmtOffset;

  final String? gmtOffsetName;

  final String? abbreviation;

  final String? tzName;

  TimezonesEntity ({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });
}


