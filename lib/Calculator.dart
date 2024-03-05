import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Add this import statement

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _expression = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
      } else if (buttonText == "=") {
        _expression = _expression.replaceAll('x', '*');
        try {
          // Evaluate the expression
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          _output = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          _output = "Error";
        }
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
        _expression += buttonText;
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7", 1, Colors.blueGrey),
                  buildButton("8", 1, Colors.blueGrey),
                  buildButton("9", 1, Colors.blueGrey),
                  buildButton("/", 1, Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4", 1, Colors.blueGrey),
                  buildButton("5", 1, Colors.blueGrey),
                  buildButton("6", 1, Colors.blueGrey),
                  buildButton("x", 1, Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1", 1, Colors.blueGrey),
                  buildButton("2", 1, Colors.blueGrey),
                  buildButton("3", 1, Colors.blueGrey),
                  buildButton("-", 1, Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("C", 1, Colors.red),
                  buildButton("0", 1, Colors.blueGrey),
                  buildButton("=", 1, Colors.orange),
                  buildButton("+", 1, Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
