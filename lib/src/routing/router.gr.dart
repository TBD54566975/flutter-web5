// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:wallet_exp/src/app_tabs.dart' as _i6;
import 'package:wallet_exp/src/features/apps/apps_page.dart' as _i4;
import 'package:wallet_exp/src/features/contacts/contacts_page.dart' as _i1;
import 'package:wallet_exp/src/features/credentials/credentials_page.dart'
    as _i5;
import 'package:wallet_exp/src/features/personas/create_persona_page.dart'
    as _i3;
import 'package:wallet_exp/src/features/personas/list_personas_page.dart'
    as _i7;
import 'package:wallet_exp/src/features/personas/view_persona_page.dart' as _i2;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ContactsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContactsPage(),
      );
    },
    ViewPersonaRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ViewPersonaPage(),
      );
    },
    CreatePersonaRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreatePersonaPage(),
      );
    },
    AppsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AppsPage(),
      );
    },
    CredentialsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CredentialsPage(),
      );
    },
    AppTabs.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AppTabs(),
      );
    },
    ListPersonasRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ListPersonasPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactsPage]
class ContactsRoute extends _i8.PageRouteInfo<void> {
  const ContactsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ViewPersonaPage]
class ViewPersonaRoute extends _i8.PageRouteInfo<void> {
  const ViewPersonaRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ViewPersonaRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewPersonaRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreatePersonaPage]
class CreatePersonaRoute extends _i8.PageRouteInfo<void> {
  const CreatePersonaRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CreatePersonaRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePersonaRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AppsPage]
class AppsRoute extends _i8.PageRouteInfo<void> {
  const AppsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CredentialsPage]
class CredentialsRoute extends _i8.PageRouteInfo<void> {
  const CredentialsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CredentialsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CredentialsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AppTabs]
class AppTabs extends _i8.PageRouteInfo<void> {
  const AppTabs({List<_i8.PageRouteInfo>? children})
      : super(
          AppTabs.name,
          initialChildren: children,
        );

  static const String name = 'AppTabs';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ListPersonasPage]
class ListPersonasRoute extends _i8.PageRouteInfo<void> {
  const ListPersonasRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ListPersonasRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListPersonasRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
