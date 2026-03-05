import 'package:flutter/material.dart';
import 'package:banco/TelaInicial.dart'; 
import 'package:banco/TelaCartao.dart';
import 'package:banco/TelaPix.dart';
import 'package:banco/TelaExtrato.dart'; // Certifique-se de ter criado esse arquivo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(209, 9, 51, 1),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const TelaInicial(),
      routes: {
        '/home': (context) => const BradescoHome(),
        '/pix': (context) => const TelaPix(),
        '/cartoes': (context) => const TelaCartao(),
        '/extrato': (context) => const TelaExtrato(),
      },
    );
  }
}

class BradescoHome extends StatefulWidget {
  const BradescoHome({super.key});

  @override
  State<BradescoHome> createState() => _BradescoHomeState();
}

class _BradescoHomeState extends State<BradescoHome> {
  // --- VARIÁVEIS DE ESTADO ---
  bool _saldoVisivel = false;
  String _filtroBia = "";
  final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

  // Lista de serviços para a BIA filtrar
  final List<Map<String, dynamic>> _servicos = [
    {"icon": Icons.swap_horiz, "label": "Transferências", "rota": null},
    {"icon": Icons.grid_view, "label": "Pix", "rota": '/pix'},
    {"icon": Icons.qr_code_scanner, "label": "Pagamentos", "rota": null},
    {"icon": Icons.credit_card, "label": "Cartões", "rota": '/cartoes'},
    {"icon": Icons.monetization_on_outlined, "label": "Empréstimos", "rota": null},
    {"icon": Icons.trending_up, "label": "Investimentos", "rota": null},
    {"icon": Icons.pie_chart_outline, "label": "Open Finance", "rota": null},
    {"icon": Icons.tune, "label": "Personalizar", "rota": null, "isBlue": true},
  ];

  @override
  Widget build(BuildContext context) {
    // Lógica do filtro da BIA
    final servicosFiltrados = _servicos.where((s) {
      return s['label'].toString().toLowerCase().contains(_filtroBia.toLowerCase());
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER VERMELHO ---
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
              decoration: BoxDecoration(
                color: vermelhoBradesco,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Gabriel Silva",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                        child: const Text("Sair", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Saldo", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      _saldoVisivel 
                        ? const Text("R\$ 1.250,00", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                        : Container(width: 110, height: 25, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(4))),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => setState(() => _saldoVisivel = !_saldoVisivel),
                        child: Icon(_saldoVisivel ? Icons.visibility : Icons.visibility_off_outlined, color: Colors.white, size: 22),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/extrato'),
                        child: const Text("Ver extrato", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  _buildBarraBuscaBia(), // Barra da BIA
                ],
              ),
            ),

            // --- CONTEÚDO (FAVORITOS FILTRADOS) ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_filtroBia.isEmpty ? "Favoritos" : "Resultado da busca", 
                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: servicosFiltrados.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final item = servicosFiltrados[index];
                      return _itemMenu(
                        item['icon'], 
                        item['label'], 
                        isBlue: item['isBlue'] ?? false, 
                        rota: item['rota']
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS AUXILIARES (DENTRO DA CLASSE STATE) ---

  Widget _buildBarraBuscaBia() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 55,
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: Text("BIA", style: TextStyle(fontSize: 9, color: vermelhoBradesco, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: (value) => setState(() => _filtroBia = value),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Buscar serviço ou falar com a BIA",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search, color: Colors.white),
        ],
      ),
    );
  }

  Widget _itemMenu(IconData icon, String label, {bool isBlue = false, String? rota}) {
    return GestureDetector(
      onTap: () {
        if (rota != null) Navigator.pushNamed(context, rota);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Icon(icon, color: isBlue ? Colors.blue : vermelhoBradesco, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}  