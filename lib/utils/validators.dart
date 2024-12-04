class Validators {
  static bool isPositiveNumber(double value) => value > 0;

  static bool isValidDate(DateTime date) => date.isAfter(DateTime.now());

  static bool isValidCategory(String category) {
    const validCategories = ['leafy', 'root', 'fruit'];
    return validCategories.contains(category.toLowerCase());
  }
}
