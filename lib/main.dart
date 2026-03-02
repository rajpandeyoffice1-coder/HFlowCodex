import 'package:flutter/material.dart';

import 'core/theme/liquid_glass_theme.dart';
import 'features/ai/ai_page.dart';
import 'features/analytics/analytics_page.dart';
import 'features/clients/clients_page.dart';
import 'features/dashboard/dashboard_page.dart';
import 'features/expenses/expenses_page.dart';
import 'features/investments/investments_page.dart';
import 'features/invoices/invoices_page.dart';
import 'features/performance/performance_page.dart';
import 'features/settings/settings_page.dart';
import 'features/tax/tax_page.dart';

void main() => runApp(const HariInvoiceApp());

class HariInvoiceApp extends StatefulWidget {
  const HariInvoiceApp({super.key});

  @override
  State<HariInvoiceApp> createState() => _HariInvoiceAppState();
}

class _HariInvoiceAppState extends State<HariInvoiceApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hari Invoice V4',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: themeMode,
      home: HomeShell(
        isDark: themeMode == ThemeMode.dark,
        onThemeToggle: (isDark) => setState(() => themeMode = isDark ? ThemeMode.dark : ThemeMode.light),
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key, required this.isDark, required this.onThemeToggle});

  final bool isDark;
  final ValueChanged<bool> onThemeToggle;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int current = 0;

  static const names = [
    'Dashboard',
    'Invoices',
    'Clients',
    'Expenses',
    'Investments',
    'Tax Calculator',
    'AskHari AI',
    'Analytics',
    'Performance',
    'Settings'
  ];

  late final pages = const [
    DashboardPage(),
    InvoicesPage(),
    ClientsPage(),
    ExpensesPage(),
    InvestmentsPage(),
    TaxPage(),
    AiPage(),
    AnalyticsPage(),
    PerformancePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(names[current]),
        actions: [
          const Icon(Icons.light_mode),
          Switch(value: widget.isDark, onChanged: widget.onThemeToggle),
          const Icon(Icons.dark_mode),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Hari Invoice V4')),
            for (var i = 0; i < names.length; i++)
              ListTile(
                title: Text(names[i]),
                selected: current == i,
                onTap: () {
                  setState(() => current = i);
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF0A0E1E), Color(0xFF121433)],
          ),
        ),
        child: pages[current],
      ),
    );
  }
}
