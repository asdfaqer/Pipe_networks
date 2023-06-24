int previous_milli = 0;
boolean drawing = false;
boolean selecting_start_and_end = false;
boolean solving = false;
void mousePressed(){
  int x = mouseX - padding;
  int y = mouseY - padding;
  if(solving){
    if(algo == "basic"){
      return;
    }
    else if(algo == "human"){
      try{
        int grid_x = x/grid_size;
        int grid_y = y/grid_size;
        //checks if out of bonds on the right and bottom
        if(mouseX >= width - padding + 25|| mouseY >= height - padding + 25){
          return;
        }
        //rotates the cell
        cells[grid_x][grid_y] = ((cells[grid_x][grid_y] + 1)%10)%4 + (cells[grid_x][grid_y]/10)*10;
      }catch(Exception e){}
      return;
    }
  }
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
    case 'v':
      if(algo == "basic"){
        algo = "human";
      }
      else if(algo == "human"){
        algo = "basic";
      }
  }
}
void keyPressed(){
  switch(key){
    case 's':
      pipe_type = "delete";
      break;
  }
}
