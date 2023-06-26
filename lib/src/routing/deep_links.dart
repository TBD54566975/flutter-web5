import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';

class DeepLinks extends HookConsumerWidget {
  final logger = Logger('DeepLinks');
  final Widget widget;

  DeepLinks({required this.widget, super.key});

  Future<void> initInitialUri() async {
    logger.info('initInitialUri');
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      logger.info('Got a deep link: $initialLink');
    }
    return;
  }

  Future<void> initIncomingUris(BuildContext context) async {
    logger.info('initIncomingUris');
    uriLinkStream.listen((Uri? uri) async {
      logger.info('Got a deep scheme: ${uri?.scheme}');
      logger.info('Got a deep host: ${uri?.host}');
      logger.info('Got a deep path: ${uri?.path}');
      logger.info('Got a deep params: ${uri?.queryParameters}');
      if (uri != null) {
        Future.delayed(const Duration(milliseconds: 200)).then((value) {
          context.router.push(RequestPermissionsRoute(uri: uri));
        });
      }
    }, onError: (err) {
      logger.severe('Got an error! $err');
    });

    return;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      initInitialUri();
      initIncomingUris(context);

      return null;
    }, const []);

    return widget;
  }
}

// class DeepLinks {
//   final logger = Logger('DeepLinks');

//   Future<void> initDeepLinks() async {
//     final initialLink = await getInitialLink();
//     if (initialLink != null) {
//       logger.info('Got a deep link: $initialLink');
//     }
//     uriLinkStream.listen((Uri? uri) async {
//       logger.info('Got a deep link: ${uri?.scheme}');
//       logger.info('Got a deep link: $uri');
//       final Uri url = Uri.parse('https://jttz2d.csb.app#mykey=123');
//       logger.info(url);
//       if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//         throw Exception('Could not launch $url');
//       }
//     }, onError: (err) {
//       logger.severe('Got an error! $err');
//     });
//   }
// }
