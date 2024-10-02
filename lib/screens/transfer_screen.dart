import 'package:flutter/material.dart';

class Recipient {
  final String name;
  final String accountNumber;

  Recipient({required this.name, required this.accountNumber});
}

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String? selectedRecipient;
  String amount = '';
  String selectedTransferMethod = 'Bank Transfer';

  final List<Recipient> recipients = [
    Recipient(name: 'Wilsen', accountNumber: '0000000001'),
    Recipient(name: 'Jhos', accountNumber: '1111111112'),
    Recipient(name: 'Endless', accountNumber: '2222222223'),
    Recipient(name: 'Gabriel', accountNumber: '3333333334'),
    Recipient(name: 'Michael', accountNumber: '4444444445'),
    Recipient(name: 'Gabriele', accountNumber: '5555555556'),
  ];

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
          'Transfer',
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
                'Select Recipient',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              _buildRecipientSelection(),
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
                'Select Transfer Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              _buildTransferMethodSelection(),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: _onTransferNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF301F17),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Transfer Now'),
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

  Widget _buildRecipientSelection() {
    return Column(
      children: recipients.map((recipient) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRecipient = recipient.name;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: selectedRecipient == recipient.name ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(Icons.person, color: Color(0xFF301F17)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipient.name,
                        style: TextStyle(
                          color: selectedRecipient == recipient.name ? Colors.white : Colors.white54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        recipient.accountNumber,
                        style: TextStyle(
                          color: selectedRecipient == recipient.name ? Colors.white : Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTransferMethodSelection() {
    return Wrap(
      spacing: 10,
      children: ['Bank Transfer', 'E-Wallet', 'Cash'].map((method) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTransferMethod = method;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: selectedTransferMethod == method ? const Color(0xFF5D4037) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF8D6E63)),
            ),
            child: Text(
              method,
              style: TextStyle(
                color: selectedTransferMethod == method ? Colors.white : Colors.white54,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _onTransferNow() {
    if (selectedRecipient == null || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a recipient and enter an amount')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Transfer Successful'),
          content: Text(
            'You have successfully transferred Rp$amount to $selectedRecipient using $selectedTransferMethod.',
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
          'Transfer Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text('Recipient: ${selectedRecipient ?? "None"}', style: const TextStyle(color: Colors.white)),
        Text('Amount: Rp${amount.isNotEmpty ? amount : "0"}', style: const TextStyle(color: Colors.white)),
        Text('Transfer Method: $selectedTransferMethod', style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}