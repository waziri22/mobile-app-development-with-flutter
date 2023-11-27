import 'dart:math';


class GetSmallestInteger 
{

  
  void getSmallestInteger(List<int> myList)


  {
    print("Smallest element is: ${myList.reduce(min)}");
  }

  
}

void main()


{

  
  var myList = [10, 20, 1, 45, 99];
  

  var p = GetSmallestInteger();
  

  p.getSmallestInteger(myList);

  
}
