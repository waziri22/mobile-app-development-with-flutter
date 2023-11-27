import 'dart:io';


  int sumOfEvenNumbers(List<int> numbers)
  
  
  {
    int sum = 0;
    

    numbers.forEach((numbers)
                    
    
    {
      if (numbers % 2 == 0) 
      
      
      {
        sum += numbers;

        
       numbers++;

        
      } else
      
      
      {
        print('$numbers is not even');
      }

      
    });
      return sum;
  }


void main()


{
  print('Enter numbers :');

  
  int numbers = int.parse(stdin.readLineSynch());

  
  sumOfEvenNumbers(numbers);
}
