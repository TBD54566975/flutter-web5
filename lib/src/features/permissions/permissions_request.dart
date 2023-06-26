import 'dart:convert';

class PermissionsRequest {
  final Map<String, dynamic> descriptor;
  final Map<String, dynamic> authorization;

  PermissionsRequest({required this.descriptor, required this.authorization});

  factory PermissionsRequest.fromJson(Map<String, dynamic> json) {
    return PermissionsRequest(
      descriptor: json['descriptor'],
      authorization: json['authorization'],
    );
  }

  factory PermissionsRequest.fromBase64(String base64String) {
    List<int> decodedBytes = base64.decode(base64String);
    String decodedString = utf8.decode(decodedBytes);
    Map<String, dynamic> decodedMap = jsonDecode(decodedString);
    return PermissionsRequest.fromJson(decodedMap);
  }

  Map<String, dynamic> toJson() => {
        'descriptor': descriptor,
        'authorization': authorization,
      };
}
