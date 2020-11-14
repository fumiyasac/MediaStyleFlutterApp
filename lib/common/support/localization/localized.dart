// MEMO: Localize(ja/en)での文字列定義を書いていく
// https://itome.team/blog/2019/12/flutter-advent-calendar-day19/
// → Localized.of(context).homeScreenTitle の様に設定する

import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Localized {
  Localized(this.locale);

  final Locale locale;

  static Localized of(BuildContext context) {
    return Localizations.of<Localized>(context, Localized);
  }

  // FIXME: ゆくゆくは英語＆日本語定義ファイルはJSONから取得したい
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'homeScreenTitle': 'Hello',
      'galleriesScreenTitle': 'Galleries',
      'profileScreenTitle': 'Profile',
    },
    'ja': {
      'homeScreenTitle': 'ようこそ',
      'galleriesScreenTitle': 'フォトギャラリー',
      'profileScreenTitle': 'プロフィール',
    },
  };

  String get homeScreenTitle {
    return _localizedValues[locale.languageCode]['homeScreenTitle'];
  }

  String get galleriesScreenTitle {
    return _localizedValues[locale.languageCode]['galleriesScreenTitle'];
  }

  String get profileScreenTitle {
    return _localizedValues[locale.languageCode]['profileScreenTitle'];
  }
}

// MEMO: Localizationのに関するDelegate定義
// 参考:
// https://flutter.dev/docs/development/accessibility-and-localization/internationalization
// https://github.com/billylev/flutter_localizations
class AppLocalizationsDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) async => Localized(locale);


  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}