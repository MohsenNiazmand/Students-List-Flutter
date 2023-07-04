import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';

class AddStudentForm extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  AddStudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {

          },
          label: Row(
            children: const [Icon(Icons.check), Text('Save')],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                label: Text('First Name'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                label: Text('Last Name'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _courseController,
              decoration: const InputDecoration(
                label: Text('Course'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _scoreController,
              decoration: const InputDecoration(
                label: Text('Score'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}