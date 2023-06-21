import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/web5/web5_providers.dart';

class AppWebView extends StatefulHookConsumerWidget {
  const AppWebView({super.key});

  @override
  AppWebViewState createState() => AppWebViewState();
}

class AppWebViewState extends ConsumerState<AppWebView> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(web5Controller);

    return Stack(
      children: [
        InAppWebView(
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
            print(consoleMessage);
          },
          onLoadHttpError: (controller, url, statusCode, description) {
            print('HTTP error $statusCode: $description');
          },
          iosOnWebContentProcessDidTerminate: (controller) => print('Dead'),
        ),
        // Container(color: Theme.of(context).colorScheme.background),
      ],
    );
  }
}
