
import '../../../data/models/invoice.dart';
import '../../../data/models/invoice_product.dart';
import '../../../data/models/invoice_type.dart';

class InvoiceState {
  final List<Invoice> invoices;
  final List<InvoiceType> invoiceTypes;
  final List<InvoiceProduct> invoiceProducts;
  final bool isLoading;

  InvoiceState({
    this.invoices = const [],
    this.invoiceTypes = const [],
    this.invoiceProducts = const [],
    this.isLoading = false,
  });

  InvoiceState copyWith({
    List<Invoice>? invoices,
    List<InvoiceType>? invoiceTypes,
    List<InvoiceProduct>? invoiceProducts,
    bool? isLoading,
  }) {
    return InvoiceState(
      invoices: invoices ?? this.invoices,
      invoiceTypes: invoiceTypes ?? this.invoiceTypes,
      invoiceProducts: invoiceProducts ?? this.invoiceProducts,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
