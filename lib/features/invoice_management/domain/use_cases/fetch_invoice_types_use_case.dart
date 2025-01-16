import '../../data/models/invoice_type.dart';
import '../repositories/invoice_repository_interface.dart';

class FetchInvoiceTypesUseCase {
  final IInvoiceRepository repository;

  FetchInvoiceTypesUseCase(this.repository);

  Future<List<InvoiceType>> call() async {
    return await repository.fetchAllInvoiceTypes();
  }
}
