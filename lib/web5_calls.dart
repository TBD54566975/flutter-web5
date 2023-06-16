import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<String> getMyDid(InAppWebViewController controller) async {
  final response = await controller.callAsyncJavaScript(functionBody: '''
    return window.myDid;
  ''');
  return response.toString();
}
