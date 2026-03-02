import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/services/finance_service.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/section_widgets.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = const FinanceService();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('Clients', subtitle: 'Revenue, status badges, and quick actions'),
        const SizedBox(height: 12),
        ...MockData.clients.map(
          (c) => Card(
            child: ListTile(
              title: Text(c.name),
              subtitle: Text('${c.company ?? 'N/A'} • ${c.email}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(AppFormatters.formatInr(c.totalAmount)),
                  Text(service.computeClientStatus(c, DateTime.now())),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
