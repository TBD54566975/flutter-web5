// import 'package:uni_links/uni_links.dart';

import 'package:logging/logging.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinks {
  final logger = Logger('DeepLinks');

  Future<void> initDeepLinks() async {
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      logger.info('Got a deep link: $initialLink');
    }
    uriLinkStream.listen((Uri? uri) async {
      logger.info('Got a deep link: ${uri?.scheme}');
      logger.info('Got a deep link: $uri');
      final Uri url = Uri.parse('https://jttz2d.csb.app#mykey=123');
      logger.info(url);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }, onError: (err) {
      logger.severe('Got an error! $err');
    });
  }
}
