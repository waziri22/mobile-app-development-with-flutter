import 'dart:io';


void printFrequency(String str)


{
  Map<String, int> frequencyMap = {};

  
  String word = "";
  

  for (int i = 0; i < str.length; i++)
  
  
  {
    if (str[i] == ' ') 
    
    
    {
      if (word.isNotEmpty) 
      
      
      {
        frequencyMap[word] = (frequencyMap[word] ?? 0) + 1;
        word = "";

        
      }
    } else
    
    
    {
      word += str[i];
    }
  }
  

  if (word.isNotEmpty) 
  
  
  {
    frequencyMap[word] = (frequencyMap[word] ?? 0) + 1;
  }


  for (var entry in frequencyMap.entries)
  
  
  {
    print('${entry.key} - ${entry.value}');
  }
}


void main() 


{
  print('Enter a word');

  
  String str = stdin.readLineSynch());

  
  printFrequency(str);
}
