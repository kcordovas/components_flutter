import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      // ListView permite Hacer Scroll
      body: ListView(children: _crearItemsCorta()),
    );
  }

/*
  List<Widget> _crearItems() {
    List<Widget> lista = List<Widget>();
    opciones.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element),
      );
      lista..add(tempWidget)..add(Divider());
    });
    return lista;
  }
  */

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
