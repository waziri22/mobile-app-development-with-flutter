class FindIndexOfFirstOccurrence 


{
  FindIndexOfFirstOccurrence(List<int> myList, int target)
  
  
  {
    int index = myList.indexOf(target);

    
     print (index);
  }

  
}


void main()


{
  var myList = [1, 3, 4, 2];

  
  var target = 1;

  
  var w = FindIndexOfFirstOccurrence(myList, target);

  
}
