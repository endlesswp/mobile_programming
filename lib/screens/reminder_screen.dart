import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final List<Map<String, String>> reminders = [];

  void _saveReminder() {
    if (titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      setState(() {
        reminders.add({
          'title': titleController.text,
          'amount': amountController.text,
          'date': dateController.text,
        });
        titleController.clear();
        amountController.clear();
        dateController.clear();
      });
    }
  }

  void _deleteInputs() {
    titleController.clear();
    amountController.clear();
    dateController.clear();
  }

  void _deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Reminder',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'For Sarang Wallet Friends',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Set Your Reminder',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: _deleteInputs,
                        ),
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: _saveReminder,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Reminders List:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: reminders.isNotEmpty 
                  ? ListView.builder(
                      itemCount: reminders.length,
                      itemBuilder: (context, index) {
                        final reminder = reminders[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8D6E63),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: ${reminder['title']}', style: const TextStyle(color: Colors.white)),
                                    Text('Amount: ${reminder['amount']}', style: const TextStyle(color: Colors.white)),
                                    Text('Date: ${reminder['date']}', style: const TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteReminder(index),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No reminders yet!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}