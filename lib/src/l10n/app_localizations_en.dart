import 'app_localizations.dart';

/// The translations for English (`en`).
class LocEn extends Loc {
  LocEn([String locale = 'en']) : super(locale);

  @override
  String get apps => 'Apps';

  @override
  String get contacts => 'Contacts';

  @override
  String get createNewPersona => 'Create new persona';

  @override
  String get credentials => 'Credentials';

  @override
  String get personas => 'Personas';

  @override
  String get connections => 'Connections';

  @override
  String get lastActivity => 'Last activity';
}
