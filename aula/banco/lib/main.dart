import 'package:banco/TelaCartao.dart';
import 'package:banco/TelaPix.dart';
import 'package:flutter/material.dart';
import 'package:banco/TelaInicial.dart';

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
      // A primeira tela que abre agora é a Inicial
      home: const TelaInicial(),
      
      // Rotas para facilitar a navegação entre telas
      routes: {
        '/home': (context) => const BradescoHome(),
      },
    );
  }
}


class BradescoHome extends StatelessWidget {
  const BradescoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

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
                      const Stack(
                        children: [
                          Icon(Icons.notifications_none, color: Colors.white, size: 28),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                              child: Text("1", style: TextStyle(fontSize: 8, color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Sair", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Saldo", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.visibility_outlined, color: Colors.white, size: 22),
                      const Spacer(),
                      const Text("Ver extrato", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                    ],
                  ),
                  const SizedBox(height: 35),
                  // Barra de busca BIA
                  Container(
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
                  ),
                ],
              ),
            ),

            // --- CONTEÚDO PRINCIPAL ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Favoritos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  
                  // GRID DE FAVORITOS
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.85,
                    children: [
                      _buildMenuItem(context, Icons.swap_horiz, "Transferências"),
                      // AQUI ESTÁ A NAVEGAÇÃO PARA A TELA PIX:
                      _buildMenuItem(context, Icons.grid_view, "Pix", telaDestino: const TelaPix()),
                      _buildMenuItem(context, Icons.qr_code_scanner, "Pagamentos"),
                      _buildMenuItem(context, Icons.credit_card, "Cartões", telaDestino: const TelaCartao()),
                      _buildMenuItem(context, Icons.monetization_on_outlined, "Empréstimos"),
                      _buildMenuItem(context, Icons.trending_up, "Investimentos"),
                      _buildMenuItem(context, Icons.pie_chart_outline, "Open Finance"),
                      _buildMenuItem(context, Icons.tune, "Personalizar", isBlue: true),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  _buildPromoBanner(vermelhoBradesco),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- FUNÇÃO DE MENU ATUALIZADA COM GESTUREDETECTOR ---
  Widget _buildMenuItem(BuildContext context, IconData icon, String label, {bool isBlue = false, Widget? telaDestino}) {
    return GestureDetector(
      onTap: () {
        // Se uma tela de destino foi passada, navega para ela
        if (telaDestino != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => telaDestino),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
              ],
            ),
            child: Icon(
              icon, 
              color: isBlue ? Colors.blue[700] : const Color.fromRGBO(209, 9, 51, 1), 
              size: 28
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: isBlue ? Colors.blue[700] : Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(Color primaryColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(width: 80, height: 80, color: Colors.grey[300], child: const Icon(Icons.image, color: Colors.white)),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("O Pix no Bradesco está melhor", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text("Seguro contra golpes", style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: primaryColor),
        ],
      ),
    );
  }
}



