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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex= _registredExpenses.indexOf(expense);
    setState(() {
      _registredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .showSnackBar( SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds:3 ),
          action: SnackBarAction(
            label: 'cancel',
             onPressed: (){
              setState(() {
                 _registredExpenses.insert(expenseIndex, expense);
              });
             }),
          content:const Text('Expense deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Flutter expense tracker'),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
              child: ExpensesList(
                  expenses: _registredExpenses,
                  onRemoveExpense: _removeExpense))
        ],
      ),
    );
  }
}
