import '../../data/models/invoice_product.dart';
import '../repositories/invoice_repository_interface.dart';

class FetchInvoiceProductsUseCase {
  final IInvoiceRepository repository;

  FetchInvoiceProductsUseCase(this.repository);

  Future<List<InvoiceProduct>> call(String invoiceId) async {
    return await repository.fetchInvoiceProducts(invoiceId);
  }
}
