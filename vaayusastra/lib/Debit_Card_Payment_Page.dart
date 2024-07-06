import 'package:flutter/material.dart';

class DebitCardPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debit Card Payment'),
        backgroundColor: Colors.blueGrey[900], // Match the AppBar color
      ),
      backgroundColor: Colors.blueGrey[900], // Match the background color
      body: CardPaymentForm(),
    );
  }
}

class CardPaymentForm extends StatefulWidget {
  @override
  _CardPaymentFormState createState() => _CardPaymentFormState();
}

class _CardPaymentFormState extends State<CardPaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  bool _isCvvObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Debit Card Payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Enter your payment details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: _amountController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cardNumberController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Card Number',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a card number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cvvController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'CVV',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isCvvObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCvvObscured = !_isCvvObscured;
                    });
                  },
                ),
              ),
              obscureText: _isCvvObscured,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a CVV';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _expiryDateController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Expiry Date',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 10),
                    );
                    if (pickedDate != null) {
                      _expiryDateController.text =
                          '${pickedDate.month}/${pickedDate.year}';
                    }
                  },
                ),
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an expiry date';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process payment
                  _showPaymentSuccessfulDialog(context);
                }
              },
              child: Text('Proceed Payment'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.yellow,
                textStyle: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Payment Successful: \$${_amountController.text}'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
