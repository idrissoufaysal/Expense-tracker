import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10
        ),
        child: Column(
          children: [
            Text(expense.title),
          const  SizedBox(height: 4,),
          Row(children: [
            Text('\$${expense.amount.toString()}'),
           const Spacer(),
            Row(
              children: [
                  Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8,),
                Text(expense.formattedDate)
              ],
            )
          ],)
          ],
        )
    ));
  }
}
