ArrayList<Integer> Verified_pipes = new ArrayList<Integer>();
ArrayList <Tile> Tiles = new ArrayList<Tile>();
boolean stop = false;
boolean verified = false;
//used for testing purposes and concept learned were transfered to the pipe solver
void verify(){
  if(end.id == start.id){
    if(start.connected() && end.connected()){
      verified = true;
      print("valid");
      return;
    }
    return;
  }
  if(stop){
    return;
  }
  if(start.connected()){
    switch(start.type){
      case 1:
        Verified_pipes.add(start.id);
        switch(start.entrance){
          case 1:
            if(start.x != canvas_definition - 1){
              start = new Tile(start.id + 1 , start.entrance);
            }
            else{
              stop = true;
              return;
            }
            break;
          case 2:
            if(start.y != canvas_definition - 1){
              start = new Tile(start.id + canvas_definition, start.entrance);
            }
            else{
              stop = true;
              return;
            }
            break;
          case 3:
            if(start.x != 0){
              start = new Tile(start.id - 1, start.entrance);
            }
            else{
              stop = true;
              return;
            }
            break;
          case 4:
            if(start.y != 0){
              start = new Tile(start.id - canvas_definition, start.entrance);
            }
            else{
              stop = true;
              return;
            }
            break;
        }
        break;
      case 2://bent
        Verified_pipes.add(start.id);
        switch(start.entrance){
          case 1:
            switch(start.rotation){
              case 0:
                if(start.y == 0){
                  stop = true;
                  return;
                }
                start = new Tile(start.id - canvas_definition, 4);
                break;
              case 3:
                if(start.y == canvas_definition - 1){
                  stop = true;
                  return;
                }
                start = new Tile(start.id + canvas_definition, 2);
                break;
            }
            break;
          case 2:
            switch(start.rotation){
              case 0:
                if(start.x == 0){
                  stop = true;
                  return;
                }
                start = new Tile(start.id - 1, 3);
                print(start.type);
                break;
              case 1:
                if(start.x == canvas_definition - 1){
                  stop = true;
                  return;
                }
                start = new Tile(start.id + 1, 1);
                break;
            }
            break;
          case 3:
            switch(start.rotation){
              case 1:
                if(start.y == 0){
                  stop = true;
                  return;
                }
                start = new Tile(start.id - canvas_definition, 4);
                break;
              case 2:
                if(start.y == canvas_definition - 1){
                  stop = true;
                  return;
                }
                start = new Tile(start.id + canvas_definition, 2);
                break;
            }
            break;
          case 4:
            switch(start.rotation){
              case 2:
                if(start.x == canvas_definition-1){
                  stop = true;
                  return;
                }
                start = new Tile(start.id + 1, 1);
                print(start.type);
                break;
              case 3:
                if(start.x == 0){
                  stop = true;
                  return;
                }
                start = new Tile(start.id - 1, 3);
                println("a");
                break;
            }
            break;
        }
        break;
      case 3:
        switch(start.rotation){
          
          
        }
        break;
      case 4:
        
        break;
    }
    verify();
  }
  stop = true;
}

void grid_to_tile(){
  for(int i = 0; i<pow(canvas_definition,2); i++){
      Tiles.add(new Tile(i));
  }
}
