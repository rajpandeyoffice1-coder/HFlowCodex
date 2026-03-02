import 'package:flutter/material.dart';

import '../../core/models/domain_models.dart';
import '../../core/services/tax_service.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/section_widgets.dart';

class TaxPage extends StatefulWidget {
  const TaxPage({super.key});

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  final _business = TextEditingController(text: '1200000');
  final _salary = TextEditingController(text: '0');
  final _ded80c = TextEditingController(text: '150000');
  final _ded80d = TextEditingController(text: '25000');
  final _expense = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    final service = const TaxService();
    final input = TaxInput(
      businessIncome: double.tryParse(_business.text) ?? 0,
      salaryIncome: double.tryParse(_salary.text) ?? 0,
      deductions80C: double.tryParse(_ded80c.text) ?? 0,
      deductions80D: double.tryParse(_ded80d.text) ?? 0,
      businessExpenses: double.tryParse(_expense.text) ?? 0,
    );

    final oldResult = service.calculate(input, TaxRegime.oldRegime);
    final newResult = service.calculate(input, TaxRegime.newRegime);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('Tax Calculator', subtitle: 'FY + Old/New regime comparison'),
        const SizedBox(height: 12),
        _field(_business, 'Business Income'),
        _field(_salary, 'Salary Income'),
        _field(_ded80c, 'Section 80C'),
        _field(_ded80d, 'Section 80D'),
        _field(_expense, 'Business Expenses'),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () => setState(() {}), child: const Text('Calculate')),
        const SizedBox(height: 16),
        MetricCard(label: 'Old Regime Tax', value: AppFormatters.formatInr(oldResult.totalTax)),
        const SizedBox(height: 10),
        MetricCard(label: 'New Regime Tax', value: AppFormatters.formatInr(newResult.totalTax)),
        const SizedBox(height: 10),
        MetricCard(
          label: 'Recommended',
          value: oldResult.totalTax < newResult.totalTax
              ? 'Old Regime (save ${AppFormatters.formatInr(newResult.totalTax - oldResult.totalTax)})'
              : 'New Regime (save ${AppFormatters.formatInr(oldResult.totalTax - newResult.totalTax)})',
        ),
      ],
    );
  }

  Widget _field(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(controller: c, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: label)),
    );
  }
}
