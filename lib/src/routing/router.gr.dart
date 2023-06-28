// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:wallet_exp/src/app_tabs.dart' as _i11;
import 'package:wallet_exp/src/features/apps/apps_page.dart' as _i9;
import 'package:wallet_exp/src/features/contacts/contacts_page.dart' as _i1;
import 'package:wallet_exp/src/features/credentials/credentials_page.dart'
    as _i10;
import 'package:wallet_exp/src/features/permissions/request_permissions_page.dart'
    as _i3;
import 'package:wallet_exp/src/features/personas/create_persona_page.dart'
    as _i7;
import 'package:wallet_exp/src/features/personas/import_personas_page.dart'
    as _i8;
import 'package:wallet_exp/src/features/personas/initial_personas_page.dart'
    as _i5;
import 'package:wallet_exp/src/features/personas/list_personas_page.dart'
    as _i4;
import 'package:wallet_exp/src/features/personas/persona.dart' as _i14;
import 'package:wallet_exp/src/features/personas/view_persona_page.dart' as _i6;
import 'package:wallet_exp/src/features/welcome/welcome_page.dart' as _i2;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ContactsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContactsPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    RequestPermissionsRoute.name: (routeData) {
      final args = routeData.argsAs<RequestPermissionsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RequestPermissionsPage(
          uri: args.uri,
          key: args.key,
        ),
      );
    },
    ListPersonasRoute.name: (routeData) {
      final args = routeData.argsAs<ListPersonasRouteArgs>(
          orElse: () => const ListPersonasRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ListPersonasPage(key: args.key),
      );
    },
    InitialPersonasRoute.name: (routeData) {
      final args = routeData.argsAs<InitialPersonasRouteArgs>(
          orElse: () => const InitialPersonasRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.InitialPersonasPage(key: args.key),
      );
    },
    ViewPersonaRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPersonaRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ViewPersonaPage(
          persona: args.persona,
          key: args.key,
        ),
      );
    },
    CreatePersonaRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePersonaRouteArgs>(
          orElse: () => const CreatePersonaRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CreatePersonaPage(key: args.key),
      );
    },
    ImportPersonasRoute.name: (routeData) {
      final args = routeData.argsAs<ImportPersonasRouteArgs>(
          orElse: () => const ImportPersonasRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ImportPersonasPage(key: args.key),
      );
    },
    AppsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AppsPage(),
      );
    },
    CredentialsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CredentialsPage(),
      );
    },
    AppTabs.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.AppTabs(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactsPage]
class ContactsRoute extends _i12.PageRouteInfo<void> {
  const ContactsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i12.PageRouteInfo<void> {
  const WelcomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RequestPermissionsPage]
class RequestPermissionsRoute
    extends _i12.PageRouteInfo<RequestPermissionsRouteArgs> {
  RequestPermissionsRoute({
    required Uri uri,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RequestPermissionsRoute.name,
          args: RequestPermissionsRouteArgs(
            uri: uri,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestPermissionsRoute';

  static const _i12.PageInfo<RequestPermissionsRouteArgs> page =
      _i12.PageInfo<RequestPermissionsRouteArgs>(name);
}

class RequestPermissionsRouteArgs {
  const RequestPermissionsRouteArgs({
    required this.uri,
    this.key,
  });

  final Uri uri;

  final _i13.Key? key;

  @override
  String toString() {
    return 'RequestPermissionsRouteArgs{uri: $uri, key: $key}';
  }
}

/// generated route for
/// [_i4.ListPersonasPage]
class ListPersonasRoute extends _i12.PageRouteInfo<ListPersonasRouteArgs> {
  ListPersonasRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ListPersonasRoute.name,
          args: ListPersonasRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ListPersonasRoute';

  static const _i12.PageInfo<ListPersonasRouteArgs> page =
      _i12.PageInfo<ListPersonasRouteArgs>(name);
}

class ListPersonasRouteArgs {
  const ListPersonasRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ListPersonasRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.InitialPersonasPage]
class InitialPersonasRoute
    extends _i12.PageRouteInfo<InitialPersonasRouteArgs> {
  InitialPersonasRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          InitialPersonasRoute.name,
          args: InitialPersonasRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'InitialPersonasRoute';

  static const _i12.PageInfo<InitialPersonasRouteArgs> page =
      _i12.PageInfo<InitialPersonasRouteArgs>(name);
}

class InitialPersonasRouteArgs {
  const InitialPersonasRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'InitialPersonasRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ViewPersonaPage]
class ViewPersonaRoute extends _i12.PageRouteInfo<ViewPersonaRouteArgs> {
  ViewPersonaRoute({
    required _i14.Persona persona,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ViewPersonaRoute.name,
          args: ViewPersonaRouteArgs(
            persona: persona,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPersonaRoute';

  static const _i12.PageInfo<ViewPersonaRouteArgs> page =
      _i12.PageInfo<ViewPersonaRouteArgs>(name);
}

class ViewPersonaRouteArgs {
  const ViewPersonaRouteArgs({
    required this.persona,
    this.key,
  });

  final _i14.Persona persona;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ViewPersonaRouteArgs{persona: $persona, key: $key}';
  }
}

/// generated route for
/// [_i7.CreatePersonaPage]
class CreatePersonaRoute extends _i12.PageRouteInfo<CreatePersonaRouteArgs> {
  CreatePersonaRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CreatePersonaRoute.name,
          args: CreatePersonaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreatePersonaRoute';

  static const _i12.PageInfo<CreatePersonaRouteArgs> page =
      _i12.PageInfo<CreatePersonaRouteArgs>(name);
}

class CreatePersonaRouteArgs {
  const CreatePersonaRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'CreatePersonaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ImportPersonasPage]
class ImportPersonasRoute extends _i12.PageRouteInfo<ImportPersonasRouteArgs> {
  ImportPersonasRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ImportPersonasRoute.name,
          args: ImportPersonasRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportPersonasRoute';

  static const _i12.PageInfo<ImportPersonasRouteArgs> page =
      _i12.PageInfo<ImportPersonasRouteArgs>(name);
}

class ImportPersonasRouteArgs {
  const ImportPersonasRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ImportPersonasRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.AppsPage]
class AppsRoute extends _i12.PageRouteInfo<void> {
  const AppsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CredentialsPage]
class CredentialsRoute extends _i12.PageRouteInfo<void> {
  const CredentialsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CredentialsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CredentialsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.AppTabs]
class AppTabs extends _i12.PageRouteInfo<void> {
  const AppTabs({List<_i12.PageRouteInfo>? children})
      : super(
          AppTabs.name,
          initialChildren: children,
        );

  static const String name = 'AppTabs';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
