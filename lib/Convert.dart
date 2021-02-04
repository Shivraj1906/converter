import 'dart:collection';

class Convert {
  bool isOperator(int item) {
    String operator = String.fromCharCode(item);

    if (operator == '+' ||
        operator == '-' ||
        operator == '*' ||
        operator == '/' ||
        operator == '%' ||
        operator == '^') {
      return true;
    } else {
      return false;
    }
  }

  int checkPrecedence(int item) {
    String operator = String.fromCharCode(item);

    if (operator == '+' || operator == '-') {
      return 1;
    } else if (operator == '*' || operator == '/' || operator == '%') {
      return 2;
    } else if (operator == '^') {
      return 3;
    } else {
      return -1; // to be safe, but it should never happen
    }
  }

  String convert(String expression) {
    String output = "";
    Queue stack = new Queue();
    int flag;

    for (int i = 0; i < expression.length; i++) {
      //check is current char is Operator
      if (isOperator(expression.codeUnitAt(i))) {
        //stack is empty or not
        do {
          flag = 0;
          if (stack.isEmpty || stack.last == '(') {
            stack.add(expression.codeUnitAt(i));
          } else {
            //compare onHand operator and inStack operator
            if (checkPrecedence(expression.codeUnitAt(i)) >
                checkPrecedence(stack.last)) {
              stack.add(expression.codeUnitAt(i));
            } else {
              output += String.fromCharCode(stack.removeLast());
              flag = 1;
            }
          }
        } while (flag == 1);
      } else if (expression.codeUnitAt(i) == ')'.codeUnitAt(0)) {
        while (stack.last != '('.codeUnitAt(0)) {
          output += String.fromCharCode(stack.removeLast());
        }
        stack.removeLast();
      } else {
        if (expression.codeUnitAt(i) == '('.codeUnitAt(0)) {
          stack.add(expression.codeUnitAt(i));
        } else {
          output += expression[i];
        }
      }
    }

    while (stack.isNotEmpty) {
      output += String.fromCharCode(stack.removeLast());
    }

    return output;
  }
}
