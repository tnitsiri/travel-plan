import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:travel_plan/app.dart';
import 'package:travel_plan/models/mrt_station.model.dart';

void main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // system style
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  // portrait screen
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // mrt stations
  List<MrtStationModel> mrtStations = [];

  try {
    String mrtStationsData = await rootBundle.loadString(
      'assets/data/mrt_station.json',
    );

    dynamic mrtStationsInfo = jsonDecode(mrtStationsData);

    mrtStations = (mrtStationsInfo as List).map(
      (data) {
        return MrtStationModel.fromJson(
          data,
        );
      },
    ).toList();
  } catch (_) {}

  // app
  runApp(
    App(
      mrtStations: mrtStations,
    ),
  );
}
