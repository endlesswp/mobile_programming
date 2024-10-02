import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedUtility;
  String amount = '';
  String selectedPaymentMethod = 'Credit Card';

  final List<String> utilities = ['Electricity', 'Internet', 'Water', 'Insurance'];
  final List<String> paymentMethods = ['Credit Card', 'Debit Card', 'E-Wallet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF301F17),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF3E9DC)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Color(0xFFF3E9DC),
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4E342E),
              Color(0xFF8D6E63),
              Color(0xFF4E342E),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Utility Service',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildUtilitySelection(),
            const SizedBox(height: 20),
            const Text(
              'Enter Amount',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Amount (Rp)',
                prefixIcon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildPaymentMethodSelection(),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: _onPayNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF301F17),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Pay Now'),
                ),
              ),
            ),
            const Spacer(),
            _buildSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildUtilitySelection() {
    return Wrap(
      spacing: 10,
      children: utilities.map((utility) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedUtility = utility;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: selectedUtility == utility ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Text(
              utility,
              style: TextStyle(
                color: selectedUtility == utility ? Colors.white : Colors.white54,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Wrap(
      spacing: 10,
      children: paymentMethods.map((method) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedPaymentMethod = method;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: selectedPaymentMethod == method ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Text(
              method,
              style: TextStyle(
                color: selectedPaymentMethod == method ? Colors.white : Colors.white54,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _onPayNow() {
    if (selectedUtility == null || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a utility and enter an amount')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: Text(
            'You have successfully paid Rp$amount for $selectedUtility using $selectedPaymentMethod.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF301F17)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text('Utility: ${selectedUtility ?? "None"}', style: const TextStyle(color: Colors.white)),
        Text('Amount: Rp${amount.isNotEmpty ? amount : "0"}', style: const TextStyle(color: Colors.white)),
        Text('Payment Method: $selectedPaymentMethod', style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}