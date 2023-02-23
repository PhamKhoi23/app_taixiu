// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int first = 0, second = 0;
  var opp, result;
  String text = '';
  String textfirst = '', textopp = '';

  void btnClicked(String btnText) {
    if (btnText == 'C') {
      result = '';
      opp = '';
      text = '';
      first = 0;
      second = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      first = int.parse(text);
      result = '';
      opp = btnText;
      textopp = opp;
      textfirst = first.toString();
    } else if (btnText == '=') {
      second = int.parse(text);
      textfirst = '';
      textopp = '';
      if (opp == '+') {
        result = (first + second).toString();
      } else if (opp == '-') {
        result = (first - second).toString();
      } else if (opp == 'x') {
        result = (first * second).toString();
      } else if (opp == '/') {
        result = (first / second).toString();
      }
    } else if (btnText == '%') {
      result = 'loi roi ban oi';
    } else if (btnText == '+/-') {
      first = int.parse(text);
      if (first > 0) {
        result = (-first).toString();
      } else if (first < 0) {
        result = (--first).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget ctOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 25),
            foregroundColor: Colors.black),
        child: Text(
          value,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Calculator Pro'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    color: Colors.yellow[100],
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textfirst,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[850]),
                    ),
                  )),
              Expanded(
                  child: Container(
                    color: Colors.yellow[100],
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textopp,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[850]),
                    ),
                  )),
              Expanded(
                  child: Container(
                    color: Colors.yellow[100],
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[850]),
                    ),
                  )),
              Row(
                children: [
                  ctOutlineButton('C'),
                  ctOutlineButton('+/-'),
                  ctOutlineButton('%'),
                  ctOutlineButton('/')
                ],
              ),
              Row(
                children: [
                  ctOutlineButton('7'),
                  ctOutlineButton('8'),
                  ctOutlineButton('9'),
                  ctOutlineButton('x')
                ],
              ),
              Row(
                children: [
                  ctOutlineButton('4'),
                  ctOutlineButton('5'),
                  ctOutlineButton('6'),
                  ctOutlineButton('-')
                ],
              ),
              Row(
                children: [
                  ctOutlineButton('1'),
                  ctOutlineButton('2'),
                  ctOutlineButton('3'),
                  ctOutlineButton('+')
                ],
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 95, top: 25, right: 95, bottom: 25),
                        foregroundColor: Colors.black),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  ctOutlineButton(','),
                  ctOutlineButton('=')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('opp', opp));
  }
}