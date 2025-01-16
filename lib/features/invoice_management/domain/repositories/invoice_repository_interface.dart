import '../../data/models/invoice.dart';
import '../../data/models/invoice_product.dart';
import '../../data/models/invoice_type.dart';

abstract class IInvoiceRepository {
  Future<List<InvoiceType>> fetchAllInvoiceTypes();
  Future<void> addInvoice(String typeId, DateTime date, List<InvoiceProduct> products);
  Future<List<Invoice>> fetchAllInvoices();
  Future<List<InvoiceProduct>> fetchInvoiceProducts(String invoiceId);

}
