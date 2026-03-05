// 1. IMPORTAÇÃO
// O comando 'import' traz a biblioteca Material Design. 
// Ela contém todos os botões, textos e ícones que vemos no Android e iOS.
import 'package:flutter/material.dart';

// 2. FUNÇÃO PRINCIPAL (Ponto de entrada)
// Todo app em Dart começa pela função main(). 
// O comando 'runApp' diz ao Flutter qual é o widget principal que deve ser desenhado primeiro.
void main() {
  runApp(const MyApp());
}

// 3. CLASSE CONFIGURADORA (StatelessWidget)
// O 'StatelessWidget' é usado para telas ou componentes que não mudam de estado 
// (como cores fixas e textos estáticos). O MyApp configura o "estilo" do app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o "envelope" do app. Ele gerencia rotas, temas e idiomas.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Esconde a etiqueta "Debug" no simulador
      title: 'Lista de Exercícios Flutter',
      theme: ThemeData(
        // 'colorScheme' define as cores automáticas do app (botões, barras, etc)
        // O '.fromSeed' gera uma paleta inteira a partir de uma cor escolhida.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 110)),
        useMaterial3: true, // Ativa a versão mais atual dos componentes visuais
      ),
      // 'home' indica qual widget será a tela inicial (a porta de entrada).
      home: const MyHomePage(title: 'Lista de Exercícios Flutter'),
    );
  }
}

// 4. TELA PRINCIPAL
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // O Scaffold é o "esqueleto" padrão de uma tela. 
    // Ele reserva espaço para a barra superior (appBar) e o corpo (body).
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // Define a cor da barra baseada no tema que criamos lá no MyApp
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // SingleChildScrollView: Funciona como uma "janela de rolagem". 
      // Sem isso, se você tiver muitos exercícios, eles seriam cortados no final da tela.
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0), // Padding cria uma margem interna (respiro nas bordas)
        child: Column(
          // 'Column' empilha os widgets verticalmente (um abaixo do outro).
          // 'crossAxisAlignment.start' alinha tudo para a esquerda (início).
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            
            // --- EXERCÍCIO 1: CONTAINER ---
            // O Container é uma caixa versátil. Definimos largura (width), altura (height) e cor.
            _buildExercicio("1) Nível Fácil", Column(
              children: [
                Container(width: 100, height: 100, color: Colors.blue), 
                const Text("Texto abaixo do container"),
              ],
            )),

            // --- EXERCÍCIO 2: TEXTO E BOTÃO ---
            // 'ElevatedButton' é o botão clássico com sombra. 
            // O 'onPressed: () {}' é a ação do clique (que agora está vazia).
            _buildExercicio("2) Nível Fácil", Column(
              children: [
                const Text("Bem-vindo", style: TextStyle(fontSize: 20)),
                ElevatedButton(onPressed: () {}, child: const Text("Entrar")),
              ],
            )),

            // --- EXERCÍCIO 3: ROW E ALINHAMENTO START ---
            // 'Row' organiza os elementos horizontalmente (lado a lado).
            // 'mainAxisAlignment' na Row controla a distribuição horizontal.
            _buildExercicio("3) Nível Médio", Row(
              mainAxisAlignment: MainAxisAlignment.start, // Tudo para a esquerda
              children: const [
                Text("Login ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Senha"),
              ],
            )),

            // --- EXERCÍCIO 4: ROW E ALINHAMENTO CENTER ---
            _buildExercicio("4) Nível Médio", Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões na linha
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Sim")),
                const SizedBox(width: 10), // SizedBox funciona como um "espaçador" invisível
                ElevatedButton(onPressed: () {}, child: const Text("Não")),
              ],
            )),

            // --- EXERCÍCIO 5: CONTAINER COM TEXTO CENTRALIZADO ---
            // Aqui o Container usa 'alignment: Alignment.center' para que o TEXTO fique no meio dele.
            _buildExercicio("5) Nível Difícil", Column(
              children: [
                Container(
                  width: double.infinity, // Pega toda a largura da tela
                  height: 60,
                  color: Colors.yellow,
                  alignment: Alignment.center, 
                  child: const Text("Texto Centralizado"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("Botão A")),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text("Botão B")),
                  ],
                )
              ],
            )),

            // --- EXERCÍCIO 6: STACK (EMPILHAMENTO) ---
            // 'Stack' é como camadas de Photoshop. O primeiro widget da lista fica no fundo.
            _buildExercicio("6) Nível Difícil", Stack(
              alignment: Alignment.center, // Centraliza as camadas superiores
              children: [
                // Camada 1: Imagem (Fundo)
                Image.network('https://picsum.photos/id/237/400/150', fit: BoxFit.cover),
                // Camada 2: Texto (Fica por cima da imagem)
                const Text("Texto sobre a Imagem", 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 22, 
                    fontWeight: FontWeight.bold, 
                    backgroundColor: Colors.black45 // Fundo preto transparente para dar leitura
                  )),
              ],
            )),

            // --- EXERCÍCIO 7: TUDO JUNTO ---
            // Combina uma Column principal com uma Stack e uma Row interna.
            _buildExercicio("7) Nível Muito Difícil", Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network('https://picsum.photos/id/1/400/150', fit: BoxFit.cover),
                    const Text("TOP TEXT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Botão Abaixo")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Ícones alinhados no início
                  children: const [
                    Icon(Icons.star, size: 40),
                    Icon(Icons.palette, size: 40),
                    Icon(Icons.bolt, size: 40),
                  ],
                ),
              ],
            )),

          ],
        ),
      ),
    );
  }

  // 5. FUNÇÃO DE CONSTRUÇÃO DE BLOCOS (REUTILIZAÇÃO)
  // Para não repetir código, criamos este método que recebe um título e um conteúdo.
  // Ele desenha o título em verde, coloca uma linha (Divider) e o conteúdo abaixo.
  Widget _buildExercicio(String titulo, Widget conteudo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0), // Espaço entre o fim de um exercício e o início de outro
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
          const Divider(), // Linha horizontal decorativa
          const SizedBox(height: 10), // Pequeno espaço entre o título e o exercício
          conteudo, // Aqui é onde o código de cada questão é injetado
        ],
      ),
    );
  }
}