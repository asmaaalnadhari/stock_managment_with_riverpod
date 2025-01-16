class InvoiceType {
  final String id;
  final String name;

  InvoiceType({
    required this.id,
    required this.name,
  });

  factory InvoiceType.fromMap(Map<String, dynamic> map) {
    return InvoiceType(
      id: map['id'].toString(),
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
