import 'package:flutter/material.dart';
import 'package:provider/index.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexActual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      Emalta(),
      Subscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.1),
        title: Image.asset(
          "assets/youtube.png",
          fit: BoxFit.contain,
          width: 120,
        ),
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final resultado = await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                  if (resultado != null && resultado.isNotEmpty) {
                    print("Pesquisa realizada: $resultado");
                  }
                },
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indexActual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _indexActual,
        onTap: (index) {
          setState(() {
            _indexActual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
