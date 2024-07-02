import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'localization/locales.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    configureLocaliztion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Internationalization example",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: HomePage(),
    );
  }

  void configureLocaliztion() {
    //mapLocales: all the data dont on a besoin de translate un language to anothre
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? local) {
    setState(() {});
  }
}
