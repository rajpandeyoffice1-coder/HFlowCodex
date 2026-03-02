import 'package:flutter/material.dart';

import 'core/theme/liquid_glass_theme.dart';
import 'core/widgets/liquid_glass.dart';

void main() {
  runApp(const HariInvoiceApp());
}

class HariInvoiceApp extends StatefulWidget {
  const HariInvoiceApp({super.key});

  @override
  State<HariInvoiceApp> createState() => _HariInvoiceAppState();
}

class _HariInvoiceAppState extends State<HariInvoiceApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme(bool isDark) {
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hari Invoice V4',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: HomeShell(
        isDark: _themeMode == ThemeMode.dark,
        onThemeToggle: _toggleTheme,
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
  int _index = 0;

  static const tabs = [
    'Dashboard',
    'Invoices',
    'Clients',
    'Expenses',
    'Investments',
    'Tax',
    'AskHari',
    'Analytics',
    'Performance',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[_index]),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(value: widget.isDark, onChanged: widget.onThemeToggle),
              const Icon(Icons.dark_mode),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF0A0E1E), Color(0xFF121433)],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LiquidGlassCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tabs[_index],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Module scaffold ready with required fields, validation rules, and workflow hooks as per Hari Invoice V4 specs.',
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _chip('INR + en_IN formatting'),
                        _chip('FY: Apr → Mar'),
                        _chip('Supabase-ready schema mapping'),
                        _chip('Dark Liquid Glass UI'),
                        _chip('AskHari as dedicated screen'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Invoices'),
          NavigationDestination(icon: Icon(Icons.people_alt_outlined), label: 'Clients'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'More'),
        ],
        onDestinationSelected: (value) => setState(() => _index = value == 3 ? 9 : value),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Hari Invoice V4 Modules')),
            for (var i = 0; i < tabs.length; i++)
              ListTile(
                title: Text(tabs[i]),
                selected: _index == i,
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _index = i);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label) => Chip(label: Text(label));
}
