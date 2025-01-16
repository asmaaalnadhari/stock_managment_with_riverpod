import '../../../../db/data_base_helper.dart';
import '../../../../shared/utils/constant.dart';
import '../../domain/repositories/invoice_repository_interface.dart';
import '../models/invoice.dart';
import '../models/invoice_product.dart';
import '../models/invoice_type.dart';

class InvoiceRepository implements IInvoiceRepository {
  final DatabaseHelper _dbHelper;

  InvoiceRepository(this._dbHelper);

  @override
  Future<List<InvoiceType>> fetchAllInvoiceTypes() async {
    final db = await _dbHelper.database;
    final result = await db.query(Constants.invoiceTypesTable);
    return result.map((map) => InvoiceType.fromMap(map)).toList();
  }

  @override
  Future<void> addInvoice(String typeId, DateTime date, List<InvoiceProduct> products) async {
    final db = await _dbHelper.database;

    await db.transaction((txn) async {
      // Add the invoice
      final invoiceId = await txn.insert(Constants.invoicesTable, {
        Constants.colInvoiceTypeId: typeId,
        Constants.colInvoiceDate: date.toIso8601String(),
      });

      // Process products in the invoice
      for (final product in products) {
        final productId = product.productId;
        final stockId = product.stockId;
        final quantity = product.quantity;
        final price = product.price;

        // Add the product to the invoice_products table
        await txn.insert(Constants.invoiceProductsTable, {
          Constants.colInvoiceProductInvoiceId: invoiceId,
          Constants.colInvoiceProductProductId: productId,
          Constants.colInvoiceProductStockId: stockId,
          Constants.colInvoiceProductQuantity: quantity,
          Constants.colInvoiceProductPrice: price,
        });

        // Check stock entry
        final stockEntry = await txn.rawQuery('''
        SELECT ${Constants.colProductStockQuantity} FROM ${Constants.productStockTable}
        WHERE ${Constants.colProductStockProductId} = ? AND ${Constants.colProductStockStockId} = ?
      ''', [productId, stockId]);

        if (stockEntry.isEmpty) {
          throw Exception('لم يتم العثور على بيانات المخزون للمنتج $productId في المخزن $stockId.');
        }

        final currentQuantity = stockEntry.first[Constants.colProductStockQuantity] as int;

        // Update product stock based on invoice type
        switch (typeId) {
          case '1': // Sales Invoice
            if (currentQuantity < quantity) {
              throw Exception('الكمية غير كافية للمنتج $productId في المخزن $stockId.');
            }
            await txn.update(
              Constants.productStockTable,
              {Constants.colProductStockQuantity: currentQuantity - quantity},
              where: '${Constants.colProductStockProductId} = ? AND ${Constants.colProductStockStockId} = ?',
              whereArgs: [productId, stockId],
            );
            break;

          case '2': // Purchase Invoice
            await txn.update(
              Constants.productStockTable,
              {Constants.colProductStockQuantity: currentQuantity + quantity},
              where: '${Constants.colProductStockProductId} = ? AND ${Constants.colProductStockStockId} = ?',
              whereArgs: [productId, stockId],
            );
            break;

          default:
            throw Exception('نوع الفاتورة غير معروف: $typeId.');
        }
      }
    });
  }
  @override
  Future<List<Invoice>> fetchAllInvoices() async {
    final db = await _dbHelper.database;

    final result = await db.query(
      Constants.invoicesTable,
      columns: [
        Constants.colInvoiceId,
        Constants.colInvoiceTypeId,
        Constants.colInvoiceDate,
      ],
    );

    return result.map((map) => Invoice.fromMap(map)).toList();
  }


  @override
  Future<List<InvoiceProduct>> fetchInvoiceProducts(String invoiceId) async {
    final db = await _dbHelper.database;

    final result = await db.query(
      Constants.invoiceProductsTable,
      columns: [
        Constants.colInvoiceProductId,
        Constants.colInvoiceProductInvoiceId,
        Constants.colInvoiceProductProductId,
        Constants.colInvoiceProductStockId,
        Constants.colInvoiceProductQuantity,
        Constants.colInvoiceProductPrice,
      ],
      where: '${Constants.colInvoiceProductInvoiceId} = ?',
      whereArgs: [invoiceId],
    );

    return result.map((map) => InvoiceProduct.fromMap(map)).toList();
  }
}
