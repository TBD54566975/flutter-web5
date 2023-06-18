import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<String> getMyDid(InAppWebViewController controller) async {
  final response = await controller.callAsyncJavaScript(
      functionBody: 'return window.myDid;');
  return response!.value.toString();
}

Future<String> createARecord(InAppWebViewController controller) async {
  final response = await controller.callAsyncJavaScript(functionBody: '''
window.oneMbyte = new Array(1024 * 1024).join('a');
window.oneHundredMbyte = new Array(101).join(oneMbyte);
window.blob = new Blob([oneHundredMbyte], {type: "text/plain"});
const { record, status } = await window.web5.dwn.records.write({
  data: blob,
  message: {
    schema: "text/plain",
  },
});
delete window.oneMbyte;
delete window.oneHundredMbyte;
delete window.blob;
return JSON.stringify(record.id, status);
''');
  return response!.value.toString();
}

Future<String> getRecords(InAppWebViewController controller) async {
  final response = await controller.callAsyncJavaScript(functionBody: '''
const { records } = await window.web5.dwn.records.query({
  message: {
    filter: {
      schema: "text/plain",
    },
  },
});
return JSON.stringify(records.length);
''');
  return response!.value.toString();
}
