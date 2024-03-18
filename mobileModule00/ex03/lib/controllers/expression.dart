import 'package:ex03/controllers/calculator_controller.dart';

const possibleValues = "0123456789+-*/.";
const possibleOperations = "+-*/";
const digits = "0123456789.";

class Expression {
  String _expression = "0";
  String _result = "0";
  List<double> numbers = [];
  List<String> operations = [];
  String tmpNumber = "0";
  bool negative = false;
  bool _isResult = false;
  bool firstUpdate = true;

  String get expression {
    return _expression;
  }

  String get result {
    return _result;
  }

  bool get isResult {
    return _isResult;
  }

  void reset() {
    _expression = "0";
    _result = "0";
    numbers = [];
    operations = [];
    tmpNumber = "0";
    negative = false;
  }

  void update(String value) {
    //print("Button pressed $value");
    if (value == "AC") {
      resetFields();
    } else if (value == "C") {
      removeLastChar();
    } else if (value == "=") {
      computeResult();
    } else if (possibleValues.contains(value) || value == "00") {
      addValue(value);
    } else {
      _expression = "Invalid input";
    }
  }

  void resetFields() {
    _expression = "0";
    _result = "0";
    numbers = [];
    operations = [];
    tmpNumber = "";
  }

  void removeLastChar() {
    String removed = "";

    print(removed);
    if (_expression.isNotEmpty) {
      removed = _expression[_expression.length - 1];
      if (_expression.length == 1) {
        _expression = "0";
      }
      if (_expression != "0") {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    }
    if (digits.contains(removed)) {
      if (tmpNumber.isEmpty) {
        tmpNumber = numbers.last.toString();
      }
      tmpNumber = tmpNumber.substring(0, tmpNumber.length - 1);
    } else if (!(removed == "-" &&
        _expression.length > 2 &&
        possibleOperations.contains(_expression[_expression.length - 2]))) {
      operations.removeLast();
      tmpNumber = numbers.last.toString();
      numbers.removeLast();
    }
    print(operations);
    print(numbers);
  }

  void computeResult() {
    _isResult = true;
    if (tmpNumber == "") {
      _result = "Invalid input";
      return;
    }
    var tmp = double.parse(tmpNumber);
    if (negative) {
      tmp *= -1;
    }
    print(numbers);
    print(operations);
    numbers.add(tmp);
    CalculatorController calc = CalculatorController(
        expression: _expression, numbers: numbers, operations: operations);
    _result = calc.result;
  }

  void addValue(String value) {
    if (_expression[_expression.length - 1] == "." && value == ".") {
      return;
    }
    addValueToExpression(value);
    saveValue(value);
  }

  void addValueToExpression(String value) {
    if (firstUpdate) {
      if (value == "00") {
        value = "0";
      }
      firstUpdate = false;
      _expression = value;
    } else {
      _expression += value;
    }
  }

  void saveValue(String value) {
    if (possibleOperations.contains(value)) {
      saveOperations(value);
    } else if (digits.contains(value) || value == "00") {
      saveNumbers(value);
    }
  }

  void saveOperations(String value) {
    if (_expression.length > 1 &&
        value == "-" &&
        possibleOperations.contains(_expression[_expression.length - 2])) {
      negative = true;
    } else if (_expression.length == 1 && value == "-") {
      negative = true;
    } else {
      if (tmpNumber != "") {
        double tmp = double.parse(tmpNumber);
        if (negative == true) {
          tmp *= -1;
          negative = false;
        }
        numbers.add(tmp);
        tmpNumber = "";
      }
      operations.add(value);
    }
  }

  void saveNumbers(String value) {
    if (tmpNumber != "") {
      tmpNumber += value;
    } else {
      tmpNumber = value;
    }
  }
}
