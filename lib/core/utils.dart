import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool onboard = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}

DateTime convertToDateTime(String date) {
  return DateFormat('dd-MM-yyyy').parse(date);
}
