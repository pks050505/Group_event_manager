import 'package:contribution_app/models/DonationModel.dart';
import 'package:flutter/material.dart';
import 'package:contribution_app/providers/providers.dart';

class AddSingleDonation extends StatelessWidget {
  static const route = '/singleUserDonation';
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final _donationFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        centerTitle: true,
      ),
      body: Form(
        key: _donationFormState,
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
                  hintText: 'Enter name',
                  labelText: 'name',
                ),
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  hintText: 'Enter Expected Amount',
                  labelText: 'amount',
                ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    var donation = DonationModel(
                        title: _titleController.text,
                        givenAmount: _amountController.text);
                    context.read(addUserDonationProvider(donation));
                    Navigator.pop(context);
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
