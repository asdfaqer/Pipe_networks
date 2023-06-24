class Tile{
  //fields
  int id;//location of the tile top right 0 and bottom left is n*k in a n by k grid
  int x;
  int y;
  int type;//type of pipe
  int rotation;//rotation of the tile
  //only for start and end
  int entrance;// where start and end enter the new tile
  
  //constructor
  Tile(int i){
    this.id = i;
    this.x = i % canvas_definition;
    this.y = i / canvas_definition;
    this.rotation = cells[this.x][this.y] % canvas_definition;
    this.type = cells[this.x][this.y] / canvas_definition;
  }
  Tile(int i, int e){
    this.id = i;
    this.x = i % canvas_definition;
    this.y = i / canvas_definition;
    this.rotation = cells[i % canvas_definition][i / canvas_definition] % 10;
    this.type = cells[i % canvas_definition][i / canvas_definition] / 10;
    this.entrance = e;
  }
  //method
  boolean connected(){
    switch(this.type){
      case 1:
        if((this.entrance == 4 || this.entrance == 2) && (this.rotation == 1 || this.rotation == 3)){
          return true;
        }
        if((this.entrance == 1 || this.entrance == 3) && (this.rotation == 0 || this.rotation == 2)){
          return true;
        }
        return false;
      case 2:
        if((this.entrance == 1 || this.entrance == 2) && (this.rotation == 0)){
          return true;
        }
        if((this.entrance == 2 || this.entrance == 3) && (this.rotation == 1)){
          return true;
        }
        if((this.entrance == 3 || this.entrance == 4) && (this.rotation == 2)){
          return true;
        }
        if((this.entrance == 4 || this.entrance == 1) && (this.rotation == 3)){
          return true;
        }
        return false;
      case 3:
        if((this.entrance == 1) && !(this.rotation == 1)){
          return true;
        }
        if((this.entrance == 2) && !(this.rotation == 2)){
          return true;
        }
        if((this.entrance == 3) && !(this.rotation == 3)){
          return true;
        }
        if((this.entrance == 4) && !(this.rotation == 0)){
          return true;
        }
        return false;
      case 4:
        return true;
    }
    return false;
  }
}
