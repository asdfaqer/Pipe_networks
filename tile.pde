class tile{
  //fields
  int id;//location of the tile top right 0 and bottom left is n*k in a n by k grid
  int x;
  int y;
  int type;//type of pipe
  int rotation;//rotation of the tile
  //only for start and end
  int entrance;// where start and end enter the new tile
  ArrayList<Integer> connections = new ArrayList<Integer>();
  ArrayList<Integer> connections_dir = new ArrayList<Integer>();
  
  //constructor
  tile(int i){
    this.id = i;
    this.x = this.id % canvas_definition;
    this.y = this.id - this.x;
    this.type = cells[this.x][this.y] % 10;
    this.rotation = cells[this.x][this.y] - this.type;
  }
  tile(int i, int e){
    this.id = i;
    this.x = this.id % canvas_definition;
    this.y = this.id - this.x;
    this.type = cells[this.x][this.y] % 10;
    this.rotation = cells[this.x][this.y] - this.type;
    this.entrance = e;
  }
  //method
  boolean connected(){
    switch(this.type){
      case 1:
      if((this.entrance == 4 || this.entrance == 2) && (this.rotation == 0 || this.rotation == 2)){
          return true;
        }
        if((this.entrance == 1 || this.entrance == 3) && (this.rotation == 1 || this.rotation == 3)){
          return true;
        }
        return false;
      case 2:
        
        break;
      case 3:
        
        break;
      case 4:
        
        break;
    }
    return false;
  }
}
