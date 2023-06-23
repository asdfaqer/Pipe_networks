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
      if(pipe_type.equals("water start")){
        pipe_type = "water end";
      }
      else if(pipe_type.equals("water end")){
        pipe_type = "none";
        selecting_start_and_end = false;
        drawing = true;
      }
      print("cool");
    }
    else if(y <= 0){
      flow_path[1][grid_x] = cur_liquid;
      if(pipe_type.equals("water start")){
        pipe_type = "water end";
      }
      else if(pipe_type.equals("water end")){
        pipe_type = "none";
        selecting_start_and_end = false;
        drawing = true;
      }
      print("fancy");
    }
  }
  if(drawing && (x<0 || y<0)){
    return;
  }
  else if(selecting_start_and_end && !((mouseY > height - padding) && (mouseX > width - padding))){
    if(mouseX > width - padding){
      flow_path[2][grid_y] = cur_liquid;
      if(pipe_type.equals("water start")){
        pipe_type = "water end";
      }
      else if(pipe_type.equals("water end")){
        pipe_type = "none";
        selecting_start_and_end = false;
        drawing = true;
      }
      print("very cool");
    }
    else if(mouseY > height - padding){
      flow_path[3][grid_x] = cur_liquid;
      if(pipe_type.equals("water start")){
        pipe_type = "water end";
      }
      else if(pipe_type.equals("water end")){
        pipe_type = "none";
        selecting_start_and_end = false;
        drawing = true;
      }
      print("very fancy");
    }
    return;
  }
  cells[grid_x][grid_y] = cur_image*10 + cur_orientation;
  printArray(cells);
  }catch(Exception e){}
}
void keyReleased(){
  switch(key){
    case 'r':
        cur_orientation = (cur_orientation + 1)%4;
        break;
    case 's':
      pipe_type = dropList1.getSelectedText();
  }
}
void keyPressed(){
  switch(key){
    case 's':
      pipe_type = "delete";
      break;
  }
}
