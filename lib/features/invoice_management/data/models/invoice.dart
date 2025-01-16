class Invoice {
  final String id;
  final String typeId;
  final DateTime date;

  Invoice({
    required this.id,
    required this.typeId,
    required this.date,
  });

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'].toString(),
      typeId: map['type_id'].toString(),
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type_id': typeId,
      'date': date.toIso8601String(),
    };
  }
}
