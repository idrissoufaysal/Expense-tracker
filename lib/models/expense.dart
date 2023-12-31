import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter=DateFormat.yMd();
const uuid = Uuid();

enum Categores { food, travel, leisure, work }

const  categoryIcons={
Categores.food:Icons.lunch_dining,
Categores.travel:Icons.flight_takeoff,
Categores.leisure:Icons.movie,
Categores.work:Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categores category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

String get formattedDate{
  return formatter.format(date);
}

}
