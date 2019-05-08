import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_parser/model/kullanici.dart';
import 'package:json_parser/model/sehir.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Parser Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Json Parser Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Kullanici kullanici;
  String gezdigiYerler;
  String kullaniciAd, kullaniciSoyad;

  @override
  void initState() {
    sunucudanVerileriGetir().then((response) {
      kullanici = Kullanici.fromJson(json.decode(response.data));
      setState(() {
        debugPrint('ui updated');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyCard(kullanici),
          ],

      ),
    );
  }

  Future<Response> sunucudanVerileriGetir() async {
    var dio = Dio();
    createHttpRequestConfig(dio);
    Response response;
    await dio.get('https://www.eniserkaya.com/tutorials/flutter/json_parser.php').then((resp) {
      response = resp;
    });
    return response;
  }

  createHttpRequestConfig(dio) {
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
    dio.options.responseType = ResponseType.plain;
  }
}

class MyCard extends StatelessWidget {
  Kullanici kullanici;

  MyCard(this.kullanici);

  @override
  Widget build(BuildContext context) {
    if (kullanici == null) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            PaddingText('Ad:'),
            PaddingText('Soyad:'),
            PaddingText('Gezilen Yerler:')
          ],
        ),
      );
    } else {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            PaddingText('Ad: ' + kullanici.ad),
            PaddingText('Soyad: ' + kullanici.soyad ),
            PaddingText('Gezilen Yerler:' +
                kullanici.gezilenYerler
                    .map((sehir) => sehir.sehirAdi)
                    .join(','))
          ],
        ),
      );
    }
  }
}
class PaddingText extends StatelessWidget{
  String msg;

  PaddingText(this.msg);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(msg),
    );
  }

}