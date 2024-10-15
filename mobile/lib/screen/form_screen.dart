import 'package:flutter/material.dart';
import '../services/bank_api.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();
  final BankApi _api = BankApi();

  void _submitForm() async {
    String name = _nameController.text;
    String balance = _balanceController.text;

    if (name.isNotEmpty && balance.isNotEmpty) {
      String body = '{"name": "$name", "balance": $balance}';
      await _api.post(body);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _balanceController,
              decoration: const InputDecoration(labelText: 'Saldo'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
