import 'package:flutter/material.dart';

class TelaPix extends StatelessWidget {
  const TelaPix({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

    return Scaffold(
      // Removi a AppBar padrão para usarmos o Header customizado no body
      body: Column(
        children: [
          // --- HEADER DA TELA PIX (Igual à Home para manter o padrão) ---
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
                // Botão para voltar
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Área Pix",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // --- LISTA DE BOTÕES GRANDES E ARREDONDADOS ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildLargeButton(Icons.qr_code_scanner, "Pagar com QR Code"),
                _buildLargeButton(Icons.copy, "Pix Copia e Cola"),
                _buildLargeButton(Icons.send_outlined, "Transferir"),
                _buildLargeButton(Icons.file_download_outlined, "Receber"),
                _buildLargeButton(Icons.vpn_key_outlined, "Minhas Chaves"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Função para criar os botões grandes e arredondados (Cards)
  Widget _buildLargeButton(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15), // Espaço entre os botões
      height: 90, // Altura maior para o botão
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Bem arredondado
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Ícone com fundo leve para destacar
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: const Color.fromRGBO(209, 9, 51, 1), size: 30),
                ),
                const SizedBox(width: 20),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}