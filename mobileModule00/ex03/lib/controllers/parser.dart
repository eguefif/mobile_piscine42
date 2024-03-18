const possibleValues = "00123456789+-*/.";
const possibleOperations = "+-*/";
const digits = "0123456789.";

class Parser {
  Parser({required this.expression});

  final String expression;
  List<String> operations = [];
  List<double> numbers = [];

  bool parse() {
    if (!checkExpression()) {
      return false;
    }
    parseExpression();
    return true;
  }

  bool checkExpression() {
    if (expression.isEmpty) {
      return false;
    }

    if ("*/".contains(expression[0])) {
      return false;
    }
    if (expression.length > 2 &&
        possibleOperations.contains(expression[0]) &&
        possibleOperations.contains(expression[1])) {
      return false;
    }

    for (int i = 1; i < expression.length; i++) {
      if (expression[i] == "." && expression[i - 1] == ".") {
        return false;
      }
    }

    for (int i = 1; i < expression.length; i++) {
      if ("*/".contains(expression[i]) && "+-*/".contains(expression[i - 1])) {
        return false;
      }
    }
    for (int i = 1; i < expression.length; i++) {
      if ("*/".contains(expression[i]) && "*/".contains(expression[i - 1])) {
        return false;
      }
    }

    for (int i = 2; i < expression.length; i++) {
      if (possibleOperations.contains(expression[i]) &&
          possibleOperations.contains(expression[i - 1]) &&
          possibleOperations.contains(expression[i - 2])) {
        return false;
      }
    }
    if (possibleOperations.contains(expression[expression.length - 1])){
      return false;
    }
    return true;
  }

  void parseExpression() {
    String tmp = "";
    bool negative = false;

    for (int i = 0; i < expression.length; i++) {
      if (digits.contains(expression[i])) {
        tmp += expression[i];
      } else if (possibleOperations.contains(expression[i])) {
        if (isSign(i, "-") || isSign(i, "+")) {
          tmp += expression[i];
        } else {
          if (tmp.isNotEmpty) {
            numbers.add(double.parse(tmp));
            if (negative) {
              numbers.last *= -1;
              negative = false;
            }
            tmp = "";
          }
          operations.add(expression[i]);
        }
      }
    }
    if (tmp.isNotEmpty) {
      numbers.add(double.parse(tmp));
      if (negative) {
        numbers.last *= -1;
      }
    }
  }

  bool isSign(int i, String symbol) {
    return (i == 0 && expression[i] == symbol ||
        (i > 0 &&
            expression[i] == symbol &&
            possibleOperations.contains(expression[i - 1])));
  }
}
