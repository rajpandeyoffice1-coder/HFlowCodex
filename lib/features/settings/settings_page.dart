import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final name = TextEditingController(text: 'Hari');
  final email = TextEditingController(text: 'hari@example.com');
  final gstin = TextEditingController();
  final invoicePrefix = TextEditingController(text: 'HP-2526');
  final taxRate = TextEditingController(text: '18');
  final bankName = TextEditingController();
  final accountNo = TextEditingController();
  final ifsc = TextEditingController();
  final swift = TextEditingController();
  final aiKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _field(name, 'Profile Name'),
        _field(email, 'Profile Email'),
        _field(gstin, 'GSTIN'),
        _field(invoicePrefix, 'Invoice Prefix'),
        _field(taxRate, 'Default Tax Rate (%)'),
        _field(bankName, 'Bank Name'),
        _field(accountNo, 'Bank Account Number'),
        _field(ifsc, 'IFSC'),
        _field(swift, 'SWIFT'),
        _field(aiKey, 'OpenAI API Key', obscure: true),
        ElevatedButton(onPressed: () {}, child: const Text('Save Settings')),
      ],
    );
  }

  Widget _field(TextEditingController c, String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(controller: c, obscureText: obscure, decoration: InputDecoration(labelText: label)),
    );
  }
}
