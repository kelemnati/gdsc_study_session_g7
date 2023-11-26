import 'dart:io';

int findMaximum(List<int> numbers) {
  int max = numbers[0];
  for (int n in numbers) {
    if (n > max) {
      max = n;
    }
  }
  return max;
}

int findMinimum(List<int> numbers) {
  int max = numbers[0];

  for (int n in numbers) {
    if (n < max) {
      max = n;
    }
  }
  return max;
}

int calculateSum(List<int> numbers) {
  int sum = 0;

  for (int n in numbers) {
    sum += n;
  }
  return sum;
}

double calculateAverage(List<int> numbers) {
  int sum = calculateSum(numbers);
  double average = (sum / numbers.length);
  average.toStringAsFixed(2);
  return average;
}

void main() {
  print("Enter the amount of numbers in the list:");

  int? n = int.parse(stdin.readLineSync()!);
  print("Enter the numbers in the list:");

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    numbers.add(int.parse(stdin.readLineSync()!));
  }

  int largestNum = findMaximum(numbers);
  int smallestNum = findMinimum(numbers);
  int totalSum = calculateSum(numbers);
  double average = calculateAverage(numbers);

  print("""
    Largest Number = $largestNum 
    Smallest Number = $smallestNum  
    Total = $totalSum
    Average = $average
 """);
}
