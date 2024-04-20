class Anillos{
  private PVector posicion;
  private PImage imagen;
  private PVector velocidad;
  
  public Anillos(){
    imagen = loadImage("anillos.png");
  }
  
  public Anillos (PVector posicion, PVector velocidad){
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.imagen = loadImage ("anillos.png");
  }
  
  public void dibujar(){
    imageMode(CENTER);
    image(imagen,posicion.x,posicion.y,150,150);
  }
  
  public void mover(){
    if(this.posicion.x >=0){
      this.posicion.x-=this.velocidad.x;
    }else{
      this.posicion.x = width;
    }
  }
}
