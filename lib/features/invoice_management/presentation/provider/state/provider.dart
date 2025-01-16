import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../db/data_base_helper.dart';
import '../../../data/local_services/invoice_repository_impl.dart';
import '../../../domain/repositories/invoice_repository_interface.dart';
import '../../../domain/use_cases/add_invoice_use_case.dart';
import '../../../domain/use_cases/fetch_all_invoice_use_case.dart';
import '../../../domain/use_cases/fetch_invoice_products_use_case.dart';
import '../../../domain/use_cases/fetch_invoice_types_use_case.dart';
import 'invoice_notifier.dart';
import 'invoice_state.dart';

// Repository Provider
final invoiceRepositoryProvider = Provider<IInvoiceRepository>((ref) {
  return InvoiceRepository(DatabaseHelper.instance);
});

// Use Case Providers
final fetchAllInvoicesUseCaseProvider = Provider<FetchAllInvoicesUseCase>((ref) {
  final repository = ref.watch(invoiceRepositoryProvider);
  return FetchAllInvoicesUseCase(repository);
});

final fetchInvoiceTypesUseCaseProvider = Provider<FetchInvoiceTypesUseCase>((ref) {
  final repository = ref.watch(invoiceRepositoryProvider);
  return FetchInvoiceTypesUseCase(repository);
});

final fetchInvoiceProductsUseCaseProvider = Provider<FetchInvoiceProductsUseCase>((ref) {
  final repository = ref.watch(invoiceRepositoryProvider);
  return FetchInvoiceProductsUseCase(repository);
});

final addInvoiceUseCaseProvider = Provider<AddInvoiceUseCase>((ref) {
  final repository = ref.watch(invoiceRepositoryProvider);
  return AddInvoiceUseCase(repository);
});

// ViewModel Provider
final invoiceViewModelProvider = StateNotifierProvider<InvoiceViewModel, InvoiceState>((ref) {
  final fetchAllInvoicesUseCase = ref.watch(fetchAllInvoicesUseCaseProvider);
  final fetchInvoiceTypesUseCase = ref.watch(fetchInvoiceTypesUseCaseProvider);
  final fetchInvoiceProductsUseCase = ref.watch(fetchInvoiceProductsUseCaseProvider);
  final addInvoiceUseCase = ref.watch(addInvoiceUseCaseProvider);

  return InvoiceViewModel(
    fetchAllInvoicesUseCase,
    fetchInvoiceTypesUseCase,
    fetchInvoiceProductsUseCase,
    addInvoiceUseCase,
  );
});
