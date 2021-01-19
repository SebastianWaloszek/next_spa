import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spa_coding_exercise/presentation/localization/generated/l10n.dart';

List<Locale> supportedLocales = [
  const Locale('en', 'US'),
  const Locale('de', 'DE'),
  const Locale('pl', 'PL'),
];

final List<LocalizationsDelegate> localizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  DefaultCupertinoLocalizations.delegate,
];
