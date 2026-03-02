import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/models/domain_models.dart';
import '../../core/services/finance_service.dart';
import '../../core/utils/formatters.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  String query = '';
  InvoiceStatus? filter;

  @override
  Widget build(BuildContext context) {
    final service = const FinanceService();
    final rows = MockData.invoices.where((i) {
      final passQuery = i.clientName.toLowerCase().contains(query.toLowerCase()) || i.id.toLowerCase().contains(query.toLowerCase());
      final passFilter = filter == null || i.status == filter;
      return passQuery && passFilter;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search client / invoice number'),
                onChanged: (v) => setState(() => query = v),
              ),
            ),
            const SizedBox(width: 12),
            DropdownButton<InvoiceStatus?>(
              value: filter,
              items: const [
                DropdownMenuItem(value: null, child: Text('All')),
                DropdownMenuItem(value: InvoiceStatus.draft, child: Text('Draft')),
                DropdownMenuItem(value: InvoiceStatus.pending, child: Text('Pending')),
                DropdownMenuItem(value: InvoiceStatus.paid, child: Text('Paid')),
                DropdownMenuItem(value: InvoiceStatus.overdue, child: Text('Overdue')),
              ],
              onChanged: (value) => setState(() => filter = value),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...rows.map((invoice) {
          final effective = service.computeInvoiceStatus(invoice, DateTime.now());
          return Card(
            child: ListTile(
              title: Text('${invoice.id} • ${invoice.clientName}'),
              subtitle: Text('Issued: ${invoice.dateIssued.toString().split(' ').first}  Due: ${invoice.dueDate.toString().split(' ').first}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(AppFormatters.formatInr(invoice.total)),
                  Text(effective.name),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
