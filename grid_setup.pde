int padding = 100;
int canvas_definition = 10;
float recenter = -42;
int canvas_width;
int grid_size;
float scale;
void draw_grid(){
  canvas_width = width - 2*padding;
  grid_size = canvas_width/canvas_definition;
  scale = 5.0/canvas_definition;
  recenter = -42 * scale;
  for(int i = 0; i<canvas_definition; i++){
    for(int j = 0; j<canvas_definition; j++){
      square(grid_size*i+padding,grid_size*j+padding,grid_size);
      try{
        int cell_type = cells[i][j]/10;
        int cell_orientation = cells[i][j] - cell_type*10;
        float[] pipe_position = {grid_size*i+padding - recenter,grid_size*j+padding - recenter};
        switch(cell_type){
          case 0:
            break;
          case 1:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(straight_pipe, pipe_position[0], pipe_position[1],125*scale,125*scale);
            rotate(-cell_orientation*PI/2);
            break;
          case 2:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(curved_pipe, pipe_position[0], pipe_position[1],125*scale,125*scale);
            rotate(-cell_orientation*PI/2);
            break;
          case 3:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(three_pipe, pipe_position[0], pipe_position[1],125*scale,125*scale);
            rotate(-cell_orientation*PI/2);
            break;  
          case 4:
            rotate(cell_orientation*PI/2);
            pipe_position = rotate_cell(cell_orientation, pipe_position[0], pipe_position[1]);
            image(four_pipe,pipe_position[0], pipe_position[1],125*scale,125*scale);
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
          image(water_start, padding-25, padding + grid_size*j - recenter,50*scale,50*scale);
          break;
        case -1:
          image(water_end, padding-25, padding + grid_size*j - recenter,50*scale,50*scale);
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
          image(water_start, padding+grid_size*j - recenter, padding-25,50*scale,50*scale);
          break;
        case -1:
          image(water_end, padding+grid_size*j - recenter, padding-25,50*scale,50*scale);
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
          image(water_start, width-padding - recenter/2, padding+grid_size*j - recenter,50*scale,50*scale);
          break;
        case -1:
          image(water_end, width-padding - recenter/2, padding+grid_size*j - recenter,50*scale,50*scale);
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
          image(water_start, padding+grid_size*j - recenter, height-padding - recenter/2 ,50*scale,50*scale);
          break;
        case -1:
          image(water_end, padding+grid_size*j - recenter, height-padding - recenter/2,50*scale,50*scale);
          break;
      }
    }
    catch(Exception e){}
  }
  if(solving && algo.equals("human")){//if the user wants to try to sovle the puzzles themself
    int id = 0;
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < canvas_definition; j++){
        switch(i){
          case 0:
            id = j*canvas_definition;
            break;
          case 1:
            id = j;
            break;
          case 2:
            id = canvas_definition-1+j*canvas_definition;
            break;
          case 3:
            id = j + canvas_definition*(canvas_definition-1);
            break;
        }
        switch(flow_path[i][j]){
          //water
          case 1://start
            start = new Tile(id, i+1);
            break;
          case -1://end
            end = new Tile(id, i+1);
            break;
          //oil
          case 2://start
            break;
          case -2://end
            break;
        }
      }
    }
    Verified_pipes.clear();
    stop=false;
    verify();
    if(verified){
      r = 0;
      scene = "computer solving puzzle";
    }
  }
}
