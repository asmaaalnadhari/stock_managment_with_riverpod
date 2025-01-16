import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_management_with_riverpod/db/features/product_management/domain/repositories/product_repository_interface.dart';
import '../../../../../shared/utils/constant.dart';
import '../../../../data_base_helper.dart';
import '../models/product.dart';


class ProductRepository implements IProductRepository {
  final DatabaseHelper _dbHelper;

  ProductRepository(this._dbHelper);

  // Add a new product
  @override
  Future<int> addProduct(String name, double price) async {
    final db = await _dbHelper.database;
    return await db.insert(
      Constants.productsTable,
      {'name': name, 'price': price},
    );
  }

  // Link product to stock with quantity
  @override
  Future<void> linkProductToStock(
      String productId, String stockId, int quantity) async {
    final db = await _dbHelper.database;
    await db.insert(
      Constants.productStockTable,
      {'product_id': productId, 'stock_id': stockId, 'quantity': quantity},
    );
  }

  // Get all products as a List<Product>
  @override
  Future<List<Product>> getAllProducts() async {
    final db = await _dbHelper.database;
    final result = await db.query(Constants.productsTable);
    return result.map((map) => Product.fromMap(map)).toList();
  }

  // Get products by stock ID as a List<Product>
  @override
  Future<List<Product>> getProductsByStock(String stockId) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('''
      SELECT p.id, p.name, p.price
      FROM ${Constants.productsTable} p
      JOIN ${Constants.productStockTable} ps ON p.id = ps.product_id
      WHERE ps.stock_id = ?
    ''', [stockId]);
    return result.map((map) => Product.fromMap(map)).toList();
  }

  @override
  Future<bool> deleteProductIfNotInInvoice(String productId) async {
    final db = await _dbHelper.database;

    // Check if the product is linked to any invoice
    if (await _isProductLinkedToInvoice(db, productId)) {
      // Product is connected to an invoice, cannot delete
      return false;
    }

    // Delete the product from the products table
    await db.delete(
      Constants.productsTable,
      where: '${Constants.colProductId} = ?',
      whereArgs: [productId],
    );

    // Remove associated entries from product_stock table
    await db.delete(
      Constants.productStockTable,
      where: '${Constants.colProductStockProductId} = ?',
      whereArgs: [productId],
    );

    return true;
  }

  // Helper method to check if a product is linked to any invoice
  Future<bool> _isProductLinkedToInvoice(Database db, String productId) async {
    final result = await db.rawQuery('''
    SELECT COUNT(*) as count
    FROM ${Constants.invoiceProductsTable}
    WHERE ${Constants.colProductStockProductId} = ?
  ''', [productId]);

    // Cast the count to an integer
    final count = (result.first['count'] as int?) ?? 0;
    return count > 0;
  }

  @override
  Future<void> updateProduct(
      String productId, String name, double price) async {
    final db = await _dbHelper.database;
    await db.update(
      Constants.productsTable,
      {'name': name, 'price': price},
      where: 'id = ?',
      whereArgs: [productId],
    );
  }

}

