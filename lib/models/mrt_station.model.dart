// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'mrt_station.model.g.dart';

@JsonSerializable()
class MrtStationModel {
  String id_station;
  String name;
  String? location;
  int id_mrtline;
  String mrtline;
  String? station_co;
  int? dcode;
  String? dname;
  double lat;
  double lng;

  MrtStationModel({
    required this.id_station,
    required this.name,
    this.location,
    required this.id_mrtline,
    required this.mrtline,
    this.station_co,
    this.dcode,
    this.dname,
    required this.lat,
    required this.lng,
  });

  factory MrtStationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$MrtStationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MrtStationModelToJson(this);
  }
}
