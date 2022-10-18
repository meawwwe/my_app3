import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

typedef CustomCallString = void Function(String value);

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final CustomCallString deleteTx;

  TransactionList({required this.transactions, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    /* SingleChildScrollView is a widget that creates a box that can be scrolled
    ,To set scroll size only works with under Container
    , set height of container eg:
    Container (
      height : 300,
      child : SingleChildScrollView (
        child : Column(....)
      )
    )
    or simply wrap Column with 
    return SingleChildScrollView(
      child : Container(...
      )
      )
    */

    /* ListView is same as Column but with scrollable features or dynamic scrollable list of widgets
    ListView is a Column with singleChildScrollView inbuilt
    But it requires Container of specific height eg :
    return Container (
      height : 300 (say specific to phones )
      child : ListView (
        childeren :....
      )
    )
    */

    return Container(
      height: 300,
      /*Listview is like an array of objects and loads evrything on screen
      so cause high meomry usage on devices , 
      instead use ListView.builder() inbuilt flutter class constructor that 
      ,requires itemcount : number of list items
      and itembuilder : which returns a new widget built , has to be not null 
      */
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                        onPressed: () => deleteTx(transactions[index].id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).colorScheme.primary,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           //$ sign is used for string interpolation like %s auto convert to string
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             color: Theme.of(context).colorScheme.primary,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
