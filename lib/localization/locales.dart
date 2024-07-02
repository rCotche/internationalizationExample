import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("de", LocaleData.DE),
  MapLocale("zh", LocaleData.ZH),
];

mixin LocaleData {
  static const String title = 'title';
  static const String body = 'body';

  //check language code

  static const Map<String, dynamic> EN = {
    title: 'Localization',
    //%a to add some dynamic values into the string
    body: 'Welcome to this localized flutter application %a',
  };

  static const Map<String, dynamic> DE = {
    title: 'Lokalisierung',
    body: 'Willkommen bei dieser lokalisierten Flatteranwendung %a',
  };

  static const Map<String, dynamic> ZH = {
    title: '本土化',
    body: '欢迎使用这个本地化的 flutter 应用程序 %a',
  };
}
