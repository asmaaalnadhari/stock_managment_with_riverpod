import 'package:stock_management_with_riverpod/shared/data/modles/base_entity.dart';

class Stock extends BaseEntity {
  final String id;
  final String name;

  Stock({
    required this.id,
    required this.name,
  });

  // Convert a Map (from the database) to a Stock object
  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      id: map['id'].toString(),
      name: map['name'],
    );
  }

  // Convert a Stock object to a Map (for the database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  // TODO: implement pk
  String? get pk => id;

  @override
  // TODO: implement title
  String? get title => name;
}