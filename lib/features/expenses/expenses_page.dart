import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/models/domain_models.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/section_widgets.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  String? category;
  bool? businessOnly;

  @override
  Widget build(BuildContext context) {
    final rows = MockData.expenses.where((e) {
      final passCategory = category == null || e.category == category;
      final passBusiness = businessOnly == null || e.isBusinessExpense == businessOnly;
      return passCategory && passBusiness;
    }).toList();

    final total = rows.fold<double>(0, (sum, e) => sum + e.amount);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        MetricCard(label: 'Total Expenses', value: AppFormatters.formatInr(total), color: Colors.redAccent),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String?>(
                value: category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: [null, ...{for (final e in MockData.expenses) e.category}]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e ?? 'All')))
                    .toList(),
                onChanged: (v) => setState(() => category = v),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<bool?>(
                value: businessOnly,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All')),
                  DropdownMenuItem(value: true, child: Text('Business')),
                  DropdownMenuItem(value: false, child: Text('Personal')),
                ],
                onChanged: (v) => setState(() => businessOnly = v),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...rows.map((e) => ListTile(
              leading: const Icon(Icons.money_off),
              title: Text(e.description),
              subtitle: Text('${e.category} • ${e.paymentMethod.name} • ${e.date.toString().split(' ').first}'),
              trailing: Text(AppFormatters.formatInr(e.amount)),
            )),
      ],
    );
  }
}
