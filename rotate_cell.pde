//since the rotation is preformed before the tranformations 
//you need to adjust the tranformation to get the object in the same location 
//as when it is in another orientation
float[] rotate_cell(int rotation, float x, float y){
  float newX=0;
  float newY=0;
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
  float[]result = {newX,newY};
  return result;
}
