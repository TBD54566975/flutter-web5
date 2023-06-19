import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wallet_exp/web5_calls.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';


class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late InAppWebViewController controller;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  StreamSubscription? _sub;

  @override
  void dispose() {
    super.dispose();
  }


  void _initDeepLinkListener() async {
    _sub = getUriLinksStream().listen((Uri? uri) {
      if (uri != null) {
        // Handle your deep link
        print('Got a deep link: $uri');
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      print('Failed to open deep link: $err');
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Wallet App",
      )),
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              this.controller = controller;
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
              // final snackBar = SnackBar(
              //   content: Text('Console Message: ${consoleMessage.message}'),
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              print(consoleMessage);
            },
            onLoadHttpError: (controller, url, statusCode, description) {
              print('HTTP error $statusCode: $description');
            },
            iosOnWebContentProcessDidTerminate: (controller) => print('Dead'),
          ),
          Container(color: Colors.black),
          SafeArea(
            child: Column(
              children: <Widget>[
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        textController.clear();
                        final result = await getMyDid(controller);
                        textController.text = result;
                      },
                      child: const Text("Get my DID")),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        textController.clear();
                        final result = await createARecord(controller);
                        textController.text = result;
                      },
                      child: const Text("Create a Record")),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        textController.clear();
                        final result = await getRecords(controller);
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
        ],
      ),
    );
  }
}
