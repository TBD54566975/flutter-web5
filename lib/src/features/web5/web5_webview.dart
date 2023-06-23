import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/features/web5/web5_providers.dart';

class Web5WebView extends HookConsumerWidget {
  final logger = Logger('Web5WebView');
  Web5WebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InAppWebView(
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          transparentBackground: true,
        ),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        ref.read(web5Controller.notifier).state = controller;
        controller.loadFile(assetFilePath: 'assets/index.html');
      },
      onLoadStop: (controller, url) async {
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/web5.js');
        await controller.injectJavascriptFileFromAsset(
            assetFilePath: 'assets/scripts.js');
        await controller.callAsyncJavaScript(functionBody: '''
const { web5, did: myDid } = await window.Web5.Web5.connect();
window.web5 = web5;
window.myDid = myDid;
''');
      },
      onConsoleMessage: (controller, consoleMessage) {
        logger.info(consoleMessage);
      },
      onLoadHttpError: (controller, url, statusCode, description) {
        logger.severe('HTTP error $statusCode: $description');
      },
      iosOnWebContentProcessDidTerminate: (controller) => logger.severe('Dead'),
    );
  }
}
