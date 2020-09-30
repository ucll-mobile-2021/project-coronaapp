import 'package:coronapp/localization/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) => Localization.of(context).getTranslatedValue(key);

const String ENGLISH = 'en';
const String FRENCH = 'fr';
const String GERMAN = 'de';
const String DUTCH = 'nl';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;

  switch(languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'GB'); break;

    case FRENCH:
      _temp = Locale(languageCode, 'FR'); break;

    case GERMAN:
      _temp = Locale(languageCode, 'DE'); break;

    case DUTCH:
      _temp = Locale(languageCode, 'BE'); break;

    default:
      _temp = Locale(ENGLISH, 'GB');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}