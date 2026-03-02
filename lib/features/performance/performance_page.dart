import 'package:flutter/material.dart';

import '../../core/widgets/section_widgets.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  String timeline = '6 months';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<String>(
          value: timeline,
          items: const ['3 months', '6 months', '12 months', 'All time']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => timeline = v!),
          decoration: const InputDecoration(labelText: 'Timeline'),
        ),
        const SizedBox(height: 12),
        const MetricCard(label: 'Health Score', value: '82 / 100'),
        const SizedBox(height: 10),
        const MetricCard(label: 'Collection Rate', value: '91%'),
        const SizedBox(height: 10),
        const MetricCard(label: 'Cash Runway', value: '9.5 months'),
        const SizedBox(height: 16),
        const Text('AI Insights: Revenue up 15% MoM. Client concentration 40%. Software + Travel expenses rising.'),
      ],
    );
  }
}
