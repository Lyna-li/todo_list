void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  var result = processList(numbers);

  print("Sum of odd numbers: ${result.$1}");
  print("Squared even numbers: ${result.$2}");
}


(int, List<int>) processList(List<int> numbers) {
  int sum= 0;

  List<int> squaredEvens = numbers.map((num) {
    if (num % 2 == 0) {
      return num * num;
    } else {
      sum += num; 
      return null;
    }
  }).where((num) => num != null).cast<int>().toList();

  return (sum, squaredEvens);
}
