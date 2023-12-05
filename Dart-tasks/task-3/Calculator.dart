class Calculator {
  double? _num1;
  double? _num2;

  Calculator(this._num1, this._num2);

  double _add() {
    return this._num1! + this._num2!;
  }

  double _subtraction() {
    return this._num1! - this._num2!;
  }

  double _multiplication() {
    return this._num1! * this._num2!;
  }

  void division() {
    double result = 0;
    try {
      if (this._num2! == 0) {
        throw Exception("Division by zero is undefined");
      }
      result = this._num1! / this._num2!;
      print("${result.toStringAsFixed(2)}");
    } catch (e) {
      print("Exception Caught: $e");
    }
  }

  void displayResult() {
    print("""
Addition Result = ${_add()}
Subtraction Result = ${_subtraction()}
Multiplication Result = ${_multiplication()}
Division Result =  """);
  }
}
