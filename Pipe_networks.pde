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
PImage water_start;
PImage water_end;
PImage oil_start;
PImage oil_end;
String scene = "homescreen"; // scene being drawn
int [][] cells;//stores two digit values the first is the object the second is orintation
int [][] flow_path;//stores the start and end of pipeline
String pipe_type = "none";
int cursor_x;
int cursor_y;
int[][] sample1 = {{0,20,20,20,20},{10,20,20,20,10},{0,0,20,20,10},{0,20,20,10,10},{20,20,0,20,20}};
int[][] sample1flow = {{0,0,0,0,0},{0,1,0,0,0},{-1,0,0,0,0},{0,0,0,0,0}};
int[][] sample2 = {
{00,00,00,00,00,20,20,00},
{00,00,20,20,00,20,20,00},
{00,20,20,20,20,20,20,00},
{00,20,20,20,20,20,00,00},
{00,20,20,20,20,00,00,00},
{00,20,20,00,00,00,00,00},
{00,20,20,00,00,00,00,00},
{00,20,20,00,00,00,00,00},
{00,20,20,00,00,00,00,00}};
int[][] sample2flow= {
{0,0,0,0,0,0,1,0},
{0,0,0,0,0,0,0,0},
{0,0,-1,0,0,0,0,0},
{0,0,0,0,0,0,0,0}};
int homescreen_background_image = int(random(0,4));
color background_color = color(random(150,255),random(150,255),random(150,255));

void setup(){
  cells = new int [canvas_definition][canvas_definition];
  for(int i = 0; i<canvas_definition; i++){
     for(int j = 0; j<canvas_definition; j++){
       cells[i][j] = 0;
     }
  }
  flow_path = new int[4][canvas_definition];
  canvas_definition = 5;
  imageMode(CENTER);
  
  size(600,600);
  createGUI();
  window1.setVisible(false);// makes the tool bar hidden on start up
  
  loadImages();
  
  frameRate(60);
}

void loadImages(){
  straight_pipe = loadImage("straight_pipe.png");
  curved_pipe = loadImage("curved_pipe.png");
  three_pipe = loadImage("3waypipe.png");
  four_pipe = loadImage("4waypipe.png");
  erase = loadImage("erase.png");
  water_start = loadImage("water_start.png");
  water_end = loadImage("water_end.png");
  oil_start = loadImage("oil_start.png");
  oil_end = loadImage("oil_end.png");
}
int r = 0; // allows the solution to be displayed step by step
int animation_speed = 5;//min speed = 1, max speed = 10
String algo = "basic";
void draw(){
  background(background_color);
  switch(scene){
    case "homescreen":
      switch(homescreen_background_image){
        case 0:
          image(straight_pipe,width/2,height/2,width,height);
          break;
        case 1:
          image(curved_pipe,width/2,height/2,width,height);
          break;
        case 2:
          image(three_pipe,width/2,height/2,width,height);
          break;
        case 3:
          image(four_pipe,width/2,height/2,width,height);
          break;
      }
      break;
    case "build mode":
      draw_grid();
      place_pipes();
      break;
    case "computer solving puzzle":
      animate_solution();
      break;
  }
}

void animate_solution(){
  draw_grid();
  if(verified && r<100){
    fill(0,255,0);
    textSize(50);
    textAlign(CENTER);
    text("Solved",width/2,height/2);
    fill(255);
    r++;
  }
  else if(!solution_found && r<100){
    fill(255,0,0);
    textSize(50);
    textAlign(CENTER);
    text("No Path Found",width/2,height/2);
    fill(255);
    r++;
  }
  else if(solution_found && r<100*path.size()){
    if(r<100*animation_speed){
      fill(0,255,0);
      textSize(50);
      textAlign(CENTER);
      text("Path Found",width/2,height/2);
      fill(255);
    }
    solve(path.get(r/100));
    r+=animation_speed;
  }
  else{
    scene = "build mode";
    path.clear();
    solution_found = false;
    solving=false;
  }
}
int cur_liquid;
int object_being_placed;
int cur_image = 0;
int cur_orientation = 0;
void place_pipes(){
  switch(pipe_type){
    case "delete":
      cur_image = 0;
      image(erase, mouseX, mouseY, 50, 50);
      break;
    case "Straight":
      cur_image = 1;
      change_rotation();
      image(straight_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "Bend":
      cur_image = 2;
      change_rotation();
      image(curved_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "3 Way":
      cur_image = 3;
      change_rotation();
      image(three_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "4 Way":
      cur_image = 4;
      change_rotation();
      image(four_pipe, cursor_x, cursor_y, 50, 50);
      break;
    case "water start":
      cur_liquid = 1;
      image(water_start, mouseX, mouseY, 50, 50);
      break;
    case "water end":
      cur_liquid = -1;
      image(water_end, mouseX, mouseY, 50, 50);
      break;
    case "oil start":
      cur_liquid = 2;
      image(oil_start, mouseX, mouseY, 50, 50);
      break;
    case "oil end":
      cur_liquid = -2;
      image(oil_end, mouseX, mouseY, 50, 50);
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

//To Do:
//bottom right and bottom left click doesn't produce expected behaviour.
//start on the solving algo don't be lazy
//fix gimicky controls
