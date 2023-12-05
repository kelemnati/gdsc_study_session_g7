import 'dart:io';

import 'Calculator.dart';

void main() {
  stdout.write("Enter the first number: ");
  double num1 = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the second number: ");
  double num2 = double.parse(stdin.readLineSync()!);
  Calculator calculator = new Calculator(num1, num2);

  Future.delayed(Duration(seconds: 5), () {
    calculator.displayResult();
    calculator.division();
  });
}
