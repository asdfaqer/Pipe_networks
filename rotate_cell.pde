int[] rotate_cell(int rotation, int x, int y){
  int newX=0;
  int newY=0;
  switch(rotation){
    case 0:
      newX = x;
      newY = y;
      break;
    case 1:
      newX = y;
      newY = -x;
      break;
    case 2:
      newX = -x;
      newY = -y;
      break;
    case 3:
      newX= -y;
      newY= x;
      break;
  }
  int[]result = {newX,newY};
  return result;
}
