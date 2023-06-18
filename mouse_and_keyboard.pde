void mousePressed(){
  int x = mouseX - padding;
  int y = mouseY - padding;
  try{
  int grid_x = x/grid_size;
  int grid_y = y/grid_size;
  //checks if out of bonds on the right and bottom
  if(grid_x >= canvas_definition|| grid_y >= canvas_definition){
    return;
  }
  //checks if out of bonds on the left and top
  if(x<0 || y<0){
    return;
  }
  cells[grid_x][grid_y] = cur_image*10 + cur_orientation;
  printArray(cells);
  }catch(Exception e){}
}

void keyPressed(){
  switch(key){
    case 'r':
      cur_orientation = (cur_orientation + 1)%4;
      print(cur_orientation);
      break;
    case SHIFT:
      
  }
}
