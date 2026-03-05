import 'package:banco/TelaQrCode.dart';
import 'package:flutter/material.dart';

class TelaPix extends StatelessWidget {
  const TelaPix({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

    return Scaffold(
      body: Column(
        children: [
          // --- HEADER ---
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

          // --- LISTA DE BOTÕES ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Agora passamos o contexto e a tela de destino
                _buildLargeButton(context, Icons.qr_code_scanner, "Pagar com QR Code", telaDestino: const Telaqrcode()),
                _buildLargeButton(context, Icons.copy, "Pix Copia e Cola"),
                _buildLargeButton(context, Icons.send_outlined, "Transferir"),
                _buildLargeButton(context, Icons.file_download_outlined, "Receber"),
                _buildLargeButton(context, Icons.vpn_key_outlined, "Minhas Chaves"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNÇÃO ATUALIZADA PARA ACEITAR NAVEGAÇÃO ---
  Widget _buildLargeButton(BuildContext context, IconData icon, String label, {Widget? telaDestino}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 90,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Se você passou uma tela, ele navega. Se não passou, não faz nada.
            if (telaDestino != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => telaDestino),
              );
            }
          },
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