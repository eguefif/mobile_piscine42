import 'package:ex03/controllers/calculator_controller.dart';
import 'package:ex03/controllers/parser.dart';

const possibleValues = "0123456789+-*/.";

class Expression {
  String _expression = "0";
  String _result = "0";
  bool firstUpdate = true;
  bool _isResult = false;

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
    _isResult = false;
    firstUpdate = true;
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
    _isResult = false;
  }

  void removeLastChar() {
    if (_expression.isNotEmpty) {
      if (_expression.length == 1) {
        _expression = "0";
      }
      if (_expression != "0") {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    }
  }

  void computeResult() {
    _isResult = true;
    Parser parser = Parser(expression: _expression);
    if (parser.parse()){ 
      CalculatorController calc = CalculatorController(
          expression: _expression, numbers: parser.numbers, operations: parser.operations);
      _result = calc.result;
    }
    else {
      _result = "Invalid input";
    }
  }

  void addValue(String value) {
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
}