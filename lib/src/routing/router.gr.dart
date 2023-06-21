// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:wallet_exp/src/app_tabs.dart' as _i5;
import 'package:wallet_exp/src/features/apps/apps_page.dart' as _i3;
import 'package:wallet_exp/src/features/contacts/contacts_page.dart' as _i1;
import 'package:wallet_exp/src/features/credentials/credentials_page.dart'
    as _i4;
import 'package:wallet_exp/src/features/personas/personas_page.dart' as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ContactsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContactsPage(),
      );
    },
    PersonasRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PersonasPage(),
      );
    },
    AppsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AppsPage(),
      );
    },
    CredentialsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CredentialsPage(),
      );
    },
    AppTabs.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AppTabs(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactsPage]
class ContactsRoute extends _i6.PageRouteInfo<void> {
  const ContactsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PersonasPage]
class PersonasRoute extends _i6.PageRouteInfo<void> {
  const PersonasRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PersonasRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonasRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AppsPage]
class AppsRoute extends _i6.PageRouteInfo<void> {
  const AppsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CredentialsPage]
class CredentialsRoute extends _i6.PageRouteInfo<void> {
  const CredentialsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CredentialsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CredentialsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AppTabs]
class AppTabs extends _i6.PageRouteInfo<void> {
  const AppTabs({List<_i6.PageRouteInfo>? children})
      : super(
          AppTabs.name,
          initialChildren: children,
        );

  static const String name = 'AppTabs';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
