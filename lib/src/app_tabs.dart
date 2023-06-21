import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/web5/web5_webview.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';

@RoutePage()
class AppTabs extends HookConsumerWidget {
  const AppTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        PersonasRoute(),
        AppsRoute(),
        CredentialsRoute(),
        ContactsRoute()
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: Stack(children: [const Web5WebView(), child]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet), label: 'Personas'),
                BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Apps'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.key), label: 'Credentials'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contacts), label: 'Contacts'),
              ],
            ));
      },
    );
  }
}
