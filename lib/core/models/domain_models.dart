import 'package:flutter/material.dart';

enum InvoiceStatus { draft, pending, paid, overdue }
enum PaymentMethod { cash, upi, bankTransfer, creditCard, debitCard }
enum TaxRegime { oldRegime, newRegime }

class DashboardSnapshot {
  const DashboardSnapshot({
    required this.balance,
    required this.income,
    required this.expenses,
    required this.expectedIncome,
    required this.recentTransactions,
  });

  final double balance;
  final double income;
  final double expenses;
  final double expectedIncome;
  final List<TransactionEntry> recentTransactions;
}

class TransactionEntry {
  const TransactionEntry({required this.title, required this.date, required this.amount, required this.isIncome});

  final String title;
  final DateTime date;
  final double amount;
  final bool isIncome;
}

class InvoiceItem {
  const InvoiceItem({required this.description, required this.quantity, required this.rate});

  final String description;
  final double quantity;
  final double rate;

  double get amount => quantity * rate;
}

class Invoice {
  const Invoice({
    required this.id,
    required this.clientId,
    required this.clientName,
    required this.dateIssued,
    required this.dueDate,
    required this.status,
    required this.items,
    this.tax = 0,
  });

  final String id;
  final String clientId;
  final String clientName;
  final DateTime dateIssued;
  final DateTime dueDate;
  final InvoiceStatus status;
  final List<InvoiceItem> items;
  final double tax;

  double get subtotal => items.fold(0, (sum, item) => sum + item.amount);
  double get total => subtotal + tax;
}

class Client {
  const Client({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.company,
    this.contactName,
    this.totalInvoices = 0,
    this.totalAmount = 0,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? company;
  final String? contactName;
  final int totalInvoices;
  final double totalAmount;
  final DateTime createdAt;
}

class Expense {
  const Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
    required this.paymentMethod,
    this.vendorName,
    this.receiptNumber,
    this.isBusinessExpense = true,
    this.taxDeductible = false,
    this.notes,
    this.tags = const [],
  });

  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String category;
  final PaymentMethod paymentMethod;
  final String? vendorName;
  final String? receiptNumber;
  final bool isBusinessExpense;
  final bool taxDeductible;
  final String? notes;
  final List<String> tags;
}

class Investment {
  const Investment({
    required this.id,
    required this.date,
    required this.amount,
    required this.category,
    required this.subCategory,
    required this.owner,
  });

  final String id;
  final DateTime date;
  final double amount;
  final String category;
  final String subCategory;
  final String owner;
}

class TaxInput {
  const TaxInput({
    required this.businessIncome,
    this.salaryIncome = 0,
    this.rentalIncome = 0,
    this.interestIncome = 0,
    this.capitalGains = 0,
    this.otherIncome = 0,
    this.deductions80C = 0,
    this.deductions80D = 0,
    this.businessExpenses = 0,
  });

  final double businessIncome;
  final double salaryIncome;
  final double rentalIncome;
  final double interestIncome;
  final double capitalGains;
  final double otherIncome;
  final double deductions80C;
  final double deductions80D;
  final double businessExpenses;

  double get grossTotal =>
      businessIncome + salaryIncome + rentalIncome + interestIncome + capitalGains + otherIncome;
}

class TaxResult {
  const TaxResult({
    required this.regime,
    required this.taxableIncome,
    required this.taxBeforeRebate,
    required this.rebate,
    required this.surcharge,
    required this.cess,
    required this.totalTax,
  });

  final TaxRegime regime;
  final double taxableIncome;
  final double taxBeforeRebate;
  final double rebate;
  final double surcharge;
  final double cess;
  final double totalTax;
}

class GlassAction {
  const GlassAction({required this.label, required this.icon, required this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback onTap;
}
