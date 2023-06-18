import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wallet_exp/web5_calls.dart';

class AppHeadless extends StatefulWidget {
  const AppHeadless({super.key});

  @override
  _AppHeadlessState createState() => _AppHeadlessState();
}

class _AppHeadlessState extends State<AppHeadless> {
  HeadlessInAppWebView? headlessWebView;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    headlessWebView = HeadlessInAppWebView(
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
        final snackBar = SnackBar(
          content: Text('Console Message: ${consoleMessage.message}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
    headlessWebView?.run();
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Wallet App",
      )),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    textController.clear();
                    final result =
                        await getMyDid(headlessWebView!.webViewController);
                    textController.text = result;
                  },
                  child: const Text("Get my DID")),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    textController.clear();
                    final result =
                        await createARecord(headlessWebView!.webViewController);
                    textController.text = result;
                  },
                  child: const Text("Create a Record")),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    textController.clear();
                    final result =
                        await getRecords(headlessWebView!.webViewController);
                    textController.text = result;
                  },
                  child: const Text("Get records")),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  controller: textController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
