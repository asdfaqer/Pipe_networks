int previous_milli = 0;
boolean drawing = false;
boolean selecting_start_and_end = false;
void mousePressed(){
  int x = mouseX - padding;
  int y = mouseY - padding;
  try{
  int grid_x = x/grid_size;
  int grid_y = y/grid_size;
  //checks if out of bonds on the right and bottom
  if(mouseX >= width - padding + 25|| mouseY >= height - padding + 25){
    return;
  }
  //checks if out of bonds on the left and top
  if(mouseX<padding-25 || mouseY<padding -25){
    return;
  }
  if(drawing && (grid_x >= canvas_definition|| grid_y >= canvas_definition)){
    return;
  }
  else if(selecting_start_and_end && !(x <= 0 && y <= 0)){
    if(x <= 0){
      flow_path[0][grid_y] = cur_liquid;
      print("cool");
    }
    else if(y <= 0){
      flow_path[1][grid_x] = cur_liquid;
      print("fancy");
    }
    return;
  }
  if(drawing && (x<0 || y<0)){
    return;
  }
  else if(selecting_start_and_end && !(grid_x>= canvas_definition && grid_y >= canvas_definition)){
    if(grid_x >= canvas_definition){
      flow_path[2][grid_y] = cur_liquid;
      print("very cool");
    }
    else if(grid_y >= canvas_definition){
      flow_path[3][grid_x] = cur_liquid;
      print("very fancy");
    }
    return;
  }
  cells[grid_x][grid_y] = cur_image*10 + cur_orientation;
  printArray(cells);
  }catch(Exception e){}
}
int previous_milli_main = 0;
void keyPressed(){
  switch(key){
    case 'r':
      if(millis() - previous_milli_main > 100 && abs(millis() - previous_milli_main - 200)>20){
          cur_orientation = (cur_orientation + 1)%4;
        }
        print(cur_orientation);
        previous_milli_main = millis();
        break;
    case 's':
      pipe_type = "delete";
      break;
  }
}
