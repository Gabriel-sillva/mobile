import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usando BoxDecoration para fazer o gradiente do Bradesco
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE30613), // Vermelho mais claro em cima
              Color(0xFFB0040D), // Vermelho mais escuro embaixo
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- TOPO (Menu e Notificação) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white, size: 30),
                    Stack(
                      children: [
                        const Icon(Icons.notifications_none, color: Colors.white, size: 30),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.green,
                            child: const Text("1", style: TextStyle(fontSize: 10, color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // --- LOGO E BOAS-VINDAS ---
              const Icon(Icons.account_balance, color: Colors.white, size: 60), // Simulando logo
              const SizedBox(height: 10),
              const Text(
                "bradesco",
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              
              const SizedBox(height: 60),

              const Text(
                "Olá, Gabriel Silva",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                "Agência **02    Conta ***48-0",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 50),

              // --- BOTÃO ACESSAR CONTA ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // NAVEGAÇÃO PARA A HOME (Main.dart)
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      "acessar conta",
                      style: TextStyle(color: Color(0xFFCC092F), fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // --- BOTÕES INFERIORES (BIA, PIX, ETC) ---
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomItem(Icons.lock_outline, "Chave de\nSegurança"),
                    _buildBottomItem(Icons.chat_bubble_outline, "BIA", isSpecial: true),
                    _buildBottomItem(Icons.grid_view, "PIX"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomItem(IconData icon, String label, {bool isSpecial = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: isSpecial ? Border.all(color: Colors.white, width: 2) : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}