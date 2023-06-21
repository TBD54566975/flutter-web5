import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wallet_exp/src/features/web5/web5_calls.dart';

class IAWVPage extends StatefulWidget {
  const IAWVPage({super.key});

  @override
  State<IAWVPage> createState() => _IAWVPageState();
}

class _IAWVPageState extends State<IAWVPage> {
  final GlobalKey webViewKey = GlobalKey();

  late InAppWebViewController controller;
  String url = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('InAppWebView Example'),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: InAppWebView(
                        // initialFile: 'assets/index.html',
                        initialOptions: InAppWebViewGroupOptions(),
                        onWebViewCreated: (InAppWebViewController controller) {
                          this.controller = controller;
                          controller.loadFile(
                              assetFilePath: 'assets/index.html');
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
                        onLoadHttpError:
                            (controller, url, statusCode, description) => print(
                          'HTTP error $statusCode: $description',
                        ),
                        onConsoleMessage: (controller, consoleMessage) => print(
                          'console message: ${consoleMessage.messageLevel} : ${consoleMessage.message}',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final did = await getMyDid(controller);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(did)),
                );
                print(did);
              },
              child: const Icon(Icons.perm_identity),
            ),
          );
        },
      ),
    );
  }
}
