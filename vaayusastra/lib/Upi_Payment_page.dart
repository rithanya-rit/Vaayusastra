import 'package:flutter/material.dart';

class UpiPaymentPage extends StatefulWidget {
  @override
  _UpiPaymentPageState createState() => _UpiPaymentPageState();
}

class _UpiPaymentPageState extends State<UpiPaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _upiIdController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment'),
        backgroundColor: Colors.blueGrey[900], // Match the AppBar color
      ),
      backgroundColor: Colors.blueGrey[900], // Match the background color
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UPI Payment Integration',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
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
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _upiIdController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'UPI ID',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your UPI ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _pinController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'PIN',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your UPI PIN';
                  }
                  if (value.length < 4) {
                    return 'PIN must be at least 4 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed to payment confirmation
                    _showConfirmationDialog(context);
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
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amount: \$${_amountController.text}'),
              SizedBox(height: 10),
              Text('UPI ID: ${_upiIdController.text}'),
              SizedBox(height: 10),
              Text('UPI Payment will be processed.'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Simulate processing delay
                _simulateProcessing(context);
              },
              child: Text('Confirm'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                textStyle: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
          ],
        );
      },
    );
  }

  void _simulateProcessing(BuildContext context) {
    // Show processing dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss by tapping outside
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate processing delay
    Future.delayed(Duration(seconds: 2), () {
      // Close processing dialog
      Navigator.of(context).pop();

      // Show payment success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment Successful: \$${_amountController.text} via UPI')),
      );
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _upiIdController.dispose();
    _pinController.dispose();
    super.dispose();
  }
}
