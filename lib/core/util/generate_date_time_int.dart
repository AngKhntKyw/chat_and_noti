int generateDateTimeInt() {
  // Get current date and time
  DateTime now = DateTime.now();

  // Format: YYYYMMDD (e.g., 20250402)
  String year = now.year.toString();
  String month = now.month.toString().padLeft(
    2,
    '0',
  ); // Adds leading zero if needed
  String day = now.day.toString().padLeft(2, '0');

  // Concatenate into a single string
  String dateString = '$year$month$day';

  // Convert to integer
  return int.parse(dateString);
}
