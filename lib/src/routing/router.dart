import 'package:auto_route/auto_route.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppTabs.page, initial: true, children: [
          AutoRoute(page: PersonasRoute.page, initial: true),
          AutoRoute(page: AppsRoute.page),
          AutoRoute(page: CredentialsRoute.page),
          AutoRoute(page: ContactsRoute.page),
        ]),
        // AutoRoute(
        //   page: AppTabs.route,
        //   children: [
        //     AutoRoute(
        //       name: 'HomeRouter',
        //       page: EmptyRouterPage,
        //       children: [
        //         AutoRoute(page: HomePage, initial: true),
        //         AutoRoute(page: BenefitPage),
        //       ],
        //     ),
        //     AutoRoute(
        //       name: 'SupportRouter',
        //       page: MessagesPage,
        //     ),
        //     AutoRoute(
        //       name: 'ProvidersRouter',
        //       page: EmptyRouterPage,
        //       children: [
        //         AutoRoute(page: ProvidersSearchPage, initial: true),
        //         AutoRoute(page: ProvidersSearchResultsPage),
        //         AutoRoute(page: ProviderDetailPage),
        //       ],
        //     ),
        //     AutoRoute(
        //       name: 'AccountRouter',
        //       page: EmptyRouterPage,
        //       children: [
        //         AutoRoute(page: AccountPage, initial: true),
        //         AutoRoute(page: ProfilePage),
        //       ],
        //     )
        //   ],
        // ),
      ];
}

// routes: <AutoRoute>[
//   AutoRoute(
//     page: HomeTabPage,
//     guards: [AuthGuard],
//     children: [
//       AutoRoute(
//         name: 'HomeRouter',
//         page: EmptyRouterPage,
//         children: [
//           AutoRoute(page: HomePage, initial: true),
//           AutoRoute(page: BenefitPage),
//         ],
//       ),
//       AutoRoute(
//         name: 'SupportRouter',
//         page: MessagesPage,
//       ),
//       AutoRoute(
//         name: 'ProvidersRouter',
//         page: EmptyRouterPage,
//         children: [
//           AutoRoute(page: ProvidersSearchPage, initial: true),
//           AutoRoute(page: ProvidersSearchResultsPage),
//           AutoRoute(page: ProviderDetailPage),
//         ],
//       ),
//       AutoRoute(
//         name: 'AccountRouter',
//         page: EmptyRouterPage,
//         children: [
//           AutoRoute(page: AccountPage, initial: true),
//           AutoRoute(page: ProfilePage),
//         ],
//       )
//     ],
//   ),
// ],
