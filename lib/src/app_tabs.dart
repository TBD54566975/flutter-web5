import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';

@RoutePage()
class AppTabs extends HookConsumerWidget {
  const AppTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: [
        ListPersonasRoute(),
        const AppsRoute(),
        const CredentialsRoute(),
        const ContactsRoute()
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              selectedLabelStyle: Theme.of(context).textTheme.labelLarge,
              unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
              items: [
                _bottomNavItem(context, Icons.wallet, 'Personas'),
                _bottomNavItem(context, Icons.apps, 'Apps'),
                _bottomNavItem(context, Icons.key, 'Credentials'),
                _bottomNavItem(context, Icons.contacts, 'Contacts'),
              ],
            ));
      },
    );
  }

  BottomNavigationBarItem _bottomNavItem(
      BuildContext context, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
