import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Payment Options'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.yellow),
            title: Text('UPI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushNamed(context, '/upi'); // Navigate to UPI payment page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.yellow),
            title: Text('Credit Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushNamed(context, '/credit_card'); // Navigate to Credit Card payment page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.yellow),
            title: Text('Debit Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushNamed(context, '/debit_card'); // Navigate to Debit Card payment page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.yellow),
            title: Text('PayPal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushNamed(context, '/paypal'); // Navigate to PayPal payment page
            },
          ),
        ],
      ),
    );
  }
}

class UpiPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment'),
      ),
      body: Center(
        child: Text('UPI Payment Page'),
      ),
    );
  }
}

class CreditCardPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Payment'),
      ),
      body: Center(
        child: Text('Credit Card Payment Page'),
      ),
    );
  }
}

class DebitCardPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debit Card Payment'),
      ),
      body: Center(
        child: Text('Debit Card Payment Page'),
      ),
    );
  }
}

class PayPalPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Payment'),
      ),
      body: Center(
        child: Text('PayPal Payment Page'),
      ),
    );
  }
}
