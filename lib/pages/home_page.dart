import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:internationalization_example/localization/locales.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleData.title.getString(context),
        ),
        actions: [
          DropdownButton(
              value: _currentLocale,
              items: const [
                DropdownMenuItem(
                  value: "en",
                  child: Text("English"),
                ),
                DropdownMenuItem(
                  value: "de",
                  child: Text("German"),
                ),
                DropdownMenuItem(
                  value: "zh",
                  child: Text("Chinese"),
                ),
              ],
              onChanged: (value) {
                _setLocale(value);
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Text(
          //l'ordre a son importance
          //premier "%a" sera remplace apar la 1ere valeur dans le tableau
          context.formatString(LocaleData.body, ["Mario"]),
          style: TextStyle(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  void _setLocale(String? value) {
    if (value == null) {
      return;
    }
    switch (value) {
      case "en":
        _flutterLocalization.translate("en");
        break;
      case "de":
        _flutterLocalization.translate("de");
        break;
      case "zh":
        _flutterLocalization.translate("zh");
        break;
      default:
        return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
