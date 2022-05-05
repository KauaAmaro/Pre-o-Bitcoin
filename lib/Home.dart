import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valor = "0.00";

  void _retornoPreco() async {
    String url = "https://api.coinbase.com/v2/prices/spot?currency=BRL";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode ( response.body);
    setState(() {
      _valor = retorno ["data"] ["amount"].toString();
    });


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF6FDFB),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Padding(padding: EdgeInsets.only(top: 250 ),
            child: Image.asset("img/bitcoin.png"),
            ),

            Padding(padding: EdgeInsets.only(top: 30 ),
            child: Text( "R\$ " + _valor,
              style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, ) ,),),

         Padding(padding: EdgeInsets.only(top: 20),
             child:   RaisedButton(
               color: Colors.orange,
               child: Text("ATUALIZAR",
                 style: TextStyle(color: Colors.white, fontSize: 20,),
               ),
               onPressed: _retornoPreco,
           ),
         )

          ],
        ),
      )
    );
  }
}
