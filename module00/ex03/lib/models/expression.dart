const possibleValues = "00123456789+-*/.";
const possibleOperations = "+-*/";
const digits = "0123456789";

class Expression {
  String _expression = "0";
  String _result = "0";
  List<int> numbers = [];
  List<String> operations = [];
  int? tmpNumbers;

  String get expression {
    return _expression;
  }

  String get result {
    return _result;
  }

  void update(String value) {
    //print("Button pressed $value");
    if (value == "AC") {
      resetFields();
    } else if (value == "C") {
      removeLastChar();
    } else if (value == "=") {
      computeResult();
    } else if (possibleValues.contains(value)) {
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
    tmpNumbers = null;
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
    if (tmpNumbers == null){
      _result = "Invalid imput";
      return;
    }
    switch (operations[0]) {
      case '+':
        _result = (numbers[0] + tmpNumbers!).toString();
        break;
    }
  }

  void addValue(String value) {
    addValueToExpression(value);
    saveValue(value);
  }

  void addValueToExpression(String value) {
    if (_expression == "0") {
      if (value != "0" && value != "00") {
        _expression = value;
      }
    } else {
      _expression += value;
    }
  }

  void saveValue(String value) {
    if (possibleOperations.contains(value)) {
      saveOperations(value);
    } else if (digits.contains(value)) {
      saveNumbers(value);
    }
  }

  void saveOperations(String value) {
    numbers.add(tmpNumbers!);
    tmpNumbers = null;
    operations.add(value);
  }

  void saveNumbers(String value) {
    if (tmpNumbers != null) {
      if (value == "00"){
        tmpNumbers = tmpNumbers! * 100;
      }
      else {
        tmpNumbers = 10 * tmpNumbers! + int.parse(value);
      }
    } else {
      tmpNumbers = int.parse(value);
    }
  }
}