import 'package:flutter/material.dart';
import 'calculation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ---------- For Input display ----------
  void inputDisplay(String toDisplay) {
    setState(() {
      display = display + toDisplay;
    });
  }

  // ---------- For AC ----------
  void ac() {
    setState(() {
      display = "";
      result = "";
    });
  }

  // ---------- For X ----------
  void x() {
    setState(() {
      String sub = display.substring(0, display.length - 1);
      display = sub;
    });
  }

  // ---------- For Evaluation ----------
  String display = "";
  String result = "";

  void calc() {
    setState(() {
      result = calculation(display);
    });
  }

  @override
  Widget build(BuildContext context) {
    // double preferredSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff023047),
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Simple Calculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.purple)),
          centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color(0xff023047),
            // height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.cyanAccent,
                    child: Text(
                      display,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          overflow: TextOverflow.fade),
                    )),
                const SizedBox(height: 5),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      result,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          overflow: TextOverflow.fade),
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.58,
            decoration: const BoxDecoration(
                color: Color(0xffEEE2DE),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputButtons(input: "AC", getInput: () => ac()),
                    InputButtons(input: "X", getInput: () => x()),
                    InputButtons(input: "%", getInput: () => inputDisplay("%")),
                    InputButtons(input: "/", getInput: () => inputDisplay("/")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputButtons(input: "7", getInput: () => inputDisplay("7")),
                    InputButtons(input: "8", getInput: () => inputDisplay("8")),
                    InputButtons(input: "9", getInput: () => inputDisplay("9")),
                    InputButtons(input: "*", getInput: () => inputDisplay("*")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputButtons(input: "4", getInput: () => inputDisplay("4")),
                    InputButtons(input: "5", getInput: () => inputDisplay("5")),
                    InputButtons(input: "6", getInput: () => inputDisplay("6")),
                    InputButtons(input: "-", getInput: () => inputDisplay("-")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputButtons(input: "1", getInput: () => inputDisplay("1")),
                    InputButtons(input: "2", getInput: () => inputDisplay("2")),
                    InputButtons(input: "3", getInput: () => inputDisplay("3")),
                    InputButtons(input: "+", getInput: () => inputDisplay("+")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputButtons(input: "</>", getInput: () {}),
                    InputButtons(input: "0", getInput: () => inputDisplay("0")),
                    InputButtons(input: ".", getInput: () => inputDisplay(".")),
                    InputButtons(input: "=", getInput: () => calc()),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputButtons extends StatefulWidget {
  final String input;
  final Function getInput;

  const InputButtons({super.key, required this.input, required this.getInput});

  @override
  State<InputButtons> createState() => _InputButtonsState();
}

class _InputButtonsState extends State<InputButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.getInput(),
      child: Container(
        height: 80,
        width: 85,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset.fromDirection(5, -10))
            ]),
        child: Center(
            child: Text(
          widget.input,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
