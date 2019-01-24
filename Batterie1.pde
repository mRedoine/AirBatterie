import processing.opengl.*;
import SimpleOpenNI.*;


AccesCube kick;
AccesCube kick2;
AccesCube snare1;
AccesCube snare2;
AccesCube fmSnare;
AccesCube tom;

Envoi re;

SimpleOpenNI kinect;

float rotation=0;
float s = 1;

void setup() {
size(1024,768,P3D);
kinect = new SimpleOpenNI(this);
kinect.enableDepth();


re = new Envoi();
//Positionnement des différents cubes à l'ecran
snare1 = new AccesCube(200,-50,1500,150);
snare2 = new AccesCube(-200,-50,1500,150);
kick = new AccesCube(-200,-650,1300,150);
kick2 = new AccesCube(200,-650,1300,150);
fmSnare = new AccesCube(400, -350, 1300,150);
tom = new AccesCube(-400, -350, 1300, 150);

}

void draw() {
  background(0);
  kinect.update();

  //Positionnement du PointCloud à 1000 pixels derriere
  translate(width/2, height/2, -1000);
  //Départ du pixel le plus à droite
  rotateX(radians(180));
  translate(0, 0, 1400);
  rotateY(radians(map(mouseX, 0, width, -180, 180)));
  translate(0, 0,s*-1000);
  scale (s);
  stroke(255);
  //Récupération du tableau de VECTOR de la profondeur
  PVector[] pointsProfondeur = kinect.depthMapRealWorld();
  
  for (int i = 0; i < pointsProfondeur.length; i+=10) {
    PVector pointActuel = pointsProfondeur[i];
    //Vérifications
    snare1.verif(pointActuel);
    snare2.verif(pointActuel);
    kick.verif(pointActuel);
    kick2.verif(pointActuel);
    fmSnare.verif(pointActuel);
    tom.verif(pointActuel);
    point(pointActuel.x, pointActuel.y, pointActuel.z);
  }
  if(snare1.estFrappe()) {
   re.transfert("/snare");
  }
   if(snare2.estFrappe()) {
   re.transfert("/fm");
  }
  if(kick.estFrappe()) {
    re.transfert("/kick");
  }
   if(kick2.estFrappe()) {
    re.transfert("/kicka");
  }
   if(fmSnare.estFrappe()) {
    re.transfert("/fmsnare");
  }
  if(tom.estFrappe()) {
    re.transfert("/tom");
  }
  
  kick.draw();
  kick.clear();
  kick2.draw();
  kick2.clear();
  snare1.draw();
  snare1.clear();
  snare2.draw();
  snare2.clear();
  fmSnare.draw();
  fmSnare.clear();
  tom.draw();
  tom.clear();

}

void keyPressed() {
  if (keyCode == 38) {
    s = s + 0.01;
  }
  if (keyCode == 40) {
    s = s - 0.01;
  }
}
void mousePressed() {
  save("touchedPoint.png");
}
