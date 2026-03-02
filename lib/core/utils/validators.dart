class Validators {
  static String? requiredText(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    return null;
  }

  static String? positiveNumber(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    final n = double.tryParse(value);
    if (n == null) return '$label must be a valid number';
    if (n <= 0) return '$label must be greater than 0';
    return null;
  }

  static String? nonNegativeNumber(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    final n = double.tryParse(value);
    if (n == null) return '$label must be a valid number';
    if (n < 0) return '$label must be 0 or more';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim());
    return ok ? null : 'Enter a valid email';
  }

  static String? gstin(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return RegExp(r'^[0-9A-Z]{15}$').hasMatch(value.trim().toUpperCase()) ? null : 'GSTIN must be 15 alphanumeric uppercase chars';
  }
}
