import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HistoryTransactionScreen extends StatelessWidget {
  const HistoryTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF301F17),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Color(0xFFF3E9DC)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'History Transaction',
          style: TextStyle(color: Color(0xFFF3E9DC)),
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
            children: [
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  List<String> recipients = [
                    'Transfer to Endless',
                    'Payment to Gabriele',
                    'Donation to Charity',
                    'Refund from Michael',
                    'Purchase at Local Store',
                  ];
                  List<String> amounts = [
                    'Rp500.000',
                    'Rp250.000',
                    'Rp300.000',
                    'Rp150.000',
                    'Rp600.000',
                  ];
                  List<String> dates = [
                    '2024-10-06',
                    '2024-10-05',
                    '2024-10-04',
                    '2024-10-03',
                    '2024-10-02',
                  ];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20.0),
                      leading: const Icon(
                        CupertinoIcons.money_dollar,
                        color: Colors.amber,
                        size: 40,
                      ),
                      title: Text(
                        recipients[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            'Amount: ${amounts[index]}',
                            style: const TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Date: ${dates[index]}',
                            style: const TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF301F17),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}