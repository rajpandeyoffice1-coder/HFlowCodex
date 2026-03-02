import '../models/domain_models.dart';

class MockData {
  static final clients = [
    Client(id: '1', name: 'Acme Pvt Ltd', email: 'hello@acme.com', company: 'Acme', totalInvoices: 6, totalAmount: 650000, createdAt: DateTime.now().subtract(const Duration(days: 45))),
    Client(id: '2', name: 'Beta Labs', email: 'pay@beta.io', company: 'Beta', totalInvoices: 2, totalAmount: 90000, createdAt: DateTime.now().subtract(const Duration(days: 10))),
  ];

  static final invoices = [
    Invoice(id: 'HP-2526-001', clientId: '1', clientName: 'Acme Pvt Ltd', dateIssued: DateTime.now().subtract(const Duration(days: 20)), dueDate: DateTime.now().subtract(const Duration(days: 1)), status: InvoiceStatus.pending, items: const [InvoiceItem(description: 'Website Design', quantity: 1, rate: 50000)], tax: 9000),
    Invoice(id: 'HP-2526-002', clientId: '2', clientName: 'Beta Labs', dateIssued: DateTime.now().subtract(const Duration(days: 35)), dueDate: DateTime.now().subtract(const Duration(days: 5)), status: InvoiceStatus.paid, items: const [InvoiceItem(description: 'App Retainer', quantity: 1, rate: 80000)], tax: 14400),
  ];

  static final expenses = [
    Expense(id: 'e1', description: 'Figma subscription', amount: 1200, date: DateTime.now().subtract(const Duration(days: 2)), category: 'Software', paymentMethod: PaymentMethod.upi, isBusinessExpense: true),
    Expense(id: 'e2', description: 'Travel to client site', amount: 3500, date: DateTime.now().subtract(const Duration(days: 5)), category: 'Travel', paymentMethod: PaymentMethod.creditCard, isBusinessExpense: true),
  ];

  static final investments = [
    Investment(id: 'i1', date: DateTime.now().subtract(const Duration(days: 90)), amount: 10000, category: 'Mutual Funds', subCategory: 'Index Fund', owner: 'Hari'),
    Investment(id: 'i2', date: DateTime.now().subtract(const Duration(days: 40)), amount: 15000, category: 'Stocks', subCategory: 'Large Cap', owner: 'Wife'),
  ];
}
