void  printRightAngleTriangle (int height)
{
  String  triangleChar = '*';   
     print('');
     int j = 0;
  while (j <= height)
  {
     print(triangleChar * j);
     j += 1;
  }
}

void  main () 
{
   printRightAngleTriangle(5);
}

