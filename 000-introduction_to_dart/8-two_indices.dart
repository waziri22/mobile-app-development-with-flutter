 class  FindTwoNumbersWithSum {
  List<int> numbers = [1, 2, 4, 5, 11];
  int target = 6;

   findTwoNumbersWithSum  (List<int> numbers, int target) {
    this.numbers = numbers;
    this.target = target;
  }

  List<int> solution () {
    int length = numbers.length;

    for (int i = 0; i < length - 1; i++) {
      for (int j = i + 1; j < length; j++) {
        if (numbers[i] + numbers[j] == target) {
          return [i, j];
        }
      }
    }
    return [-1];
  }
}

void  main () {
 
  FindTwoNumbersWithSum obj =  FindTwoNumbersWithSum();
   print (obj.solution());
}
