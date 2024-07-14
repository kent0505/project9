import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/transaction.dart';

bool onboard = true;
bool expanded = false;
String boxTarget = 'My car';
double boxAmount = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
  boxTarget = prefs.getString('boxTarget') ?? 'My car';
  boxAmount = prefs.getDouble('boxAmount') ?? 0;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

Future<void> saveTarget(String target) async {
  final prefs = await SharedPreferences.getInstance();
  boxTarget = target;
  prefs.setString('boxTarget', target);
}

Future<void> saveBoxAmount(double value, bool plus) async {
  final prefs = await SharedPreferences.getInstance();
  if (plus) {
    boxAmount = boxAmount + value;
  } else {
    boxAmount = boxAmount - value;
  }
  prefs.setDouble('boxAmount', boxAmount);
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}

DateTime convertToDateTime(String date) {
  return DateFormat('dd-MM-yyyy').parse(date);
}

String formatDateString(String date) {
  DateTime dateTime = DateFormat('dd-MM-yyyy').parse(date);
  String formattedDate = DateFormat('d MMMM yyyy').format(dateTime);
  return formattedDate;
}

String formatTime(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('HH:mm').format(dateTime);
}

String getTotalBalance() {
  double incomes = 0;
  double expenses = 0;
  for (Transaction transaction in mytransactions) {
    if (transaction.income) {
      incomes = incomes + transaction.amount;
    } else {
      expenses = expenses + transaction.amount;
    }
  }
  double total = incomes - expenses;
  return total.toStringAsFixed(0);
}

String getLastMonthSpendings() {
  double amount = 0;
  List<Transaction> lastMonthTransactions = [];
  DateTime now = DateTime.now();
  DateTime firstDayOfLastMonth = DateTime(now.year, now.month - 1, 1);
  for (Transaction transaction in mytransactions) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      transaction.id * 1000,
    );
    if (dateTime.isAfter(firstDayOfLastMonth)) {
      lastMonthTransactions.add(transaction);
    }
  }
  for (Transaction transaction in lastMonthTransactions) {
    if (!transaction.income) amount = amount + transaction.amount;
  }
  return amount.toStringAsFixed(0);
}

String getCategoryTotalAmount(String category) {
  double amount1 = 0;
  double amount2 = 0;
  double amount3 = 0;
  double amount4 = 0;
  for (Transaction transaction in mytransactions) {
    if (category == 'Travel' && transaction.category == category) {
      amount1 = amount1 + transaction.amount;
    }
    if (category == 'Shopping' && transaction.category == category) {
      amount2 = amount2 + transaction.amount;
    }
    if (category == 'Sport' && transaction.category == category) {
      amount3 = amount3 + transaction.amount;
    }
    if (category == 'Medicine' && transaction.category == category) {
      amount4 = amount4 + transaction.amount;
    }
  }
  if (category == 'Travel') return amount1.toStringAsFixed(0);
  if (category == 'Shopping') return amount2.toStringAsFixed(0);
  if (category == 'Sport') return amount3.toStringAsFixed(0);
  if (category == 'Medicine') return amount4.toStringAsFixed(0);
  return '0';
}

List<Transaction> mytransactions = [];

Future<List<Transaction>> getTransactions() async {
  final box = await Hive.openBox('transactionbox');
  List data = box.get('mytransactions') ?? [];
  mytransactions = data.cast<Transaction>();
  log(mytransactions.length.toString());
  return mytransactions;
}

Future<List<Transaction>> updateTransactions() async {
  final box = await Hive.openBox('transactionbox');
  box.put('mytransactions', mytransactions);
  mytransactions = await box.get('mytransactions');
  return mytransactions;
}
