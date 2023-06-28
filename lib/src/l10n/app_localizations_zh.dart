import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class LocZh extends Loc {
  LocZh([String locale = 'zh']) : super(locale);

  @override
  String get apps => '应用程序';

  @override
  String get contacts => '联系人';

  @override
  String get createNewPersona => '创建新角色';

  @override
  String get credentials => '凭据';

  @override
  String get personas => '角色';

  @override
  String get connections => '连接';

  @override
  String get lastActivity => '最后活动';
}
