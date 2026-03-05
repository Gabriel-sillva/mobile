// // //biblioteca que importa os componentes do flutter
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const Home());
// // }

// // class Home extends StatelessWidget {
// //   const Home({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(appBar: AppBar(title: Text("Hacker Do Bem",style:TextStyle(color: Colors.white))),
// //       backgroundColor: Color.fromARGB(255, 61, 10, 10)
// //       ),
// //       body:Center(child: 
// //         Column(
// //          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento do eixo principal Y
// //          spacing: 30, // da Espacamento entre os elementos  
// //          children: [Text("Eu sou o MELHOR.. se Eu não pensar nisso, então quem pensaram por Mim?"),
// //         Text("Neste app voce vera...."),
// //         TextButton(onPressed:(){},child: Text("Pressione Aqui"))]))
// //       ),
// //     );
// //   )
// //   }
// // }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Home());
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // O fundo e o corpo devem ficar dentro do Scaffold
//         backgroundColor: const Color.fromARGB(255, 61, 10, 10),
//         appBar: AppBar(
//           title: const Text("Hacker Do Bem", style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.black, // Cor para combinar com o tema
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 30, 
//             children: [
//               const Text(
//                 "Eu sou o MELHOR.. se Eu não pensar nisso, então quem pensará por Mim?",
//                 style: TextStyle(color: Colors.white), // Texto branco para aparecer no fundo escuro
//                 textAlign: TextAlign.center,
//               ),
//               const Text(
//                 "Por que Existe Hacker.. Como Surgiu.. tudo aqui Em Hcker Do Bem.",
//                 style: TextStyle(color: Colors.white70),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text("Pressione Aqui", style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           ),
//         ),
//       ), // Fechamento do Scaffold
//     ); // Fechamento do MaterialApp
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tira aquela faixa escrita 'DEBUG'
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 61, 10, 10),
        appBar: AppBar(
          title: const Text("Hacker Do Bem", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Dá um espaço nas laterais
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30, 
              children: [

              // Imagem 1 
              Image.network(
                'https://images.unsplash.com/photo-1666615435088-4865bf5ed3fd?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGFja2VyfGVufDB8fDB8fHww',
                height: 120, // Diminuí um pouco o tamanho para caber tudo na tela
                fit: BoxFit.cover,
              ),

              // IMAGEM 2
              Image.network(
                'data:image/jpeg;base64,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',
                height: 120,
                fit: BoxFit.cover,
              ),

              // NOVA IMAGEM 3
              Image.network(
                'data:image/jpeg;base64,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',
                height: 120,
                fit: BoxFit.cover,
              ),

                // SEU TEXTO: Agora com tamanho maior e negrito
                const Text(
                  "Eu sou o MELHOR.. se Eu não pensar nisso, então quem pensará por Mim?",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 22, 
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                const Text(
                  "Por que Existe Hacker.. Como Surgiu.. tudo aqui Em Hacker Do Bem.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),

                // SEU BOTÃO: Agora com cor de fundo vermelha
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900], // Vermelho escuro
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    print("Sistema Acessado!");
                  },
                  child: const Text(
                    "Pressione Aqui", 
                    style: TextStyle(color: Colors.white, fontSize: 18)
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}