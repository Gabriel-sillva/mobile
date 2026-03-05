import 'package:flutter/material.dart';

class TelaExtrato extends StatelessWidget {
  const TelaExtrato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extrato"),
        backgroundColor: const Color.fromRGBO(209, 9, 51, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _itemExtrato("Supermercado BH", "- R\$ 150,00", "05 Mar", isNegative: true),
          _itemExtrato("Transferência Recebida", "+ R\$ 500,00", "04 Mar", isNegative: false),
          _itemExtrato("Posto Shell", "- R\$ 200,00", "03 Mar", isNegative: true),
          _itemExtrato("Netflix", "- R\$ 55,90", "02 Mar", isNegative: true),
        ],
      ),
    );
  }

  Widget _itemExtrato(String titulo, String valor, String data, {required bool isNegative}) {
    return ListTile(
      leading: Icon(isNegative ? Icons.remove_circle_outline : Icons.add_circle_outline, 
                    color: isNegative ? Colors.red : Colors.green),
      title: Text(titulo),
      subtitle: Text(data),
      trailing: Text(valor, style: TextStyle(fontWeight: FontWeight.bold, 
                color: isNegative ? Colors.black : Colors.green)),
    );
  }
}