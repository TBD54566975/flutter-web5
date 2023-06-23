// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:wallet_exp/src/app_tabs.dart' as _i7;
import 'package:wallet_exp/src/features/apps/apps_page.dart' as _i5;
import 'package:wallet_exp/src/features/contacts/contacts_page.dart' as _i1;
import 'package:wallet_exp/src/features/credentials/credentials_page.dart'
    as _i6;
import 'package:wallet_exp/src/features/personas/create_persona_page.dart'
    as _i4;
import 'package:wallet_exp/src/features/personas/list_personas_page.dart'
    as _i2;
import 'package:wallet_exp/src/features/personas/view_persona_page.dart' as _i3;

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
    ListPersonasRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ListPersonasPage(),
      );
    },
    ViewPersonaRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ViewPersonaPage(),
      );
    },
    CreatePersonaRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePersonaRouteArgs>(
          orElse: () => const CreatePersonaRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CreatePersonaPage(key: args.key),
      );
    },
    AppsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AppsPage(),
      );
    },
    CredentialsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CredentialsPage(),
      );
    },
    AppTabs.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AppTabs(),
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
/// [_i2.ListPersonasPage]
class ListPersonasRoute extends _i8.PageRouteInfo<void> {
  const ListPersonasRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ListPersonasRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListPersonasRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ViewPersonaPage]
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
/// [_i4.CreatePersonaPage]
class CreatePersonaRoute extends _i8.PageRouteInfo<CreatePersonaRouteArgs> {
  CreatePersonaRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CreatePersonaRoute.name,
          args: CreatePersonaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreatePersonaRoute';

  static const _i8.PageInfo<CreatePersonaRouteArgs> page =
      _i8.PageInfo<CreatePersonaRouteArgs>(name);
}

class CreatePersonaRouteArgs {
  const CreatePersonaRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'CreatePersonaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AppsPage]
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
/// [_i6.CredentialsPage]
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
/// [_i7.AppTabs]
class AppTabs extends _i8.PageRouteInfo<void> {
  const AppTabs({List<_i8.PageRouteInfo>? children})
      : super(
          AppTabs.name,
          initialChildren: children,
        );

  static const String name = 'AppTabs';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
