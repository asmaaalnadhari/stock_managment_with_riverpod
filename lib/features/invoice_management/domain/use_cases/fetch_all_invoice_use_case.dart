import '../../data/models/invoice.dart';
import '../repositories/invoice_repository_interface.dart';

class FetchAllInvoicesUseCase {
  final IInvoiceRepository repository;

  FetchAllInvoicesUseCase(this.repository);

  Future<List<Invoice>> call() async {
    return await repository.fetchAllInvoices();
  }
}
