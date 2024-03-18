const possibleValues = "00123456789+-*/.";
const possibleOperations = "+-*/";
const digits = "0123456789.";

class CalculatorController {
  CalculatorController(
      {required this.expression,
      required this.numbers,
      required this.operations});

  String _result = "";
  bool isResult = false;
  bool divByZero = false;
  final String expression;
  final List<double> numbers;
  final List<String> operations;

  String get result {
    computeResult();
    return _result;
  }

  void computeResult() {
    if (isResult == true) {
      return;
    }
    double resultTmp = 0;
    if (operations.isEmpty) {
      resultTmp = numbers[0];
    } else {
      resultTmp = calculateDivMul();
    }
    processResult(resultTmp);
  }

  double calculateDivMul() {
    int nbrIndex = 0;
    int opIndex = 0;

    while (opIndex < operations.length) {
      if ("*/".contains(operations[opIndex])) {
        if (operations[opIndex] == "*") {
          numbers[nbrIndex] *= numbers[nbrIndex + 1];
        } else if (operations[opIndex] == "/") {
          if (numbers[nbrIndex + 1] == 0) {
            divByZero = true;
            return 0;
          }
          numbers[nbrIndex] /= numbers[nbrIndex + 1];
        }
        numbers.removeAt(nbrIndex + 1);
        operations.removeAt(opIndex);
      } else {
        opIndex++;
        nbrIndex++;
      }
    }
    return calculateAddSub();
  }

  double calculateAddSub() {
    double retval = numbers[0];

    for (int i = 0; i < operations.length; i++) {
      if ("+-".contains(operations[i])) {
        if (operations[i] == "+") {
          retval += numbers[i + 1];
        }
        if (operations[i] == "-") {
          retval -= numbers[i + 1];
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
      if (_result.length > 2 &&
          _result[_result.length - 1] == "0" &&
          _result[_result.length - 2] == ".") {
        _result = _result.substring(0, _result.length - 2);
      }
    }
    isResult = true;
  }
}
