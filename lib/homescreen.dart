import "package:calculator_app/components/buttons.dart";
import "package:flutter/material.dart";
import "package:math_expressions/math_expressions.dart";

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/gb.jpg'),
              radius: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Text(
                      userinput.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Buttons(
                          title: 'AC',
                          onPress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '+/-',
                          onPress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '%',
                          onPress: () {
                            userinput += '%';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '/',
                          onPress: () {
                            userinput += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa80a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: '7',
                          onPress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '8',
                          onPress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '9',
                          onPress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: 'x',
                          onPress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa80a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: '4',
                          onPress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '5',
                          onPress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '6',
                          onPress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '-',
                          onPress: () {
                            userinput += '-';
                            setState(() {});
                          },
                          color: const Color(0xffffa80a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: '1',
                          onPress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '2',
                          onPress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '3',
                          onPress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '+',
                          onPress: () {
                            userinput += '+';
                            setState(() {});
                          },
                          color: const Color(0xffffa80a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Buttons(
                          title: '0',
                          onPress: () {
                            userinput += '0';

                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '.',
                          onPress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: 'DEL',
                          onPress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        Buttons(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: const Color(0xffffa80a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void equalPress() {
    String finalUserInput = userinput;
    finalUserInput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}
