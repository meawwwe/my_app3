/*

import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // how dart handles final and const
  /*final is run time constant , 
  pass to constructor and initalize to pointer objects with final keywords
  */
  /*
  const is compile time constant 
  it fixes the object data and used in stateless widget by default 
  , but need to specify in stateless widget
  */
  // _userTransactions is pointing to a constant address (Fixed)
  /* if its _userTransaction = const [list of ...] , _userTransaction has constant number of items  
   , List is constant of fixed size 
  */
  /* here since final is on left side of _usertransaction(means its pointing to fixed location) 
   , no _usertransaction =  ... something(new object/address to point  to )
   but we can add to _usertransaction since in rhs the list is dynamic not fixed
   using _usertransaction.add() or similar _userTransaction.methods()
   or 
  */
  
  
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      amount: 69.99,
      date: DateTime.now(),
      title: 'New Shoes',
    ),
    Transaction(
        id: 't2',
        amount: 16.99,
        date: DateTime.now(),
        title: 'Weekly Groceries'),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      date: DateTime.now(),
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTx: _addNewTransaction),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}


*/