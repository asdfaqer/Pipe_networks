ArrayList<Integer> path = new ArrayList<Integer>();
Tile start;
Tile end;
boolean solution_found = false;
void find_path_to_endpoint(Tile s){
  if(s == null){
    return;
  }
  Tile next_start = null;
  for(int i = 0; i<4; i++){
    s.rotation = i; // 4 states( 0, 1, 2, 3 )
    end.rotation = i;
    if(s.type == 1 && i>=2){
      continue;
    }
    //if the start and end are connected to the same tile then the path must have been found
    if(s.id == end.id && s.connected() && end.connected()){
      path.add(s.type*1000 + i*100 +s.id);
      solution_found = true;
      return;
    }
    if(s.connected()){
      path.add(s.type*1000+i*100+s.id);
      //move start
      switch(s.type){
        case 1:
          switch(s.entrance){// 1 = left, 2 = up, 3 = right, 4 = down
            case 1:
              if(s.x != canvas_definition - 1){
                next_start = new Tile(s.id + 1 , s.entrance);
              }
              break;
            case 2:
              if(s.y != canvas_definition - 1){
                next_start = new Tile(s.id + canvas_definition, s.entrance);
              }
              break;
            case 3:
              if(s.x != 0){
                next_start = new Tile(s.id - 1, s.entrance);
              }
              break;
            case 4:
              if(s.y != 0){
                next_start = new Tile(s.id - canvas_definition, s.entrance);
              }
              break;
          }
          break;
        case 2:
          switch(s.entrance){
            case 1:
              switch(s.rotation){
                case 0:
                  if(s.y != 0){
                    next_start = new Tile(s.id - canvas_definition, 4);
                  }
                  break;
                case 3:
                  if(s.y != canvas_definition - 1){
                    next_start = new Tile(s.id + canvas_definition, 2);
                  }
                  break;
              }
              break;
            case 2:
              switch(s.rotation){
                case 0:
                  if(s.x != 0){
                    next_start = new Tile(s.id - 1, 3);
                  }
                  break;
                case 1:
                  if(s.x != canvas_definition - 1){
                    next_start = new Tile(s.id + 1, 1);
                  }
                  break;
              }
              break;
            case 3:
              switch(s.rotation){
                case 1:
                  if(s.y != 0){
                    next_start = new Tile(s.id - canvas_definition, 4);
                  }
                  break;
                case 2:
                  if(s.y != canvas_definition - 1){
                    next_start = new Tile(s.id + canvas_definition, 2);
                  }
                  break;
              }
              break;
            case 4:
              switch(s.rotation){
                case 2:
                  if(s.x != canvas_definition - 1){
                    next_start = new Tile(s.id + 1, 1);
                  }
                  break;
                case 3:
                  if(s.x != 0){
                    next_start = new Tile(s.id - 1, 3);
                  }
                  break;
              }
              break;
          }
          break;
        case 3:
          break;
        case 4:
          break;
      }
    }
    boolean already_explored = false;
    try{
      for(int j: path){
        if(j%100 == next_start.id){
          already_explored = true;
          break;
        }
      }
    } catch(Exception e){}
    if(!already_explored){
      find_path_to_endpoint(next_start);
    }
    if(!solution_found){
      path.remove(Integer.valueOf(s.type*1000+i*100+s.id));
    }
    else{
      break;
    }
  }
}

void solve(int cur_pipe){
  int id = cur_pipe%100;
  int x = id%canvas_definition;
  int y = id/canvas_definition;
  cells[x][y] = cur_pipe/100;
}
  
  
