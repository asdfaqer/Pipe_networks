int padding = 100;
int canvas_definition = 5;
int recenter = -42;
int canvas_width;
int grid_size;
void draw_grid(){
  canvas_width = width - 2*padding;
  grid_size = canvas_width/canvas_definition;
  for(int i = 0; i<canvas_definition; i++){
    for(int j = 0; j<canvas_definition; j++){
      square(grid_size*i+padding,grid_size*j+padding,grid_size);
      try{
        int cell_type = cells[i][j]/10;
        int cell_orientation = cells[i][j] - cell_type*10;
        int[] pipe_position = {grid_size*i+padding - recenter,grid_size*j+padding - recenter};
        switch(cell_type){
          case 0:
            break;
          case 1:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(straight_pipe, pipe_position[0], pipe_position[1],125,125);
            rotate(-cell_orientation*PI/2);
            break;
          case 2:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(curved_pipe, pipe_position[0], pipe_position[1],125,125);
            rotate(-cell_orientation*PI/2);
            break;
          case 3:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(three_pipe, pipe_position[0], pipe_position[1],125,125);
            rotate(-cell_orientation*PI/2);
            break;  
          case 4:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(four_pipe,pipe_position[0], pipe_position[1],125,125);
            rotate(-cell_orientation*PI/2);
            break;
        }  
      }catch(Exception e){}
    }   
  }
  //outer grid
  for(int j = 0; j<canvas_definition; j++){
    rect(padding-25, padding+grid_size*j, 25, grid_size);
    try{
      switch(flow_path[0][j]){
        case 1:
          image(water_start, padding-25, padding + grid_size*j - recenter,50,50);
          break;
        case -1:
          image(water_end, padding-25, padding + grid_size*j - recenter,50,50);
          break;
      }
    }
    catch(Exception e){}
  }
  for(int j = 0; j<canvas_definition; j++){
    rect(padding+grid_size*j, padding-25, grid_size, 25);
    try{
      switch(flow_path[1][j]){
        case 1:
          image(water_start, padding+grid_size*j - recenter, padding-25,50,50);
          break;
        case -1:
          image(water_end, padding+grid_size*j - recenter, padding-25,50,50);
          break;
      }
    }
    catch(Exception e){}
  }
  for(int j = 0; j<canvas_definition; j++){
    rect(width-padding, padding+grid_size*j, 25, grid_size);
    try{
      switch(flow_path[2][j]){
        case 1:
          image(water_start, width-padding, padding+grid_size*j - recenter,50,50);
          break;
        case -1:
          image(water_end, width-padding, padding+grid_size*j - recenter,50,50);
          break;
      }
    }
    catch(Exception e){}
  }
  for(int j = 0; j<canvas_definition; j++){
    rect(padding+grid_size*j, height-padding, grid_size, 25);
    try{
      switch(flow_path[3][j]){
        case 1:
          image(water_start, padding+grid_size*j - recenter, height-padding ,50,50);
          break;
        case -1:
          image(water_end, padding+grid_size*j - recenter, height-padding ,50,50);
          break;
      }
    }
    catch(Exception e){}
  }
}
