import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'mmbfnign': {
      'en': 'Email',
      'pt': 'Email',
    },
    'acurbize': {
      'en': 'What is your email?',
      'pt': 'Qual é seu email?',
    },
    '2x1sevtg': {
      'en': 'Password',
      'pt': '',
    },
    'zgihb8d1': {
      'en': 'Type your password',
      'pt': '',
    },
    '3z0ian8a': {
      'en': 'Login',
      'pt': 'Entrar',
    },
    'ss0kpwqr': {
      'en': 'Forgot my password',
      'pt': 'Esqueci minha senha',
    },
    'jve6ea4r': {
      'en': 'Field is required',
      'pt': '',
    },
    'jvnp9zzx': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    '5sp4a7bo': {
      'en': 'Field is required',
      'pt': '',
    },
    'y9sohp83': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    '4zjc0dvd': {
      'en': 'Home',
      'pt': 'Início',
    },
  },
  // Miscellaneous
  {
    'f5izo0ud': {
      'en': '',
      'pt': '',
    },
    'tcy3n4gt': {
      'en': '',
      'pt': '',
    },
    'qy733tx4': {
      'en': '',
      'pt': '',
    },
    'qub432x1': {
      'en': '',
      'pt': '',
    },
    'uax3ryw3': {
      'en': '',
      'pt': '',
    },
    '1qpwkwtd': {
      'en': '',
      'pt': '',
    },
    'h9utn8nz': {
      'en': '',
      'pt': '',
    },
    'lxn7foe9': {
      'en': '',
      'pt': '',
    },
    'bb19jivx': {
      'en': '',
      'pt': '',
    },
    'epcm5t8g': {
      'en': '',
      'pt': '',
    },
    'gi4phigu': {
      'en': '',
      'pt': '',
    },
    'fih28u85': {
      'en': '',
      'pt': '',
    },
    'w6ura96x': {
      'en': '',
      'pt': '',
    },
    '0u4rzz21': {
      'en': '',
      'pt': '',
    },
    'v9zhsmoc': {
      'en': '',
      'pt': '',
    },
    '2d971vsx': {
      'en': '',
      'pt': '',
    },
    '39rderir': {
      'en': '',
      'pt': '',
    },
    'm39mpals': {
      'en': '',
      'pt': '',
    },
    'ijkn44bn': {
      'en': '',
      'pt': '',
    },
    'alest3a2': {
      'en': '',
      'pt': '',
    },
    'dshj78r6': {
      'en': '',
      'pt': '',
    },
    'puv2hb4o': {
      'en': '',
      'pt': '',
    },
    'bupwemdf': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
