import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final didBoxProvider =
    Provider<Box<dynamic>>((ref) => throw UnimplementedError());

Future<Box<dynamic>> createDidBox() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey =
      await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(
        key: 'encryptionKey', value: base64UrlEncode(key));
  }

  final key = await secureStorage.read(key: 'encryptionKey');
  if (key == null) {
    throw Exception('Encryption key not found');
  }

  var encryptionKey = base64Url.decode(key);

  return Hive.openBox<dynamic>(
    'encryptedBox',
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
}
