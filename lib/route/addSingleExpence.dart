import 'package:contribution_app/models/models.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:flutter/material.dart';

class AddSingleExpence extends StatelessWidget {
  static const route = '/addSingleExpence';
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _expenceFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // void updateTitle(BuildContext context, String title) {
    //   context.read(expenceTitleStateProvider).state = title;
    // }

    // void updateAmount(BuildContext context, int amount) {
    //   context.read(expenceAmountStateProvider).state = amount;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expence'),
        centerTitle: true,
      ),
      body: Form(
        key: _expenceFormState,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'title must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Product name',
                  labelText: 'Expence',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Amount must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Donation',
                  labelText: '\$ 501',
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  var expence = ExpenceModel(
                    givenAmount: num.tryParse(_amountController.text),
                    title: _titleController.text,
                  );
                  context.read(addUserExpenceProvider(expence));
                  Navigator.pop(context);
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
