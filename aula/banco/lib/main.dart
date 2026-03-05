import 'package:flutter/material.dart';
import 'package:banco/TelaInicial.dart'; 
import 'package:banco/TelaCartao.dart';
import 'package:banco/TelaPix.dart';

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
      // Centralizei as rotas aqui para ficar fácil de dar manutenção
      routes: {
        '/home': (context) => const BradescoHome(),
        '/pix': (context) => const TelaPix(),
        '/cartoes': (context) => const TelaCartao(),
      },
    );
  }
}

// Transformei a Home em StatefulWidget para a lógica do "Olhinho" do saldo funcionar
class BradescoHome extends StatefulWidget {
  const BradescoHome({super.key});

  @override
  State<BradescoHome> createState() => _BradescoHomeState();
}

class _BradescoHomeState extends State<BradescoHome> {
  // Variável que controla se o saldo aparece ou não
  bool _saldoVisivel = false;
  final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

  @override
  Widget build(BuildContext context) {
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
                      // Botão Sair funcionando agora
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
                      // Lógica do Saldo: Se estiver visível mostra o valor, se não, mostra o bloco
                      _saldoVisivel 
                        ? const Text("R\$ 1.250,00", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                        : Container(
                            width: 110,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                      const SizedBox(width: 12),
                      // Ícone do Olhinho clicável
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _saldoVisivel = !_saldoVisivel;
                          });
                        },
                        child: Icon(
                          _saldoVisivel ? Icons.visibility : Icons.visibility_off_outlined, 
                          color: Colors.white, 
                          size: 22
                        ),
                      ),
                      const Spacer(),
                      const Text("Ver extrato", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                    ],
                  ),
                  const SizedBox(height: 35),
                  // Barra de busca BIA
                  _buildBarraBusca(),
                ],
              ),
            ),

            // --- CONTEÚDO PRINCIPAL (FAVORITOS) ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Favoritos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.85,
                    children: [
                      _itemMenu(Icons.swap_horiz, "Transferências"),
                      _itemMenu(Icons.grid_view, "Pix", rota: '/pix'),
                      _itemMenu(Icons.qr_code_scanner, "Pagamentos"),
                      _itemMenu(Icons.credit_card, "Cartões", rota: '/cartoes'),
                      _itemMenu(Icons.monetization_on_outlined, "Empréstimos"),
                      _itemMenu(Icons.trending_up, "Investimentos"),
                      _itemMenu(Icons.pie_chart_outline, "Open Finance"),
                      _itemMenu(Icons.tune, "Personalizar", isBlue: true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE APOIO DENTRO DA STATE ---

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

  Widget _buildBarraBusca() {
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
          const Text("Buscar serviço ou falar com a BIA", style: TextStyle(color: Colors.white, fontSize: 14)),
          const Spacer(),
          const Icon(Icons.search, color: Colors.white),
        ],
      ),
    );
  }
}