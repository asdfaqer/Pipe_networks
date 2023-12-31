/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void Start(GButton source, GEvent event) { //_CODE_:Start_button:839361:
  source.setVisible(false);
  window1.setVisible(true);
  scene = "build mode";
  println("Start_button - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:Start_button:839361:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:758463:
  appc.background(230);
  switch(pipe_type){
    case "Straight":
      appc.image(straight_pipe, 160, 110, 120, 120);
      break;
    case "Bend":
      appc.image(curved_pipe, 160, 110, 120, 120);
      break;
    case "3 Way":
      appc.image(three_pipe, 160, 110, 120, 120);
      break;
    case "4 Way":
      appc.image(four_pipe, 160, 110, 120, 120);
      break;
    case "delete":
      appc.image(erase, 160, 110, 120, 120);
      break;
  }
} //_CODE_:window1:758463:

synchronized public void key_pressed(PApplet appc, GWinData data, KeyEvent kevent) { //_CODE_:window1:542730:
  println("window1 - key event " + kevent);
  switch(appc.key){
    case 'r':
      if(!appc.keyPressed){
        cur_orientation = (cur_orientation + 1)%4;
      }
      print(cur_orientation);
      break;
    case 's':
      pipe_type = "delete";
      if(!appc.keyPressed){
        pipe_type = dropList1.getSelectedText();
      }
      break;
    case 'c':
      if(!appc.keyPressed){
        background_color = color(random(150,255),random(150,255),random(150,255));
      }
      break;
  }
} //_CODE_:window1:434800:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:532416:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
  pipe_type = source.getSelectedText();
  label14.setText("");
  if(pipe_type.equals("3 Way") || pipe_type.equals("4 Way")){
    label14.setText("When solving, " + pipe_type + " pipes often don't work");
  }
  drawing = true;
} //_CODE_:dropList1:532416:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:823717:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
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
  switch(algo){
    case "basic":
      solving=true;
      find_path_to_endpoint(start);
      r = 0;
      scene = "computer solving puzzle";
      break;
    case "human":
      solving=true;
      verify();
      if(verified){
        r = 0;
        scene = "computer solving puzzle";
      }
      break;
  }
} //_CODE_:button1:823717:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:290036:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  drawing = false;
  selecting_start_and_end = true;
  pipe_type = "water start";
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 10; j++){
      flow_path[i][j]=0;
    }
  }
} //_CODE_:button2:290036:

public void custom_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider1:789757:
  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
  canvas_definition = source.getValueI();
} //_CODE_:custom_slider1:789757:

public void custom_slider2_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider2:656710:
  println("custom_slider2 - GCustomSlider >> GEvent." + event + " @ " + millis());
  animation_speed = source.getValueI();
} //_CODE_:custom_slider2:656710:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:990596:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  custom_slider1.setValue(5);
  for(int i = 0; i<5; i++){
    for(int j = 0; j< 5; j++){
      cells[i][j] = sample1[i][j];
    }
  }
  for(int i = 0; i<4; i++){
    for(int j = 0; j<5; j++){
      flow_path[i][j] = sample1flow[i][j];
    }
  }
} //_CODE_:button3:990596:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:882794:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  custom_slider1.setValue(8);
    for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      cells[i][j] = sample2[i][j];
    }
  }
  for(int i = 0; i<4; i++){
    for(int j = 0; j<8; j++){
      flow_path[i][j] = sample2flow[i][j];
    }
  }
} //_CODE_:button4:882794:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Start_button = new GButton(this, 220, 340, 160, 80);
  Start_button.setText("Strat");
  Start_button.addEventHandler(this, "Start");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 300, 700, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  window1.addKeyHandler(this, "key_pressed");
  dropList1 = new GDropList(window1, 18, 110, 90, 120, 5, 10);
  dropList1.setItems(loadStrings("list_532416"), 0);
  dropList1.addEventHandler(this, "dropList1_click1");
  label1 = new GLabel(window1, 110, 30, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Build Tools");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 22, 80, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Pipe Types");
  label2.setOpaque(false);
  button1 = new GButton(window1, 110, 475, 80, 30);
  button1.setText("Solve");
  button1.addEventHandler(this, "button1_click1");
  label3 = new GLabel(window1, 20, 240, 80, 20);
  label3.setText("Rules:");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 24, 262, 241, 20);
  label4.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label4.setText("- Select a pipe type through the drop list");
  label4.setOpaque(false);
  label5 = new GLabel(window1, 25, 286, 239, 19);
  label5.setText("- Press \" r \" to rotate the pipe");
  label5.setOpaque(false);
  label7 = new GLabel(window1, 25, 306, 247, 20);
  label7.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label7.setText("- Click on the canvas to place the pipe");
  label7.setOpaque(false);
  label8 = new GLabel(window1, 23, 328, 244, 31);
  label8.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label8.setText("- Hold \"s\" and click to delete unwanted pipes");
  label8.setOpaque(false);
  button2 = new GButton(window1, 13, 430, 80, 30);
  button2.setText("Select Flow");
  button2.addEventHandler(this, "button2_click1");
  label6 = new GLabel(window1, 23, 345, 247, 33);
  label6.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label6.setText("- Click the \"Select Flow\" button to select the flow path of the fluid");
  label6.setOpaque(false);
  label9 = new GLabel(window1, 22, 378, 248, 20);
  label9.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label9.setText(" - Click the \"Solve\" button to solve the track");
  label9.setOpaque(false);
  label10 = new GLabel(window1, 104, 429, 151, 36);
  label10.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label10.setText("Cur Fluid: \n       water");
  label10.setOpaque(false);
  custom_slider1 = new GCustomSlider(window1, 25, 544, 100, 40, "red_yellow18px");
  custom_slider1.setShowValue(true);
  custom_slider1.setShowLimits(true);
  custom_slider1.setLimits(5, 1, 10);
  custom_slider1.setNbrTicks(10);
  custom_slider1.setStickToTicks(true);
  custom_slider1.setShowTicks(true);
  custom_slider1.setNumberFormat(G4P.INTEGER, 0);
  custom_slider1.setOpaque(false);
  custom_slider1.addEventHandler(this, "custom_slider1_change1");
  label11 = new GLabel(window1, 0, 521, 126, 20);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Canvas Definition:");
  label11.setOpaque(false);
  label12 = new GLabel(window1, 161, 521, 104, 20);
  label12.setText("Animation Speed:");
  label12.setOpaque(false);
  custom_slider2 = new GCustomSlider(window1, 170, 544, 100, 40, "purple18px");
  custom_slider2.setShowValue(true);
  custom_slider2.setShowLimits(true);
  custom_slider2.setLimits(5, 1, 10);
  custom_slider2.setNbrTicks(10);
  custom_slider2.setStickToTicks(true);
  custom_slider2.setShowTicks(true);
  custom_slider2.setNumberFormat(G4P.INTEGER, 0);
  custom_slider2.setOpaque(false);
  custom_slider2.addEventHandler(this, "custom_slider2_change1");
  button3 = new GButton(window1, 28, 610, 80, 30);
  button3.setText("Sample Grid 1");
  button3.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(window1, 187, 608, 80, 30);
  button4.setText("Sample Grid 2");
  button4.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  button4.addEventHandler(this, "button4_click1");
  label13 = new GLabel(window1, 23, 399, 250, 20);
  label13.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label13.setText("- Press \"c\" to change background color");
  label13.setOpaque(false);
  label14 = new GLabel(window1, 140, 196, 140, 40);
  label14.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label14.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton Start_button; 
GWindow window1;
GDropList dropList1; 
GLabel label1; 
GLabel label2; 
GButton button1; 
GLabel label3; 
GLabel label4; 
GLabel label5; 
GLabel label7; 
GLabel label8; 
GButton button2; 
GLabel label6; 
GLabel label9; 
GLabel label10; 
GCustomSlider custom_slider1; 
GLabel label11; 
GLabel label12; 
GCustomSlider custom_slider2; 
GButton button3; 
GButton button4; 
GLabel label13; 
GLabel label14; 
