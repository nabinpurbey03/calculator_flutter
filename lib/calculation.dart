import 'dart:io';

String calculation(String expn) {
  String op1 = "";
  String op2 = "";
  String opr = "";
  String opr2 = "";
  String result = "";
  String checkExpn = "";
  for (int i = 0; i < expn.length; i++) {
    String dig = expn[i];
    checkExpn = expn.substring(i + 1, expn.length);
    if (dig == "+" || dig == "-" || dig == "*" || dig == "/" || dig == "%") {
      opr = dig;
      break;
    }
    op1 += expn[i];
  }
  int opi = expn.indexOf(opr);
  for (int i = opi + 1; i < expn.length; i++) {
    checkExpn = expn.substring(i + 1, expn.length);
    String dig = expn[i];
    if (dig == "+" || dig == "-" || dig == "*" || dig == "/" || dig == "%") {
      opr2 = dig;
      break;
    }
    op2 += expn[i];
  }
  result = calculator(op1, op2, opr);
  if (checkExpn.isNotEmpty) {
    result = calculation(result + opr2 + checkExpn);
  }
  return result;
}

String calculator(String operand1, String operand2, String operator) {
  var num1 = int.tryParse(operand1);
  var num2 = int.tryParse(operand2);
  String result = "";
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
