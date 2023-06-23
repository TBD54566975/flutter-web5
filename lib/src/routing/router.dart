import 'package:auto_route/auto_route.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppTabs.page,
          initial: true,
          children: [
            AutoRoute(page: ListPersonasRoute.page, initial: true),
            AutoRoute(page: AppsRoute.page),
            AutoRoute(page: CredentialsRoute.page),
            AutoRoute(page: ContactsRoute.page),
          ],
        ),
        AutoRoute(page: CreatePersonaRoute.page, fullscreenDialog: true),
        AutoRoute(page: ViewPersonaRoute.page),
      ];
}
