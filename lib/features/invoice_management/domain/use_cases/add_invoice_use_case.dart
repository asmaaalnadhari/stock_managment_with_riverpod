import '../../data/models/invoice_product.dart';
import '../repositories/invoice_repository_interface.dart';

class AddInvoiceUseCase {
  final IInvoiceRepository repository;

  AddInvoiceUseCase(this.repository);

  Future<void> call(String typeId, DateTime date, List<InvoiceProduct> products) async {
    await repository.addInvoice(typeId, date, products);
  }
}
