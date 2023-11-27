import 'dart:math';

import 'dart:io';
void factorizeToPrimeNumbers(int number)
 {
  while (number % 2 == 0) 
  {
    print(2);
    number = number ~/ 2;
  }
  for (int i = 3; i <= sqrt(number); i += 2)
  {
    while (number % i == 0) 
    {
      print(i);
      number = number ~/ i;
    }
  }
  if (number > 2) {
    print(number);
  }
}
void main() 
{
 print('Enter number');
  int number = int.parse(stdin.readLineSynch());
  factorizeToPrimeNumbers(number);
}

