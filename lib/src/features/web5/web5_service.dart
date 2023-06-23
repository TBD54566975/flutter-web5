import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/features/web5/web5_js_calls.dart';

final web5Provider = Provider<Web5Service>((ref) {
  return Web5Service();
});

class Web5Service {
  final logger = Logger('Web5Service');
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
      },
      onConsoleMessage: (controller, consoleMessage) {
        logger.info(consoleMessage);
      },
    );
    _headlessWebView?.run();
  }

  void stop() {
    _headlessWebView?.dispose();
  }

  Future<String?> getMyDid() async {
    final response = await _headlessWebView?.webViewController
        .callAsyncJavaScript(functionBody: Web5Js.myDid);
    return response?.value.toString();
  }

  Future<String?> createARecord() async {
    final response = await _headlessWebView?.webViewController
        .callAsyncJavaScript(functionBody: Web5Js.createRecord());
    return response?.value.toString();
  }

  Future<String?> getRecords() async {
    final response = await _headlessWebView?.webViewController
        .callAsyncJavaScript(functionBody: Web5Js.getRecords());
    return response?.value.toString();
  }

  Future<String?> createDid() async {
    final response = await _headlessWebView?.webViewController
        .callAsyncJavaScript(functionBody: Web5Js.createDid);
    return response?.value.toString();
  }
}
