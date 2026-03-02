class DashboardSnapshot {
  const DashboardSnapshot({
    required this.balance,
    required this.income,
    required this.expenses,
    required this.expectedIncome,
  });

  final double balance;
  final double income;
  final double expenses;
  final double expectedIncome;
}

class InvoiceItem {
  const InvoiceItem({
    required this.description,
    required this.quantity,
    required this.rate,
  });

  final String description;
  final double quantity;
  final double rate;

  double get amount => quantity * rate;
}

class TaxInput {
  const TaxInput({
    required this.businessIncome,
    this.salaryIncome = 0,
    this.rentalIncome = 0,
    this.interestIncome = 0,
    this.capitalGains = 0,
    this.otherIncome = 0,
  });

  final double businessIncome;
  final double salaryIncome;
  final double rentalIncome;
  final double interestIncome;
  final double capitalGains;
  final double otherIncome;

  double get grossTotal =>
      businessIncome + salaryIncome + rentalIncome + interestIncome + capitalGains + otherIncome;
}
