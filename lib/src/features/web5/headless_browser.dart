import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HeadlessBrowser {
  HeadlessInAppWebView? _headlessWebView;

  void start() async {
    _headlessWebView?.dispose();
    _headlessWebView = HeadlessInAppWebView(
      onWebViewCreated: (InAppWebViewController controller) {
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
    );
    _headlessWebView?.run();
  }

  void stop() {
    _headlessWebView?.dispose();
  }

  Future<CallAsyncJavaScriptResult?> callAsync(
      {required String functionBody,
      Map<String, dynamic> arguments = const <String, dynamic>{},
      ContentWorld? contentWorld}) async {
    return _headlessWebView?.webViewController.callAsyncJavaScript(
        functionBody: functionBody,
        arguments: arguments,
        contentWorld: contentWorld);
  }
}
