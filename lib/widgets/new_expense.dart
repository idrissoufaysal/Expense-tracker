import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _saveTitleInput(String inputValue) {}
  String title = 'titre';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title),
          TextField(
            onChanged: (value) => setState(() {
              title = value;
            }),
            controller: titleController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          const SizedBox(
            height: 6,
          ),
          TextField(
            
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Amount'),prefixText: '\$ '),
          ),
        const  SizedBox(height: 10,),
          Row(
            children: [
TextButton(onPressed: (){
  Navigator.pop(context);
}, child: const Text('Cancel')),

              OutlinedButton(
                  onPressed: () {
                    print(titleController.text + ' ' + amountController.text);
                  },
                  child: const Text('submit')),
            
            
            ],
          )
        ],
      ),
    );
  }
}
