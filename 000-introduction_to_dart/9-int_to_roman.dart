import 'dart:io';

String intToRoman(int number) {
  if (number <= 0 || number > 3999) {
    return 'Invalid input';
  }

  List<String> romanSymbols = ["M", "D", "C", "L", "X","V","I"];
  List<int> romanValues = [1000,500,100, 50, 10,5, 1];

  String result = '';

  for (int i = 0; i < romanSymbols.length; i++) {
    while (number >= romanValues[i]) {
      result += romanSymbols[i];
      number -= romanValues[i];
    }
  }

  return result;
}

void main() {
  print('Enter a numeral number:');
  int number = int.parse(stdin.readLineSynch());
  print('Roman numeral for $number: ${intToRoman(number)}');
}
