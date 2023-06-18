import g4p_controls.*;
//types of pipes || value in cells
//straight pipe
PImage straight_pipe; // 1
//90degree turn
PImage curved_pipe; // 2
//intersection
PImage three_pipe; // 3
PImage four_pipe; // 4
//eraser
PImage erase;
String scene = "homescreen"; // scene being drawn
int [][] cells;//stores two digit values the first is the object the second is orintation
String pipe_type = "none";
int cursor_x;
int cursor_y;
void setup(){
  cells = new int [canvas_definition][canvas_definition];
  for(int i = 0; i<canvas_definition; i++){
     for(int j = 0; j<canvas_definition; j++){
       cells[i][j] = 0;
     }
  }
  imageMode(CENTER);
  
  size(600,600);
  createGUI();
  window1.setVisible(false);// makes the tool bar hidden on start up
  
  loadImages();
}

void loadImages(){
  straight_pipe = loadImage("straight_pipe.png");
  curved_pipe = loadImage("curved_pipe.png");
  three_pipe = loadImage("3waypipe.png");
  four_pipe = loadImage("4waypipe.png");
  erase = loadImage("erase.png");
}

void draw(){
  background(255);
  switch(scene){
    case "homescreen":
      break;
    case "build mode":
      draw_grid();
      place_pipes();
      break;
    case "computer solving puzzle":
      break;
  }
}
int object_being_placed;
int cur_image = 0;
int cur_orientation = 0;
void place_pipes(){
  switch(pipe_type){
    case "delete":
      image(erase, mouseX, mouseY, 50, 50);
    case "Straight":
      cur_image = 1;
      object_being_placed = 10;
      change_rotation();
      image(straight_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "Bend":
      cur_image = 2;
      object_being_placed = 20;
      change_rotation();
      image(curved_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "3 Way":
      cur_image = 3;
      object_being_placed = 30;
      change_rotation();
      image(three_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "4 Way":
      cur_image = 4;
      object_being_placed = 40;
      change_rotation();
      image(four_pipe, cursor_x, cursor_y, 50, 50);
      break;
  }
}

void change_rotation(){
  rotate(cur_orientation*PI/2);
  switch(cur_orientation){
    case 0:
      cursor_x = mouseX;
      cursor_y = mouseY;
      break;
    case 1:
      cursor_x = mouseY;
      cursor_y = -mouseX;
      break;
    case 2:
      cursor_x = -mouseX;
      cursor_y = -mouseY;
      break;
    case 3:
      cursor_x = -mouseY;
      cursor_y = mouseX;
      break;
  }
}
