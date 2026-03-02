# Hari Invoice V4 Flutter Starter

This repository now contains a Flutter starter scaffold for **Hari Invoice V4** with:

- Dark-first **liquid glass morphism** UI
- Built-in **dark/light mode** toggle (default: dark)
- Modular app shell for all 10 functional modules:
  - Dashboard
  - Invoices
  - Clients
  - Expenses
  - Investments
  - Tax Calculator
  - AskHari AI
  - Analytics
  - Performance
  - Settings

## What is implemented now

1. **Design system**
   - Dark and light themes via `AppTheme`
   - Liquid glass card component (`BackdropFilter + gradient + soft border`)

2. **Navigation shell**
   - App bar + drawer + bottom nav
   - Quick module switching and placeholder content for each module

3. **Financial utility foundations**
   - INR formatter (`en_IN`) in `AppFormatters`
   - Domain models for dashboard, invoice items, and tax input

## Next build phases suggested

- Add Supabase integration (`supabase_flutter`) and repository layer per table.
- Build each module screen with full form validations and CRUD actions.
- Add charts using `fl_chart`/`syncfusion_flutter_charts`.
- Implement tax engine services for old/new regime slabs and recommendations.
- Add offline caching and secure auth token handling.

## Run locally

Install Flutter SDK first, then run:

```bash
flutter pub get
flutter run
```
