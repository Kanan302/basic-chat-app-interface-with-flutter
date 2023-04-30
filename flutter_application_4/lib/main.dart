import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "basic chat app interface",
      home: iskele(),
    );
  }
}

class iskele extends StatelessWidget {
  const iskele ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mesaj uygulamasi"),
        ),
        body: esassehife(),
    );
  }
}

class esassehife extends StatefulWidget {
  const esassehife({super.key});

  @override
  State<esassehife> createState() => _esassehifeState();
}

class _esassehifeState extends State<esassehife> {

  TextEditingController t1 = TextEditingController();

  List mesajlar = [];

  mesajyaz(String yazi){
    setState(() {
      mesajlar.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajlar.length,
              itemBuilder: (context, indekssayi) => ListTile(title: Text(mesajlar[indekssayi]),),
            ),
          ),
          Row(
            children: [
              Flexible(
                child:TextField( 
                  controller: t1,
                  onSubmitted: mesajyaz,
                ), 
              ),
              ElevatedButton(
                onPressed: () {mesajyaz(t1.text);},
                child: Text("gonder"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}