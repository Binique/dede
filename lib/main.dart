
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dédé'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  int leftDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child:
              Padding(
                padding:
                const EdgeInsets.all(16.0),
                child:
                FlatButton(
                  onPressed:() {
                    print('bonjour');
                  },
                child:
                Image.asset('images/dice$leftDiceNumber.png'),
              ),
          ),
          ),
          Expanded(
              child:
              Padding(
                padding:
                const EdgeInsets.all(16.0),
                child:
                FlatButton(
                onPressed:() {
                print('bonjour');
                },
                child:
                Image.asset('images/dice2.png'),
              ),
          ),
          ),
        ],
      ),
    );
  }
}

