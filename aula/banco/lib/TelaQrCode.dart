import 'package:flutter/material.dart';

// Mudei para StatelessWidget para simplificar, já que não vamos mudar estados agora
class Telaqrcode extends StatelessWidget {
  const Telaqrcode({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

    return Scaffold(
      body: Column(
        children: [
          // --- HEADER ARREDONDADO ---
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
              color: vermelhoBradesco,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Área QR Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // --- CONTEÚDO (BOTÕES GRANDES) ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Usando a função auxiliar para criar botões com o estilo da imagem que você mandou
                _buildLargeButton(Icons.qr_code_scanner, "Ler QR Code", "Aponte a câmera para um código"),
                _buildLargeButton(Icons.qr_code, "Meu QR Code", "Mostre seu código para receber"),
                _buildLargeButton(Icons.history, "Histórico de Leitura", "Veja códigos escaneados anteriormente"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Função auxiliar para manter o padrão de botões arredondados e grandes
  Widget _buildLargeButton(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 100, // Altura confortável para o toque
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color.fromRGBO(209, 9, 51, 1), size: 30),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}