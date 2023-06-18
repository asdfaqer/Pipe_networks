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
  void connected(){
    
    
  }
}
