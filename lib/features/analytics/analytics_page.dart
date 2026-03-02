import 'package:flutter/material.dart';

import '../../core/widgets/section_widgets.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  String period = 'Last 6 Months';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<String>(
          value: period,
          items: const ['This Month', 'Last 3 Months', 'Last 6 Months', 'This Year', 'All Time']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => period = v!),
          decoration: const InputDecoration(labelText: 'Time Period'),
        ),
        const SizedBox(height: 12),
        const MetricCard(label: 'Total Revenue', value: '₹9,40,000'),
        const SizedBox(height: 10),
        const MetricCard(label: 'Total Expenses', value: '₹1,85,000'),
        const SizedBox(height: 10),
        const MetricCard(label: 'Net Profit Margin', value: '80.3%'),
        const SizedBox(height: 16),
        const Text('Chart placeholders: Revenue, Expense Breakdown, Income vs Expenses, Top Clients, Invoice Status, Collections'),
      ],
    );
  }
}
