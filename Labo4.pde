class Figura {
  PVector posicion;
  PVector posicionInicial;
  color colorFigura;

  Figura(float x, float y, color c) {
    posicion = new PVector(x, y);
    posicionInicial = new PVector(x, y);
    colorFigura = c;
  }

  void dibujar() {
    // Este método será implementado en las clases derivadas
  }
  
  void resetearPosicion() {
    posicion.x = posicionInicial.x;
    posicion.y = posicionInicial.y;
  }
}

class Circulo extends Figura {
  float radio;
  float velocidad;

  Circulo(float x, float y, float r, color c, float v) {
    super(x, y, c);
    radio = r;
    velocidad = v;
  }

  @Override
  void dibujar() {
    fill(colorFigura);
    ellipse(posicion.x, posicion.y, radio * 2, radio * 2);
    posicion.x += velocidad; // Mover hacia la derecha

    if (posicion.x > width + radio) {
      resetearPosicion();
    }
  }
}

class Rectangulo extends Figura {
  float ancho, alto;
  float velocidad;

  Rectangulo(float x, float y, float w, float h, color c, float v) {
    super(x, y, c);
    ancho = w;
    alto = h;
    velocidad = v;
  }

  @Override
  void dibujar() {
    fill(colorFigura);
    rectMode(CENTER);
    rect(posicion.x, posicion.y, ancho, alto);
    posicion.x -= velocidad; // Mover hacia la izquierda

    if (posicion.x < -ancho) {
      resetearPosicion();
    }
  }
}

ArrayList<Figura> figuras;

void setup() {
  size(400, 400);
  figuras = new ArrayList<Figura>();
  
  // Crear instancias de Círculo y Rectángulo con velocidad
  figuras.add(new Circulo(100, 100, 50, color(255, 0, 0), 2.0));
  figuras.add(new Rectangulo(300, 300, 80, 60, color(0, 0, 255), 1.5));
}

void draw() {
  background(220);
  
  // Dibujar todas las figuras en la lista
  for (Figura figura : figuras) {
    figura.dibujar();
  }
}
