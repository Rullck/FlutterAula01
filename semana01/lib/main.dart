import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Flutter Aula 01', // alteração do titulo da aba
      theme: ThemeData(
         // O MaterialApp é um widget de conveniência que envolve vários widgets que normalmente são necessários para aplicativos de material design.
         //O widget MaterialApp fornece um layout orientado ao material design. Para usá-lo, precisamos criar uma nova instância dentro do método runnAp
         // Este é o tema da sua aplicação.
         // Tente executar seu aplicativo com "flutter run". Você verá o
         // o aplicativo tem uma barra de ferramentas azul. Então, sem sair do aplicativo, tente
         // alterando o primarySwatch abaixo para Colors.green e invocando
         // "hot reload" (pressione "r" no console onde você executou "flutter run",
         // ou simplesmente salve suas alterações em "hot reload" em um Flutter IDE).
         // Observe que o contador não voltou a zero; a aplicação
         // não é reiniciado.
        primarySwatch: Colors.red, // alteração da cor para vermelho
      ),
      home: const MyHomePage(title: 'Davi Dias Soares Unilavras ADS'), // Alteração do titulo no canto superior da página
    );
  }
}

class MyHomePage extends StatefulWidget { //Este widget é a página inicial do seu aplicativo. É stateful, que tem um objeto State que contém campos que afetam as aparencias.
  const MyHomePage({super.key, required this.title}); //Ele contém os valores (neste caso o título) fornecidos pelo pai (neste caso o widget App) e usados pelo método build do State.

   // Este widget é a página inicial do seu aplicativo. É stateful, ou seja,
   // que possui um objeto State (definido abaixo) que contém campos que afetam
   // como fica.

   // Esta classe é a configuração para o estado. Ele mantém os valores (neste
   // case o título) fornecido pelo pai (neste caso o widget App) e
   // usado pelo método build do State. Os campos em uma subclasse Widget são
   // sempre marcado como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { //informa ao framework Flutter que algo mudou neste estado, fazendo com que ele execute novamente o método de compilação abaixo
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
       // Esta chamada para setState diz ao framework Flutter que algo tem
       // alterado neste estado, o que faz com que ele execute novamente o método de compilação abaixo
       // para que a exibição possa refletir os valores atualizados. se nós mudássemos
       // _counter sem chamar setState(), então o método build não seria
       // chamado novamente, e então nada parece acontecer.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     //O método build está retornando um Scaffold que é uma estrutura básica de layout do Widget Material Design. 
     //Esse layout, entre outras coisas, possui um atributo chamado appBar que recebe um objeto AppBar que possui um atributo chamado title e outro atributo chamado body,
     //que representa o restante da tela, exceto o AppBar.
     // Este método é executado novamente toda vez que setState é chamado, por exemplo, como feito
     // pelo método _incrementCounter acima.
     // O framework Flutter foi otimizado para fazer reexecutar métodos de compilação
     // rápido, para que você possa reconstruir qualquer coisa que precise de atualização em vez de
     // do que ter que alterar individualmente as instâncias de widgets.
    return Scaffold(
      appBar: AppBar(
	//AppBar é geralmente o componente superior do aplicativo (ou às vezes o inferior), 
	//ele contém a barra de ferramentas e alguns outros botões de ação comuns.
        // Aqui pegamos o valor do objeto MyHomePage que foi criado por
        // o método App.build e use-o para definir o título da nossa barra de aplicativos.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele pega uma única criança e a posiciona
        // no meio do pai.
        child: Column(
          // A coluna também é um widget de layout. É preciso uma lista de crianças e
           // organiza-os verticalmente. Por padrão, ele se dimensiona para caber em seu
           // filhos horizontalmente e tenta ser tão alto quanto seu pai.
           // Invoca "debug painting" (pressione "p" no console, escolha o
           // Ação "Toggle Debug Paint" do Flutter Inspector no Android
           // Studio ou o comando "Toggle Debug Paint" no Visual Studio Code)
           // para ver o wireframe de cada widget.
           //
           // A coluna tem várias propriedades para controlar como ela se dimensiona e
           // como ele posiciona seus filhos. Aqui usamos mainAxisAlignment para
           // centraliza os filhos verticalmente; o eixo principal aqui é a vertical
           // eixo porque as colunas são verticais (o eixo cruzado seria
           //horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você apertou o botão tantas vezes:', // Alteração da frase em cima da contagem, no meio da tela
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Apertar', // alteração para quando passar o mouse em cima do botão "+" ser "Apertar"
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}//O Widget Card é um widget do Material Design e possui cantos ligeiramente arredondados e uma sombra. Geralmente este widget é usado para representar informações relacionados.
