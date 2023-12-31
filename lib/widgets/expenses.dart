import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
        category: Categores.food,
        title: 'Fluttger course',
        amount: 19.36,
        date: DateTime.now()),
    Expense(
        title: 'Les enfants',
        amount: 80.65,
        date: DateTime.now(),
        category: Categores.travel),
    Expense(
        title: 'Cinema',
        amount: 80.65,
        date: DateTime.now(),
        category: Categores.leisure),
    Expense(
        title: 'Cinema',
        amount: 80.65,
        date: DateTime.now(),
        category: Categores.travel),
    Expense(
        title: 'Cinema',
        amount: 80.65,
        date: DateTime.now(),
        category: Categores.work)
  ];

void _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (context){
    return const NewExpense();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 185, 135, 194),
        elevation: 10,
        title:const Text('Flutter expense tracker'),
        actions:  [
          IconButton(onPressed: () {_openAddExpenseOverlay();}, 
          icon:const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registredExpenses))
        ],
      ),
    );
  }
}
