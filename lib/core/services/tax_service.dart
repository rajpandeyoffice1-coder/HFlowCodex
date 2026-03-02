import '../models/domain_models.dart';

class TaxService {
  const TaxService();

  TaxResult calculate(TaxInput input, TaxRegime regime) {
    final standardDeduction = regime == TaxRegime.newRegime ? 75000 : 50000;
    final deduction80C = regime == TaxRegime.oldRegime ? input.deductions80C.clamp(0, 150000) : 0;
    final deduction80D = regime == TaxRegime.oldRegime ? input.deductions80D : 0;

    final taxableIncome = (input.grossTotal - input.businessExpenses - standardDeduction - deduction80C - deduction80D)
        .clamp(0, double.infinity)
        .toDouble();

    final taxBeforeRebate = regime == TaxRegime.newRegime ? _newRegimeTax(taxableIncome) : _oldRegimeTax(taxableIncome);

    final rebate = _rebate(regime, taxableIncome, taxBeforeRebate);
    final postRebate = (taxBeforeRebate - rebate).clamp(0, double.infinity).toDouble();
    final surcharge = _surcharge(taxableIncome, postRebate);
    final cess = (postRebate + surcharge) * 0.04;

    return TaxResult(
      regime: regime,
      taxableIncome: taxableIncome,
      taxBeforeRebate: taxBeforeRebate,
      rebate: rebate,
      surcharge: surcharge,
      cess: cess,
      totalTax: postRebate + surcharge + cess,
    );
  }

  double _newRegimeTax(double income) {
    final slabs = [
      (400000.0, 0.0),
      (800000.0, 0.05),
      (1200000.0, 0.10),
      (1600000.0, 0.15),
      (2000000.0, 0.20),
      (2400000.0, 0.25),
      (double.infinity, 0.30),
    ];
    return _computeProgressive(income, slabs);
  }

  double _oldRegimeTax(double income) {
    final slabs = [
      (250000.0, 0.0),
      (500000.0, 0.05),
      (1000000.0, 0.20),
      (double.infinity, 0.30),
    ];
    return _computeProgressive(income, slabs);
  }

  double _computeProgressive(double income, List<(double upto, double rate)> slabs) {
    var previous = 0.0;
    var tax = 0.0;
    for (final slab in slabs) {
      final limit = slab.$1;
      final rate = slab.$2;
      if (income <= previous) break;
      final taxableInSlab = (income < limit ? income : limit) - previous;
      tax += taxableInSlab * rate;
      previous = limit;
    }
    return tax;
  }

  double _rebate(TaxRegime regime, double income, double taxBeforeRebate) {
    if (regime == TaxRegime.newRegime && income <= 1275000) return taxBeforeRebate;
    if (regime == TaxRegime.oldRegime && income <= 500000) return taxBeforeRebate;
    return 0;
  }

  double _surcharge(double income, double tax) {
    if (income > 50000000) return tax * 0.37;
    if (income > 20000000) return tax * 0.25;
    if (income > 10000000) return tax * 0.15;
    if (income > 5000000) return tax * 0.10;
    return 0;
  }
}
