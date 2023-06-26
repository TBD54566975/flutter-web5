class Did {
  final String id;
  final String internalId;
  final Map<String, dynamic> didDocument;
  final List<Map<String, dynamic>> methodData;
  final List<Map<String, dynamic>> keys;

  Did({
    required this.id,
    required this.internalId,
    required this.didDocument,
    required this.methodData,
    required this.keys,
  });

  factory Did.fromJson(Map<String, dynamic> json) => Did(
        id: json['id'],
        internalId: json['internalId'],
        didDocument: json['didDocument'],
        methodData: List<Map<String, dynamic>>.from(json['methodData']),
        keys: List<Map<String, dynamic>>.from(json['keys']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'internalId': internalId,
        'didDocument': didDocument,
        'methodData': methodData,
        'keys': keys,
      };

  @override
  String toString() {
    return 'Did{id: $id, internalId: $internalId, didDocument: $didDocument, methodData: $methodData, keys: $keys}';
  }
}
