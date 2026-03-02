# Hari Invoice V4 Flutter

Flutter implementation with **dark liquid glass morphism design** and **default dark mode**.

## Implemented modules/pages
- Dashboard
- Invoices
- Clients
- Expenses
- Investments (Dashboard/Table/Calendar tabs)
- Tax Calculator (Old vs New regime compare)
- AskHari AI (dedicated chat page)
- Analytics
- Performance
- Settings

## Implemented functional foundations
- INR formatting (`en_IN`)
- Invoice totals and status logic
- Dashboard balance/income/expense/expected-income calculation
- Client status logic (VIP/Gold/New/Active)
- Tax engine (slabs, 87A rebate, surcharge, cess, standard deduction)
- Shared validators (required/email/number/GSTIN)
- Modular feature pages with filters/inputs/action placeholders for full CRUD wiring

## Run
```bash
flutter pub get
flutter run
```

> Note: Supabase integration and persistent storage wiring are prepared as modular next steps.
