import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/section_widgets.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final invested = MockData.investments.fold<double>(0, (sum, e) => sum + e.amount);
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(tabs: [Tab(text: 'Dashboard'), Tab(text: 'Table'), Tab(text: 'Calendar')]),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    MetricCard(label: 'Total Invested', value: AppFormatters.formatInr(invested)),
                    const SizedBox(height: 12),
                    const MetricCard(label: 'Active SIPs', value: '3'),
                    const SizedBox(height: 12),
                    const MetricCard(label: 'Diversification Score', value: '72 / 100'),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: MockData.investments
                      .map((i) => ListTile(
                            title: Text('${i.category} • ${i.subCategory}'),
                            subtitle: Text('${i.owner} • ${i.date.toString().split(' ').first}'),
                            trailing: Text(AppFormatters.formatInr(i.amount)),
                          ))
                      .toList(),
                ),
                const Center(child: Text('Investment heatmap calendar placeholder')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
