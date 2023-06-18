int padding = 100;
int canvas_definition = 5;
int recenter = -42;
int canvas_width;
int grid_size;
void draw_grid(){
  canvas_width = width - 2*padding;
  grid_size = canvas_width/canvas_definition;
  for(int i = 0; i<5; i++){
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
}
