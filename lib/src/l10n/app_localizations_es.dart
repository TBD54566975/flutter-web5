import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class LocEs extends Loc {
  LocEs([String locale = 'es']) : super(locale);

  @override
  String get apps => 'Aplicaciones';

  @override
  String get contacts => 'Contactos';

  @override
  String get createNewPersona => 'Crear nueva persona';

  @override
  String get credentials => 'Credenciales';

  @override
  String get personas => 'Personas';

  @override
  String get connections => 'Conexiones';

  @override
  String get lastActivity => 'Última actividad';
}
