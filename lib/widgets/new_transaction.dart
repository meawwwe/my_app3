import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

typedef CustomCallBack = void Function(String, double, DateTime?);

//typedef CustomCall = void Function(ObjectKey);

//typedef ValueSetter<in T> = void Function(T value);

class NewTransaction extends StatefulWidget {
  final CustomCallBack addTx;
  NewTransaction({required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectDate;

  void _submitdata() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              // keyboardType: TextInputType.text,
              onSubmitted: (unUsedParameter) => _submitdata(),
              //onSubmitted: (value) => {titleinput = value},
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (unUsedParameter) => _submitdata(),
              //  onSubmitted: (value) => {amountinput = value},
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date : ${DateFormat.yMd().format(_selectDate!)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            Theme.of(context).textTheme.headline6?.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.button?.color,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Add Transaction',
              ),
              onPressed: _submitdata
              // print(titleinput);
              // print(amountinput);
              // print(titleController.text);
              // print(_amountController.text);
              ,
            ),
          ],
        ),
      ),
    );
  }
}
