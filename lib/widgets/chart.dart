import 'package:PersonalExpensesApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);


  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for(var i = 0; i < recentTransactions.length; i++) {
        if(_isSameDay(recentTransactions[i].date, weekDay)) {
          totalSum += recentTransactions[i].amount;
         }
        }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  bool _isSameDay(DateTime dateFirst, DateTime dateSecond) {
    return dateFirst.day == dateSecond.day
         && dateFirst.month == dateSecond.month
         && dateFirst.year == dateSecond.year;
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [

        ],
      ),
    );
  }
}