import 'package:flutter/material.dart';

class TelaCartao extends StatelessWidget {
  const TelaCartao({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER COM TABS (CRÉDITO / DÉBITO) ---
            Container(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: vermelhoBradesco,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Cartões",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Seletor de Crédito/Débito
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        _buildTab("Crédito", true),
                        _buildTab("Débito", false),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- BANNER AZUL (PEÇA UM NOVO CARTÃO) ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A4685), // Azul escuro
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add_card, color: Colors.white),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "Peça um novo cartão de crédito!",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // --- GRID DE SERVIÇOS DO TOPO ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallCard(Icons.description_outlined, "Fatura do\ncartão"),
                      _buildSmallCard(Icons.tune, "Limite do\ncartão"),
                      _buildSmallCard(Icons.qr_code_scanner, "Pagamento\nde fatura"),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text("Pagamentos digitais", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 15),

                  // --- CARDS LARGOS (CARTÃO VIRTUAL E G-PAY) ---
                  Row(
                    children: [
                      Expanded(child: _buildWideCard(Icons.credit_card, "Cartão virtual", isNew: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildWideCard(Icons.account_balance_wallet_outlined, "G Pay")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildWideCard(Icons.tap_and_play, "Click to Pay", isFullWidth: true),

                  const SizedBox(height: 30),
                  const Text("Configurações", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 15),

                  // --- LISTA DE CONFIGURAÇÕES EM GRID ---
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      _buildWideCard(Icons.lock_open, "Desbloqueio"),
                      _buildWideCard(Icons.settings_suggest, "Opções da\nfatura", isNew: true),
                      _buildWideCard(Icons.flight, "Aviso de viagem"),
                      _buildWideCard(Icons.block, "Bloqueio temporário"),
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

  // --- WIDGETS AUXILIARES PARA LIMPAR O CÓDIGO ---

  Widget _buildTab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: active ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCard(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.red[900], size: 30),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildWideCard(IconData icon, String label, {bool isNew = false, bool isFullWidth = false}) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.red[900]),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isNew) 
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4)),
                    child: const Text("NOVO", style: TextStyle(color: Colors.white, fontSize: 8)),
                  ),
                Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}