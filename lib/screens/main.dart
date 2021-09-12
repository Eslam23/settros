import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:service_system/localization/app_localization.dart';
import 'package:service_system/localization/language_constants.dart';
import 'package:service_system/localization/theme_constants.dart';
import 'package:service_system/screens/splash_screen.dart';
import 'package:service_system/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static ThemeMode themeMode;
  static Locale localeLan;
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }
  static void setTheme(BuildContext context, ThemeMode themeMode) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setTheme(themeMode);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setLocale(Locale locale) {
    setState(() {
      MyApp.localeLan = locale;
    });
  }
  setTheme(ThemeMode themeMode) {
    setState(() {
      MyApp.themeMode = themeMode;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        MyApp.localeLan = locale;
      });
    });
    getTheme().then((value) {
      setState(() {
        MyApp.themeMode = value;
      });
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    if (MyApp.localeLan != null) {
      setState(() {

      });
    }
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        scaffoldBackgroundColor: Colors.grey[100],
        cardColor: Colors.white,
        shadowColor: Colors.grey,
        accentColor: AppTheme.appColor,
        buttonColor: Colors.black,
        primaryColor: AppTheme.appColor,
        /* appBarTheme: AppBarTheme(
            backgroundColor: AppTheme.appColor,
        ),*/
        /*backgroundColor: Colors.white*/
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.darkBackground,
        backgroundColor:AppTheme.darkBackground,
        cardColor: AppTheme.darkCard,
        accentColor: AppTheme.appColor,
        buttonColor: Colors.white,
        primaryColor: AppTheme.darkCard,
        /*appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.darkCard,
          titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)
        ),*/
        /* dark theme settings */
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: "Settros",
      locale: MyApp.localeLan,
      themeMode: MyApp.themeMode,
      supportedLocales: [
        Locale("en", "US"),
        // Locale("fa", "IR"),
        Locale("ar", "SA"),
        // Locale("hi", "IN")
      ],
      localizationsDelegates: [
        AppLocalization.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
