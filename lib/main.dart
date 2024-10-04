import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:travel_plan/app.dart';

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

  // // load env
  // await dotenv.load(
  //   fileName: 'assets/.env',
  // );

  // app
  runApp(
    App(),
  );
}
