import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarDiez();

    _scrollController.addListener(() {
      // Compara si es igual maximo scroll, es decir que esta al final de la pagina.
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarDiez();
        fetchData();
      }
    });
  }

  /**
   * Cuando la pagina ya se destruye
   * Destruimos el controlador para que no exista fuga de memoria.
   */
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPaginaUno,
      child: ListView.builder(
        itemCount: _listNumeros.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, index) {
          final image = _listNumeros[index];
          return FadeInImage(
              placeholder:
                  NetworkImage('https://picsum.photos/500/300/?image=1'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'));
        },
      ),
    );
  }

  Future<Null> _obtenerPaginaUno() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumeros.clear();
      _ultimoItem += 1;
      _agregarDiez();
    });

    return Future.delayed(duration);
  }

  void _agregarDiez() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestHttp);
  }

  void respuestHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }
    return Container();
  }
}
