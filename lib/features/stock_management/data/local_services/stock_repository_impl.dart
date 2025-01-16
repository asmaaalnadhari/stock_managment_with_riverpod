import 'package:stock_management_with_riverpod/shared/utils/constant.dart';

import '../../../../db/data_base_helper.dart';
import '../../domain/repositories/stock_repository_interface.dart';
import '../models/product_stock_availability.dart';
import '../models/stock.dart';

class StockRepository implements IStockRepository {
  final DatabaseHelper _dbHelper;

  StockRepository(this._dbHelper);

  // Add a new stock
  @override
  Future<int> addStock(String name) async {
    final db = await _dbHelper.database;
    return await db.insert(Constants.stocksTable, {'name': name});
  }

  // Update stock data
  @override
  Future<void> updateStock(String stockId, String name) async {
    final db = await _dbHelper.database;
    await db.update(
      Constants.stocksTable,
      {'name': name},
      where: '${Constants.colStockId} = ?',
      whereArgs: [stockId],
    );
  }

  // Fetch all stocks
  @override
  Future<List<Stock>> fetchStocks() async {
    final db = await _dbHelper.database;
    final result = await db.query(Constants.stocksTable);
    return result.map((map) => Stock.fromMap(map)).toList();
  }

  // Delete stock if it has no products or processes
  @override
  Future<bool> deleteStockIfEmpty(String stockId) async {
    final db = await _dbHelper.database;

    // Check if the stock has any associated products in product_stock table
    final productCheck = await db.rawQuery('''
      SELECT COUNT(*) as count
      FROM ${Constants.productStockTable}
      where: '${Constants.colProductStockId} = ?',
    ''', [stockId]);

    final hasProducts = (productCheck.first['count'] as int?) ?? 0 > 0;
    if (hasProducts==true) {
      return false; // Cannot delete stock with associated products
    }

    // If no products, delete the stock
    await db.delete(
      Constants.stocksTable,
      where: '${Constants.colStockId} = ?',
      whereArgs: [stockId],
    );

    return true;
  }


  @override
  Future<List<ProductStockAvailability>> fetchProductStockAvailability() async {
    final db = await _dbHelper.database;

    // Query to get product-stock pairs with quantities
    final result = await db.rawQuery('''
      SELECT 
        ps.${Constants.colProductStockProductId} AS product_id,
        p.${Constants.colProductName} AS product_name,
        ps.${Constants.colProductStockStockId} AS stock_id,
        s.${Constants.colStockName} AS stock_name,
        ps.${Constants.colProductStockQuantity} AS quantity
      FROM ${Constants.productStockTable} ps
      JOIN ${Constants.productsTable} p ON ps.${Constants.colProductStockProductId} = p.${Constants.colProductId}
      JOIN ${Constants.stocksTable} s ON ps.${Constants.colProductStockStockId} = s.${Constants.colStockId}
    ''');

    // Map query results to ProductStockAvailability objects
    return result.map((row) => ProductStockAvailability.fromMap(row)).toList();
  }

}
