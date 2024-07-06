import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Payment Options'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PaymentOptionButton(
                icon: Icons.credit_card,
                text: 'Debit Card',
                onPressed: () => Navigator.pushNamed(context, '/debit_card'),
              ),
              SizedBox(height: 20),
              PaymentOptionButton(
                icon: Icons.credit_card,
                text: 'Credit Card',
                onPressed: () => Navigator.pushNamed(context, '/credit_card'),
              ),
              SizedBox(height: 20),
              PaymentOptionButton(
                icon: Icons.account_balance_wallet,
                text: 'PayPal',
                onPressed: () => Navigator.pushNamed(context, '/paypal'),
              ),
              SizedBox(height: 20),
              PaymentOptionButton(
                icon: Icons.qr_code,
                text: 'UPI',
                onPressed: () => Navigator.pushNamed(context, '/upi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  PaymentOptionButton({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: Colors.blueGrey[900]),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
