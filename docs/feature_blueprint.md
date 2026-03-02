# Hari Invoice V4 Flutter Blueprint

This blueprint maps your provided requirements to Flutter module ownership.

## Global rules
- Currency: INR (`₹`) with Indian comma formatting.
- Fiscal year: April 1 → March 31.
- Default theme: Dark (liquid glass).
- AskHari: Dedicated screen in mobile app.

## Module map
- Dashboard: greeting, cards, recent transactions, charts, quick actions.
- Invoices: list filters/sort/pagination, create/edit with line items, statuses, PDF export hooks.
- Clients: card grid, KPI strip, status badge logic, profile and invoice timeline.
- Expenses: summary cards, table with filters/sort/pagination, categories CRUD, CSV export.
- Investments: dashboard/table/calendar tabs, SIP automation, redemptions, goals, achievements.
- Tax: FY selector, income + deductions, old/new regime engine, recommendation cards.
- AskHari: chat, attachments, memory, data-read tools and write actions.
- Analytics: period filter and chart pack.
- Performance: health score, metric cards, trends, insights.
- Settings: profile, invoice defaults, bank details, AI key.

## Data layer mapping
Use the Supabase tables you defined:
- Core: `clients`, `invoices`, `expenses`, `expense_categories`, `balance_summary`
- Investments: `investments`, `investment_categories`, `investment_sub_categories`, `investment_redemptions`, `investment_goals`, `investment_user_stats`, `investment_achievements`, `pending_sip_entries`, `financial_goals`
- Tax: `tax_profiles`, `tax_income`, `tax_deductions`, `tax_business_expenses`, `tax_calculations`, `tax_summary_by_fy`
- Other: `settings`, `ai_memories`
