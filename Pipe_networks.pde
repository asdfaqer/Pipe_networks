import g4p_controls.*;
int cells[][];
//types of pipes || value in cells
//straight pipe
PImage straight_pipe; // 1
//90degree turn
PImage curved_pipe; // 2
//intersection
PImage three_pipe; // 3
PImage four_pipe; // 4
String scene = "homescreen"; // scene being drawn
void setup(){
  size(600,600);
  createGUI();
  loadImages();
}

void loadImages(){
  straight_pipe = loadImage("");
  curved_pipe = loadImage("");
  three_pipe = loadImage("");
  four_pipe = loadImage("");
}

void draw(){
  background(0);
  switch(scene){
    case "homescreen":
      break;
    case "build scene":
      break;
    case "computer solving puzzle":
      break;
    case "user solving puzzle":
      break;
  }
}
