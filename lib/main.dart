import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Do Ovo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MyHomePage(title: 'Aplicativo do Ovo(Meme)'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;

  void _incrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _return() {
    setState(() {
      _counter = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (() {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Esse é o app MEME do ovo!')));
            }),
            icon: const Icon(Icons.info_sharp),
            tooltip: 'Informações',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _counter > 5
                ? const Text(
                    'Descasque o OVO',
                    style:
                        TextStyle(height: 4, fontSize: 20, color: Colors.black),
                  )
                : _counter >= 1
                    ? const Text(
                        'Você trincou o Ovo',
                        style: TextStyle(
                            height: 4, fontSize: 20, color: Colors.black),
                      )
                    : const Text(
                        '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          height: -3,
                          color: (Colors.black87),
                        ),
                      ),
            _counter == 0
                ? //Pintinho
                Image.network(
                    'https://2.bp.blogspot.com/-RScrvTZNQNw/V2aGAtmY1mI/AAAAAAAAFpE/IJhKWfx3CcQ2urnmDmyE_YSyuzbtOOW1gCLcB/s1600/PINTO.jpg',
                    fit: BoxFit.cover,
                  )
                : _counter <= 5
                    ? //Ovo trincado
                    Image.network(
                        'https://thumbs.dreamstime.com/b/ovo-rachado-do-pequeno-almo%C3%A7o-16591050.jpg',
                        height: 300,
                        width: 340,
                      )
                    : // Ovo inteiro
                    Image.network(
                        'https://www.pngarts.com/files/3/Brown-Egg-PNG-Background-Image.png',
                        height: 300,
                        width: 340,
                      ),
            _counter > 0
                ? Text('$_counter',
                    style: const TextStyle(
                        height: -3.5,
                        backgroundColor: Colors.transparent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold))
                : _counter == 0
                    ? const Text(
                        'Parabéns você achou o pinto!!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            height: 4),
                      )
                    : _counter > 5
                        ? const Text(
                            'Descasque o OVO',
                            style: TextStyle(
                              height: 4,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            'Você trincou o Ovo',
                            style: TextStyle(
                                height: 4, fontSize: 20, color: Colors.black),
                          ),

            //Botão de descascagem do ovo
            _counter > 0
                ? ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('Clique para descascar'),
                  )
                :
                // Botão de voltar ao inicio
                SizedBox(
                    width: 48,
                    height: 110.0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.repeat),
                          color: Colors.black87,
                          onPressed: _return,
                        ),
                      ],
                    ),
                  ),

            //  Icones
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Meu ovo favorito')));
                  }),
                  icon: const Icon(Icons.favorite),
                  color: Colors.pink,
                ),
                IconButton(
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Musica do pintinho')));
                  }),
                  icon: const Icon(Icons.audiotrack),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Chuva de ovo')));
                  }),
                  icon: const Icon(Icons.beach_access),
                  color: Colors.green,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
