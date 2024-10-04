import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_plan/pages/home.dart';

class App extends StatelessWidget {
  // ANCHOR App
  const App({
    super.key,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return const CupertinoApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('th', 'TH'),
      ],
      locale: Locale('th', 'TH'),
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF1C50D0),
        barBackgroundColor: Color(0xFF1C50D0),
        scaffoldBackgroundColor: Color(0xFF1C50D0),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 14.5,
            fontWeight: FontWeight.w400,
            color: CupertinoColors.white,
          ),
          navTitleTextStyle: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: CupertinoColors.white,
            letterSpacing: 0.3,
          ),
          navLargeTitleTextStyle: TextStyle(
            fontFamily: 'Prompt',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: CupertinoColors.white,
            letterSpacing: 0.3,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
