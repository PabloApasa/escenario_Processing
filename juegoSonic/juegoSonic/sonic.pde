class Sonic{
  private PVector posicion;
  private PImage imagen;
  private PVector velocidad;
  
  // CONSTRUCTOR 
  public Sonic(){
    imagen = loadImage("sonic.png");
  }
  
  public void dibujar(){
    imageMode(CENTER);
    image(imagen,posicion.x,posicion.y,150,150);
  }
  /**
  * Mueve la posicon hacia izquierda o derecha según lo 
  * que se indique en el atributo velocidad
  * direccion (0:izquierda; 1=derecha; 2 = arriba, 3= abajo)
  */
  public void mover(int direccion){
    if(direccion==0){
      this.posicion.x-=this.velocidad.x;
    }
    if(direccion==1){
      this.posicion.x+=this.velocidad.x;
    }
    if(direccion==2){
      this.posicion.y-=this.velocidad.y;
    }
    if(direccion==3){
      this.posicion.y+=this.velocidad.y;
    }
    
  }
  
  public PVector perPosicion(){
    return this.posicion;
  }
  
  public void setPosicion(PVector posicion){
    this.posicion = posicion;
  }
  
  public PVector perVelocidad(){
    return this.velocidad;
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
  
}
