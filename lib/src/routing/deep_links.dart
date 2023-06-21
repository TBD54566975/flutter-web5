// import 'package:uni_links/uni_links.dart';

import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinks {
  Future<void> initDeepLinks() async {
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      // Handle your deep link
      print('Got a deep link: $initialLink');
    }
    uriLinkStream.listen((Uri? uri) async {
      // Use the uri and warn the user, if it is not correct
      print('Got a deep link: ${uri?.scheme}');
      print('Got a deep link: $uri');
      final Uri url = Uri.parse('https://jttz2d.csb.app#mykey=123');
      print(url);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      print('Got an error! $err');
    });
  }
}
