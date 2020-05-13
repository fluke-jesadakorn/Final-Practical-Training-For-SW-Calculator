import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jesadakorn Kirtnu 5835512119', //Name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(title: 'Jesadakorn Kirtnu 5835512119'), //Name
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title})
      : super(key: key); //Constructor For receive Key from Event

  final String title;

  @override
  _Home createState() =>
      _Home(); //Create State to Class from extends StatefulWidget
}

class _Home extends State<MyHome> {
  // Main class type MyHomePage

  String output = "0"; // initial for show screen number value

  String _output = "0"; // for calculating value
  double num1 = 0; // value 1
  double num2 = 0; // value 2
  String operand = ""; // operation

  buttonPressed(String buttonText) {
    // create function from duplicate code

    if (buttonText == "C") {
      // case clear value = 0

      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      // case operand

      num1 = double.parse(output); // change type to int for calculate

      operand = buttonText; // receive operand type
      _output = "0"; // output

    } else if (buttonText == "=") {
      // after calculated case
      num2 = double.parse(output); // receive num 2 from button event

      if (operand == "+") {
        // plus event
        _output =
            (num1 + num2).toStringAsFixed(0); // calculate and change type int to string
      }

      if (operand == "-") {
        //minus event
        _output =
            (num1 - num2).toStringAsFixed(0); // calculate and change type int to string
      }

      if (operand == "X") {
        // multiply event
        _output =
            (num1 * num2).toStringAsFixed(0); // calculate and change type int to string
      }
      if (operand == "/") {
        // divide event
        _output = (num1 / num2)
              .toStringAsFixed(0); // calculate and change type double to string
      }

      num1 = 0;
      num2 = 0;
      operand = ""; //clear value to blank in screen
    } else {
      _output = _output + buttonText; // case receive blank
    }

    print(_output); // for developer log

    setState(() {
      // change value output variable use setState for re-render class
      if(!double.parse(_output).isInfinite)
      output = double.parse(_output)
          .toStringAsFixed(0); // change value output variable screen to string
      else output = "Error"; // Error type if Infinity
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      // expand max edge
      child: RaisedButton(
        padding: EdgeInsets.all(26.0),
        color: Colors.greenAccent,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0),
        ),
        onPressed: () => buttonPressed(
            buttonText) // handle event on press and pass value buttonText variable
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 14.0),
                child: Text(output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            Expanded(
              // Style for divide to expand max y axis
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                buildButton("9"),
                buildButton("8"),
                buildButton("7"),
                buildButton("+")
              ]),
              Row(children: [
                buildButton("6"),
                buildButton("5"),
                buildButton("4"),
                buildButton("-")
              ]),
              Row(children: [
                buildButton("3"),
                buildButton("2"),
                buildButton("1"),
                buildButton("X")
              ]),
              Row(children: [
                buildButton("C"),
                buildButton("0"),
                buildButton("="),
                buildButton("/"),
              ]),
            ])
          ],
        )));
  }
}
