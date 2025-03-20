import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class TransactionsScreen extends StatefulWidget {
  final String accountType;

  const TransactionsScreen({super.key, required this.accountType});

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<dynamic>? transactions;

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    try {
      final String transactionString = await rootBundle.loadString(
        'assets/transactions.json',
      );
      final Map<String, dynamic> transactionData = json.decode(
        transactionString,
      );

      setState(() {
        transactions = transactionData['transactions'][widget.accountType];
      });
    } catch (e) {
      print("Error loading transactions: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.accountType} Transactions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
          transactions == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: transactions!.length,
                itemBuilder: (context, index) {
                  final transaction = transactions![index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      title: Text(transaction['description']),
                      subtitle: Text(transaction['date']),
                      trailing: Text(
                        '\$${transaction['amount'].toStringAsFixed(2)}',
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
