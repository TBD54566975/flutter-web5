// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:wallet_exp/src/app_tabs.dart' as _i7;
import 'package:wallet_exp/src/features/apps/apps_page.dart' as _i5;
import 'package:wallet_exp/src/features/contacts/contacts_page.dart' as _i1;
import 'package:wallet_exp/src/features/credentials/credentials_page.dart'
    as _i6;
import 'package:wallet_exp/src/features/personas/create_persona_page.dart'
    as _i10;
import 'package:wallet_exp/src/features/personas/import_personas_page.dart'
    as _i9;
import 'package:wallet_exp/src/features/personas/initial_personas_page.dart'
    as _i8;
import 'package:wallet_exp/src/features/personas/list_personas_page.dart'
    as _i3;
import 'package:wallet_exp/src/features/personas/view_persona_page.dart' as _i4;
import 'package:wallet_exp/src/features/welcome/welcome_page.dart' as _i2;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    ContactsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContactsPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    ListPersonasRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ListPersonasPage(),
      );
    },
    ViewPersonaRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPersonaRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ViewPersonaPage(
          title: args.title,
          did: args.did,
          key: args.key,
        ),
      );
    },
    AppsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AppsPage(),
      );
    },
    CredentialsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CredentialsPage(),
      );
    },
    AppTabs.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AppTabs(),
      );
    },
    InitialPersonasRoute.name: (routeData) {
      final args = routeData.argsAs<InitialPersonasRouteArgs>(
          orElse: () => const InitialPersonasRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.InitialPersonasPage(key: args.key),
      );
    },
    ImportPersonasRoute.name: (routeData) {
      final args = routeData.argsAs<ImportPersonasRouteArgs>(
          orElse: () => const ImportPersonasRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ImportPersonasPage(key: args.key),
      );
    },
    CreatePersonaRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePersonaRouteArgs>(
          orElse: () => const CreatePersonaRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.CreatePersonaPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactsPage]
class ContactsRoute extends _i11.PageRouteInfo<void> {
  const ContactsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
  const WelcomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ListPersonasPage]
class ListPersonasRoute extends _i11.PageRouteInfo<void> {
  const ListPersonasRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ListPersonasRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListPersonasRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ViewPersonaPage]
class ViewPersonaRoute extends _i11.PageRouteInfo<ViewPersonaRouteArgs> {
  ViewPersonaRoute({
    required String title,
    required String did,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ViewPersonaRoute.name,
          args: ViewPersonaRouteArgs(
            title: title,
            did: did,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPersonaRoute';

  static const _i11.PageInfo<ViewPersonaRouteArgs> page =
      _i11.PageInfo<ViewPersonaRouteArgs>(name);
}

class ViewPersonaRouteArgs {
  const ViewPersonaRouteArgs({
    required this.title,
    required this.did,
    this.key,
  });

  final String title;

  final String did;

  final _i12.Key? key;

  @override
  String toString() {
    return 'ViewPersonaRouteArgs{title: $title, did: $did, key: $key}';
  }
}

/// generated route for
/// [_i5.AppsPage]
class AppsRoute extends _i11.PageRouteInfo<void> {
  const AppsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CredentialsPage]
class CredentialsRoute extends _i11.PageRouteInfo<void> {
  const CredentialsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CredentialsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CredentialsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AppTabs]
class AppTabs extends _i11.PageRouteInfo<void> {
  const AppTabs({List<_i11.PageRouteInfo>? children})
      : super(
          AppTabs.name,
          initialChildren: children,
        );

  static const String name = 'AppTabs';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.InitialPersonasPage]
class InitialPersonasRoute
    extends _i11.PageRouteInfo<InitialPersonasRouteArgs> {
  InitialPersonasRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          InitialPersonasRoute.name,
          args: InitialPersonasRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'InitialPersonasRoute';

  static const _i11.PageInfo<InitialPersonasRouteArgs> page =
      _i11.PageInfo<InitialPersonasRouteArgs>(name);
}

class InitialPersonasRouteArgs {
  const InitialPersonasRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'InitialPersonasRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ImportPersonasPage]
class ImportPersonasRoute extends _i11.PageRouteInfo<ImportPersonasRouteArgs> {
  ImportPersonasRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ImportPersonasRoute.name,
          args: ImportPersonasRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportPersonasRoute';

  static const _i11.PageInfo<ImportPersonasRouteArgs> page =
      _i11.PageInfo<ImportPersonasRouteArgs>(name);
}

class ImportPersonasRouteArgs {
  const ImportPersonasRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ImportPersonasRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.CreatePersonaPage]
class CreatePersonaRoute extends _i11.PageRouteInfo<CreatePersonaRouteArgs> {
  CreatePersonaRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CreatePersonaRoute.name,
          args: CreatePersonaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreatePersonaRoute';

  static const _i11.PageInfo<CreatePersonaRouteArgs> page =
      _i11.PageInfo<CreatePersonaRouteArgs>(name);
}

class CreatePersonaRouteArgs {
  const CreatePersonaRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'CreatePersonaRouteArgs{key: $key}';
  }
}
