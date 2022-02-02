import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dédé'),
          backgroundColor: Colors.red,
        ),
        body: DicePage2(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      leftDiceNumber = 6;
                      print("Vous avez appuyé sur l'image de gauche");
                    },
                    child: Image.asset("images/dice$leftDiceNumber.png")),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      print("Vous avez appuyé sur l'image de droite");
                    },
                    child: Image.asset("images/dice$rightDiceNumber.png")),
              )),
        ],
      ),
    );
  }
}

class DicePage2 extends StatefulWidget {
  const DicePage2({Key? key}) : super(key: key);

  @override
  _DicePage2State createState() => _DicePage2State();
}

class _DicePage2State extends State<DicePage2> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  diceChanged() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  sendScore() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('http://localhost/apitest/public/api/dedes'));
    request.body = json.encode({"pseudo": "test", "score": leftDiceNumber + rightDiceNumber });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        diceChanged();
                      });
                      sendScore();
                      print("Vous avez appuyé sur l'image de gauche");
                    },
                    child: Image.asset("images/dice$leftDiceNumber.png")),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        diceChanged();
                      });
                      print("Vous avez appuyé sur l'image de droite");
                    },
                    child: Image.asset("images/dice$rightDiceNumber.png")),
              )),
        ],
      ),
    );
  }
}
