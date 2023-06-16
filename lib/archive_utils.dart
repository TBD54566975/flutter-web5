import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<String> copyHtmlArchiveFromAssetToDocumentsFolder() async {
  try {
    Directory docsDir;
    if (Platform.isIOS) {
      docsDir = await getApplicationDocumentsDirectory();
    } else {
      docsDir = await getApplicationSupportDirectory();
    }
    String path = docsDir.path;
    String filename = 'web5.zip';

    File archiveFile = File('$path/$filename');
    var bytes = await rootBundle.load("assets/$filename");
    final buffer = bytes.buffer;
    var archiveBytes = await archiveFile.writeAsBytes(
        buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    var bytes2 = archiveBytes.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes2);

    // Unzip the HTML zip into the documents path
    for (var file in archive) {
      var filename = '$path/${file.name}';
      if (file.isFile) {
        var outFile = File(filename);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }

    archiveFile.deleteSync();

    return '$path/index.html';
  } on Exception catch (e) {
    print(e);
    rethrow;
  }
}
