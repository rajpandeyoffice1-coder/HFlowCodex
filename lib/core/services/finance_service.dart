import '../models/domain_models.dart';

class FinanceService {
  const FinanceService();

  DashboardSnapshot buildDashboard({required List<Invoice> invoices, required List<Expense> expenses}) {
    final paid = invoices.where((e) => e.status == InvoiceStatus.paid).toList();
    final expected = invoices.where((e) => e.status == InvoiceStatus.pending || e.status == InvoiceStatus.draft);

    final income = paid.fold<double>(0, (s, e) => s + e.total);
    final totalExpenses = expenses.fold<double>(0, (s, e) => s + e.amount);
    final expectedIncome = expected.fold<double>(0, (s, e) => s + e.total);

    final transactions = <TransactionEntry>[
      ...paid.map((e) => TransactionEntry(title: 'Invoice ${e.id}', date: e.dateIssued, amount: e.total, isIncome: true)),
      ...expenses.map((e) => TransactionEntry(title: e.description, date: e.date, amount: e.amount, isIncome: false)),
    ]..sort((a, b) => b.date.compareTo(a.date));

    return DashboardSnapshot(
      balance: income - totalExpenses,
      income: income,
      expenses: totalExpenses,
      expectedIncome: expectedIncome,
      recentTransactions: transactions.take(10).toList(),
    );
  }

  InvoiceStatus computeInvoiceStatus(Invoice invoice, DateTime now) {
    if (invoice.status == InvoiceStatus.paid) return InvoiceStatus.paid;
    if (invoice.dueDate.isBefore(DateTime(now.year, now.month, now.day))) return InvoiceStatus.overdue;
    return invoice.status;
  }

  bool validateInvoiceDates(DateTime issued, DateTime due) => !due.isBefore(issued);

  String computeClientStatus(Client client, DateTime now) {
    if (client.totalAmount > 500000) return 'VIP Client';
    if (client.totalAmount > 100000) return 'Gold Client';
    if (now.difference(client.createdAt).inDays <= 30) return 'New';
    return 'Active';
  }
}
