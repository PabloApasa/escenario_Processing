//Tarea Armar escenario en Processing 
//Realizar un proyecto en el cual se coloque de fondo una imagen. Sobre esta imagen aplique tintes. 
//ADemás coloque otra imagen que moverá mediante teclas del mouse. Otra imagen debe moverse de izquierda a derecha y rebotar contra el marco del lienzo, 
//moviéndose de derecha a izquierda y rebotar nuevamente en el marco. Sería ideal que trate de que la estética haga referencia a un juego. 
//Se recomiendan por ejemplo, galaga, recoger frutas que deja caer un mono, Etc.
//En el frente colocar el piso de tal forma que sea de bloques o ladrillos armados con primitivas y que usen estructuras iterativas. 
//Puede agregar nubes (o estrellas redondas) armadas con estruucturas iterativas y colocadas al azar en el cielo.
//Modele las clases que utiliza, y genere un archivo en DIA, y además un archivo de DIA exportado a imagen, Ambos colóquelos dentro dentro de la carpeta del proyecto en Processing. 
//Suba a GitHub. Comparta aquí un simple archivo de texto con la url del repositorio. Fecha fin: 19_04_24 23:59 hs
PImage fondo;
private Anillos tesoros;
private Sonic personaje;
//bloques y nubes
int numBlocks; // Número de bloques en el piso
int blockSize; // Tamaño de cada bloque
int blockHeight; // Altura de cada bloque
int numClouds; // Número de nubes en el cielo
Cloud[] clouds; // Arreglo de nubes


PImage img; // Variable para almacenar la imagen
MovingImage movingImg; // Instancia de la clase para la imagen móvil


public void setup(){
  size(800,600);
  fondo = loadImage ("fondo.jpg");
  imageMode (CENTER);
  personaje = new Sonic(); 
  personaje.setPosicion(new PVector(width/2,height/2));
  personaje.setVelocidad(new PVector(10,10));
  
  PVector posicion = new PVector(100, height/2); // Posición inicial
  PVector velocidad = new PVector(2, 0); // Velocidad en x
  tesoros = new Anillos(posicion, velocidad);
  
  numBlocks = width / 50; // Ajuste para que los bloques ocupen todo el ancho de la pantalla
  blockSize = width / numBlocks;
  blockHeight = 100; // Altura fija para todos los bloques
  
  // Inicializar nubes
  numClouds = 20; // Número de nubes
  clouds = new Cloud[numClouds];
  for (int i = 0; i < numClouds; i++) {
    float x = random(width);
    float y = random(100);
    float radius = random(30, 80);
    clouds[i] = new Cloud(x, y, radius);
  }
  
   // Cargar la imagen
  img = loadImage("tu_imagen.png");
  // Crear una instancia de MovingImage con la imagen cargada
  movingImg = new MovingImage(img);
  
}

public void draw(){
  background(255);
  image (fondo, width / 2, height /2);
  personaje.dibujar();
  actualizarVelocidadPersonaje();
  tesoros.dibujar();
  tesoros.mover();
  
  // Dibujar el piso
  fill(139, 69, 19); // Color marrón
  for (int i = 0; i < numBlocks; i++) {
    rect(i * blockSize, height - blockHeight, blockSize, blockHeight);
  }
  
  // Dibujar nubes
  for (int i = 0; i < numClouds; i++) {
    clouds[i].display();
  }
  
  // Actualizar y mostrar la imagen con movimiento aleatorio
  movingImg.update();
  movingImg.display();
  
}


// Clase para representar una nube
class Cloud {
  float x, y;
  float radius;
  
  Cloud(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }
  
  void display() {
    noStroke();
    fill(255); // Color blanco para las nubes
    ellipse(x, y, radius * 2, radius * 2);
    ellipse(x - radius * 0.5, y - radius * 0.5, radius * 1.5, radius * 1.5);
    ellipse(x + radius * 0.5, y - radius * 0.5, radius * 1.5, radius * 1.5);
    ellipse(x - radius * 0.25, y + radius * 0.25, radius * 1.5, radius * 1.5);
    ellipse(x + radius * 0.25, y + radius * 0.25, radius * 1.5, radius * 1.5);
  }
}
  

public void keyPressed(){
  if(key=='d'){
    personaje.mover(1);
  }
  if(key=='a'){
    personaje.mover(0);
  }
  
  if(key=='w'){
    personaje.mover(2);
  }
  if(key=='s'){
    personaje.mover(3);
  }
  
}

public void actualizarVelocidadPersonaje(){
  if(personaje.perPosicion().x>(width/2)){
    personaje.perVelocidad().x=30;
  }else{
    personaje.perVelocidad().x=10;
  }
}

// Clase para representar una imagen con movimiento aleatorio
class MovingImage {
  PImage img;
  float x, y;
  float vx, vy;
  
  MovingImage(PImage img) {
    this.img = img;
    x = random(width);
    y = random(height);
    vx = random(-2, 2); // Velocidad aleatoria en x
    vy = random(-2, 2); // Velocidad aleatoria en y
  }
  
  void update() {
    x += vx;
    y += vy;
    
    // Rebote en los bordes de la pantalla
    if (x < 0 || x > width) {
      vx *= -1;
    }
    if (y < 0 || y > height) {
      vy *= -1;
    }
  }
  
  void display() {
    image(img, x, y);
  }
}
