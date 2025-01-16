import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/invoice_product.dart';
import '../../../domain/use_cases/add_invoice_use_case.dart';
import '../../../domain/use_cases/fetch_all_invoice_use_case.dart';
import '../../../domain/use_cases/fetch_invoice_products_use_case.dart';
import '../../../domain/use_cases/fetch_invoice_types_use_case.dart';
import 'invoice_state.dart';

class InvoiceViewModel extends StateNotifier<InvoiceState> {
  final FetchAllInvoicesUseCase _fetchAllInvoicesUseCase;
  final FetchInvoiceTypesUseCase _fetchInvoiceTypesUseCase;
  final FetchInvoiceProductsUseCase _fetchInvoiceProductsUseCase;
  final AddInvoiceUseCase _addInvoiceUseCase;

  InvoiceViewModel(
      this._fetchAllInvoicesUseCase,
      this._fetchInvoiceTypesUseCase,
      this._fetchInvoiceProductsUseCase,
      this._addInvoiceUseCase,
      ) : super(InvoiceState());

  // Fetch all invoices
  Future<void> fetchAllInvoices() async {
    state = state.copyWith(isLoading: true);
    try {
      final invoices = await _fetchAllInvoicesUseCase();
      state = state.copyWith(invoices: invoices, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Fetch all invoice types
  Future<void> fetchInvoiceTypes() async {
    state = state.copyWith(isLoading: true);
    try {
      final invoiceTypes = await _fetchInvoiceTypesUseCase();
      state = state.copyWith(invoiceTypes: invoiceTypes, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Fetch products of a specific invoice
  Future<void> fetchInvoiceProducts(String invoiceId) async {
    state = state.copyWith(isLoading: true);
    try {
      final invoiceProducts = await _fetchInvoiceProductsUseCase(invoiceId);
      state = state.copyWith(invoiceProducts: invoiceProducts, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

// Add a new invoice
  Future<void> addInvoice(String typeId, DateTime date, List<InvoiceProduct> products) async {
    state = state.copyWith(isLoading: true);
    try {
      await _addInvoiceUseCase(typeId, date, products);
      await fetchAllInvoices(); // Refresh invoices after adding
      state = state.copyWith(isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}