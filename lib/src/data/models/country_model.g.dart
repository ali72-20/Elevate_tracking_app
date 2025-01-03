// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      isoCode: json['isoCode'] as String?,
      name: json['name'] as String?,
      phoneCode: json['phoneCode'] as String?,
      flag: json['flag'] as String?,
      currency: json['currency'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      timezones: (json['timezones'] as List<dynamic>?)
          ?.map((e) => Timezones.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'isoCode': instance.isoCode,
      'name': instance.name,
      'phoneCode': instance.phoneCode,
      'flag': instance.flag,
      'currency': instance.currency,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezones': instance.timezones,
    };

Timezones _$TimezonesFromJson(Map<String, dynamic> json) => Timezones(
      zoneName: json['zoneName'] as String?,
      gmtOffset: (json['gmtOffset'] as num?)?.toInt(),
      gmtOffsetName: json['gmtOffsetName'] as String?,
      abbreviation: json['abbreviation'] as String?,
      tzName: json['tzName'] as String?,
    );

Map<String, dynamic> _$TimezonesToJson(Timezones instance) => <String, dynamic>{
      'zoneName': instance.zoneName,
      'gmtOffset': instance.gmtOffset,
      'gmtOffsetName': instance.gmtOffsetName,
      'abbreviation': instance.abbreviation,
      'tzName': instance.tzName,
    };
