// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrt_station.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MrtStationModel _$MrtStationModelFromJson(Map<String, dynamic> json) =>
    MrtStationModel(
      id_station: json['id_station'] as String,
      name: json['name'] as String,
      location: json['location'] as String?,
      id_mrtline: (json['id_mrtline'] as num).toInt(),
      mrtline: json['mrtline'] as String,
      station_co: json['station_co'] as String?,
      dcode: (json['dcode'] as num?)?.toInt(),
      dname: json['dname'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$MrtStationModelToJson(MrtStationModel instance) =>
    <String, dynamic>{
      'id_station': instance.id_station,
      'name': instance.name,
      'location': instance.location,
      'id_mrtline': instance.id_mrtline,
      'mrtline': instance.mrtline,
      'station_co': instance.station_co,
      'dcode': instance.dcode,
      'dname': instance.dname,
      'lat': instance.lat,
      'lng': instance.lng,
    };
