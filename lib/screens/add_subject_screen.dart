import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a subject name';
    }
    return null;
  }

  String? _validateMark(String? value) {
    final mark = int.tryParse(value?.trim() ?? '');
    if (mark == null) {
      return 'Please enter a valid number';
    }
    if (mark < 0 || mark > 100) {
      return 'Mark must be between 0 and 100';
    }
    return null;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final mark = int.parse(_markController.text.trim());
    context.read<SubjectProvider>().addSubject(name, mark);

    _nameController.clear();
    _markController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name added')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Subject name',
                border: OutlineInputBorder(),
              ),
              validator: _validateName,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Mark (0-100)',
                border: OutlineInputBorder(),
              ),
              validator: _validateMark,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _submit,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Add Subject'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
