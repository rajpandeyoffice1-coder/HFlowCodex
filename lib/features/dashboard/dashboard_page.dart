import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/services/finance_service.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/section_widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = const FinanceService();
    final snapshot = service.buildDashboard(invoices: MockData.invoices, expenses: MockData.expenses);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionTitle('Good ${_greeting()}, Hari!', subtitle: DateTime.now().toString().split(' ').first),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            MetricCard(label: 'Balance', value: AppFormatters.formatInr(snapshot.balance)),
            MetricCard(label: 'Income', value: AppFormatters.formatInr(snapshot.income), color: Colors.greenAccent),
            MetricCard(label: 'Expenses', value: AppFormatters.formatInr(snapshot.expenses), color: Colors.redAccent),
            MetricCard(label: 'Expected Income', value: AppFormatters.formatInr(snapshot.expectedIncome)),
          ],
        ),
        const SizedBox(height: 16),
        const SectionTitle('Recent Transactions'),
        ...snapshot.recentTransactions.take(8).map(
              (t) => ListTile(
                leading: Icon(t.isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: t.isIncome ? Colors.green : Colors.red),
                title: Text(t.title),
                subtitle: Text(t.date.toString().split(' ').first),
                trailing: Text(AppFormatters.formatInr(t.amount)),
              ),
            ),
      ],
    );
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Morning';
    if (h < 17) return 'Afternoon';
    return 'Evening';
  }
}
