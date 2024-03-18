const possibleValues = "00123456789+-*/.";
const possibleOperations = "+-*/";
const digits = "0123456789.";

class Expression {
  String _expression = "0";
  String _result = "0";
  List<double> numbers = [];
  List<String> operations = [];
  String tmpNumber = "0";
  bool negative = false;
  bool divByZero = false;
  bool isResult = false;

  String get expression {
    return _expression;
  }

  String get result {
    return _result;
  }

  void reset(){
    _expression = "0";
    _result = "0";
    numbers = [];
    operations = [];
    tmpNumber = "0";
    negative = false;
    divByZero = false;
    isResult = false;
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
    tmpNumber = "";
  }

  void removeLastChar() {
    String removed = "";

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
      if (tmpNumber.isNotEmpty) {
        tmpNumber = tmpNumber.substring(0, tmpNumber.length - 1);
      }
    } else {
      operations.removeLast();
      tmpNumber = numbers.last.toString();
      numbers.removeLast();
    }
  }

  void computeResult() {
    if (isResult == true){
      return;
    }
    if (!checkExpression()) {
      _result = "Invalid input";
      return;
    }
    var tmp = double.parse(tmpNumber);
    if (negative) {
      tmp *= -1;
    }
    double resultTmp = 0;
    if (operations.isEmpty){
      resultTmp = tmp;
    }
    else {
      numbers.add(tmp);
      resultTmp = calculateDivMul();
    }
    processResult(resultTmp);
  }

  bool checkExpression() {
    if (tmpNumber == "") {
      return false;
    }
    if (_expression.isEmpty) {
      return false;
    }

    if (("*/".contains(_expression[0]) || _expression[0] == ".")) {
      return false;
    }
    for (int i = 1; i < _expression.length; i++) {
      if ("*/".contains(_expression[i]) &&
          possibleOperations.contains(_expression[i - 1])) {
        return false;
      }
    }

    for (int i = 2; i < _expression.length; i++) {
      if (possibleOperations.contains(_expression[i]) &&
          possibleOperations.contains(_expression[i - 1]) &&
          possibleOperations.contains(_expression[i - 2])) {
        return false;
      }
    }
    return true;
  }

  bool addTmpNumbersToNumbers() {
    if (tmpNumber.isEmpty) {
      _result = "Invalid input";
      return false;
    }
    double tmp = double.parse(tmpNumber);
    if (negative == true) {
      tmp *= -1;
    }
    numbers.add(tmp);
    return true;
  }

  double calculateDivMul() {
    List<double> newNumbersList = [];

    for (int i = 0; i < operations.length; i++) {
      if ("*/".contains(operations[i])) {
        if (operations[i] == "*") {
          newNumbersList.add(numbers[i] * numbers[i + 1]);
        } else if (operations[i] == "/") {
          if (numbers[i + 1] == 0) {
            divByZero = true;
            return 0;
          }
          newNumbersList.add(numbers[i] / numbers[i + 1]);
        }
        i++;
      } else {
        newNumbersList.add(numbers[i]);
      }
    }
    if (!("*/").contains(operations[operations.length - 1])) {
      newNumbersList.add(numbers[numbers.length - 1]);
    }
    operations.remove("*");
    operations.remove("/");
    return calculateAddSub(newNumbersList);
  }

  double calculateAddSub(List<double> newNumbersList) {
    double retval = newNumbersList[0];

    for (int i = 0; i < operations.length; i++) {
      if ("+-".contains(operations[i])) {
        if (operations[i] == "+") {
          retval += newNumbersList[i + 1];
        }
        if (operations[i] == "-") {
          retval -= newNumbersList[i + 1];
        }
      }
    }
    return retval;
  }

  void processResult(double resultTmp) {
    if (divByZero) {
      _result = "Error div by zero";
    } else {
      _result = resultTmp.toString();
    }
    if (_result.length > 2 &&
        _result[_result.length - 1] == "0" &&
        _result[_result.length - 2] == ".") {
      _result = _result.substring(0, _result.length - 2);
    }
    isResult = true;
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
    } else if (digits.contains(value) || value == "00") {
      saveNumbers(value);
    }
  }

  void saveOperations(String value) {
    if (_expression.length > 1 &&
        value == "-" &&
        possibleOperations.contains(_expression[_expression.length - 2])) {
      negative = true;
    } else if (_expression.length == 1 && _expression[0] == "+") {
      return;
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
      if (!"00.".contains(value)) {
        tmpNumber = value;
      }
    }
  }
}
