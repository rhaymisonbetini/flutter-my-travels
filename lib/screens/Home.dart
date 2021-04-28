import 'package:flutter/material.dart';
import 'package:flutter_my_travels/screens/Map.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List _list = ['sotelandia', 'acapulco', 'bastogne'];

  _abrirMapa() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Map()));
  }

  _excluirViagem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas viagens"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _abrirMapa();
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                String titulo = _list[index];
                return GestureDetector(
                  onTap: _abrirMapa,
                  child: Card(
                    child: ListTile(
                      title: Text(titulo),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _excluirViagem,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child:
                                  Icon(Icons.remove_circle, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
