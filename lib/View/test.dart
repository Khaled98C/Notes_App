import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _dateString = '';

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateString = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  TextEditingController con = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a date'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_dateString),
            MaterialButton(
              onPressed: _selectDate,
              child: Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}
