import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stock_management_with_riverpod/db/configs/app_configs.dart';
import 'package:stock_management_with_riverpod/db/tables/product_stock_table.dart';
import 'tables/products_table.dart';
import 'tables/stocks_table.dart';
import 'tables/invoices_table.dart';
import 'tables/invoice_items_table.dart';
import 'tables/invoice_types_table.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  static DatabaseHelper get instance => _instance;

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }



  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,AppConfigs.dbName);

    return await openDatabase(
      path,
      version: AppConfigs.dbVersion,
      onCreate: (db, version) async {
        await db.execute(ProductsTable.createTable);
        await db.execute(StocksTable.createTable);
        await db.execute(ProductStockTable.createTable);
        await db.execute(InvoiceTypesTable.createTable);
        await db.execute(InvoicesTable.createTable);
        await db.execute(InvoiceItemsTable.createTable);

        // Insert predefined data into invoice_types and Stock tables
        await _insertDefaultInvoiceTypes(db);
        await _insertDefaultStock(db);
      },
    );
  }

  Future<void> _insertDefaultInvoiceTypes(Database db) async {
    await db.insert(InvoiceTypesTable.tableName, {'name': 'مبيعات'});
    await db.insert(InvoiceTypesTable.tableName, {'name': 'مشتريات'});
  }

  Future<void> _insertDefaultStock(Database db) async {
     await db.insert(StocksTable.tableName, {'name': 'المخزن الرئيسي'});
  }

}
