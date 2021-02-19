import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipoOne(),
          SizedBox(
            height: 30,
          ),
          _cardTipoTwo(),
        ],
      ),
    );
  }
}

Widget _cardTipoOne() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(20.0)),
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: Text('Soy el titulo de esta tarjeta'),
          subtitle: Text(
              'Este es un texto largo que necesita mantenerse a la distancia'),
          contentPadding:
              EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () {}, child: Text('Cancelar')),
            FlatButton(onPressed: () {}, child: Text('Aceptar'))
          ],
        )
      ],
    ),
  );
}

Widget _cardTipoTwo() {
  final card = Container(
    // clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            // placeholder: ExactAssetImage('data/jar-loading.gif'),
            placeholder: NetworkImage(
                "https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0?e=2159024400&v=beta&t=C7KMOtnrJwGrMXmgIk2u1B8a7VRfgxMwXng9cdP9kZk"),
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg')),
        // https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg
        //Image(image: NetworkImage('https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg')),
        Container(
          padding: EdgeInsets.all(10),
          child: Text('Imagen'),
        ),
      ],
    ),
  );

  return Container(
    child: ClipRRect(
      child: card,
      borderRadius: BorderRadius.circular(20.0),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0))
      ],
    ),
  );
}
