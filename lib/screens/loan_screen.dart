import 'package:flutter/material.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  String? selectedLoanType;
  String amount = '';
  String selectedPaymentMethod = 'Bank Transfer';
  int loanTerm = 6;
  double interestRate = 0.05;

  final List<String> loanTypes = ['Personal Loan', 'Home Loan', 'Car Loan'];
  final List<String> paymentMethods = ['Bank Transfer', 'Credit Card', 'E-Wallet'];

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
          'Loan',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Loan Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              _buildLoanTypeSelection(),
              const SizedBox(height: 20),
              const Text(
                'Enter Loan Amount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8D6E63)),
                  ),
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
                'Select Loan Term (Months)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              _buildLoanTermSelection(),
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
                    onPressed: _onApplyNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF301F17),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Apply Now'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoanTypeSelection() {
    return Wrap(
      spacing: 10,
      children: loanTypes.map((loanType) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedLoanType = loanType;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: selectedLoanType == loanType ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Text(
              loanType,
              style: TextStyle(
                color: selectedLoanType == loanType ? Colors.white : Colors.white54,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLoanTermSelection() {
    return Wrap(
      spacing: 10,
      children: [6, 12, 24, 36].map((term) {
        return GestureDetector(
          onTap: () {
            setState(() {
              loanTerm = term;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: loanTerm == term ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Text(
              '$term Months',
              style: TextStyle(
                color: loanTerm == term ? Colors.white : Colors.white54,
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

  void _onApplyNow() {
    if (selectedLoanType == null || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a loan type and enter an amount')),
      );
      return;
    }

    double loanAmount = double.tryParse(amount) ?? 0;
    double monthlyPayment = (loanAmount + (loanAmount * interestRate)) / loanTerm;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Loan Application Successful'),
          content: Text(
            'You have successfully applied for a loan of Rp$amount for $selectedLoanType '
            'using $selectedPaymentMethod.\n\n'
            'Estimated Monthly Payment: Rp${monthlyPayment.toStringAsFixed(2)}',
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
          'Loan Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text('Loan Type: ${selectedLoanType ?? "None"}', style: const TextStyle(color: Colors.white)),
        Text('Amount: Rp${amount.isNotEmpty ? amount : "0"}', style: const TextStyle(color: Colors.white)),
        Text('Loan Term: $loanTerm Months', style: const TextStyle(color: Colors.white)),
        Text('Payment Method: $selectedPaymentMethod', style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}