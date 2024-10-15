import 'package:flutter/material.dart';
import '../services/bank_api.dart';
import 'dart:convert';
import 'form_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final BankApi _api = BankApi();
  List<dynamic> _transacoes = [];

  @override
  void initState() {
    super.initState();
    _fetchtransacoes();
  }

  void _fetchtransacoes() async {
    String response = await _api.getAll();
    setState(() {
      _transacoes = jsonDecode(response);
    });
  }

  void _deleteCliente(String id) async {
    await _api.delete(id);
    _fetchtransacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: ListView.builder(
        itemCount: _transacoes.length,
        itemBuilder: (context, index) {
          var cliente = _transacoes[index];
          return ListTile(
            title: Text(cliente['name']),
            subtitle: Text('Saldo: ${cliente['balance']}'),
            trailing: IconButton(
              // preciso colocar o botao de edição
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteCliente(cliente['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          ).then((_) => _fetchtransacoes());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
