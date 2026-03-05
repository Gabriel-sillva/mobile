import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Telacartao extends StatelessWidget {
  const Telacartao({super.key}); //  O nome aqui deve ser igual ao da classe

  @override
  Widget build(BuildContext context) {
    final Color vermelhoBradesco = const Color.fromRGBO(209, 9, 51, 1);

    return Scaffold(
      body: Column(
        children: [
          // --- HEADER PADRONIZADO ---
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
                  "Meus Cartões",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // --- FORMULÁRIO DO CARTÃO ---
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cadastrar novo cartão",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Campo de Número do Cartão
                TextField(
                  keyboardType: TextInputType.number, // Abre o teclado numérico
                  decoration: InputDecoration(
                    labelText: "Número do Cartão",
                    hintText: "0000 0000 0000 0000",
                    prefixIcon: const Icon(Icons.credit_card),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: vermelhoBradesco, width: 2),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),

                // Botão de Confirmar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vermelhoBradesco,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Continuar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MascaraCartaoFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, 
    TextEditingValue newValue
  ) {
    var text = newValue.text;

    // Se o usuário estiver apagando, não fazemos nada
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonSpaceLength = i + 1;
      // Adiciona um espaço a cada 4 caracteres, mas não no final
      if (nonSpaceLength % 4 == 0 && nonSpaceLength != text.length) {
        buffer.write(' '); // Pode trocar por '-' se preferir traço
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}