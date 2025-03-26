import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Localization {
  late final Locale locale;
  static late Locale currentLocale;

  Localization(this.locale) {
    currentLocale = locale;
  }

  static Localization of(BuildContext context) {
    return Localizations.of(context, Localization);
  }

  late Map<String, String> _localizedString;

  Future<void> load() async {
    final jsonString = await rootBundle
        .loadString('assets/locale/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedString[key];
  }

  static const supportedLocales = [Locale('en', 'US'), Locale('ko', 'KR')];

  static Locale? localeResolutionCallBack(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
              (element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }

    return null;
  }

  static const LocalizationsDelegate<Localization> _delegate =
  _LocalizationServiceDelegate();

  static const localizationsDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    _delegate
  ];
}

class _LocalizationServiceDelegate
    extends LocalizationsDelegate<Localization> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ko'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    Localization service = Localization(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) {
    return false;
  }
}
