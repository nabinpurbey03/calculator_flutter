import 'dart:io';

String calculation(String data) {
  String result = "";
  String operand1 = "";
  String operand2 = "";
  String operator = "";
  // setState(() {});
  for (int i = 0; i < data.length; i++) {
    String sc = data[i];
    if (sc == "+" || sc == "-" || sc == "*" || sc == "/" || sc == "%") {
      operator = data[i];
      break;
    } else {
      operand1 += data[i];
    }
  }
  int operatorIndex = data.indexOf(operator);
  for (int i = operatorIndex + 1; i < data.length; i++) {
    operand2 += data[i];
  }
  var num1 = double.tryParse(operand1);
  var num2 = double.tryParse(operand2);
  if (num1 != null && num2 != null) {
    switch (operator) {
      case "+":
        result = (num1 + num2).toString();
        break;
      case "-":
        result = (num1 - num2).toString();
        break;
      case "*":
        result = (num1 * num2).toString();
        break;
      case "/":
        result = (num1 / num2).toString();
        break;
      case "%":
        result = (num1 * (num2 / 100)).toString();
        break;
    }
  }
  return result;
}
