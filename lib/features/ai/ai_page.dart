import 'package:flutter/material.dart';

import '../../core/widgets/liquid_glass.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  final controller = TextEditingController();
  final List<String> messages = ['Hi Hari! I can analyze cash flow, tax, invoices, and expenses.'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: i.isEven ? Alignment.centerLeft : Alignment.centerRight,
                child: LiquidGlassCard(child: Text(messages[i])),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(child: TextField(controller: controller, decoration: const InputDecoration(hintText: 'AskHari...'))),
              IconButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;
                  setState(() {
                    messages.add(controller.text.trim());
                    messages.add('Function stub: query tools and respond with insights.');
                    controller.clear();
                  });
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
