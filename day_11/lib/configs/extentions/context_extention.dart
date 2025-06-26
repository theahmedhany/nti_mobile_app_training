import 'package:apis_nti_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
}
